using FinalProjectCode.DataAccessLayer;
using Microsoft.AspNetCore.Mvc;

namespace FinalProjectCode.Controllers
{
    public class HomeController : Controller
    {
        private readonly AppDbContext _context;

        public HomeController(AppDbContext context)
        {
            _context = context;
        }

        //public async Task<IActionResult> Index()
        //{
        //    HomeVM homeVM = new HomeVM
        //    {
        //        Categories = await _context.Categories.Where(c => c.IsDeleted == false && c.IsMain).ToListAsync(),
        //        NewArrivals = await _context.Products.Where(p => !p.IsDeleted && p.IsNewArrivals).Include(m => m.Author).ToListAsync(),
        //        MostViewProducts = await _context.Products.Where(p => !p.IsDeleted && p.IsMostViewProducts).Include(m => m.Author).ToListAsync(),
        //        FeaturedProducts = await _context.Products.Where(p => !p.IsDeleted && p.IsFeaturedProducts).Include(m => m.Author).ToListAsync()
        //    };

        //    return View(homeVM);
        //}
    }
}
