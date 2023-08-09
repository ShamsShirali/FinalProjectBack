using Microsoft.EntityFrameworkCore.Metadata.Internal;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using FinalProjectCode.Migrations;

namespace FinalProjectCode.Models
{
    public class Product : BaseEntity
    {
        [StringLength(255)]
        public string Title { get; set; }
        [StringLength(1000)]
        public string Description { get; set; }
        [StringLength(1000)]
        public string Info { get; set; }
        public int View { get; set; }
        public int Sold { get; set; }
        [Column(TypeName = "money")]
        public decimal Price { get; set; }
        [Column(TypeName = "money")]
        public decimal? DiscountedPrice { get; set; }
        public int Count { get; set; }
        [StringLength(255)]
        public string? HoverImage { get; set; }
        [StringLength(255)]
        public string? MainImage { get; set; }

        public int? BrandId { get; set; }
        public Brand? Brand { get; set; }
        public int? CategoryId { get; set; }
        public Category? Category { get; set; }
        public IEnumerable<ProductImage> ProductImages { get; set; }
        public IEnumerable<ProductTag>? ProductTags { get; set; }
        public ICollection<Review> Reviews { get; set; }
        public int Raiting { get; set; }
        public bool InStock { get; set; } = true;
    }
}
