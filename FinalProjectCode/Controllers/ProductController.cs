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
                List<Product> products = await _context.Products.Include(m=>m.ProductImages).Where(c => c.IsDeleted == false && 
                c.Title.ToLower().StartsWith(search.ToLower())).ToListAsync();

                //return Json(products);
                return PartialView("_SearchPartial", products);
        }
    }
}