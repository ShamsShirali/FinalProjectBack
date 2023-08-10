using FinalProjectCode.DataAccessLayer;
using FinalProjectCode.Models;
using FinalProjectCode.ViewModels.BlogVMs;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace FinalProjectCode.Controllers
{
    public class BlogController : Controller
    {
        public readonly AppDbContext _context;
        public BlogController(AppDbContext contex)
        {
            _context= contex;
        }
        public async Task<IActionResult> Index()
        {

            List<BlogCategory> categories = await _context.BlogCategies.ToListAsync();
            List<Tag> tags = await _context.Tags.ToListAsync();
            int basketCount = 0;
            int wishlistCount = 0;
            if (User.Identity.IsAuthenticated)
            {
                AppUser result = await _context.Users.FirstOrDefaultAsync(m => m.UserName == User.Identity.Name);
                List<Basket> baskets = await _context.Baskets.Where(m => m.UserId == result.Id).ToListAsync();
                basketCount = baskets.Sum(m => m.Count);
                List<Wishlist> wishlists = await _context.Wishlists.Where(m => m.UserId == result.Id).ToListAsync();
                wishlistCount = wishlists.Count;
                ViewBag.BasketCount = basketCount;
                ViewBag.WishListCount = wishlistCount;
                ViewBag.Name = result.UserName;
                ViewBag.Email = result.Email;
            }
            else
            {
                ViewBag.BasketCount = 0;
                ViewBag.WishListCount = 0;
            }
            BlogVM model = new()
            {
                BlogCategories = categories,
                Tags = tags
            };
            
            return View(model);
        }

        public async Task<IActionResult> BlogDetail()
        {
            int basketCount = 0;
            int wishlistCount = 0;
            if (User.Identity.IsAuthenticated)
            {
                AppUser result = await _context.Users.FirstOrDefaultAsync(m => m.UserName == User.Identity.Name);
                List<Basket> baskets = await _context.Baskets.Where(m => m.UserId == result.Id).ToListAsync();
                basketCount = baskets.Sum(m => m.Count);
                List<Wishlist> wishlists = await _context.Wishlists.Where(m => m.UserId == result.Id).ToListAsync();
                wishlistCount = wishlists.Count;
                ViewBag.BasketCount = basketCount;
                ViewBag.WishListCount = wishlistCount;
                ViewBag.Name = result.UserName;
                ViewBag.Email = result.Email;
            }
            else
            {
                ViewBag.BasketCount = 0;
                ViewBag.WishListCount = 0;
            }
            return View();
        }
    }
}
