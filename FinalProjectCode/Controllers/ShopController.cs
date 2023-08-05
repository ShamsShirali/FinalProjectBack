using FinalProjectCode.DataAccessLayer;
using FinalProjectCode.Models;
using FinalProjectCode.ViewModels.TestVMs;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace FinalProjectCode.Controllers
{
    public class ShopController : Controller
    {
        private readonly AppDbContext _context;

        public ShopController(AppDbContext context)
        {
            _context = context;
        }
        public async Task<IActionResult> Index()
        {
            IEnumerable<Product> products = await _context.Products.Include(m=>m.ProductImages).Include(m=>m.Category).ToListAsync();

            IEnumerable<Category> categories = await _context.Categories.ToListAsync();

           IEnumerable<Brand> brands = await _context.Brands.ToListAsync();

            ProductVM model = new()
            {
                Products = products,
                Categories = categories,
                Brands = brands
            };


            return View(model);
        }


        [HttpGet]
        public async Task<IActionResult> Sort(string filter)
        {

            if (filter == "Best selling")
            {
                IEnumerable<Product> products = await _context.Products.OrderByDescending(m => m.Raiting).Include(m => m.ProductImages).Include(m=>m.Brand).Include(m=>m.ProductTags).ToListAsync();
                return PartialView("_ShopProductsPartial", products);
            }
            else if (filter == "Alphabetically, Z-A")
            {
                IEnumerable<Product> products = await _context.Products.OrderByDescending(m => m.Title).Include(m => m.ProductImages).Include(m => m.Brand).Include(m => m.ProductTags).ToListAsync();
                return PartialView("_ShopProductsPartial", products);
            }
            else if (filter == "Alphabetically, A-Z")
            {
                IEnumerable<Product> products = await _context.Products.OrderBy(m => m.Title).Include(m => m.ProductImages).Include(m => m.Brand).Include(m => m.ProductTags).ToListAsync();
                return PartialView("_ShopProductsPartial", products);
            }
            else if (filter == "Price, low to high")
            {
                IEnumerable<Product> products = await _context.Products.OrderBy(m => m.Price).Include(m => m.ProductImages).Include(m => m.Brand).Include(m => m.ProductTags).ToListAsync();
                return PartialView("_ShopProductsPartial", products);
            }
            else if (filter == "Price, high to low")
            {
                IEnumerable<Product> products = await _context.Products.OrderByDescending(m => m.Price).Include(m => m.ProductImages).Include(m => m.Brand).Include(m => m.ProductTags).ToListAsync();
                return PartialView("_ShopProductsPartial", products);
            }
            else if (filter == "Date, old to new")
            {
                IEnumerable<Product> products = await _context.Products.OrderBy(m => m.CreateAt).Include(m => m.ProductImages).Include(m => m.Brand).Include(m => m.ProductTags).ToListAsync();
                return PartialView("_ShopProductsPartial", products);
            }
            else if (filter == "Date, new to old")
            {
                IEnumerable<Product> products = await _context.Products.OrderByDescending(m => m.CreateAt).Include(m => m.ProductImages).Include(m => m.Brand).Include(m => m.ProductTags).ToListAsync();
                return PartialView("_ShopProductsPartial", products);
            }
            else if (filter == "All")
            {
                IEnumerable<Product> products = await _context.Products.Include(m => m.ProductImages).Include(m => m.Brand).Include(m => m.ProductTags).ToListAsync();
                return PartialView("_ShopProductsPartial", products);
            }
            else
            {
                IEnumerable<Product> products = await _context.Products.Include(m => m.ProductImages).Include(m => m.Brand).Include(m => m.ProductTags).ToListAsync();
                return PartialView("_ShopProductsPartial", products);
            }
        }



        [HttpGet]
        public async Task<IActionResult> SortByBrand(string brand)
        {
           Brand dbBrand = await _context.Brands.FirstOrDefaultAsync(m=>m.Name == brand);
           IEnumerable<Product> products = await _context.Products.Where(m => m.BrandId == dbBrand.Id).Include(m => m.ProductImages).Include(m => m.Brand).Include(m => m.ProductTags).ToListAsync();
           return PartialView("_ShopProductsPartial", products);
        }


        [HttpGet]
        public async Task<IActionResult> SortByCategory(string category)
        {
            Category dbCategory = await _context.Categories.FirstOrDefaultAsync(m => m.Name == category);
            IEnumerable<Product> products = await _context.Products.Where(m => m.CategoryId == dbCategory.Id).Include(m => m.ProductImages).Include(m => m.Brand).Include(m => m.ProductTags).ToListAsync();
            return PartialView("_ShopProductsPartial", products);
        } 

    }
}
