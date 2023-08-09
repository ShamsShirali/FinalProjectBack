using FinalProjectCode.Models;

namespace FinalProjectCode.Interfaces
{
    public interface IProductService
    {
        Task<Product> GetById(int id);
        Task<IEnumerable<Product>> GetAll();
    }
}
