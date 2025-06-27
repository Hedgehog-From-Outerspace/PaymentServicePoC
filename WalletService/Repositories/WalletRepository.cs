using System;

namespace WalletService.Repositories
{
    public class WalletRepository
    {
        private readonly AppDbContext _context;
        private readonly ILogger<WalletRepository> _logger;
        private readonly HttpClient _httpClient;

        public WalletRepository(AppDbContext context, ILogger<WalletRepository> logger, HttpClient httpClient)
        {
            _context = context;
            _logger = logger;
            _httpClient = httpClient;
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
    }
}
