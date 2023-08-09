using FinalProjectCode.DataAccessLayer;
using FinalProjectCode.Interfaces;
using FinalProjectCode.Models;
using FinalProjectCode.ViewModels.BasketVMs;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;

namespace FinalProjectCode.Services
{
    public class LayoutService : ILayoutService
    {
        private readonly AppDbContext _context;
        private readonly IHttpContextAccessor _contextAccessor;

        public LayoutService(AppDbContext context, IHttpContextAccessor contextAccessor)
        {
            _context = context;
            _contextAccessor = contextAccessor;
        }

        public async Task<List<BasketVM>> GetBasket(string UserName)
        {
            List<BasketVM> basketVMs = new();
            
            if(UserName!= null)
            {
                AppUser user = await _context.Users.Where(m => m.UserName == UserName).FirstOrDefaultAsync();

                List<Basket> baskets = await _context.Baskets.Where(m => m.UserId == user.Id).ToListAsync();

                IEnumerable<Product> products = await _context.Products.ToListAsync();

                Product product = new();




                foreach (var item in baskets)
                {
                    product = await _context.Products.FirstOrDefaultAsync(p => p.Id == item.ProductId);
                    basketVMs.Add(new BasketVM
                    {
                        Id = product.Id,
                        Count = item.Count,
                        Image = product.HoverImage,
                        Title = product.Title,
                        Price = product.Price,
                    });
                }
                return basketVMs;
            }
            else
            {
                return basketVMs;
            }

            
        }

        public async Task<IEnumerable<Category>> GetCategories()
        {
            return await _context.Categories.Include(c => c.Children.Where(c => c.IsDeleted == false)).Where(c => c.IsDeleted == false && c.IsMain).ToListAsync();
        }

        public async Task<List<Setting>> GetSetting()
        {
            List<Setting> settings = await _context.Settings.ToListAsync();

            return settings;
        }
    }
}
