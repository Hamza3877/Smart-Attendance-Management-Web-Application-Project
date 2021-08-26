using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using smartattendancesystem.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace smartattendancesystem.Controllers
{//q
    public class DepartmentsController : Controller
    {
        private readonly projectContext _context;

        public DepartmentsController(projectContext context)
        {
            _context = context;
        }

        // GET: Departments
        public async Task<IActionResult> Index()
        {
            var projectContext = _context.Department.Include(d => d.CompanyNavigation);
            return View(await projectContext.ToListAsync());
        }

        // GET: Departments/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var department = await _context.Department
                .Include(d => d.CompanyNavigation)
                .FirstOrDefaultAsync(m => m.DepartmentId == id);
            if (department == null)
            {
                return NotFound();
            }

            return View(department);
        }

        // GET: Departments/Create
        public IActionResult Create()
        {
          
          


             ViewData["Company"] = new SelectList(_context.Company, "CompanyId", "CompanyId");
            ViewBag.AllCompanies = _context.Company.ToList<Company>();

            return View();
        }

        // POST: Departments/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("DepartmentId,Company,InTime,OutTime,PhoneNumber,CreatedDate,CreatedBy,ModifyDate,ModifyBy,Status,Name")] Department department)
        {

            department.CreatedDate = DateTime.Now;
            department.CreatedBy = HttpContext.Session.GetString("Username");
           // HttpContext.Session.SetString("Date",department. );
            
            try
            {
                if (ModelState.IsValid)
                {
                    _context.Add(department);
                    await _context.SaveChangesAsync();
                    ViewBag.SucessMessage = "Add Successfully";
                }
            }
            catch
            {

                ViewBag.WarningMessage = "Not Add Successfully so please try again";
            }
            ViewData["Company"] = new SelectList(_context.Company, "CompanyId", "CompanyId", department.Company);

            ViewBag.AllCompanies = _context.Company.ToList<Company>();
         //   ViewBag.Com = _context.Company.Find();
           



            return View(department);
        }

        // GET: Departments/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var department = await _context.Department.FindAsync(id);
            if (department == null)
            {
                return NotFound();
            }
            ViewData["Company"] = new SelectList(_context.Company, "CompanyId", "CompanyId", department.Company);
            ViewBag.AllCompanies = _context.Company.ToList<Company>();

            return View(department);
        }

        // POST: Departments/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("DepartmentId,Company,InTime,OutTime,PhoneNumber,CreatedDate,CreatedBy,ModifyDate,ModifyBy,Status")] Department department)
        {

            department.ModifyDate = DateTime.Now;
            department.ModifyBy = HttpContext.Session.GetString("Username");
            if (id != department.DepartmentId)
            {
                return NotFound(); 
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(department);
                    await _context.SaveChangesAsync();
                    ViewBag.SucessMessage = "Update Successfully";
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!DepartmentExists(department.DepartmentId))
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
            ViewData["Company"] = new SelectList(_context.Company, "CompanyId", "CompanyId", department.Company);
            ViewBag.AllCompanies = _context.Company.ToList<Company>();

            return View(department);
        }

        // GET: Departments/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var department = await _context.Department
                .Include(d => d.CompanyNavigation)
                .FirstOrDefaultAsync(m => m.DepartmentId == id);
            if (department == null)
            {
                return NotFound();
            }

            return View(department);
        }

        // POST: Departments/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            try
            {
                var department = await _context.Department.FindAsync(id);
                _context.Department.Remove(department);
                await _context.SaveChangesAsync();
                ViewBag.SucessMessage = "Deleted Sucessfully";
            }
            catch (Exception e){

                ViewBag.WarningMessage = "Already deleted that department cannot be deleted again";
            }
            return View();
        }

        private bool DepartmentExists(int id)
        {
            return _context.Department.Any(e => e.DepartmentId == id);
        }

        //public string DateAjax(int SID)
        //{
        //    Student S = GetStudent(SID);
        //    ORM.Student.Remove(S);
        //    ORM.SaveChanges();
        //    return "1";

        //}

    }
}
//end