using FinalProjectCode.DataAccessLayer;
using FinalProjectCode.Models;
using FinalProjectCode.ViewModels.HomeVMs;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace FinalProjectCode.Controllers
{
    public class HomeController : Controller
    {
        private readonly AppDbContext _context;

        public HomeController(AppDbContext context)
        {
            _context = context;
        }

        public async Task<IActionResult> Index()
        {
            IEnumerable<Slider> sliders = await _context.Sliders.ToListAsync();
            IEnumerable<Product> products= await _context.Products.Include(m=>m.ProductImages).Include(m=>m.Category).Include(m=>m.Brand).ToListAsync();

            HomeVM model = new()
            {
                Sliders = sliders,
                Products = products
            };
            return View(model);
        }
    }
}
