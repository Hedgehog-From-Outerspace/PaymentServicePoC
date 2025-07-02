using Shared;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TokenService.Models;

namespace WalletService
{
    public class Wallet
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)] // Disable auto-ID
        public Guid Id { get; set; }
        public Guid UserId { get; set; }
        public User User { get; set; }
        public int Balance { get; set; }
        public ICollection<TokenTransaction> Transactions { get; set; } = new List<TokenTransaction>();
    }
}
