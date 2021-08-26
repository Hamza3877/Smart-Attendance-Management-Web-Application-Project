using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using smartattendancesystem.Models;

namespace smartattendancesystem.Controllers
{
    //q
    public class CompaniesController : Controller
    {
        private readonly projectContext _context;

        private IHostingEnvironment env = null;

        public CompaniesController(projectContext context, IHostingEnvironment _env)
        {
            _context = context;
            env = _env;
        }

        // GET: Companies
        public async Task<IActionResult> Index()
        {
            ViewBag.Logo = HttpContext.Session.GetString("LogoDesign");
            return View(await _context.Company.ToListAsync());
        }

        // GET: Companies/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var company = await _context.Company
                .FirstOrDefaultAsync(m => m.CompanyId == id);
            if (company == null)
            {
                return NotFound();
            }
            ViewBag.Logo = HttpContext.Session.GetString("LogoDesign");
            return View(company);
        }

        // GET: Companies/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Companies/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("CompanyId,InTime,OutTime,Address,Policies,WebAddress,Email,PhoneNumber,CreatedDate,CreatedBy,ModifyDate,ModifyBy,Status,Name,LogoDesign")]IFormFile LogoDesign, Company company)
        {
            company.CreatedDate = DateTime.Now;
            company.CreatedBy = HttpContext.Session.GetString("Username");
            try
            {
                if (ModelState.IsValid)
                {

                    string RelativePathForImages = "/Images/" + Guid.NewGuid().ToString() + Path.GetExtension(LogoDesign.FileName);
                    string FinalPath = env.WebRootPath + RelativePathForImages;
                    FileStream FS = new FileStream(FinalPath, FileMode.Create);
                    LogoDesign.CopyTo(FS);
                    FS.Close();

                    company.LogoDesign = RelativePathForImages;

                    _context.Add(company);
                    await _context.SaveChangesAsync();
                    ViewBag.SucessMessage = "Add Successfully";
                }
            }
            catch
            {
                ViewBag.WarningMessage = " Not Add successfully so please try again";

            }

           // HttpContext.Session.SetString("LogoDesign", company.LogoDesign);
            return View(company);
        }

        // GET: Companies/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var company = await _context.Company.FindAsync(id);
            if (company == null)
            {
                return NotFound();
            }
            return View(company);
        }

        // POST: Companies/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("CompanyId,InTime,OutTime,Address,Policies,WebAddress,Email,PhoneNumber,CreatedDate,CreatedBy,ModifyDate,ModifyBy,Status,Name,LogoDesign")]IFormFile LogoDesign, Company company)
        {

            company.ModifyDate = DateTime.Now;
            company.ModifyBy = HttpContext.Session.GetString("Username");
            if (id != company.CompanyId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(company);
                    await _context.SaveChangesAsync();
                    ViewBag.SucessMessage = "Update Successfully";
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!CompanyExists(company.CompanyId))
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

            ViewBag.Logo = HttpContext.Session.GetString("LogoDesign");
            return View(company);
        }

        // GET: Companies/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var company = await _context.Company
                .FirstOrDefaultAsync(m => m.CompanyId == id);
            if (company == null)
            {
                return NotFound();
            }
            ViewBag.Logo = HttpContext.Session.GetString("LogoDesign");
            return View(company);
        }

        // POST: Companies/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            try
            {
                var company = await _context.Company.FindAsync(id);
                _context.Company.Remove(company);
                await _context.SaveChangesAsync();
                ViewBag.SucessMessage = "Deleted Sucessfully";
            }
            catch (Exception e)
            {
                ViewBag.WarningMessage = "Already Deleted that Company cannot be deleted again";

            }
            return View();
        }

        private bool CompanyExists(int id)
        {
            return _context.Company.Any(e => e.CompanyId == id);
        }
    }
}
//end