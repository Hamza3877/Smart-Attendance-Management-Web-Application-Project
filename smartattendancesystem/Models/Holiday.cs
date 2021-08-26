using System;
using System.Collections.Generic;

namespace smartattendancesystem.Models
{
    public partial class Holiday
    {
        public int HolidayId { get; set; }
        public string Name { get; set; }
        public DateTime? CreatedDate { get; set; }
        public string CreatedBy { get; set; }
        public DateTime? ModifyDate { get; set; }
        public string ModifyBy { get; set; }
        public string Status { get; set; }
        public DateTime? StartDate { get; set; }
        public DateTime? EndDate { get; set; }
    }
}
//end