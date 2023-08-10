using System.ComponentModel.DataAnnotations;

namespace FinalProjectCode.Models
{
    public class Blog : BaseEntity
    {
        [StringLength(255)]
        public string TagName { get; set; }
        [StringLength(255)]
        public string Title { get; set; }
        [StringLength(1000)]
        public string Description { get; set; }
        [StringLength(255)]
        public string? Image { get; set; }
        [StringLength(255)]
        public string Date { get; set; }

        public int BlogCategoryId { get; set; }
        public BlogCategory BlogCategory { get; set; }
        public int TagId { get; set; }
        public Tag Tag { get; set; }
        
        
    }
}
