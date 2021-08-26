using System;
using System.Collections.Generic;

namespace smartattendancesystem.Models
{
    public partial class Employee
    {
        public Employee()
        {
            Attendance = new HashSet<Attendance>();
            Overtime = new HashSet<Overtime>();
        }

        public int EmployeeId { get; set; }
        public int Department { get; set; }
        public string Qualification { get; set; }
        public string Email { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string PhoneNumber { get; set; }
        public string Address { get; set; }
        public string WorkExperience { get; set; }
  
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Designation { get; set; }
        public DateTime? HireDate { get; set; }
        public TimeSpan? InTime { get; set; }
        public TimeSpan? OutTime { get; set; }
        public DateTime? CreatedDate { get; set; }
        public string CreatedBy { get; set; }
        public DateTime? ModifyDate { get; set; }
        public string ModifyBy { get; set; }
        public string Status { get; set; }


        public string Images { get; set; }

        public virtual Department DepartmentNavigation { get; set; }
        public virtual ICollection<Attendance> Attendance { get; set; }
        public virtual ICollection<Overtime> Overtime { get; set; }
    }
}
//end