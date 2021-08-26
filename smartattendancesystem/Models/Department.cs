using System;
using System.Collections.Generic;

namespace smartattendancesystem.Models
{
    public partial class Department
    {
        public Department()
        {
            Attendance = new HashSet<Attendance>();
            Employee = new HashSet<Employee>();
            Overtime = new HashSet<Overtime>();
        }

        public int DepartmentId { get; set; }
        public int Company { get; set; }
        public TimeSpan? InTime { get; set; }
        public TimeSpan? OutTime { get; set; }
        public string PhoneNumber { get; set; }
        public DateTime? CreatedDate { get; set; }
        public string CreatedBy { get; set; }
        public DateTime? ModifyDate { get; set; }
        public string ModifyBy { get; set; }
        public string Status { get; set; }

        public string Name { get; set; }

        public virtual Company CompanyNavigation { get; set; }
        public virtual ICollection<Attendance> Attendance { get; set; }
        public virtual ICollection<Employee> Employee { get; set; }
        public virtual ICollection<Overtime> Overtime { get; set; }
    }
}
//end
