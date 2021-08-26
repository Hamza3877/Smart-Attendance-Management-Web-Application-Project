using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using smartattendancesystem.Models;

namespace smartattendancesystem.Controllers
{
    public class OvertimesController : Controller
    {
        private readonly projectContext _context;

        public OvertimesController(projectContext context)
        {
            _context = context;
        }

        // GET: Overtimes
        public async Task<IActionResult> Index()
        {
            var projectContext = _context.Overtime.Include(o => o.DepartmentNavigation).Include(o => o.EmployeeNavigation);
            return View(await projectContext.ToListAsync());
        }

        // GET: Overtimes/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var overtime = await _context.Overtime
                .Include(o => o.DepartmentNavigation)
                .Include(o => o.EmployeeNavigation)
                .FirstOrDefaultAsync(m => m.OvertimeId == id);
            if (overtime == null)
            {
                return NotFound();
            }

            return View(overtime);
        }

        // GET: Overtimes/Create
        public IActionResult Create()
        {
            ViewData["Department"] = new SelectList(_context.Department, "DepartmentId", "DepartmentId");
            ViewData["Employee"] = new SelectList(_context.Employee, "EmployeeId", "EmployeeId");
            ViewBag.AllDepartment = _context.Department.ToList<Department>();
            ViewBag.AllEmployee = _context.Employee.ToList<Employee>();
            return View();
        }

        // POST: Overtimes/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("OvertimeId,Department,Employee,ExtraHours,CreatedDate,CreatedBy,ModifyDate,ModifyBy,Status")] Overtime overtime)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    _context.Add(overtime);
                    await _context.SaveChangesAsync();
                    ViewBag.SucessMessage = "Added Successfully";
                }
            }
            catch (Exception e)
            {

                ViewBag.WarningMessage = "Not added successfully please try again";
            }
            ViewData["Department"] = new SelectList(_context.Department, "DepartmentId", "DepartmentId", overtime.Department);
            ViewData["Employee"] = new SelectList(_context.Employee, "EmployeeId", "EmployeeId", overtime.Employee);
            ViewBag.AllDepartment = _context.Department.ToList<Department>();
            ViewBag.AllEmployee = _context.Employee.ToList<Employee>();
            return View(overtime);
        }

        // GET: Overtimes/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var overtime = await _context.Overtime.FindAsync(id);
            if (overtime == null)
            {
                return NotFound();
            }
            ViewData["Department"] = new SelectList(_context.Department, "DepartmentId", "DepartmentId", overtime.Department);
            ViewData["Employee"] = new SelectList(_context.Employee, "EmployeeId", "EmployeeId", overtime.Employee);
            ViewBag.AllDepartment = _context.Department.ToList<Department>();
            ViewBag.AllEmployee = _context.Employee.ToList<Employee>();
            return View(overtime);
        }

        // POST: Overtimes/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("OvertimeId,Department,Employee,ExtraHours,CreatedDate,CreatedBy,ModifyDate,ModifyBy,Status")] Overtime overtime)
        {
            if (id != overtime.OvertimeId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(overtime);
                    await _context.SaveChangesAsync();
                    ViewBag.SucessMessage = "Updated Sucessfully";
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!OvertimeExists(overtime.OvertimeId))
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
            ViewData["Department"] = new SelectList(_context.Department, "DepartmentId", "DepartmentId", overtime.Department);
            ViewData["Employee"] = new SelectList(_context.Employee, "EmployeeId", "EmployeeId", overtime.Employee);
            ViewBag.AllDepartment = _context.Department.ToList<Department>();
            ViewBag.AllEmployee = _context.Employee.ToList<Employee>();
            return View(overtime);
        }

        // GET: Overtimes/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var overtime = await _context.Overtime
                .Include(o => o.DepartmentNavigation)
                .Include(o => o.EmployeeNavigation)
                .FirstOrDefaultAsync(m => m.OvertimeId == id);
            if (overtime == null)
            {
                return NotFound();
            }

            return View(overtime);
        }

        // POST: Overtimes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            try {
                var overtime = await _context.Overtime.FindAsync(id);
                _context.Overtime.Remove(overtime);
                await _context.SaveChangesAsync();
                ViewBag.SucessMessage = "Deleted Sucessfully";
            
            }

            catch (Exception e)
            {

                ViewBag.WarningMessage = "Already deleted overtime cannot be deleted again";

            }
            return View();

        }

        private bool OvertimeExists(int id)
        {
            return _context.Overtime.Any(e => e.OvertimeId == id);
        }
    }
}
//end