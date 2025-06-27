using Microsoft.EntityFrameworkCore;
using Shared.Data;
using Shared.Model;

namespace Shared.Services
{
    public class PaymentService
    {
        private readonly PaymentDbContext _context;

        public PaymentService(PaymentDbContext context)
        {
            _context = context;
        }

        public async Task<Song> GetSong(Guid songId)
        {
            return await _context.Songs.FindAsync(songId);
        }

        public async Task<bool> PurchaseSong(Guid userId, Guid songId)
        {
            var user = await _context.Users
                .Include(u => u.Wallet)
                .Include(u => u.PurchasedSongs)
                .FirstOrDefaultAsync(u => u.Id == userId);

            var song = await _context.Songs.FindAsync(songId);

            if (user == null || song == null) return false;

            if (user.Wallet.Balance < song.PriceInTokens) return false;

            user.Wallet.Balance -= (int)song.PriceInTokens;
            user.PurchasedSongs.Add(song);

            _context.TokenTransactions.Add(new TokenTransaction
            {
                WalletId = user.Wallet.Id,
                Amount = -song.PriceInTokens,
                Description = $"Purchased song: {song.Title}"
            });

            await _context.SaveChangesAsync();
            return true;
        }

        public async Task AddTokens(Guid walletId, int amount, string description)
        {
            if (amount <= 0)
                throw new ArgumentException("Amount must be positive", nameof(amount));

            var wallet = await _context.Wallets.FindAsync(walletId);
            if (wallet == null)
                throw new ArgumentException("Wallet not found", nameof(walletId));

            wallet.Balance += amount;

            _context.TokenTransactions.Add(new TokenTransaction
            {
                WalletId = walletId,
                Amount = amount,
                Description = description
            });

            await _context.SaveChangesAsync();
        }
    }
}

