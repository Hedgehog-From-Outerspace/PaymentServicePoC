using PaymentService.Controllers;
using PaymentService.Models;

namespace PaymentService.Repositories
{
    public interface IPaymentRepository
    {
        Task<Payment> CreatePaymentAsync(Guid userId, Guid songId, int tokens);
        Task<List<Payment>> GetUserPaymentsAsync(Guid userId);
        Task<bool> ProcessSongPurchaseAsync(Guid userId, Guid songId, int songPrice);
    }
}
