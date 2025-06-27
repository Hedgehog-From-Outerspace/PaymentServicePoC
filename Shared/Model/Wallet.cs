using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Shared.Model
{
    public class Wallet
    {
        public Guid Id { get; set; } = Guid.NewGuid();
        public int Balance { get; set; }
        public Guid UserId { get; set; }
        public User User { get; set; }
        public ICollection<TokenTransaction> Transactions { get; set; } = new List<TokenTransaction>();
    }
}
