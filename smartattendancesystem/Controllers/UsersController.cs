using System;
using System.Collections.Generic;
using System.Diagnostics;
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
{
    //comments
    public class UsersController : Controller
    {
        private readonly projectContext _context;
        private IHostingEnvironment env = null;

        public UsersController(projectContext context, IHostingEnvironment _env)
        {
            _context = context;
            env = _env;
        }

        // GET: Users
        public async Task<IActionResult> Index()
        {
            ViewBag.Images = HttpContext.Session.GetString("Images");
            return View(await _context.User.ToListAsync());
        }

        // GET: Users/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var user = await _context.User
                .FirstOrDefaultAsync(m => m.UserId == id);
            if (user == null)
            {
                return NotFound();
            }
            ViewBag.Images = HttpContext.Session.GetString("Images");
            return View(user);
        }

        // GET: Users/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Users/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("UserId,Email,Address,PhoneNumber,Password,FirstName,LastName,CreatedDate,CreatedBy,ModifyDate,ModifyBy,Status,UserName,Role, Images")]IFormFile Images, User user)
        {
            user.CreatedDate = DateTime.Now;
            user.CreatedBy = HttpContext.Session.GetString("Username");
            try
            {
                if (ModelState.IsValid)
                {

                    string RelativePathForImages = "/Images/" + Guid.NewGuid().ToString() + Path.GetExtension(Images.FileName);
                    string FinalPath = env.WebRootPath + RelativePathForImages;
                    FileStream FS = new FileStream(FinalPath, FileMode.Create);
                    Images.CopyTo(FS);
                    FS.Close();

                    user.Images = RelativePathForImages;

                    _context.Add(user);
                    await _context.SaveChangesAsync();
                    ViewBag.SucessMessage = "Register successfully now  go for login ";

                }
            }
            catch
            {

                ViewBag.WarningMessage = "Not Register  successfully so please try again";

            }

       //     HttpContext.Session.SetString("Images", user.Images);


            return View(user);
        }

        // GET: Users/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var user = await _context.User.FindAsync(id);
            if (user == null)
            {
                return NotFound();
            }
            return View(user);
        }

        // POST: Users/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("UserId,Email,Address,PhoneNumber,Password,Picture,FirstName,LastName,CreatedDate,CreatedBy,ModifyDate,ModifyBy,Status,UserName,Role,Images")] IFormFile Images, User user)
        {
            user.ModifyDate = DateTime.Now;
            user.ModifyBy = HttpContext.Session.GetString("Username");

            if (id != user.UserId)
            {
                return NotFound();
            }


            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(user);
                    await _context.SaveChangesAsync();
                    ViewBag.SucessMessage = "Update successfully  ";
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!UserExists(user.UserId))
                    {
                        ViewBag.WarningMessage = "Not Update Sucessfully please try again";
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }

            }

            ViewBag.Images = HttpContext.Session.GetString("Images");
            return View(user);
        }

        // GET: Users/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var user = await _context.User
                .FirstOrDefaultAsync(m => m.UserId == id);
            if (user == null)
            {
                return NotFound();
            }
            ViewBag.Images = HttpContext.Session.GetString("Images");
            return View(user);
        }

        // POST: Users/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            try
            {
                var user = await _context.User.FindAsync(id);
                _context.User.Remove(user);
                await _context.SaveChangesAsync();

                ViewBag.SucessMessage = "Deleted Successfully";
            }
            catch (Exception e)
            {

                ViewBag.WarningMessage = "Already deleted user cannot be deleted again";

            }
            return View();
        }



        private bool UserExists(int id)
        {
            return _context.User.Any(e => e.UserId == id);
        }
        [HttpGet]
        public IActionResult Login()
        {

            return View();
        }

        [HttpPost]
        public IActionResult Login(User U)
        {
            User LoggedInUser = _context.User.Where(x => x.UserName == U.UserName && x.Password == U.Password).FirstOrDefault();

            if (LoggedInUser == null)
            {
                ViewBag.WarningMessage = "Wrong Username and Password so please try again";
                return View();
            }

            //save user information in session

            HttpContext.Session.SetString("Username", LoggedInUser.UserName);
            HttpContext.Session.SetString("Role", LoggedInUser.Role);
            HttpContext.Session.SetString("Images", LoggedInUser.Images);



            //else part wla view niche ase hota remember jb braces ke andar upar wla view if ka tha bs
            return RedirectToAction("Dashboard");
        }



        public IActionResult Dashboard()
        {
            if (string.IsNullOrEmpty(HttpContext.Session.GetString("Username")))
            {
                return RedirectToAction("Login");
            }
            ViewBag.Username = HttpContext.Session.GetString("Username");
            ViewBag.Role = HttpContext.Session.GetString("Role");
            ViewBag.Images = HttpContext.Session.GetString("Images");
            ViewBag.AllUsers=_context.User.ToList().Count();
            ViewBag.AllDepartments = _context.Department.ToList<Department>().Count();
            ViewBag.AllEmployees = _context.Employee.ToList<Employee>().Count();
            ViewBag.AllAttendances = _context.Attendance.ToList<Attendance>().Count();




            return View();

        }
        public IActionResult Logout()
        {
            HttpContext.Session.Clear();
            return RedirectToAction("Login");

        }

        [HttpGet]
        public IActionResult ChangePassword()
        {

            return View();
        }

        [HttpPost]
        public IActionResult ChangePassword(User U)
        {

            User P = _context.User.Where(x => x.Password == U.OldPassword && U.NewPassword==U.ConfirmPassword).FirstOrDefault();

            
            
                if (P != null)
                {
                    P.Password = U.NewPassword;


                    _context.User.Update(U);
                    _context.SaveChanges();
                    ViewBag.SucessMessage = "Correct ,Password update Sucessfully";
                }
            
            else { 
            
                ViewBag.WarningMessage = "Not Correct so please try again";

            }






            return View();


        }
        [HttpGet]

        public IActionResult ForgotPassword()
        {

            return View();
        }
        [HttpPost]
        public IActionResult ForgotPassword(User U)
        {
            User E = _context.User.Where(x => x.Email == U.Email).FirstOrDefault();


            if (E != null)
            {

                try
                {
                    MailMessage omailmessage = new MailMessage();
                    omailmessage.From = new MailAddress("hamzair399@gmail.com");
                    omailmessage.To.Add(E.Email);
                    omailmessage.Body = "your username is " +E.UserName +"  and Password is "   +E.Password;
                    omailmessage.Subject = " Verify";
                    omailmessage.IsBodyHtml = true;


                    SmtpClient osmtpclient = new SmtpClient("smtp.gmail.com", 587);
                    osmtpclient.EnableSsl = true;
                    osmtpclient.UseDefaultCredentials = true;
                    osmtpclient.Credentials = new NetworkCredential("hamzair399@gmail.com", "1835915604");
                    osmtpclient.Send(omailmessage);


                    ViewBag.SucessMessage = "Verify and we will send you email of username and Password succcessfully check it";

                }
                catch (Exception ex)
                {




                    ViewBag.WarningMessage = " not Verify so please enter your valid email";

                }
            }


            return View();


        }


        //public int GetStudentsCount()
        //{
        //    System.Threading.Thread.Sleep(5000);
        //    return _context.User.ToList().Count();
        //}


    }
}
//end