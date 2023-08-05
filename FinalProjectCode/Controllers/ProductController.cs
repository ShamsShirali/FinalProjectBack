using FinalProjectCode.DataAccessLayer;
using FinalProjectCode.Models;
using FinalProjectCode.ViewModels.ProductDetailVMs;
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
        public async Task<IActionResult> Index(int id)
        {
            Product product = await _context.Products.Include(m=>m.ProductImages).Include(m=>m.Category).Include(m=>m.ProductTags).FirstOrDefaultAsync(m=>m.Id == id);
            IEnumerable<Product> likeproducts = await _context.Products.Take(3).Include(m => m.ProductImages).Include(m => m.Category).Include(m => m.ProductTags).ToListAsync();
            IEnumerable<Product> lastproducts = await _context.Products.OrderBy(m => m.CreateAt).Take(3).Include(m => m.ProductImages).Include(m => m.Category).Include(m => m.ProductTags).ToListAsync();

            ProductDetailVM model = new()
            {
                Product = product,
                LikeProducts= likeproducts,
                LastProducts= lastproducts
            };
            return View(model);
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