using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace uchot_oborud.Yar.Models
{
    public class Status
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public Status(int Id, string Name)
        {
            this.Id = Id;
            this.Name = Name;
        }
    }
}
