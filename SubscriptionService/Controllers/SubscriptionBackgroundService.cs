using SubscriptionService.Models;
using SubscriptionService.Repositories;
using WalletService.Repositories;

namespace SubscriptionService.Controllers
{
    public class SubscriptionBackgroundService : BackgroundService
    {
        private readonly IServiceProvider _services;
        private readonly ILogger<SubscriptionBackgroundService> _logger;

        public SubscriptionBackgroundService(
            IServiceProvider services,
            ILogger<SubscriptionBackgroundService> logger)
        {
            _services = services;
            _logger = logger;
        }

        protected override async Task ExecuteAsync(CancellationToken stoppingToken)
        {
            _logger.LogInformation("Subscription Background Service is running.");

            while (!stoppingToken.IsCancellationRequested)
            {
                try
                {
                    await ProcessDueSubscriptionsAsync();
                    await Task.Delay(TimeSpan.FromHours(1), stoppingToken); // Elke uur controleren
                }
                catch (Exception ex)
                {
                    _logger.LogError(ex, "Error in subscription background task");
                    await Task.Delay(TimeSpan.FromMinutes(5), stoppingToken); // Wacht bij fouten
                }
            }
        }

        private async Task ProcessDueSubscriptionsAsync()
        {
            using var scope = _services.CreateScope();
            var subscriptionRepo = scope.ServiceProvider.GetRequiredService<ISubscriptionRepository>();
            var walletRepo = scope.ServiceProvider.GetRequiredService<IWalletRepository>();

            var dueSubscriptions = await subscriptionRepo.GetDueSubscriptionsAsync();

            foreach (var sub in dueSubscriptions)
            {
                if (!sub.IsActive || sub.Plan == SubscriptionPlan.Free) continue;

                try
                {
                    // Voeg tokens toe gebaseerd op het abonnement
                    await walletRepo.AddTokensAsync(sub.User.WalletId.Value, sub.MonthlyTokens);

                    // Update de volgende betalingsdatum
                    sub.NextPaymentDate = sub.NextPaymentDate.AddMonths(1);
                    await subscriptionRepo.UpdateAsync(sub);

                    _logger.LogInformation(
                        "Added {Tokens} tokens to user {UserId} (subscription {SubId})",
                        sub.MonthlyTokens, sub.UserId, sub.Id);
                }
                catch (Exception ex)
                {
                    _logger.LogError(ex,
                        "Failed to process subscription {SubId} for user {UserId}",
                        sub.Id, sub.UserId);
                }
            }
        }
    }
}
