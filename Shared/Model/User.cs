using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Shared.Model
{
    public class User
    {
        public Guid Id { get; set; } = Guid.NewGuid();
        public string Name { get; set; }
        public Wallet Wallet { get; set; }
        public Subscription Subscription { get; set; }
        public List<Song> PurchasedSongs { get; set; } = new List<Song>();
    }
}
