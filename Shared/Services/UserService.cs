using Microsoft.EntityFrameworkCore;
using Shared.Data;
using Shared.Model;

namespace Shared.Services
{
    public class UserService
    {
        private readonly PaymentDbContext _context;

        public UserService(PaymentDbContext context)
        {
            _context = context;
        }

        public async Task<User> CreateUser(string name)
        {
            var user = new User
            {
                Name = name,
                Wallet = new Wallet { Balance = 0 },
                Subscription = new Subscription { Plan = SubscriptionPlan.Free }
            };

            _context.Users.Add(user);
            await _context.SaveChangesAsync();
            return user;
        }

        public async Task<User> GetUser(Guid userId)
        {
            return await _context.Users
                .Include(u => u.Wallet)
                .Include(u => u.Subscription)
                .Include(u => u.PurchasedSongs)
                .FirstOrDefaultAsync(u => u.Id == userId);
        }
    }
}
