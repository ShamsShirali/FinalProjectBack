using FinalProjectCode.DataAccessLayer;
using FinalProjectCode.Interfaces;
using FinalProjectCode.Models;
using FinalProjectCode.ViewModels.HomeVMs;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace FinalProjectCode.Controllers
{
    public class HomeController : Controller
    {
        private readonly AppDbContext _context;
        private readonly IProductService _productService;

        public HomeController(AppDbContext context, IProductService productService)
        {
            _context = context;
            _productService = productService;
        }

        public async Task<IActionResult> Index()
        {
            IEnumerable<Product> products = await _context.Products.Include(m => m.ProductImages).Include(m => m.Category).Include(m => m.Brand).ToListAsync();

            int basketCount = 0;
            int wishlistCount = 0;
            if(User.Identity.IsAuthenticated)
            {
                AppUser result = await _context.Users.FirstOrDefaultAsync(m => m.UserName == User.Identity.Name);
                List<Basket> baskets = await _context.Baskets.Where(m => m.UserId == result.Id).ToListAsync();
                basketCount = baskets.Sum(m => m.Count);
                List<Wishlist> wishlists = await _context.Wishlists.Where(m => m.UserId == result.Id).ToListAsync();
                wishlistCount = wishlists.Count;
                ViewBag.BasketCount = basketCount;
                ViewBag.WishListCount = wishlistCount;
            }
            else
            {
                ViewBag.BasketCount = 0;
                ViewBag.WishListCount = 0;
            }

            HomeVM model = new()
            {
                Products = products
            };
            return View(model);
        }

        [HttpPost]
        public async Task<IActionResult> AddBasket(int? id)
        {
            if (User.Identity.IsAuthenticated)
            {
                AppUser result = await _context.Users.FirstOrDefaultAsync(m => m.UserName == User.Identity.Name);

                if (id is null) return BadRequest();

                Product dbProduct = await _productService.GetById((int)id);

                if (dbProduct == null) return NotFound();



                Basket existBasket = await _context.Baskets.Where(m => m.ProductId == id && m.UserId == result.Id).FirstOrDefaultAsync();

                if (existBasket != null)
                {
                    existBasket.Count += 1;
                }
                else
                {

                    Basket newBasket = new()
                    {
                        ProductId = (int)id,
                        UserId = result.Id,
                        Count = 1
                    };
                    await _context.Baskets.AddAsync(newBasket);
                }


                List<Basket> baskets = await _context.Baskets.Where(m => m.UserId == result.Id).ToListAsync();

                int basketCount = baskets.Sum(m => m.Count) + 1;

                if (basketCount > 0)
                {
                    ViewBag.BasketCount = basketCount;
                }
                else
                {
                    ViewBag.BasketCount = 0;
                }

                await _context.SaveChangesAsync();

                return Ok(basketCount);
            }
            else
            {
                return Ok(0);
            }
        }

        [HttpPost]
        public async Task<IActionResult> AddWish(int? id)
        {
            if (User.Identity.IsAuthenticated)
            {
                AppUser result = await _context.Users.FirstOrDefaultAsync(m => m.UserName == User.Identity.Name);

                if (id is null) return BadRequest();

                Product dbProduct = await _productService.GetById((int)id);

                if (dbProduct == null) return NotFound();

                Wishlist existWishlist = await _context.Wishlists.Where(m => m.ProductId == id && m.UserId == result.Id).FirstOrDefaultAsync();
                List<Wishlist> wishlists = await _context.Wishlists.Where(m => m.UserId == result.Id).ToListAsync();
                int wishListCount = 0;

                if (existWishlist != null)
                {

                    wishListCount = wishlists.Count - 1;
                    _context.Wishlists.Remove(existWishlist);
                }
                else
                {

                    wishListCount = wishlists.Count + 1;
                    Wishlist newWishlist = new()
                    {
                        ProductId = (int)id,
                        UserId = result.Id,
                    };
                    await _context.Wishlists.AddAsync(newWishlist);
                }





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
                return Ok("Login");
            }

        }
    } 
}
