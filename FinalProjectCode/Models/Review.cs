﻿namespace FinalProjectCode.Models
{
    public class Review : BaseEntity
    {
        public int ProductId { get; set; }
        public Product Product { get; set; }
        public string UserId { get; set; }
        public AppUser User { get; set; }
        public int Raiting { get; set; }
        public string Tittle { get; set; }
        public string Describtion { get; set; }
        public string Username { get; set; }
        public string Email { get; set; }
    }
}
