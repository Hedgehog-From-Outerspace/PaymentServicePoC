using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Shared
{
    public class User
    {
        public Guid Id { get; set; } = Guid.NewGuid();
        public string Name { get; set; }
        public List<Song> PurchasedSongs { get; set; } = new List<Song>();
        public Guid? WalletId { get; set; } // Referentie naar WalletService
        public Guid? SubscriptionId { get; set; } // Referentie naar SubscriptionService
    }
}
