﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace uchot_oborud.Yar.Models
{
    public class Classroom
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Code { get; set; }
        public Classroom(int Id, string Name, string Code)
        {
            this.Id = Id;
            this.Name = Name;
            this.Code = Code;
        }
    }
}
