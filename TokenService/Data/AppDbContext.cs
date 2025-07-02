using Microsoft.EntityFrameworkCore;
using TokenService.Models;

namespace TokenService.Data
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
        {
        }

        public DbSet<TokenTransaction> TokenTransactions { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<TokenTransaction>()
                .HasKey(t => t.Id);
            modelBuilder.Entity<TokenTransaction>()
                .Property(t => t.Amount)
                .HasColumnType("int");
            modelBuilder.Entity<TokenTransaction>()
                .Property(t => t.Description)
                .HasMaxLength(500);
            modelBuilder.Entity<TokenTransaction>()
                .Property(t => t.TransactionDate)
                .HasDefaultValueSql("GETUTCDATE()");
        }
    }
}
