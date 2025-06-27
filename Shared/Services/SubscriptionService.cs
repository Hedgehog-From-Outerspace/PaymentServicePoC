using Microsoft.EntityFrameworkCore;
using Shared.Data;
using Shared.Model;

namespace Shared.Services
{
    public class SubscriptionService
    {
        private readonly PaymentDbContext _context;
        private readonly PaymentService _storeService;

        public SubscriptionService(PaymentDbContext context, PaymentService storeService)
        {
            _context = context;
            _storeService = storeService;
        }

        public async Task UpgradeSubscription(Guid userId, SubscriptionPlan newPlan)
        {
            var user = await _context.Users
                .Include(u => u.Subscription)
                .FirstOrDefaultAsync(u => u.Id == userId);

            if (user == null) throw new Exception("User not found");

            user.Subscription.Plan = newPlan;
            await _context.SaveChangesAsync();
        }

        public async Task RenewSubscription(Guid userId)
        {
            var user = await _context.Users
                .Include(u => u.Subscription)
                .Include(u => u.Wallet)
                .FirstOrDefaultAsync(u => u.Id == userId);

            if (user == null) throw new Exception("User not found");

            if ((DateTime.UtcNow - user.Subscription.StartDate).TotalDays >= 30)
            {
                user.Subscription.StartDate = DateTime.UtcNow;

                switch (user.Subscription.Plan)
                {
                    case SubscriptionPlan.Basic:
                        await _storeService.AddTokens(user.Wallet.Id, 100, "Monthly Basic subscription tokens");
                        break;
                    case SubscriptionPlan.Premium:
                        await _storeService.AddTokens(user.Wallet.Id, 300, "Monthly Premium subscription tokens");
                        break;
                    case SubscriptionPlan.Free:
                        // Free users get no tokens
                        break;
                }

                await _context.SaveChangesAsync();
            }
        }
    }
}