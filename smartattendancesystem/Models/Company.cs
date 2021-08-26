using System;
using System.Collections.Generic;

namespace smartattendancesystem.Models
{
    public partial class Company
    {
        public Company()
        {
            Department = new HashSet<Department>();
        }

        public int CompanyId { get; set; }
   
        public TimeSpan? InTime { get; set; }
        public TimeSpan? OutTime { get; set; }
        public string Address { get; set; }
        public string Policies { get; set; }
        public string WebAddress { get; set; }
        public string Email { get; set; }
        public string PhoneNumber { get; set; }
        public DateTime? CreatedDate { get; set; }
        public string CreatedBy { get; set; }
        public DateTime? ModifyDate { get; set; }
        public string ModifyBy { get; set; }
        public string Status { get; set; }
        public string Name { get; set; }

        public string LogoDesign { get; set; }

        public virtual ICollection<Department> Department { get; set; }
    }
}
//end