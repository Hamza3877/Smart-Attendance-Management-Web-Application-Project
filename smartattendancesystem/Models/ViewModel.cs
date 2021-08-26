using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace smartattendancesystem.Models
{
    public class ViewModel
    {

        public Company company { get; set; }
        public Attendance attendance { get; set; }

        public Department department { get; set; }
        public Employee employee { get; set; }
    }
}
//endds