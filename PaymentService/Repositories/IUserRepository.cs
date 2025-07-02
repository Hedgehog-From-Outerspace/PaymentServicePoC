using Shared;

namespace PaymentService.Repositories
{
    public interface IUserRepository
    {
        Task<User> AddAsync(User user);
        Task<User> GetByIdAsync(Guid userId);
        Task<List<User>> GetAllUsersAsync();
        Task<User> UpdateAsync(User user);
        Task<User> DeleteAsync(Guid userId);
        Task<bool> ExistsAsync(Guid userId);
    }
}
