using eTickets.Data.Base;
using eTickets.Data.Enums;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace eTickets.Models
{
    public class NewMovieVM
    {

        public int Id { get; set; }

        [Display(Name="Movie Name")]
        [Required(ErrorMessage ="Name is required")]
        public string Name { get; set; }


        [Display(Name = "Description")]
        [Required(ErrorMessage = "Description is required")]
        public string Description { get; set; }

        [Display(Name = "Start Date")]
        [Required(ErrorMessage = "Start date is required")]
        public DateTime StartDate { get; set; }

        [Display(Name = "End Date")]
        [Required(ErrorMessage = "End date is required")]
        public DateTime EndDate { get; set; }

        [Display(Name = "Price")]
        [Required(ErrorMessage = "Price is required")]
        public double Price { get; set; }
        
        [Display(Name = "Image")]    
        public string ImageUrl { get; set; }


        [Display(Name = "Select a category")]
        [Required(ErrorMessage = "Movie category is required")]
        public MovieCategory MovieCategory { get; set; }

        [NotMapped]
        [Display(Name = "Upload Image")]
        [Required(ErrorMessage = " Picuture is required")]
        public IFormFile ImageFile { get; set; }


        [Display(Name = "Select actors")]
        [Required(ErrorMessage = "Actor(s) is required")]
        public List<int> ActorIds { get; set; }

        [Display(Name = "Select cinema")]
        [Required(ErrorMessage = "Cinema is required")]
        public int CinemaId { get; set; }

        [Display(Name = "Select producer")]
        [Required(ErrorMessage = "Actor(s) is required")]
        public int ProducerId { get; set; }
    }
}
