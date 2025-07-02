using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Shared;
using SubscriptionService.Models;
using SubscriptionService.Repositories;
using WalletService.Repositories;

namespace SubscriptionService.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class SubscriptionController : ControllerBase
    {
        private readonly ILogger<SubscriptionController> _logger;
        private readonly InstanceMetaData _instanceMetaData;
        private readonly ISubscriptionRepository _subscriptionRepository;
        private readonly IWalletRepository _walletRepository;

        public SubscriptionController(ILogger<SubscriptionController> logger, InstanceMetaData instanceMetaData, ISubscriptionRepository subscriptionRepository, IWalletRepository walletRepository)
        {
            _logger = logger;
            _instanceMetaData = instanceMetaData;
            _subscriptionRepository = subscriptionRepository;
            _walletRepository = walletRepository;
        }

        [HttpGet("ping")]
        public IActionResult Ping()
        {
            _logger.LogInformation("Ping received by instance {InstanceId}", _instanceMetaData.Id);
            return Ok("SubscriptionService is running");
        }

        [HttpGet("secureping")]
        [Authorize(Roles = "admin,dev")]
        public IActionResult SecurePing()
        {
            _logger.LogInformation("Secure ping received by instance {InstanceId}", _instanceMetaData.Id);
            return Ok("SubscriptionService is running securely");
        }

        // GET: api/subscriptions/{userId}
        [HttpGet("{userId}")]
        public async Task<IActionResult> GetUserSubscription(Guid userId)
        {
            try
            {
                var subscription = await _subscriptionRepository.GetSubscriptionAsync(userId);
                if (subscription == null)
                {
                    return NotFound($"No subscription found for user {userId}");
                }
                return Ok(subscription);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error fetching subscription for user {UserId}", userId);
                return StatusCode(500, "Internal server error");
            }
        }

        // Updated code to handle nullable WalletId
        [HttpPut("{userId}/upgrade")]
        public async Task<IActionResult> UpgradeSubscription(Guid userId, [FromBody] SubscriptionPlan newPlan)
        {
            try
            {
                var success = await _subscriptionRepository.UpgradePlanAsync(userId, newPlan);
                if (!success)
                {
                    return NotFound($"User {userId} or subscription not found");
                }

                // Optional: Add tokens directly (for trial periods/direct upgrades)
                if (newPlan != SubscriptionPlan.Free)
                {
                    var subscription = await _subscriptionRepository.GetSubscriptionAsync(userId);
                    if (subscription?.User?.WalletId.HasValue == true)
                    {
                        await _walletRepository.AddTokensAsync(subscription.User.WalletId.Value, subscription.MonthlyTokens);
                    }
                    else
                    {
                        _logger.LogWarning("WalletId is null for user {UserId}", userId);
                    }
                }

                return Ok(new
                {
                    Message = $"Upgraded to {newPlan} plan",
                    NextPaymentDate = (await _subscriptionRepository.GetSubscriptionAsync(userId))?.NextPaymentDate
                });
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error upgrading subscription for user {UserId}", userId);
                return StatusCode(500, "Internal server error");
            }
        }

        // DELETE: api/subscriptions/{userId}
        [HttpDelete("{userId}")]
        public async Task<IActionResult> CancelSubscription(Guid userId)
        {
            try
            {
                var subscription = await _subscriptionRepository.GetSubscriptionAsync(userId);
                if (subscription == null)
                {
                    return NotFound();
                }

                subscription.IsActive = false;
                await _subscriptionRepository.UpdateAsync(subscription);

                return Ok($"Subscription for user {userId} cancelled");
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error cancelling subscription for user {UserId}", userId);
                return StatusCode(500, "Internal server error");
            }
        }

        [HttpGet("user/{userId}/active")]
        public async Task<IActionResult> CheckActiveSubscription(Guid userId)
        {
            var hasActiveSub = await _subscriptionRepository.UserHasActiveSubscriptionAsync(userId);
            return Ok(new { HasActiveSubscription = hasActiveSub });
        }

        [HttpPost]
        public async Task<IActionResult> CreateSubscription([FromBody] CreateSubscriptionRequest request)
        {
            var subscription = new Subscription
            {
                Id = request.SubscriptionId, // Pre-defined ID
                UserId = request.UserId,
                Plan = SubscriptionPlan.Free,
                IsActive = true,
                NextPaymentDate = DateTime.UtcNow.AddMonths(1)
            };

            await _subscriptionRepository.AddAsync(subscription);
            return Created();
        }

        public record CreateSubscriptionRequest(Guid SubscriptionId, Guid UserId);
    }
}
