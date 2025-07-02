using Microsoft.EntityFrameworkCore;
using PaymentService.Data;
using PaymentService.Repositories;
using Shared;

public class UserRepository : IUserRepository
{
    private readonly AppDbContext _context;

    public UserRepository(AppDbContext context)
    {
        _context = context;
    }

    public async Task<User> AddAsync(User user)
    {
        await _context.Users.AddAsync(user);
        await _context.SaveChangesAsync();
        return user;
    }

    public async Task<User> GetByIdAsync(Guid userId)
    {
        return await _context.Users
            .Include(u => u.PurchasedSongs)
            .FirstOrDefaultAsync(u => u.Id == userId);
    }

    public async Task<List<User>> GetAllUsersAsync()
    {
        return await _context.Users
            .Include(u => u.PurchasedSongs)
            .ToListAsync();
    }

    public async Task<User> UpdateAsync(User user)
    {
        _context.Users.Update(user);
        await _context.SaveChangesAsync();
        return user;
    }

    public async Task<User> DeleteAsync(Guid userId)
    {
        var user = await GetByIdAsync(userId);
        if (user == null) return null;

        _context.Users.Remove(user);
        await _context.SaveChangesAsync();
        return user;
    }

    public async Task<bool> ExistsAsync(Guid userId)
    {
        return await _context.Users.AnyAsync(u => u.Id == userId);
    }
}
