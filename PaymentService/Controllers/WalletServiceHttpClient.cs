namespace PaymentService.Controllers
{
    public class WalletServiceHttpClient
    {
        private readonly HttpClient _client;
        public WalletServiceHttpClient(HttpClient client) => _client = client;

        public async Task<bool> DeductTokensAsync(Guid userId, int amount)
        {
            var response = await _client.PostAsJsonAsync("/api/wallet/deduct", new { userId, amount });
            return response.IsSuccessStatusCode;
        }
    }
}
