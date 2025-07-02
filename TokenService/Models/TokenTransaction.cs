using Shared;

namespace TokenService.Models
{
    public class TokenTransaction
    {
        public Guid Id { get; set; }
        public Guid UserId { get; set; }
        public User User { get; set; }
        public int Amount { get; set; }
        public string Description { get; set; }
        public DateTime TransactionDate { get; set; } = DateTime.UtcNow;
    }
}
