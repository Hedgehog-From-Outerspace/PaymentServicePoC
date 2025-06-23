using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Shared;

namespace WalletService.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class WalletController : ControllerBase
    {
        private readonly ILogger<WalletController> _logger;
        private readonly InstanceMetaData _instanceMetaData;

        public WalletController(ILogger<WalletController> logger, InstanceMetaData instanceMetaData)
        {
            _logger = logger;
            _instanceMetaData = instanceMetaData;
        }

        [HttpGet("ping")]
        public IActionResult Ping()
        {
            _logger.LogInformation("Ping received by instance {InstanceId}", _instanceMetaData.Id);
            return Ok("WalletService is running");
        }

        [HttpGet("secureping")]
        [Authorize(Roles = "admin,dev")]
        public IActionResult SecurePing()
        {
            _logger.LogInformation("Secure ping received by instance {InstanceId}", _instanceMetaData.Id);
            return Ok("WalletService is running securely");
        }
    }
}
