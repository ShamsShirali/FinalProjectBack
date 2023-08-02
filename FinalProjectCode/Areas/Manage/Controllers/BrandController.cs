using FinalProjectCode.DataAccessLayer;
using FinalProjectCode.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace FinalProjectCode.Areas.Manage.Controllers
{
    [Area("manage")]
    public class BrandController : Controller
    {
        private readonly AppDbContext _context;

        public BrandController(AppDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<IActionResult> Index(int pageIndex = 1)
        {
            IQueryable<Brand> brands = _context.Brands
                .Include(b => b.Products.Where(p => p.IsDeleted == false))
                .Where(b => b.IsDeleted == false)
                .OrderByDescending(b => b.Id);

            int totalPages = (int)Math.Ceiling((decimal)brands.Count() / 3);

            ViewBag.TotalPages = totalPages;
            ViewBag.PageIndex = pageIndex;

            return View(brands.Skip((pageIndex - 1) * 3).Take(3).ToList());
        }

        [HttpGet]
        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Create(Brand brand)
        {
            if (!ModelState.IsValid)
            {
                return View();
            }

            if (await _context.Brands.AnyAsync(b => b.IsDeleted == false && b.Name.ToLower() == brand.Name.ToLower().Trim()))
            {
                ModelState.AddModelError("Name", "Already Exist");
                return View();
            }

            brand.Name = brand.Name.Trim();

            await _context.Brands.AddAsync(brand);
            await _context.SaveChangesAsync();

            return RedirectToAction(nameof(Index));
        }

        [HttpGet]
        public async Task<IActionResult> Update(int? id)
        {
            if (id == null) return BadRequest();

            Brand brand = await _context.Brands.FirstOrDefaultAsync(b => b.Id == id && b.IsDeleted == false);

            if (brand == null) return NotFound();

            return View(brand);
        }

        [HttpPost]
        public async Task<IActionResult> Update(int? id, Brand brand)
        {
            if (!ModelState.IsValid)
            {
                return View(brand);
            }

            if (id == null) return BadRequest();

            if (brand.Id != id) return BadRequest();

            Brand dbBrand = await _context.Brands.FirstOrDefaultAsync(b => b.Id == id && b.IsDeleted == false);

            if (dbBrand == null) return NotFound();

            if (await _context.Brands.AnyAsync(b => b.IsDeleted == false && b.Name.ToLower() == brand.Name.ToLower().Trim() && b.Id != id))
            {
                ModelState.AddModelError("Name", "Already Exist");
                return View();
            }

            dbBrand.Name = brand.Name.Trim();
            dbBrand.UpdateAt = DateTime.UtcNow.AddHours(4);
            dbBrand.UpdateBy = "System";

            await _context.SaveChangesAsync();

            return RedirectToAction(nameof(Index));
        }

        [HttpGet]
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null) return BadRequest();

            Brand brand = await _context.Brands.FirstOrDefaultAsync(b => b.Id == id && b.IsDeleted == false);

            if (brand == null) return NotFound();

            if (brand.Products != null && brand.Products.Count() > 0)
            {
                //foreach(Product product in brand.Products)
                //{
                //    product.BrandId = null;
                //}

                return BadRequest();
            }

            brand.IsDeleted = true;
            brand.DeletedBy = "System";
            brand.DeletedAt = DateTime.UtcNow.AddHours(4);

            await _context.SaveChangesAsync();

            return RedirectToAction(nameof(Index));
        }
    }
}
