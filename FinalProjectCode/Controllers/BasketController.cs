using FinalProjectCode.DataAccessLayer;
using FinalProjectCode.Models;
using FinalProjectCode.ViewModels.BasketVMs;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;

namespace FinalProjectCode.Controllers
{
    public class BasketController : Controller
    {
        public readonly AppDbContext _context;

        public BasketController(AppDbContext context)
        {
            _context = context;
        }

        public async Task<IActionResult> Index()
        {
            int basketCount = 0;
            int wishlistCount = 0;
            List<BasketVM> basketVMs = new();
            List<Wishlist> wishlists = new List<Wishlist>();
            if (User.Identity.IsAuthenticated)
            {
                AppUser user = await _context.Users.Where(m => m.UserName == User.Identity.Name).FirstOrDefaultAsync();

                List<Basket> dbBaskets = await _context.Baskets.Where(m => m.UserId == user.Id).ToListAsync();
                basketCount = dbBaskets.Sum(m => m.Count);
                wishlists = await _context.Wishlists.Where(m => m.UserId == user.Id).ToListAsync(); wishlistCount = wishlists.Count;
                wishlistCount = wishlists.Count;
                ViewBag.BasketCount = basketCount;
                ViewBag.WishListCount = wishlistCount;

                foreach (var item in dbBaskets)
                {
                    Product product = await _context.Products.FirstOrDefaultAsync(m => m.Id == item.ProductId);

                    basketVMs.Add(new BasketVM
                    {
                        Id = product.Id,
                        Count = item.Count,
                        Image = product.MainImage,
                        Title = product.Title,
                        Price = product.Price,
                        Total = product.Price * item.Count
                    });
                }
                return View(basketVMs);
            }
            else
            {
                ViewBag.BasketCount = 0;
                ViewBag.WishListCount = 0;
                return View(basketVMs);
            }
        }


        public IActionResult Check()
        {
            return View();
        }

        public async Task<IActionResult> IncreaseProductCount(int? id)
        {
            AppUser result = await _context.Users.FirstOrDefaultAsync(m => m.UserName == User.Identity.Name);

            if (id is null) return BadRequest();


            Basket dbBasket = await _context.Baskets.Where(m => m.ProductId == id && m.UserId == result.Id).FirstOrDefaultAsync();

            ++dbBasket.Count;
            List<Basket> dbBaskets = await _context.Baskets.Where(m => m.UserId == result.Id).ToListAsync();

            int basketCount = dbBaskets.Sum(m => m.Count);

            await _context.SaveChangesAsync();

            return Ok(basketCount);

        }


        public async Task<IActionResult> DecreaseProductCount(int? id)
        {
            AppUser result = await _context.Users.FirstOrDefaultAsync(m => m.UserName == User.Identity.Name);

            if (id is null) return BadRequest();

            Basket dbBasket = await _context.Baskets.Where(m => m.ProductId == id && m.UserId == result.Id).FirstOrDefaultAsync();

            dbBasket.Count -= 1;

            List<Basket> dbBaskets = await _context.Baskets.Where(m => m.UserId == result.Id).ToListAsync();

            int basketCount = dbBaskets.Sum(m => m.Count);

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


        public async Task<IActionResult> DeleteProductFromBasket(int? id)
        {
            if (id is null) return BadRequest();
            AppUser result = await _context.Users.FirstOrDefaultAsync(m => m.UserName == User.Identity.Name);

            int basketCount = 0;
            List<Basket> deletedBasket = await _context.Baskets.Where(m => m.ProductId == id && m.UserId == result.Id).ToListAsync();

            List<Basket> dbBaskets = await _context.Baskets.Where(m => m.UserId == result.Id).ToListAsync();

            basketCount = dbBaskets.Sum(m => m.Count) - deletedBasket.Sum(m => m.Count);

            if (basketCount > 0)
            {
                ViewBag.BasketCount = basketCount;
            }
            else
            {
                ViewBag.BasketCount = 0;
            }

            foreach (var item in deletedBasket)
            {
                _context.Baskets.Remove(item);
            }

            await _context.SaveChangesAsync();

            return Ok(basketCount);
        }


    }
}
