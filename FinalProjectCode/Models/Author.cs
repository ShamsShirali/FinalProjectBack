using System.ComponentModel.DataAnnotations;

namespace FinalProjectCode.Models
{
    public class Author : BaseEntity
    {
        [StringLength(255)]
        public string Name { get; set; }
        [StringLength(255)]
        public string Job { get; set; }
        [StringLength(1000)]
        public string Text { get; set; }
    }
}
