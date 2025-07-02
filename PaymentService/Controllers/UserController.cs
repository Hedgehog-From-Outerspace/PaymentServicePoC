using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PaymentService.Data;
using PaymentService.Repositories;
using Shared;
using WalletService.Repositories;

namespace PaymentService.Controllers
{
    [ApiController]
    [Route("api/users")]
    public class UserController : ControllerBase
    {
        private readonly IUserRepository _userRepository;
        private readonly AppDbContext _context;

        public UserController(IUserRepository userRepository, AppDbContext context)
        {
            _userRepository = userRepository;
            _context = context;
        }

        [HttpPost]
        public async Task<IActionResult> AddAsync([FromBody] CreateUserRequest request)
        {
            // 1. Create User (with empty WalletId/SubscriptionId)
            var user = new User
            {
                Name = request.Name,
                WalletId = Guid.Empty, // Temporary empty GUID
                SubscriptionId = Guid.Empty
            };

            await _userRepository.AddAsync(user);

            // 2. Generate IDs that other services will use
            var walletId = Guid.NewGuid();
            var subscriptionId = Guid.NewGuid();

            // 3. Update user with future IDs (other services will populate these)
            user.WalletId = walletId;
            user.SubscriptionId = subscriptionId;
            await _userRepository.UpdateAsync(user);

            return CreatedAtAction(
                nameof(GetUser),
                new { userId = user.Id },
                new
                {
                    user.Id,
                    user.Name,
                    WalletId = walletId, // Forward these IDs to clients
                    SubscriptionId = subscriptionId
                });
        }

        [HttpGet("{userId}")]
        public async Task<IActionResult> GetUser(Guid userId)
        {
            var user = await _userRepository.GetByIdAsync(userId);
            return user != null ? Ok(user) : NotFound();
        }

        public record CreateUserRequest(string Name);

        [HttpDelete("{userId}")]
        public async Task<IActionResult> DeleteUser(Guid userId)
        {
            await _userRepository.DeleteAsync(userId);
            return NoContent();
        }
    }
}
