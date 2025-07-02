namespace WalletService.Repositories
{
    public interface IWalletRepository
    {
        Task<int> GetBalanceAsync(Guid userId);
        Task<bool> HasSufficientBalanceAsync(Guid userId, int amount);
        Task<bool> DeductBalanceAsync(Guid userId, int amount);
        Task AddTokensAsync(Guid walletId, int tokensToAdd);
        Task<Wallet> GetWalletAsync(Guid userId);
        Task<Wallet> AddAsync(Wallet wallet);
    }
}
