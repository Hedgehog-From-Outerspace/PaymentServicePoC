using Microsoft.EntityFrameworkCore;
using Shared.Model;

namespace WalletService.Data
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
        {
        }

        public DbSet<Wallet> Wallets { get; set; }

    }
}
