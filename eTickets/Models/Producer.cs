using eTickets.Data.Base;
using Microsoft.AspNetCore.Http;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace eTickets.Models
{
    public class Producer : IEntityBase
    {
        [Key]
        public int Id { get; set; }

        [Display(Name = "Image")]
        public string ProfilePictureUrl { get; set; }

        [Display(Name = "Name")]
        [Required(ErrorMessage = "Name is Required")]
        [StringLength(50, MinimumLength = 3, ErrorMessage = "Name must be between 3 and 50 characters")]
        public string FullName { get; set; }

        [Display(Name = "Biography")]
        [Required(ErrorMessage = "Biography is Required")]
        public string Bio { get; set; }

        public List<Movie> Movies { get; set; }

        [NotMapped]
        [Display(Name = "Upload Image")]
        [Required(ErrorMessage = " Picuture is required")]
        public IFormFile ImageFile { get; set; }

    }
}
