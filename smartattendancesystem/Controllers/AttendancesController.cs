using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using smartattendancesystem.Models;

namespace smartattendancesystem.Controllers
{//start
    public class AttendancesController : Controller
    {
        private readonly projectContext _context;

        public AttendancesController(projectContext context)
        {
            _context = context;
        }

           // GET: Attendances
        public async Task<IActionResult> Index()
        {
            //  var projectContext = _context.Attendance.Include(a => a.DepartmentNavigation).Include(a => a.EmployeeNavigation);

            List<Attendance> attendances = _context.Attendance.ToList();
            List<Department> departments = _context.Department.ToList();

            List<Employee> employees = _context.Employee.ToList();

            var attendanceRecord = from i in attendances
                                   join d in departments on i.Department equals d.DepartmentId into table1
                                   from d in table1.ToList()
                                   join e in employees on i.Employee equals e.EmployeeId into table2
                                   from e in table2.ToList()


                                   select new ViewModel
                                   {
                                       attendance = i,
                                       department = d,

                                       employee = e,


                                   };

      
            return View(attendanceRecord);
        }


        [HttpPost]
        public async Task<IActionResult> Index(DateTime SearchByDate, string SearchByMember, ViewModel attendance)
        {
            IList<Attendance> AllDonars = _context.Attendance.Where(x => x.EmployeeNavigation.FirstName == SearchByMember  && x.Date==SearchByDate).ToList<Attendance>();



            return View(AllDonars);

        }


        // GET: Attendances/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var attendance = await _context.Attendance
                .Include(a => a.DepartmentNavigation)
                .Include(a => a.EmployeeNavigation)
                .FirstOrDefaultAsync(m => m.AttendanceId == id);
            if (attendance == null)
            {
                return NotFound();
            }

            return View(attendance);
        }

        // GET: Attendances/Create
        public IActionResult Create()
        {

             ViewData["Department"] = new SelectList(_context.Department, "DepartmentId", "DepartmentId");
            ViewData["Employee"] = new SelectList(_context.Employee, "EmployeeId", "EmployeeId");
            ViewBag.AllDepartment = _context.Department.ToList<Department>();
            ViewBag.AllEmployee = _context.Employee.ToList<Employee>();


            return View();
        }

        // POST: Attendances/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("AttendanceId,Department,Employee,Date,Timing,CreatedDate,CreatedBy,ModifyDate,ModifyBy,Status,AttendanceStatus,InTime,OutTime,Reports")] Attendance attendance)
        {

            try
            {

                if (ModelState.IsValid)
                {
                    //  MailMessage omailmessage = new MailMessage();
                    //  omailmessage.From = new MailAddress("hamzair399@gmail.com");
                    ////  omailmessage.To.Add();
                    //  omailmessage.Body = "Welcome you have   succesfully register to our company department: " ;
                    //  omailmessage.Subject = " Verify";
                    //  omailmessage.IsBodyHtml = true;


                    //  SmtpClient osmtpclient = new SmtpClient("smtp.gmail.com", 587);
                    //  osmtpclient.EnableSsl = true;
                    //  osmtpclient.UseDefaultCredentials = true;
                    //  osmtpclient.Credentials = new NetworkCredential("hamzair399@gmail.com", "1835915604");
                    //  osmtpclient.Send(omailmessage);
                    _context.Add(attendance);
                    await _context.SaveChangesAsync();
                    ViewBag.Message = " Attendance Save Successfully";
                }
            }
            catch (Exception)
            {
                ViewBag.Message = "not added sucessfully";

            }

            //  ViewData["Department"] = new SelectList(_context.Department, "DepartmentId", "DepartmentId", attendance.Department);
            //    ViewData["Employee"] = new SelectList(_context.Employee, "EmployeeId", "EmployeeId", attendance.Employee);
            ViewBag.AllDepartment = _context.Department.ToList<Department>();
            ViewBag.AllEmployee = _context.Employee.ToList<Employee>();
            return View(attendance);
            }
 
        // GET: Attendances/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var attendance = await _context.Attendance.FindAsync(id);
            if (attendance == null)
            {
                return NotFound();
            }
            ViewData["Department"] = new SelectList(_context.Department, "DepartmentId", "DepartmentId", attendance.Department);
            ViewData["Employee"] = new SelectList(_context.Employee, "EmployeeId", "EmployeeId", attendance.Employee);
            ViewBag.AllDepartment = _context.Department.ToList<Department>();
            ViewBag.AllEmployee = _context.Employee.ToList<Employee>();
            return View(attendance);
        }

        // POST: Attendances/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("AttendanceId,Department,Employee,Date,Timing,CreatedDate,CreatedBy,ModifyDate,ModifyBy,Status,AttendanceStatus,InTime,OutTime,Reports")] Attendance attendance)
        {
            if (id != attendance.AttendanceId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(attendance);
                    await _context.SaveChangesAsync();
                    ViewBag.SucessMessage = "Updated Sucessfully";
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!AttendanceExists(attendance.AttendanceId))
                    {
                        ViewBag.WarningMessage = "not Updated Sucessfully";
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["Department"] = new SelectList(_context.Department, "DepartmentId", "DepartmentId", attendance.Department);
            ViewData["Employee"] = new SelectList(_context.Employee, "EmployeeId", "EmployeeId", attendance.Employee);
            ViewBag.AllDepartment = _context.Department.ToList<Department>();
            ViewBag.AllEmployee = _context.Employee.ToList<Employee>();
            return View(attendance);
        }

        // GET: Attendances/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var attendance = await _context.Attendance
                .Include(a => a.DepartmentNavigation)
                .Include(a => a.EmployeeNavigation)
                .FirstOrDefaultAsync(m => m.AttendanceId == id);
            if (attendance == null)
            {
                return NotFound();
            }

            return View(attendance);
        }

        // POST: Attendances/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            try { 
            var attendance = await _context.Attendance.FindAsync(id);
            _context.Attendance.Remove(attendance);
            await _context.SaveChangesAsync();
            ViewBag.SucessMessage = "Deleted Sucessfully";
        }

            catch (Exception e)
            {

                ViewBag.WarningMessage = "Already deleted overtime cannot be deleted again";

            }
            return View();

}

private bool AttendanceExists(int id)
        {
            return _context.Attendance.Any(e => e.AttendanceId == id);
        }
    }
}
