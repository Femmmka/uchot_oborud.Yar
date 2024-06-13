using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace uchot_oborud.Yar.Models
{
    public class Roles
    {
        public int Id { get; set; }
        public string roles { get; set; }
        public Roles(int Id, string roles)
        {
            this.Id = Id;
            this.roles = roles;
        }
    }
}
