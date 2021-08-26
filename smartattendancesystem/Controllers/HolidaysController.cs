using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using smartattendancesystem.Models;

namespace smartattendancesystem.Controllers
{//e
    public class HolidaysController : Controller
    {
        private readonly projectContext _context;

        public HolidaysController(projectContext context)
        {
            _context = context;
        }

        // GET: Holidays
        public async Task<IActionResult> Index()
        {
            return View(await _context.Holiday.ToListAsync());
        }

        // GET: Holidays/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var holiday = await _context.Holiday
                .FirstOrDefaultAsync(m => m.HolidayId == id);
            if (holiday == null)
            {
                return NotFound();
            }

            return View(holiday);
        }

        // GET: Holidays/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Holidays/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("HolidayId,Name,CreatedDate,CreatedBy,ModifyDate,ModifyBy,Status,StartDate,EndDate")] Holiday holiday)
        {
            holiday.CreatedDate = DateTime.Now;
             holiday.CreatedBy = HttpContext.Session.GetString("Username");
            try
            {
                if (ModelState.IsValid)
                {
                    _context.Add(holiday);
                    await _context.SaveChangesAsync();
                    ViewBag.SucessMessage = "Add Successfully";
                }
            }
            catch
            {

                ViewBag.WarningMessage = "Not Add Successfully so please try again";
            }
            return View(holiday);
        }

        // GET: Holidays/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var holiday = await _context.Holiday.FindAsync(id);
            if (holiday == null)
            {
                return NotFound();
            }
            return View(holiday);
        }

        // POST: Holidays/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("HolidayId,Name,CreatedDate,CreatedBy,ModifyDate,ModifyBy,Status,StartDate,EndDate")] Holiday holiday)
        {

            holiday.ModifyDate = DateTime.Now;
            holiday.ModifyBy = HttpContext.Session.GetString("Username");
            if (id != holiday.HolidayId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(holiday);
                    await _context.SaveChangesAsync();
                    ViewBag.SucessMessage = "Update Successfully ";
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!HolidayExists(holiday.HolidayId))
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
            return View(holiday);
        }

        // GET: Holidays/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var holiday = await _context.Holiday
                .FirstOrDefaultAsync(m => m.HolidayId == id);
            if (holiday == null)
            {
                return NotFound();
            }

            return View(holiday);
        }

        // POST: Holidays/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            try
            {
                var holiday = await _context.Holiday.FindAsync(id);
                _context.Holiday.Remove(holiday);
                await _context.SaveChangesAsync();
                ViewBag.SucessMessage = "Deleted Sucessfully";
            }
            catch (Exception e)
            {

                ViewBag.WarningMessage = "Already deleted holiday cannot be deleted again";

            }
            return View();
        }

        private bool HolidayExists(int id)
        {
            return _context.Holiday.Any(e => e.HolidayId == id);
        }
    }
}
//end