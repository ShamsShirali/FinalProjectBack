using FinalProjectCode.Models;

namespace FinalProjectCode.ViewModels.HomeVMs
{
    public class HomeVM
    {
        public IEnumerable<Slider> Sliders { get; set; }
        public IEnumerable<Product> Products { get; set; }
    }
}
