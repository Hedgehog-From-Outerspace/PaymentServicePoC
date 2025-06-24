using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
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

        public PaymentController(IHttpClientFactory clientFactory, ILogger<PaymentController> logger, InstanceMetaData instanceMetaData)
        {
            _clientFactory = clientFactory;
            _logger = logger;
            _instanceMetaData = instanceMetaData;
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


    }
}
