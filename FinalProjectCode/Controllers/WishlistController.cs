using FinalProjectCode.DataAccessLayer;
using FinalProjectCode.Interfaces;
using FinalProjectCode.Models;
using FinalProjectCode.ViewModels.BasketVMs;
using FinalProjectCode.ViewModels.WishlistVMs;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace FinalProjectCode.Controllers
{
    public class WishlistController : Controller
    {
        public readonly AppDbContext _context;
        private readonly IProductService _productService;

        public WishlistController(AppDbContext context, IProductService productService)
        {
            _context = context;
            _productService = productService;
        }
        public async Task<IActionResult> Index()
        {
            int basketCount = 0;
            int wishlistCount = 0;
            List<Wishlist> wishlists = new List<Wishlist>();
            List<WishlistVM> wishlistVMs = new();
            if (User.Identity.IsAuthenticated)
            {
                AppUser result = await _context.Users.FirstOrDefaultAsync(m => m.UserName == User.Identity.Name);
                List<Basket> baskets = await _context.Baskets.Where(m => m.UserId == result.Id).ToListAsync();
                basketCount = baskets.Sum(m => m.Count);
                wishlists = await _context.Wishlists.Where(m => m.UserId == result.Id).ToListAsync();
                wishlistCount = wishlists.Count;
                ViewBag.BasketCount = basketCount;
                ViewBag.WishListCount = wishlistCount;
                ViewBag.Name = result.UserName;
                ViewBag.Email = result.Email;
                

                foreach (var item in wishlists)
                {
                    Product product = await _context.Products.FirstOrDefaultAsync(m => m.Id == item.ProductId);

                    wishlistVMs.Add(new WishlistVM
                    {
                        Id = product.Id,
                        MainImage = product.MainImage,
                        Tittle = product.Title,
                        Price = product.Price,
                        Raiting= product.Raiting,
                        DiscountPrice = product.DiscountedPrice ?? 0,
                    });
                }
                return View(wishlistVMs);
            }
            else
            {
                ViewBag.BasketCount = 0;
                ViewBag.WishListCount = 0;
                return View(wishlistVMs);
            }
            
        }

        [HttpPost]
        public async Task<IActionResult> RemoveWish(int? id)
        {
            if (User.Identity.IsAuthenticated)
            {
                AppUser result = await _context.Users.FirstOrDefaultAsync(m => m.UserName == User.Identity.Name);

                if (id is null) return BadRequest();

                Product dbProduct = await _productService.GetById((int)id);

                if (dbProduct == null) return NotFound();

                Wishlist existWishlist = await _context.Wishlists.Where(m => m.ProductId == id && m.UserId == result.Id).FirstOrDefaultAsync();

                _context.Wishlists.Remove(existWishlist);


                List<Wishlist> wishlists = await _context.Wishlists.Where(m => m.UserId == result.Id).ToListAsync();

                int wishListCount = wishlists.Count - 1;

                if (wishListCount > 0)
                {
                    ViewBag.WishListCount = wishListCount;
                }
                else
                {
                    ViewBag.WishListCount = 0;
                }

                await _context.SaveChangesAsync();

                return Ok(wishListCount);
            }
            else
            {
                return RedirectToAction("Login", "Account");
            }
        }
    }
}
