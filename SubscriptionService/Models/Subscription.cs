using Shared;
using System.ComponentModel.DataAnnotations.Schema;

namespace SubscriptionService.Models
{
    public class Subscription
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)] // Disable auto-ID
        public Guid Id { get; set; }
        public Guid UserId { get; set; }
        public User User { get; set; }
        public SubscriptionPlan Plan { get; set; }
        public decimal MonthlyPrice { get; set; }
        public int MonthlyTokens { get; set; }
        public DateTime NextPaymentDate { get; set; }
        public bool IsActive { get; set; }
    }
}
