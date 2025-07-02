using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using PaymentService.Repositories;
using Shared;

namespace PaymentService.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class PaymentController : ControllerBase
    {
        private readonly IHttpClientFactory _clientFactory;
        private readonly ILogger<PaymentController> _logger;
        private readonly InstanceMetaData _instanceMetaData;
        private readonly IPaymentRepository _paymentRepository;

        public PaymentController(IPaymentRepository paymentRepository)
            => _paymentRepository = paymentRepository;


        public PaymentController(IHttpClientFactory clientFactory, ILogger<PaymentController> logger, InstanceMetaData instanceMetaData, IPaymentRepository paymentRepository)
        {
            _clientFactory = clientFactory;
            _logger = logger;
            _instanceMetaData = instanceMetaData;
            _paymentRepository = paymentRepository;
        }

        [HttpGet("ping")]
        public IActionResult Ping()
        {
            var walletClient = _clientFactory.CreateClient("WalletServiceClient");
            var tokenClient = _clientFactory.CreateClient("TokenServiceClient");
            var logClient = _clientFactory.CreateClient("TransactionLogClient");

            _logger.LogInformation("Ping received by instance {InstanceId}", _instanceMetaData.Id);
            return Ok("PaymentService is running");
        }

        [HttpGet("secureping")]
        [Authorize(Roles = "admin,dev")]
        public IActionResult SecurePing()
        {
            _logger.LogInformation("Secure ping received by instance {InstanceId}", _instanceMetaData.Id);
            return Ok("PaymentService is running securely");
        }

        [HttpPost("purchase")]
        public async Task<IActionResult> PurchaseSong([FromBody] PurchaseRequest request)
        {
            try
            {
                var success = await _paymentRepository.ProcessSongPurchaseAsync(
                    request.UserId,
                    request.SongId,
                    request.SongPrice
                );
                return success ? Ok() : BadRequest("Insufficient tokens");
            }
            catch (Exception ex)
            {
                return StatusCode(500, "Internal server error");
            }
        }

        public record PurchaseRequest(Guid UserId, Guid SongId, int SongPrice);
    }
}