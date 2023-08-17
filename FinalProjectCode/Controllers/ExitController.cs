using FinalProjectCode.DataAccessLayer;
using FinalProjectCode.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace FinalProjectCode.Controllers
{
    public class ExitController : Controller
    {
        public readonly AppDbContext _context;

        public IActionResult Index()
        {
            return View();
        }
    }
}
