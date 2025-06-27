using Microsoft.EntityFrameworkCore;
using Shared.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Text;
using System.Threading.Tasks;

namespace Shared.Data
{
    public class PaymentDbContext : DbContext
    {
        public PaymentDbContext(DbContextOptions<PaymentDbContext> options) : base(options)
        {
        }

        public DbSet<User> Users { get; set; }
        public DbSet<Wallet> Wallets { get; set; }
        public DbSet<Subscription> Subscriptions { get; set; }
        public DbSet<Song> Songs { get; set; }
        public DbSet<TokenTransaction> TokenTransactions { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<User>()
                .HasKey(u => u.Id);

            modelBuilder.Entity<Wallet>()
                .HasKey(w => w.Id);

            modelBuilder.Entity<Subscription>()
                .HasKey(s => s.Id);

            // Configure one-to-one relationships
            modelBuilder.Entity<User>()
                .HasOne(u => u.Wallet)
                .WithOne(w => w.User)
                .HasForeignKey<Wallet>(w => w.UserId);

            modelBuilder.Entity<User>()
                .HasOne(u => u.Subscription)
                .WithOne(s => s.User)
                .HasForeignKey<Subscription>(s => s.UserId);

            modelBuilder.Entity<Wallet>()
                .HasOne(w => w.User)
                .WithOne(u => u.Wallet)
                .HasForeignKey<Wallet>(w => w.UserId)
                .OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<Subscription>()
                .HasOne(s => s.User)
                .WithOne(u => u.Subscription)
                .HasForeignKey<Subscription>(s => s.UserId)
                .OnDelete(DeleteBehavior.Cascade);

            // Configure many-to-many relationship between User and Song
            modelBuilder.Entity<User>()
                .HasMany(u => u.PurchasedSongs)
                .WithMany(s => s.PurchasedByUsers)
                .UsingEntity<Dictionary<string, object>>(
                    "UserPurchasedSongs",
                    j => j.HasOne<Song>().WithMany().HasForeignKey("SongId"),
                    j => j.HasOne<User>().WithMany().HasForeignKey("UserId")
                );

            // Configure one-to-many relationship between Wallet and TokenTransaction
            modelBuilder.Entity<Wallet>()
                .HasMany(w => w.Transactions)
                .WithOne(t => t.Wallet)
                .HasForeignKey(t => t.WalletId);

            // Seed initial data
            modelBuilder.Entity<Song>().HasData(
                new Song { Id = Guid.NewGuid(), Title = "Bohemian Rhapsody", Artist = "Queen", PriceInTokens = 50 },
                new Song { Id = Guid.NewGuid(), Title = "Imagine", Artist = "John Lennon", PriceInTokens = 30 },
                new Song { Id = Guid.NewGuid(), Title = "Shape of You", Artist = "Ed Sheeran", PriceInTokens = 40 }
            );
        }
    }
}
