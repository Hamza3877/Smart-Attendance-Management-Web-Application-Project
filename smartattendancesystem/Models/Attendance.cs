using System;
using System.Collections.Generic;

namespace smartattendancesystem.Models
{
    public partial class Attendance
    {
        public int AttendanceId { get; set; }
        public int Department { get; set; }
        public int Employee { get; set; }
        public DateTime Date { get; set; }
        public DateTime? Timing { get; set; }
        public DateTime? CreatedDate { get; set; }
        public string CreatedBy { get; set; }
        public DateTime? ModifyDate { get; set; }
        public string ModifyBy { get; set; }
        public string Status { get; set; }

        public string AttendanceStatus { get; set; }

        public TimeSpan? InTime { get; set; }

        public TimeSpan? OutTime { get; set; }

        public string Reports { get; set; }



        public virtual Department DepartmentNavigation { get; set; }
        public virtual Employee EmployeeNavigation { get; set; }
    }
}
//end