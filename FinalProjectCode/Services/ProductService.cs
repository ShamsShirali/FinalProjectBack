using FinalProjectCode.DataAccessLayer;
using FinalProjectCode.Interfaces;
using FinalProjectCode.Models;
using Microsoft.EntityFrameworkCore;

namespace FinalProjectCode.Services
{
    public class ProductService : IProductService
    {
        private readonly AppDbContext _context;
        public ProductService(AppDbContext context, IHttpContextAccessor httpContextAccessor)
        {
            _context = context;
        }

        public async Task<Product> GetById(int id) => await _context.Products.Include(m => m.Category).Include(m => m.ProductImages).Include(m => m.ProductTags).FirstOrDefaultAsync(m => m.Id == id);
        public async Task<IEnumerable<Product>> GetAll() => await _context.Products.Include(m => m.Category).Include(m => m.ProductImages).Include(m => m.ProductTags).ToListAsync();
    }
}
