using Microsoft.EntityFrameworkCore;
using SubscriptionService.Models;

namespace SubscriptionService.Data
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
        {
        }

        public DbSet<Subscription> Subscriptions { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Subscription>()
                .HasKey(s => s.Id);
            modelBuilder.Entity<Subscription>()
                .HasOne(s => s.User)
                .WithOne()
                .HasForeignKey<Subscription>(s => s.UserId)
                .OnDelete(DeleteBehavior.Cascade);
        }
    }
}
