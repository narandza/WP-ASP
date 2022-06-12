using eTickets.Data.Base;
using eTickets.Data.Enums;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace eTickets.Models
{
    public class Movie : IEntityBase
    {
        internal string ImageURL;

        [Key]
        public int Id { get; set; }

        [Display(Name="Name")]
        public string Name { get; set; }
        [Display(Name = "Descriptio")]
        public string Description { get; set; }

        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public double Price { get; set; }
        public string ImageUrl { get; set; }
        public MovieCategory MovieCategory { get; set; }

        public List<ActorMovie> ActorMovies { get; set; }
        public int CinemaId { get; set; }
        [ForeignKey("CinemaId")]
        public Cinema Cinema { get; set; }
        public int ProducerId { get; set; }
        [ForeignKey("ProducerId")]
        public Producer Producer { get; set; }

        [NotMapped]
        [Display(Name = "Upload Image")]
        [Required(ErrorMessage = " Picuture is required")]
        public IFormFile ImageFile { get; set; }
    }
}
