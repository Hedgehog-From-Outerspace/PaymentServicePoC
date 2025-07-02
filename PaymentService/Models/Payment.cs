using Shared;

namespace PaymentService.Models
{
    public class Payment
    {
        public Guid Id { get; set; }
        public Guid UserId { get; set; }
        public User User { get; set; }
        public Guid SongId { get; set; }
        public Song Song { get; set; }
        public int TokensSpent { get; set; }
        public DateTime PurchaseDate { get; set; } = DateTime.UtcNow;
    }
}
