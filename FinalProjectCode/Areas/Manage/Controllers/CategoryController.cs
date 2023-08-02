using FinalProjectCode.DataAccessLayer;
using FinalProjectCode.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace FinalProjectCode.Areas.Manage.Controllers
{
    [Area("manage")]
    public class CategoryController : Controller
    {
        private readonly AppDbContext _context;
        private readonly IWebHostEnvironment _env;

        public CategoryController(AppDbContext context, IWebHostEnvironment env)
        {
            _context = context;
            _env = env;
        }

        [HttpGet]
        public async Task<IActionResult> Index(int pageIndex = 1)
        {
            IQueryable<Category> categories = _context.Categories
                .Include(b => b.Products.Where(p => p.IsDeleted == false))
                .Include(b => b.Children.Where(p => p.IsDeleted == false))
                .Where(b => b.IsDeleted == false)
                .OrderByDescending(b => b.Id);

            int totalPages = (int)Math.Ceiling((decimal)categories.Count() / 3);

            ViewBag.TotalPages = totalPages;
            ViewBag.PageIndex = pageIndex;

            return View(categories.Skip((pageIndex - 1) * 3).Take(3).ToList());
        }

        [HttpGet]
        public async Task<IActionResult> Detail(int? id)
        {
            if (id == null) return BadRequest();

            Category category = await _context.Categories
                .Include(c => c.Products.Where(ch => ch.IsDeleted == false))
                .Include(c => c.Children.Where(ch => ch.IsDeleted == false)).ThenInclude(ch => ch.Products.Where(p => p.IsDeleted == false))
                .FirstOrDefaultAsync(c => c.IsDeleted == false && c.Id == id);

            if (category == null) return NotFound();

            return View();
        }

        [HttpGet]
        public async Task<IActionResult> Create()
        {
            ViewBag.MainCategories = await _context.Categories.Where(c => c.IsDeleted == false && c.IsMain).ToListAsync();

            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(Category category)
        {
            ViewBag.MainCategories = await _context.Categories.Where(c => c.IsDeleted == false && c.IsMain).ToListAsync();

            if (!ModelState.IsValid)
            {
                return View();
            }

            if (await _context.Categories.AnyAsync(c => c.IsDeleted == false && c.Name.ToLower() == category.Name.ToLower().Trim()))
            {
                ModelState.AddModelError("Name", $"Category Name:{category.Name} Already Exist");
                return View();
            }

            if (category.IsMain)
            {
                if (category.File == null)
                {
                    ModelState.AddModelError("File", "File Is Required");
                    return View();
                }

                if ((category.File.Length / 1024) > 100)
                {
                    ModelState.AddModelError("File", "File Size Can Be Max 100 kb");
                    return View();
                }

                string fileName = DateTime.UtcNow.AddHours(4).ToString("yyyyMMddHHmmssfff") + category.File.FileName.Substring(category.File.FileName.LastIndexOf('.'));

                category.ParentId = null;
            }
            else
            {
                if (category.ParentId == null)
                {
                    ModelState.AddModelError("ParentId", "Parent Id Is Required");
                    return View();
                }

                if (!await _context.Categories.AnyAsync(c => c.IsDeleted == false && c.IsMain && c.Id == category.ParentId))
                {
                    ModelState.AddModelError("ParentId", "Parent Id Is InCorrect");
                    return View();
                }
            }

            category.Name = category.Name.Trim();

            await _context.Categories.AddAsync(category);
            await _context.SaveChangesAsync();

            return RedirectToAction(nameof(Index));
        }

        [HttpGet]
        public async Task<IActionResult> Update(int? id)
        {
            if (id == null) return BadRequest();

            Category category = await _context.Categories.FirstOrDefaultAsync(c => c.IsDeleted == false && c.Id == id);

            if (category == null) return NotFound();

            ViewBag.MainCategories = await _context.Categories.Where(c => c.IsDeleted == false && c.IsMain).ToListAsync();

            return View(category);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Update(int? id, Category category)
        {
            ViewBag.MainCategories = await _context.Categories.Where(c => c.IsDeleted == false && c.IsMain).ToListAsync();

            if (!ModelState.IsValid) return View(category);

            if (id == null) return BadRequest();

            if (id != category.Id) return BadRequest();

            Category dbCategory = await _context.Categories.FirstOrDefaultAsync(c => c.IsDeleted == false && c.Id == id);

            if (category == null) return NotFound();

            if (dbCategory.IsMain != category.IsMain)
            {
                ModelState.AddModelError("IsMain", "Category Status Deyise Bilmez");
                return View(category);
            }

            if (await _context.Categories.AnyAsync(c => c.IsDeleted == false && c.Name.ToLower() == category.Name.Trim().ToLower() && c.Id != category.Id))
            {
                ModelState.AddModelError("Name", "Same Name Already Exists");
                return View(category);
            }

            if (category.IsMain)
            {
                if (category.File != null)
                {
                    if ((category.File.Length / 1024) > 100)
                    {
                        ModelState.AddModelError("File", "File Size Can Be Max 100 kb");
                        return View();
                    }

                    string fileName = DateTime.UtcNow.AddHours(4).ToString("yyyyMMddHHmmssfff") + category.File.FileName.Substring(category.File.FileName.LastIndexOf('.'));
                }
                dbCategory.ParentId = null;
            }
            else
            {
                if (category.ParentId == null)
                {
                    ModelState.AddModelError("ParentId", "Parent Id Is Required");
                    return View();
                }

                if (!await _context.Categories.AnyAsync(c => c.IsDeleted == false && c.IsMain && c.Id == category.ParentId))
                {
                    ModelState.AddModelError("ParentId", "Parent Id Is InCorrect");
                    return View();
                }

                dbCategory.ParentId = category.ParentId;
            }

            dbCategory.Name = category.Name.Trim();
            dbCategory.UpdateBy = "System";
            dbCategory.UpdateAt = DateTime.UtcNow.AddHours(4);

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        [HttpGet]
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null) return BadRequest();

            Category category = await _context.Categories
                .FirstOrDefaultAsync(b => b.Id == id && b.IsDeleted == false);

            if (category == null) return NotFound();

            category.IsDeleted = true;
            category.DeletedBy = "System";
            category.DeletedAt = DateTime.UtcNow.AddHours(4);

            await _context.SaveChangesAsync();

            return RedirectToAction(nameof(Index));
        }
    }
}
