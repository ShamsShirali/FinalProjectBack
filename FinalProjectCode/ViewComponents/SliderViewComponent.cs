using FinalProjectCode.DataAccessLayer;
using FinalProjectCode.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace FinalProjectCode.ViewComponents
{
    public class SliderViewComponent : ViewComponent
    {
        private readonly AppDbContext _context;

        public SliderViewComponent(AppDbContext context)
        {
            _context = context;
        }

        public async Task<IViewComponentResult> InvokeAsync()
        {
            IEnumerable<Slider> sliders = await _context.Sliders.Where(s => s.IsDeleted == false).ToListAsync();

            return await Task.FromResult(View(sliders));
        }
    }
}
