using Microsoft.EntityFrameworkCore;
using SubscriptionService.Data;
using SubscriptionService.Models;
using System;

namespace SubscriptionService.Repositories
{
    public class SubscriptionRepository : ISubscriptionRepository
    {
        private readonly AppDbContext _context;

        public SubscriptionRepository(AppDbContext context)
        {
            _context = context;
        }

        public async Task<Subscription> GetByIdAsync(Guid subscriptionId)
        {
            return await _context.Subscriptions
                .FirstOrDefaultAsync(s => s.Id == subscriptionId);
        }

        public async Task<Subscription> GetSubscriptionAsync(Guid userId)
        {
            return await _context.Subscriptions
                .FirstOrDefaultAsync(s => s.UserId == userId);
        }

        public async Task AddAsync(Subscription subscription)
        {
            await _context.Subscriptions.AddAsync(subscription);
            await _context.SaveChangesAsync();
        }

        public async Task UpdateAsync(Subscription subscription)
        {
            _context.Subscriptions.Update(subscription);
            await _context.SaveChangesAsync();
        }

        public async Task DeleteAsync(Guid subscriptionId)
        {
            var sub = await GetByIdAsync(subscriptionId);
            if (sub != null)
            {
                _context.Subscriptions.Remove(sub);
                await _context.SaveChangesAsync();
            }
        }

        public async Task<bool> UserHasActiveSubscriptionAsync(Guid userId)
        {
            return await _context.Subscriptions
                .AnyAsync(s => s.UserId == userId && s.IsActive);
        }

        public async Task<List<Subscription>> GetDueSubscriptionsAsync()
        {
            var now = DateTime.UtcNow;
            return await _context.Subscriptions
                .Include(s => s.User)
                .Where(s => s.NextPaymentDate <= now && s.IsActive)
                .ToListAsync();
        }

        public async Task<bool> UpgradePlanAsync(Guid userId, SubscriptionPlan newPlan)
        {
            var subscription = await GetSubscriptionAsync(userId);
            if (subscription == null) return false;

            // Update plan en bijbehorende waardes
            subscription.Plan = newPlan;

            // Stel nieuwe prijs en tokens in op basis van het plan
            (subscription.MonthlyPrice, subscription.MonthlyTokens) = newPlan switch
            {
                SubscriptionPlan.Free => (0, 0),
                SubscriptionPlan.Basic => (4.99m, 50),
                SubscriptionPlan.Premium => (9.99m, 200),
                _ => (0m, 0)
            };

            await UpdateAsync(subscription);
            return true;
        }
    }
}
