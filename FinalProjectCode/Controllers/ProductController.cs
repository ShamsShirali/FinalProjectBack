using FinalProjectCode.DataAccessLayer;
using FinalProjectCode.Interfaces;
using FinalProjectCode.Models;
using FinalProjectCode.ViewModels.ProductDetailVMs;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace FinalProjectCode.Controllers
{
    public class ProductController : Controller
    {
        public readonly AppDbContext _context;
        private readonly IProductService _productService;

        public ProductController(AppDbContext context, IProductService productService)
        {
            _context = context;
            _productService = productService;
        }
        public async Task<IActionResult> Index(int id)
        {
            Product product = await _context.Products.Include(m=>m.ProductImages).Include(m=>m.Category).Include(m=>m.ProductTags).FirstOrDefaultAsync(m=>m.Id == id);
            IEnumerable<Product> likeproducts = await _context.Products.Take(3).Include(m => m.ProductImages).Include(m => m.Category).Include(m => m.ProductTags).ToListAsync();
            IEnumerable<Product> lastproducts = await _context.Products.OrderBy(m => m.CreateAt).Take(3).Include(m => m.ProductImages).Include(m => m.Category).Include(m => m.ProductTags).ToListAsync();
            List<Review> reviews = await _context.Reviews.Where(m => m.ProductId == id).ToListAsync();
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


            ProductDetailVM model = new()
            {
                Product = product,
                LikeProducts= likeproducts,
                LastProducts= lastproducts,
                Reviews = reviews
            };


            TempData["Id"] = id;

            return View(model);
        }
        public async Task<IActionResult> Search(string search)
        {
                List<Product> products = await _context.Products.Include(m=>m.ProductImages).Where(c => c.IsDeleted == false && 
                c.Title.ToLower().StartsWith(search.ToLower())).ToListAsync();

                //return Json(products);
                return PartialView("_SearchPartial", products);
        }



        [HttpPost]
        public async Task<IActionResult> AddBasket(int? id, int count)
        {
            if (User.Identity.IsAuthenticated)
            {
                AppUser result = await _context.Users.FirstOrDefaultAsync(m => m.UserName == User.Identity.Name);

                if (id is null) return BadRequest();

                Product dbProduct = await _productService.GetById((int)id);

                if (dbProduct == null) return NotFound();



                Basket existBasket = await _context.Baskets.Where(m => m.ProductId == id && m.UserId == result.Id).FirstOrDefaultAsync();
                List<Basket> baskets = await _context.Baskets.Where(m => m.UserId == result.Id).ToListAsync();

                int basketCount = 0;

                if (existBasket != null)
                {
                    existBasket.Count += count;
                    basketCount = baskets.Sum(m => m.Count);
                }
                else
                {

                    Basket newBasket = new()
                    {
                        ProductId = (int)id,
                        UserId = result.Id,
                        Count = count
                    };
                    await _context.Baskets.AddAsync(newBasket);
                    basketCount = baskets.Sum(m => m.Count) + 1;
                }




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



        [HttpPost]

        [ValidateAntiForgeryToken]
        public async Task<IActionResult> AddReview(ReviewVM review)
        {
            if (User.Identity.IsAuthenticated)
            {

                AppUser User1 = await _context.Users.Where(m => m.UserName == User.Identity.Name).FirstOrDefaultAsync();
                if (User1 == null) { return NotFound(); }



                int id = Convert.ToInt32(TempData["Id"]);

                Product product = await _context.Products.Include(m => m.Reviews).FirstOrDefaultAsync(m => m.Id == id);

                decimal sum = product.Reviews.Sum(m => m.Raiting) + review.Raiting;
                decimal count = product.Reviews.Count + 1;

                product.Raiting = (int)(sum / count);


                Review newReview = new()
                {
                    ProductId = id,
                    UserId = User1.Id,
                    Raiting = review.Raiting,
                    Tittle = review.Tittle,
                    Describtion = review.Describtion,
                    Username = User1.UserName,
                    Email = User1.Email,
                };

                await _context.Reviews.AddAsync(newReview);
                await _context.SaveChangesAsync();

                return RedirectToAction("Index", "Product", new { id });
            }
            else
            {
                return RedirectToAction("Login", "Account");
            }
        }
    }
}