using FinalProjectCode.DataAccessLayer;
using FinalProjectCode.Interfaces;
using FinalProjectCode.Models;
using FinalProjectCode.ViewModels.TestVMs;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace FinalProjectCode.Controllers
{
    public class ShopController : Controller
    {
        private readonly AppDbContext _context;
        private readonly IProductService _productService;

        public ShopController(AppDbContext context, IProductService productService)
        {
            _context = context;
            _productService = productService;
        }
        public async Task<IActionResult> Index()
        {
            IEnumerable<Product> products = await _context.Products.Include(m=>m.ProductImages).Include(m=>m.Category).ToListAsync();

            IEnumerable<Category> categories = await _context.Categories.ToListAsync();

           IEnumerable<Brand> brands = await _context.Brands.ToListAsync();

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
            }
            else
            {
                ViewBag.BasketCount = 0;
                ViewBag.WishListCount = 0;
            }

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
