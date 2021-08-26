using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace smartattendancesystem.Models
{
    public partial class projectContext : DbContext
    {
        public projectContext()
        {
        }

        public projectContext(DbContextOptions<projectContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Attendance> Attendance { get; set; }
        public virtual DbSet<Company> Company { get; set; }
        public virtual DbSet<Department> Department { get; set; }
        public virtual DbSet<Employee> Employee { get; set; }
        public virtual DbSet<Holiday> Holiday { get; set; }
        public virtual DbSet<Overtime> Overtime { get; set; }
        public virtual DbSet<Role> Role { get; set; }
        public virtual DbSet<User> User { get; set; }

        //protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        //{
          //  if (!optionsBuilder.IsConfigured)
            //{
//#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
  //              optionsBuilder.UseSqlServer("Server=DESKTOP-K4O2BIG\\SQL;Database=project;Trusted_Connection=True;");
    //        }
      //  }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("ProductVersion", "2.2.6-servicing-10079");

            modelBuilder.Entity<Attendance>(entity =>
            {
                entity.Property(e => e.AttendanceId).HasColumnName("Attendance_id");

                entity.Property(e => e.CreatedBy).HasColumnName("created_by");

                entity.Property(e => e.CreatedDate)
                    .HasColumnName("created_date")
                    .HasColumnType("datetime");

                entity.Property(e => e.Date).HasColumnType("date");

                entity.Property(e => e.ModifyBy).HasColumnName("modify_by");

                entity.Property(e => e.ModifyDate)
                    .HasColumnName("modify_date")
                    .HasColumnType("datetime");

                entity.Property(e => e.Status)
                    .HasColumnName("status")
                    .HasMaxLength(50);

                entity.Property(e => e.AttendanceStatus)
                 .HasColumnName("attendance_status")
                 .HasMaxLength(50);

                entity.Property(e => e.InTime).HasColumnName("in_time");

                entity.Property(e => e.OutTime).HasColumnName("out_time");

                entity.Property(e => e.Reports)
                  .HasColumnName("reports")
                  .HasMaxLength(50);

                entity.Property(e => e.Timing)
                    .HasColumnName("timing")
                    .HasColumnType("datetime");

                entity.HasOne(d => d.DepartmentNavigation)
                    .WithMany(p => p.Attendance)
                    .HasForeignKey(d => d.Department)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Attendance_Department");

                entity.HasOne(d => d.EmployeeNavigation)
                    .WithMany(p => p.Attendance)
                    .HasForeignKey(d => d.Employee)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Attendance_Employee");
            });

            modelBuilder.Entity<Company>(entity =>
            {
                entity.Property(e => e.CompanyId).HasColumnName("Company_id");

                entity.Property(e => e.Address).HasColumnName("address");

                entity.Property(e => e.CreatedBy).HasColumnName("created_by");

                entity.Property(e => e.CreatedDate)
                    .HasColumnName("created_date")
                    .HasColumnType("datetime");

                entity.Property(e => e.Email).HasColumnName("email");

                entity.Property(e => e.InTime).HasColumnName("in_time");

                entity.Property(e => e.LogoDesign)
                        .HasColumnName("logo_design")
                        .HasColumnType("text");


                entity.Property(e => e.ModifyBy).HasColumnName("modify_by");

                entity.Property(e => e.ModifyDate)
                    .HasColumnName("modify_date")
                    .HasColumnType("datetime");

                entity.Property(e => e.OutTime).HasColumnName("out_time");

                entity.Property(e => e.PhoneNumber)
                    .HasColumnName("phone_number")
                    .HasMaxLength(50);

                entity.Property(e => e.Policies)
                    .HasColumnName("policies")
                    .HasColumnType("text");

                entity.Property(e => e.Status)
                    .HasColumnName("status")
                    .HasMaxLength(50);

                entity.Property(e => e.Name)
                  .HasColumnName("name")
                  .HasMaxLength(50);

                entity.Property(e => e.WebAddress).HasColumnName("web_address");
            });

            modelBuilder.Entity<Department>(entity =>
            {
                entity.Property(e => e.DepartmentId).HasColumnName("Department_id");

                entity.Property(e => e.CreatedBy).HasColumnName("created_by");

                entity.Property(e => e.CreatedDate)
                    .HasColumnName("created_date")
                    .HasColumnType("datetime");

                entity.Property(e => e.InTime).HasColumnName("in_time");

                entity.Property(e => e.ModifyBy).HasColumnName("modify_by");

                entity.Property(e => e.ModifyDate)
                    .HasColumnName("modify_date")
                    .HasColumnType("datetime");

                entity.Property(e => e.OutTime).HasColumnName("out_time");

                entity.Property(e => e.PhoneNumber)
                    .HasColumnName("phone_number")
                    .HasMaxLength(50);

                entity.Property(e => e.Status)
                    .HasColumnName("status")
                    .HasMaxLength(50);

                entity.Property(e => e.Name)
                 .HasColumnName("name")
                 .HasMaxLength(50);

                entity.HasOne(d => d.CompanyNavigation)
                    .WithMany(p => p.Department)
                    .HasForeignKey(d => d.Company)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Department_Company");
            });

            modelBuilder.Entity<Employee>(entity =>
            {
                entity.Property(e => e.EmployeeId).HasColumnName("Employee_id");

                entity.Property(e => e.Address).HasColumnName("address");

                entity.Property(e => e.CreatedBy).HasColumnName("created_by");

                entity.Property(e => e.CreatedDate)
                    .HasColumnName("created_date")
                    .HasColumnType("datetime");

                entity.Property(e => e.Designation).HasColumnName("designation");

                entity.Property(e => e.Email).HasColumnName("email");

                entity.Property(e => e.FirstName)
                    .HasColumnName("first_name")
                    .HasMaxLength(50);

                entity.Property(e => e.HireDate)
                    .HasColumnName("hire_date")
                    .HasColumnType("date");

                entity.Property(e => e.InTime).HasColumnName("in_time");

                entity.Property(e => e.LastName)
                    .HasColumnName("last_name")
                    .HasMaxLength(50);

                entity.Property(e => e.ModifyBy).HasColumnName("modify_by");

                entity.Property(e => e.ModifyDate)
                    .HasColumnName("modify_date")
                    .HasColumnType("datetime");

                entity.Property(e => e.OutTime).HasColumnName("out_time");

                entity.Property(e => e.Password)
                    .HasColumnName("password")
                    .HasMaxLength(50);

                entity.Property(e => e.PhoneNumber)
                    .HasColumnName("phone_number")
                    .HasMaxLength(50);

                entity.Property(e => e.Images)
                     .HasColumnName("images")
                     .HasColumnType("text");


                entity.Property(e => e.Qualification).HasColumnName("qualification");

                entity.Property(e => e.Status)
                    .HasColumnName("status")
                    .HasMaxLength(50);

                entity.Property(e => e.Username)
                    .HasColumnName("username")
                    .HasMaxLength(50);

                entity.Property(e => e.WorkExperience).HasColumnName("work_experience");

                entity.HasOne(d => d.DepartmentNavigation)
                    .WithMany(p => p.Employee)
                    .HasForeignKey(d => d.Department)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Employee_Department");
            });

            modelBuilder.Entity<Holiday>(entity =>
            {
                entity.Property(e => e.HolidayId).HasColumnName("Holiday_id");

                entity.Property(e => e.CreatedBy).HasColumnName("created_by");

                entity.Property(e => e.CreatedDate)
                    .HasColumnName("created_date")
                    .HasColumnType("datetime");

                entity.Property(e => e.EndDate)
                    .HasColumnName("end_date")
                    .HasColumnType("date");

                entity.Property(e => e.ModifyBy).HasColumnName("modify_by");

                entity.Property(e => e.ModifyDate)
                    .HasColumnName("modify_date")
                    .HasColumnType("datetime");

                entity.Property(e => e.Name).HasColumnName("name");

                entity.Property(e => e.StartDate)
                    .HasColumnName("start_date")
                    .HasColumnType("date");

                entity.Property(e => e.Status)
                    .HasColumnName("status")
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<Overtime>(entity =>
            {
                entity.Property(e => e.OvertimeId).HasColumnName("Overtime_id");

                entity.Property(e => e.CreatedBy).HasColumnName("created_by");

                entity.Property(e => e.CreatedDate)
                    .HasColumnName("created_date")
                    .HasColumnType("datetime");

                entity.Property(e => e.ExtraHours)
                    .HasColumnName("extra_hours")
                    .HasColumnType("datetime");

                entity.Property(e => e.ModifyBy).HasColumnName("modify_by");

                entity.Property(e => e.ModifyDate)
                    .HasColumnName("modify_date")
                    .HasColumnType("datetime");

                entity.Property(e => e.Status)
                    .HasColumnName("status")
                    .HasMaxLength(50);

                entity.HasOne(d => d.DepartmentNavigation)
                    .WithMany(p => p.Overtime)
                    .HasForeignKey(d => d.Department)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Overtime_Department");

                entity.HasOne(d => d.EmployeeNavigation)
                    .WithMany(p => p.Overtime)
                    .HasForeignKey(d => d.Employee)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Overtime_Employee");
            });

            modelBuilder.Entity<Role>(entity =>
            {
                entity.Property(e => e.RoleId).HasColumnName("Role_id");

                entity.Property(e => e.CreatedBy).HasColumnName("created_by");

                entity.Property(e => e.CreatedDate)
                    .HasColumnName("created_date")
                    .HasColumnType("datetime");

                entity.Property(e => e.ModifyBy).HasColumnName("modify_by");

                entity.Property(e => e.ModifyDate)
                    .HasColumnName("modify_date")
                    .HasColumnType("datetime");

                entity.Property(e => e.Name)
                    .HasColumnName("name")
                    .HasMaxLength(50);

                entity.Property(e => e.Status)
                    .HasColumnName("status")
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.Property(e => e.UserId).HasColumnName("User_id");

                entity.Property(e => e.Address).HasColumnName("address");

                entity.Property(e => e.CreatedBy).HasColumnName("created_by");

                entity.Property(e => e.CreatedDate)
                    .HasColumnName("created_date")
                    .HasColumnType("datetime");

                entity.Property(e => e.Email).HasColumnName("email");

                entity.Property(e => e.FirstName)
                    .HasColumnName("first_name")
                    .HasMaxLength(50);

                entity.Property(e => e.LastName)
                    .HasColumnName("last_name")
                    .HasMaxLength(50);

                entity.Property(e => e.ModifyBy).HasColumnName("modify_by");

                entity.Property(e => e.ModifyDate)
                    .HasColumnName("modify_date")
                    .HasColumnType("datetime");

                entity.Property(e => e.Password)
                    .HasColumnName("password")
                    .HasMaxLength(50);

                entity.Property(e => e.PhoneNumber)
                    .HasColumnName("phone_number")
                    .HasMaxLength(50);


                entity.Property(e => e.Images)
                    .HasColumnName("images")
                    .HasColumnType("text");


                entity.Property(e => e.Status)
                    .HasColumnName("status")
                    .HasMaxLength(50);

                entity.Property(e => e.UserName)
                    .HasColumnName("user_name")
                    .HasMaxLength(50);

                entity.Property(e => e.Role)
                  .HasColumnName("role")
                  .HasMaxLength(50);

                entity.Property(e => e.ConfirmPassword)
                  .HasColumnName("confirm_password")
                  .HasMaxLength(50);

                entity.Property(e => e.OldPassword)
            .HasColumnName("old_password")
            .HasMaxLength(50);

                entity.Property(e => e.NewPassword)
            .HasColumnName("new_password")
            .HasMaxLength(50);
            });
        }//c
    }
}
//end