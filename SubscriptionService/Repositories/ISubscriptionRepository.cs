using SubscriptionService.Models;

namespace SubscriptionService.Repositories
{
    public interface ISubscriptionRepository
    {
        Task<Subscription> GetByIdAsync(Guid subscriptionId);
        Task<Subscription> GetSubscriptionAsync(Guid userId);
        Task AddAsync(Subscription subscription);
        Task UpdateAsync(Subscription subscription);
        Task DeleteAsync(Guid subscriptionId);

        Task<bool> UserHasActiveSubscriptionAsync(Guid userId);
        Task<List<Subscription>> GetDueSubscriptionsAsync();
        Task<bool> UpgradePlanAsync(Guid userId, SubscriptionPlan newPlan);
    }
}
