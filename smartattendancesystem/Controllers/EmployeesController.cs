using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using smartattendancesystem.Models;

namespace smartattendancesystem.Controllers
{//q
    public class EmployeesController : Controller
    {
        private readonly projectContext _context;
        private IHostingEnvironment env = null;


        public EmployeesController(projectContext context, IHostingEnvironment _env)
        {
            _context = context;
            env = _env;
        }

        // GET: Employees
        public async Task<IActionResult> Index()
        {
            ViewBag.Images = HttpContext.Session.GetString("Images");
            var projectContext = _context.Employee.Include(e => e.DepartmentNavigation);

         

            return View(await projectContext.ToListAsync());
        }
     

            // GET: Employees/Details/5
            public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var employee = await _context.Employee
                .Include(e => e.DepartmentNavigation)
                .FirstOrDefaultAsync(m => m.EmployeeId == id);
            if (employee == null)
            {
                return NotFound();
            }

            ViewBag.Images = HttpContext.Session.GetString("Images");
            return View(employee);
        }

        // GET: Employees/Create
        public IActionResult Create()
        {
            ViewData["Department"] = new SelectList(_context.Department, "DepartmentId", "DepartmentId");

            ViewBag.AllDepartment = _context.Department.ToList<Department>();
            return View();
        }

        // POST: Employees/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("EmployeeId,Department,Qualification,Email,Username,Password,PhoneNumber,Address,WorkExperience,FirstName,LastName,Designation,HireDate,InTime,OutTime,CreatedDate,CreatedBy,ModifyDate,ModifyBy,Status,Images")] IFormFile Images, Employee employee)
        {

            employee.CreatedDate = DateTime.Now;
            employee.CreatedBy = HttpContext.Session.GetString("Username");
            try
            {
                if (ModelState.IsValid)
                {

                    string RelativePathForImages = "/Images/" + Guid.NewGuid().ToString() + Path.GetExtension(Images.FileName);
                    string FinalPath = env.WebRootPath + RelativePathForImages;
                    FileStream FS = new FileStream(FinalPath, FileMode.Create);
                    Images.CopyTo(FS);
                    FS.Close();

                    employee.Images = RelativePathForImages;
                     
                    MailMessage omailmessage = new MailMessage();
                    omailmessage.From = new MailAddress("hamzair399@gmail.com");
                    omailmessage.To.Add(employee.Email);
                    omailmessage.Body = "Welcome you have   succesfully register to our company department: " + employee.Email;
                    omailmessage.Subject = " Verify";
                    omailmessage.IsBodyHtml = true;


                    SmtpClient osmtpclient = new SmtpClient("smtp.gmail.com", 587);
                    osmtpclient.EnableSsl = true;
                    osmtpclient.UseDefaultCredentials = true;
                    osmtpclient.Credentials = new NetworkCredential("hamzair399@gmail.com", "1835915604");
                    osmtpclient.Send(omailmessage);


                    _context.Add(employee);
                    await _context.SaveChangesAsync();
                   ViewBag.SucessMessage="Add Successfully";
                }
            }
            catch {

                ViewBag.WarningMessage = "Not Add Successfully so please try again";

            }
            ViewData["Department"] = new SelectList(_context.Department, "DepartmentId", "DepartmentId", employee.Department);

            HttpContext.Session.SetString("Images", employee.Images);

            ViewBag.AllDepartment = _context.Department.ToList<Department>();
            return View(employee);
        }

        // GET: Employees/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var employee = await _context.Employee.FindAsync(id);
            if (employee == null)
            {
                return NotFound();
            }
            ViewData["Department"] = new SelectList(_context.Department, "DepartmentId", "DepartmentId", employee.Department);
            ViewBag.AllDepartment = _context.Department.ToList<Department>();
            return View(employee);
        }

        // POST: Employees/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("EmployeeId,Department,Qualification,Email,Username,Password,PhoneNumber,Address,WorkExperience,FirstName,LastName,Designation,HireDate,InTime,OutTime,CreatedDate,CreatedBy,ModifyDate,ModifyBy,Status,Images")] IFormFile Images, Employee employee)
        {

            employee.ModifyDate = DateTime.Now;
            employee.ModifyBy = HttpContext.Session.GetString("Username");
            if (id != employee.EmployeeId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(employee);
                    await _context.SaveChangesAsync();
                    ViewBag.SucessMessage = "Update Successfully";
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!EmployeeExists(employee.EmployeeId))
                    {
                        ViewBag.WarningMessage = "Not Update Sucessfully so please try again";
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["Department"] = new SelectList(_context.Department, "DepartmentId", "DepartmentId", employee.Department);

            ViewBag.Images = HttpContext.Session.GetString("Images");
            ViewBag.AllDepartment = _context.Department.ToList<Department>();
            return View(employee);
        }

        // GET: Employees/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var employee = await _context.Employee
                .Include(e => e.DepartmentNavigation)
                .FirstOrDefaultAsync(m => m.EmployeeId == id);
            if (employee == null)
            {
                return NotFound();
            }
            ViewBag.Images = HttpContext.Session.GetString("Images");
            return View(employee);
        }

        // POST: Employees/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            try
            {
                var employee = await _context.Employee.FindAsync(id);
                _context.Employee.Remove(employee);
                await _context.SaveChangesAsync();
                ViewBag.SucessMessage = "Deleted Sucessfully";
            }
            catch(Exception e)
            {

                ViewBag.WarningMessage = "Already deleted employee cannot be deleted again";

            }
            return View();
        }

        private bool EmployeeExists(int id)
        {
            return _context.Employee.Any(e => e.EmployeeId == id);
        }
    }
}
//end