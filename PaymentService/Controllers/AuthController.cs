using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using Shared;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace PaymentService.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class AuthController : ControllerBase
    {
        private readonly IConfiguration _config;
        private readonly ILogger<AuthController> _logger;
        private readonly InstanceMetaData _instanceMetaData;

        public AuthController(IConfiguration config, ILogger<AuthController> logger, InstanceMetaData instanceMetaData)
        {
            _config = config;
            _logger = logger;
            _instanceMetaData = instanceMetaData;
        }

        [HttpGet("dev-token")]
        public IActionResult GetDevToken()
        {
            var secretKey = _config["Jwt:Secret"];
            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(secretKey));
            var credentials = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

            var claims = new[]
            {
                new Claim(JwtRegisteredClaimNames.Sub, "dev_user"),
                new Claim(ClaimTypes.Role, "dev"),
                new Claim(JwtRegisteredClaimNames.Iss, "PaymentService"),
                new Claim(JwtRegisteredClaimNames.Exp, new DateTimeOffset(DateTime.UtcNow.AddHours(1)).ToUnixTimeSeconds().ToString())
            };

            var token = new JwtSecurityToken(
                claims: claims,
                signingCredentials: credentials
                );

            var tokenString = new JwtSecurityTokenHandler().WriteToken(token);

            _logger.LogInformation("Dev-token given to client by instance {InstanceId}", _instanceMetaData.Id);

            return Ok( tokenString );
        }
    }
}
