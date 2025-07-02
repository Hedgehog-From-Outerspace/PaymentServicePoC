using Microsoft.EntityFrameworkCore;
using PaymentService.Models;
using Shared;
using WalletService;

namespace PaymentService.Data
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
        {
        }

        public DbSet<User> Users { get; set; }
        public DbSet<Payment> Payments { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<User>()
                .HasKey(u => u.Id);

            modelBuilder.Entity<Payment>()
                .HasKey(p => p.Id);

            modelBuilder.Entity<User>()
                .Property(u => u.WalletId)
                .IsRequired();

            modelBuilder.Entity<User>()
                .Property(u => u.SubscriptionId)
                .IsRequired();

            modelBuilder.Entity<User>()
                .HasMany(u => u.PurchasedSongs)
                .WithMany(s => s.PurchasedByUsers)
                .UsingEntity<Dictionary<string, object>>(
                    "UserPurchasedSongs",
                    j => j.HasOne<Song>().WithMany().HasForeignKey("SongId"),
                    j => j.HasOne<User>().WithMany().HasForeignKey("UserId")
                );

            // Seed initial data
            modelBuilder.Entity<Song>().HasData(
                new Song { Id = Guid.NewGuid(), Title = "Bohemian Rhapsody", Artist = "Queen", PriceInTokens = 50 },
                new Song { Id = Guid.NewGuid(), Title = "Imagine", Artist = "John Lennon", PriceInTokens = 30 },
                new Song { Id = Guid.NewGuid(), Title = "Shape of You", Artist = "Ed Sheeran", PriceInTokens = 40 }
            );
        }
    }
}