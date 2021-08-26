using System;
using System.Collections.Generic;

namespace smartattendancesystem.Models
{
    public partial class Role
    {
        public int RoleId { get; set; }

        public string Name { get; set; }
        public DateTime? CreatedDate { get; set; }
        public string CreatedBy { get; set; }
        public DateTime? ModifyDate { get; set; }
        public string ModifyBy { get; set; }
        public string Status { get; set; }//s

       

    }
}
//end