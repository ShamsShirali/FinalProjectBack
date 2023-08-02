using FinalProjectCode.Models;

namespace FinalProjectCode.ViewModels.TestVMs
{
    public class ProductVM
    {
        public IEnumerable<Product> Products { get; set; }
        public IEnumerable<Category> Categories { get; set; }
    }
}
