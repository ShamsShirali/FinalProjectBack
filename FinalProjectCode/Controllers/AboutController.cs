using FinalProjectCode.DataAccessLayer;
using FinalProjectCode.Interfaces;
using FinalProjectCode.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using NuGet.Configuration;
using System.Collections.Generic;

namespace FinalProjectCode.Controllers
{
    public class AboutController : Controller
    {
        public readonly AppDbContext _context;

        public AboutController(AppDbContext context)
        {
            _context = context;
        }
        public async Task<IActionResult> Index()
        {
            List<Setting> settings = await _context.Settings.ToListAsync();

            return View(settings);
        }
    }
}
