using System;
using System.Collections.Generic;

namespace smartattendancesystem.Models
{
    public partial class User
    {
        public int UserId { get; set; }
        public string Email { get; set; }

        public string UserName { get; set; }

        public string Role { get; set; }
        public string Address { get; set; }
        public string PhoneNumber { get; set; }
        public string Password { get; set; }
             public string FirstName { get; set; }
        public string LastName { get; set; }
        public DateTime? CreatedDate { get; set; }
        public string CreatedBy { get; set; }
        public DateTime? ModifyDate { get; set; }
        public string ModifyBy { get; set; }
        public string Status { get; set; }//s

        public string ConfirmPassword { get; set; }
        public string OldPassword { get; set; }
        public string NewPassword { get; set; }
        public string Images { get; set; }

    }
}
//end