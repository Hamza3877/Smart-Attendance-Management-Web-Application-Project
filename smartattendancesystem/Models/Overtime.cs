using System;
using System.Collections.Generic;

namespace smartattendancesystem.Models
{
    public partial class Overtime
    {
        public int OvertimeId { get; set; }
        public int Department { get; set; }
        public int Employee { get; set; }
        public DateTime? ExtraHours { get; set; }
        public DateTime? CreatedDate { get; set; }
        public string CreatedBy { get; set; }
        public DateTime? ModifyDate { get; set; }
        public string ModifyBy { get; set; }
        public string Status { get; set; }

        public virtual Department DepartmentNavigation { get; set; }
        public virtual Employee EmployeeNavigation { get; set; }
    }
}
//end