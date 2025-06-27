using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Shared.Model
{
    public class Subscription
    {
        public Guid Id { get; set; } = Guid.NewGuid();
        public SubscriptionPlan Plan { get; set; }
        public decimal MonthlyPrice { get; set; }
        public int MonthlyTokens { get; set; }
        public DateTime StartDate { get; set; }
        public Guid UserId { get; set; }
        public User User { get; set; }
    }
}
