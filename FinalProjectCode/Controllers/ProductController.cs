using FinalProjectCode.DataAccessLayer;
using FinalProjectCode.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace FinalProjectCode.Controllers
{
    public class ProductController : Controller
    {
        public readonly AppDbContext _context;

        public ProductController(AppDbContext context)
        {
            _context = context;
        }

        public async Task<IActionResult> Search(string search)
        {
                List<Product> products = await _context.Products.Where(c => c.IsDeleted == false && (
                c.Title.ToLower().Contains(search.ToLower()) ||
                (c.Brand != null ? c.Brand.Name.ToLower().Contains(search.ToLower()) : true) ||
                (c.Category != null ? c.Category.Name.ToLower().Contains(search.ToLower()) : true) ||
                c.Description.ToLower().Contains(search.ToLower()))).ToListAsync();

                //return Json(products);
                return PartialView("_SearchPartial", products);
        }
    }
}