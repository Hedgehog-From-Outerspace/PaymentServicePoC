using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace PaymentService.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class PaymentController : ControllerBase
    {
        private readonly IHttpClientFactory _clientFactory;
        private readonly ILogger<PaymentController> _logger;

        public PaymentController(IHttpClientFactory clientFactory, ILogger<PaymentController> logger)
        {
            _clientFactory = clientFactory;
            _logger = logger;
        }

        [HttpGet("ping")]
        public IActionResult Ping()
        {
            var walletClient = _clientFactory.CreateClient("WalletServiceClient");
            var tokenClient = _clientFactory.CreateClient("TokenServiceClient");
            var logClient = _clientFactory.CreateClient("TransactionLogClient");

            _logger.LogInformation("Ping received at PaymentService");
            return Ok("PaymentService is running");
        }

        [HttpGet("secureping")]
        [Authorize(Roles = "admin,dev")]
        public IActionResult SecurePing()
        {
            _logger.LogInformation("Secure ping received at PaymentService");
            return Ok("PaymentService is running securely");
        } 


    }
}
