using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Shared.Model
{
    public class TokenTransaction
    {
        public Guid Id { get; set; }
        public Guid WalletId { get; set; }
        public Wallet Wallet { get; set; }
        public decimal Amount { get; set; }
        public string Description { get; set; }
        public DateTime Date { get; set; }
    }
}
