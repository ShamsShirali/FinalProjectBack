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

        public IActionResult Index()
        {
            return View();
        }

        public async Task<IActionResult> AddBasket(int? id)
        {
            if (id == null) return BadRequest();

            if (!await _context.Products.AnyAsync(p => p.IsDeleted == false && p.Id == id)) return NotFound();

            string? cookie = Request.Cookies["baslet"];
            List<BasketVM> basketVMs = null;

            if (string.IsNullOrWhiteSpace(cookie))
            {
                BasketVM vm = new BasketVM
                {
                    Id = (int)id,
                    Count = 1
                };

                basketVMs = new List<BasketVM> { vm };
            }
            else
            {
                basketVMs = JsonConvert.DeserializeObject<List<BasketVM>>(cookie);

                if (basketVMs.Exists(b => b.Id == id))
                {
                    basketVMs.Find(b => b.Id == id).Count += 1;
                }
                else
                {
                    BasketVM vm = new BasketVM
                    {
                        Id = (int)id,
                        Count = 1
                    };

                    basketVMs.Add(vm);
                }
            }

            cookie = JsonConvert.SerializeObject(basketVMs);

            Response.Cookies.Append("basket", cookie);

            foreach (BasketVM basketVM in basketVMs)
            {
                Product product = await _context.Products.FirstOrDefaultAsync(p => p.Id == basketVM.Id);

                basketVM.Image = product.MainImage;
                basketVM.Price = (decimal)(product.DiscountedPrice > 0 ? product.DiscountedPrice : product.Price);
                basketVM.Title = product.Title;
            }

            return PartialView("_BasketPartial", basketVMs);
        }

        public IActionResult GetBasket()
        {
            string? basket = Request.Cookies["basket"];

            List<BasketVM> products = JsonConvert.DeserializeObject<List<BasketVM>>(basket);

            return Ok(products);
        }
    }
}
