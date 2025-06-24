using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Shared;

namespace TransactionLogService.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class TransactionLogController : ControllerBase
    {
        private readonly ILogger<TransactionLogController> _logger;
        private readonly InstanceMetaData _instanceMetaData;
        public TransactionLogController(ILogger<TransactionLogController> logger, InstanceMetaData instanceMetaData)
        {
            _logger = logger;
            _instanceMetaData = instanceMetaData;
        }

        [HttpGet("ping")]
        public IActionResult Ping()
        {
            _logger.LogInformation("Ping received by instance {InstanceId}", _instanceMetaData.Id);
            return Ok("TransactionLogService is running");
        }

        [HttpGet("secureping")]
        [Authorize(Roles = "admin,dev")]
        public IActionResult SecurePing()
        {
            _logger.LogInformation("Secure ping received by instance {InstanceId}", _instanceMetaData.Id);
            return Ok("TransactionLogService is running securely");
        }
    }
}
