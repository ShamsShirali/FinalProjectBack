using FinalProjectCode.Models;

namespace FinalProjectCode.ViewModels.BlogVMs
{
    public class BlogVM
    {
        public List<BlogCategory> BlogCategories { get; set; }
        public List<Tag> Tags { get; set; }
    }
}
