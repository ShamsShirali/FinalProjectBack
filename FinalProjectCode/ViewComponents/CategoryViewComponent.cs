using FinalProjectCode.DataAccessLayer;
using FinalProjectCode.Models;
using Microsoft.AspNetCore.Mvc;

namespace FinalProjectCode.ViewComponents
{
    public class CategoryViewComponent : ViewComponent
    {
        private readonly AppDbContext _context;

        public CategoryViewComponent(AppDbContext context)
        {
            _context = context;
        }

        public async Task<IViewComponentResult> InvokeAsync(IEnumerable<Category> categories)
        {
            //IEnumerable<Category> categories = await _context.Categories.Where(c => c.IsDeleted == false && c.IsMain).ToListAsync();

            return await Task.FromResult(View(categories));
        }
    }
}
