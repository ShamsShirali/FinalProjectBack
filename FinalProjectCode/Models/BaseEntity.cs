using System.ComponentModel.DataAnnotations;

namespace FinalProjectCode.Models
{
    public class BaseEntity
    {
        public int Id { get; set; }
        public bool IsDeleted { get; set; }
        [StringLength(255)]
        public string CreateBy { get; set; } = "System";
        public DateTime CreateAt { get; set; } = DateTime.UtcNow.AddHours(4);
        [StringLength(255)]
        public string? UpdateBy { get; set; }
        public DateTime? UpdateAt { get; set; }
        [StringLength(255)]
        public string? DeletedBy { get; set; }
        public DateTime? DeletedAt { get; set; }
    }
}
