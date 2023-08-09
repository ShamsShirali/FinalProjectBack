using FinalProjectCode.Models;

namespace FinalProjectCode.ViewModels.ProductDetailVMs
{
    public class ProductDetailVM
    {
        public Product Product { get; set; }
        public IEnumerable<Product> LikeProducts { get; set; }
        public IEnumerable<Product> LastProducts { get; set; }
        public ReviewVM Review { get; set; }
        public List<Review> Reviews { get; set; }
    }
}
