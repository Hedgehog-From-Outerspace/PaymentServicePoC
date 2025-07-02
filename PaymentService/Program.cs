using Microsoft.IdentityModel.Tokens;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Shared;
using WalletService.Repositories;
using TokenService.Repositories;
using PaymentService.Repositories;
using Microsoft.EntityFrameworkCore;
using PaymentService.Data;
using PaymentService.Controllers;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllers();
builder.Services.AddHealthChecks();

// Register repositories
builder.Services.AddScoped<IUserRepository, UserRepository>();
builder.Services.AddScoped<IPaymentRepository, PaymentRepository>();
builder.Services.AddHttpClient<WalletServiceHttpClient>(client =>
{
    client.BaseAddress = new Uri("https://walletservice-api");
});

// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();

// Swagger configuration
builder.Services.AddSwaggerGen(options =>
{
    options.AddSecurityDefinition("Bearer", new Microsoft.OpenApi.Models.OpenApiSecurityScheme
    {
        Description = "JWT Authorization header using the Bearer scheme. Example: 'Bearer {token}'",
        Name = "Authorization",
        In = Microsoft.OpenApi.Models.ParameterLocation.Header,
        Type = Microsoft.OpenApi.Models.SecuritySchemeType.ApiKey,
        Scheme = "Bearer"
    });

    options.AddSecurityRequirement(new Microsoft.OpenApi.Models.OpenApiSecurityRequirement
    {
        {
            new Microsoft.OpenApi.Models.OpenApiSecurityScheme
            {
                Reference = new Microsoft.OpenApi.Models.OpenApiReference
                {
                    Type = Microsoft.OpenApi.Models.ReferenceType.SecurityScheme,
                    Id = "Bearer"
                }
            },
            new string[] {}
        }
    });
});

builder.Services.AddHttpClient("TokenServiceClient", client =>
{
    client.BaseAddress = new Uri("http://tokenservice:8080/");
});

builder.Services.AddHttpClient("TransactionLogClient", client =>
{
    client.BaseAddress = new Uri("http://transactionlogservice:8080/");
});

builder.Services.AddHttpClient("WalletServiceClient", client =>
{
    client.BaseAddress = new Uri("http://walletservice:8080/");
});

builder.Services.AddHttpClient("WalletService", client =>
{
    client.BaseAddress = new Uri("https://walletservice-api");
});

builder.Services.AddHttpClient("SubscriptionService", client =>
{
    client.BaseAddress = new Uri("https://subscriptionservice-api");
});

// Configure database
var appDbContextConnectionString = builder.Configuration.GetConnectionString("DefaultConnection")
    ?? "Server=localhost;Database=MusicStreamingPlatform;Integrated Security=True;TrustServerCertificate=True;";
builder.Services.AddDbContext<AppDbContext>(options =>
   options.UseSqlServer(appDbContextConnectionString));

// Logging configuration
builder.Logging.ClearProviders();
builder.Logging.AddConsole();
builder.Services.AddSingleton<InstanceMetaData>();

// Dummy JWT authentication setup
var jwtSecret = builder.Configuration["Jwt:Secret"];
var signingKey = new SymmetricSecurityKey(System.Text.Encoding.UTF8.GetBytes(jwtSecret));

builder.Services.AddAuthentication("Bearer")
    .AddJwtBearer("Bearer", options =>
    {
        options.TokenValidationParameters = new TokenValidationParameters
        {
            ValidateIssuer = false,
            ValidateAudience = false,
            ValidateLifetime = false,
            ValidateIssuerSigningKey = false,
            IssuerSigningKey = signingKey
        };
    });


var app = builder.Build();

var logger = app.Services.GetRequiredService<ILogger<Program>>();
logger.LogInformation("PaymentService started up");

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseAuthentication();
app.UseAuthorization();

app.MapControllers();

app.MapHealthChecks("/healthz");

app.Run();
