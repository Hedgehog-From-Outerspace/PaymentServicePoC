using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Shared;
using TokenService.Models;
using TokenService.Repositories;

namespace TokenService.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class TokenController : ControllerBase
    {
        private readonly ILogger<TokenController> _logger;
        private readonly InstanceMetaData _instanceMetaData;
        private readonly ITokenRepository _tokenRepository;

        public TokenController(ILogger<TokenController> logger, InstanceMetaData instanceMetaData, ITokenRepository tokenRepository)
        {
            _logger = logger;
            _instanceMetaData = instanceMetaData;
            _tokenRepository = tokenRepository;
        }

        [HttpGet("ping")]
        public IActionResult Ping()
        {
            _logger.LogInformation("Ping received by instance {instanceId}", _instanceMetaData.Id);
            return Ok("TokenService is running");
        }

        [HttpGet("secureping")]
        [Authorize(Roles = "admin,dev")]
        public IActionResult SecurePing()
        {
            _logger.LogInformation("Secure ping received by instance {instanceId}", _instanceMetaData.Id);
            return Ok("TokenService is running securely");
        }

        [HttpGet("transactions/{userId}")]
        public async Task<IActionResult> GetTransactions(Guid userId)
        {
            try
            {
                var transactions = await _tokenRepository.GetUserTransactionsAsync(userId);
                return Ok(transactions);
            }
            catch (Exception ex)
            {
                return StatusCode(500, "Internal server error");
            }
        }

        [HttpPost("transactions")]
        public async Task<IActionResult> CreateTransaction(
            [FromBody] CreateTransactionRequest request)
        {
            await _tokenRepository.CreateTransactionAsync(
                request.UserId,
                request.Amount,
                request.Description);

            return Ok();
        }
    }

    public record CreateTransactionRequest(Guid UserId, int Amount, string Description);
}