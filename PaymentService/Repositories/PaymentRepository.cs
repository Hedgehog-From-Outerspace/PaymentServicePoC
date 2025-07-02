using Microsoft.EntityFrameworkCore;
using PaymentService.Controllers;
using PaymentService.Data;
using PaymentService.Models;
using Shared;
using System.Net.Http;
using TokenService.Models;
using TokenService.Repositories;
using WalletService.Repositories;

namespace PaymentService.Repositories
{
    public class PaymentRepository : IPaymentRepository
    {
        private readonly AppDbContext _context;
        private readonly ITokenRepository _tokenRepository;
        private readonly IWalletRepository _walletRepository;

        public PaymentRepository(
            AppDbContext context,
            ITokenRepository tokenRepository,
            IWalletRepository walletRepository)
        {
            _context = context;
            _tokenRepository = tokenRepository;
            _walletRepository = walletRepository;
        }

        public async Task<Payment> CreatePaymentAsync(Guid userId, Guid songId, int tokens)
        {
            var payment = new Payment
            {
                UserId = userId,
                SongId = songId,
                TokensSpent = tokens
            };
            _context.Payments.Add(payment);
            await _context.SaveChangesAsync();
            return payment;
        }

        public async Task<List<Payment>> GetUserPaymentsAsync(Guid userId)
        {
            return await _context.Payments
                .Where(p => p.UserId == userId)
                .ToListAsync();
        }

        public async Task<bool> ProcessSongPurchaseAsync(Guid userId, Guid songId, int songPrice)
        {
            await using var transaction = await _context.Database.BeginTransactionAsync();

            try
            {
                // 1. Check wallet saldo  
                var walletBalance = await _walletRepository.GetBalanceAsync(userId);
                if (walletBalance < songPrice) return false;

                // 2. Voer alle operaties uit  
                await _walletRepository.AddTokensAsync(userId, -songPrice);
                await _tokenRepository.CreateTransactionAsync(userId, -songPrice, $"Song purchase: {songId}");
                await CreatePaymentAsync(userId, songId, songPrice);

                await transaction.CommitAsync();
                return true;
            }
            catch
            {
                await transaction.RollbackAsync();
                throw;
            }
        }
    }
}
