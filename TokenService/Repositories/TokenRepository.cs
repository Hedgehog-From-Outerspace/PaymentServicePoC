using Microsoft.EntityFrameworkCore;
using TokenService.Data;
using TokenService.Models;

namespace TokenService.Repositories
{
    public class TokenRepository : ITokenRepository
    {
        private readonly AppDbContext _context;

        public TokenRepository(AppDbContext context)
        {
            _context = context;
        }

        public async Task CreateTransactionAsync(Guid userId, int amount, string description)
        {
            var transaction = new TokenTransaction
            {
                UserId = userId,
                Amount = amount,
                Description = description,
                TransactionDate = DateTime.UtcNow
            };

            await _context.TokenTransactions.AddAsync(transaction);
            await _context.SaveChangesAsync();
        }

        public async Task<List<TokenTransaction>> GetUserTransactionsAsync(Guid userId)
        {
            return await _context.TokenTransactions
                .Where(t => t.UserId == userId)
                .OrderByDescending(t => t.TransactionDate)
                .ToListAsync();
        }
    }
}
