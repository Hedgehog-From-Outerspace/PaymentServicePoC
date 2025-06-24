using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Shared;

namespace TokenService.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class TokenController : ControllerBase
    {
        private readonly ILogger<TokenController> _logger;
        private readonly InstanceMetaData _instanceMetaData;

        public TokenController(ILogger<TokenController> logger, InstanceMetaData instanceMetaData)
        {
            _logger = logger;
            _instanceMetaData = instanceMetaData;
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
    }
}
