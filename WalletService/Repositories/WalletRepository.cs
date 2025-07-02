using Microsoft.EntityFrameworkCore;
using System;
using WalletService.Data;

namespace WalletService.Repositories
{
    public class WalletRepository : IWalletRepository
    {
        private readonly AppDbContext _context;

        public WalletRepository(AppDbContext context)
        {
            _context = context;
        }

        public async Task<int> GetBalanceAsync(Guid userId)
        {
            var wallet = await _context.Wallets
                .FirstOrDefaultAsync(w => w.UserId == userId);

            return wallet?.Balance ?? 0;
        }

        public async Task<bool> HasSufficientBalanceAsync(Guid userId, int amount)
        {
            var balance = await GetBalanceAsync(userId);
            return balance >= amount;
        }

        public async Task<bool> DeductBalanceAsync(Guid userId, int amount)
        {
            if (amount <= 0) throw new ArgumentException("Amount must be positive", nameof(amount));

            var wallet = await _context.Wallets.FirstOrDefaultAsync(w => w.UserId == userId);
            if (wallet == null) return false;

            if (wallet.Balance < amount) return false;

            wallet.Balance -= amount;
            await _context.SaveChangesAsync();
            return true;
        }

        public async Task AddTokensAsync(Guid walletId, int tokensToAdd)
        {
            var wallet = await _context.Wallets.FindAsync(walletId);
            if (wallet != null)
            {
                wallet.Balance += tokensToAdd;
                _context.Wallets.Update(wallet);
                await _context.SaveChangesAsync();
            }
        }

        public async Task<Wallet> GetWalletAsync(Guid userId)
        {
            return await _context.Wallets
                .FirstOrDefaultAsync(w => w.UserId == userId);
        }

        public async Task<Wallet> AddAsync(Wallet wallet)
        {
            await _context.Wallets.AddAsync(wallet);
            await _context.SaveChangesAsync();
            return wallet;
        }
    }
}
