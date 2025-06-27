using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting.Server;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Shared.Data;
using Shared.Model;
using Shared.Services;
using System;

var builder = WebApplication.CreateBuilder(args);

var appDbContextConnectionString = builder.Configuration.GetConnectionString("DefaultConnection");
builder.Services.AddDbContext<PaymentDbContext>(options =>
   options.UseSqlServer(appDbContextConnectionString));

// Add services to the container.  
var serviceProvider = new ServiceCollection()
.AddDbContext<PaymentDbContext>(options =>
 options.UseSqlServer("Server=CXO;Database=MusicStreamingPlatform;Integrated Security=True;TrustServerCertificate=True;"))
   .AddScoped<UserService>()
   .AddScoped<SubscriptionService>()
   .AddScoped<PaymentService>()
   .BuildServiceProvider();

// Initialize database  
using (var scope = serviceProvider.CreateScope())
{
    var dbContext = scope.ServiceProvider.GetRequiredService<PaymentDbContext>();
    await dbContext.Database.EnsureCreatedAsync();
}

// Test
using (var scope = serviceProvider.CreateScope())
{
    var userService = scope.ServiceProvider.GetRequiredService<UserService>();
    var subService = scope.ServiceProvider.GetRequiredService<SubscriptionService>();
    var storeService = scope.ServiceProvider.GetRequiredService<PaymentService>();

    // Create a user  
    var user = await userService.CreateUser("John Doe");
    Console.WriteLine($"Created user: {user.Name} with ID: {user.Id}");

    // Upgrade to Basic subscription  
    await subService.UpgradeSubscription(user.Id, SubscriptionPlan.Basic);
    await subService.RenewSubscription(user.Id); // Get initial tokens  
    Console.WriteLine("Upgraded to Basic and renewed subscription");

    // Get a song to purchase  
    var songs = await scope.ServiceProvider.GetRequiredService<PaymentDbContext>().Songs.ToListAsync();
    var firstSong = songs.First();

    // Purchase a song  
    var success = await storeService.PurchaseSong(user.Id, firstSong.Id);
    Console.WriteLine(success
        ? $"Successfully purchased song: {firstSong.Title}"
        : "Failed to purchase song");

    // Display user info  
    var updatedUser = await userService.GetUser(user.Id);
    Console.WriteLine($"\nUser: {updatedUser.Name}");
    Console.WriteLine($"Subscription: {updatedUser.Subscription.Plan}");
    Console.WriteLine($"Wallet Balance: {updatedUser.Wallet.Balance}");
    Console.WriteLine($"Purchased Songs: {updatedUser.PurchasedSongs.Count}");
}

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle  
builder.Services.AddEndpointsApiExplorer();

var app = builder.Build();

// Configure the HTTP request pipeline.  

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
