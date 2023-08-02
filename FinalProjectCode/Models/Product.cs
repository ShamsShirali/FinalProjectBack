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
        [StringLength(255)]
        public string View { get; set; }
        [StringLength(255)]
        public string Sold { get; set; }
        [Column(TypeName = "money")]
        public double Price { get; set; }
        [Column(TypeName = "money")]
        public double DiscountedPrice { get; set; }
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
        public int Raiting { get; set; }
    }
}
