using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace FinalProjectCode.Models
{
    public class BlogCategory : BaseEntity
    {
        [StringLength(255)]
        public string Name { get; set; }
        public bool IsMain { get; set; }

        public int? ParentId { get; set; }
        public Category? Parent { get; set; }
        public IEnumerable<Category> Children { get; set; }
        

        [NotMapped]
        public IFormFile? File { get; set; }
    }
}
