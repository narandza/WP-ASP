using eTickets.Data.Base;
using Microsoft.AspNetCore.Http;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace eTickets.Models
{
    public class Cinema : IEntityBase
    {
        [Key]
        public int Id { get; set; }

        [Display(Name="Logo")]
        public string Logo { get; set; }

        [Display(Name = "Name")]
        [Required(ErrorMessage = "Name is Required")]
        [StringLength(50, MinimumLength = 3, ErrorMessage = "Name must be between 3 and 50 characters")]
        public string Name { get; set; }

        [Display(Name = "Description")]
        [Required(ErrorMessage ="Description is Required")]
        public string Description { get; set; }

        public List<Movie> Movies { get; set; }

        [NotMapped]
        [Display(Name = "Upload Image")]
        [Required(ErrorMessage = " Logo is required")]
        public IFormFile ImageFile { get; set; }

    }
}
