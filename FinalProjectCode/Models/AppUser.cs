using Microsoft.AspNetCore.Identity;

namespace FinalProjectCode.Models
{
    public class AppUser : IdentityUser
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public List<Basket> Baskets { get; set; }
        public List<Wishlist> Wishlists { get; set; }
        public List<Review> Reviews { get; set; }
    }
}
