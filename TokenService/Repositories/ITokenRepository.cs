using TokenService.Models;

namespace TokenService.Repositories
{
    public interface ITokenRepository
    {
        Task CreateTransactionAsync(Guid userId, int amount, string description);
        Task<List<TokenTransaction>> GetUserTransactionsAsync(Guid userId);
    }
}
