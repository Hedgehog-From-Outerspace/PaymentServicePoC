using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Shared.Model
{
    public class Song
    {
        public Guid Id { get; set; }
        public string Title { get; set; }
        public string Artist { get; set; }
        public decimal PriceInTokens { get; set; }
        public List<User> PurchasedByUsers { get; set; } = new List<User>();
    }
}
