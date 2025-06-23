using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Shared
{
    public class InstanceMetaData
    {
        public string Id { get; set; }

        public InstanceMetaData()
        {
            Id = Environment.GetEnvironmentVariable("HOSTNAME")
     ?? throw new InvalidOperationException("HOSTNAME not set.");
        }

    }
}
