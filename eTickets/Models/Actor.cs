using eTickets.Data.Base;
using Microsoft.AspNetCore.Http;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace eTickets.Models
{
    public class Actor : IEntityBase
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        [Display(Name = "Image")]
    
        public string ProfilePictureUrl { get; set; }

        [Display(Name = "Name")]
        [Required(ErrorMessage = "Name is required")]
        [StringLength(50,MinimumLength =3,ErrorMessage ="Name must be between 3 and 50 characters")]
        public string FullName { get; set; }

        [Display(Name = "Biography")]
        [Required(ErrorMessage = "Biography is required")]
        public string Bio { get; set; }

        [NotMapped]
        [Display(Name = "Upload Image")]
        [Required(ErrorMessage = " Picuture is required")]
        public IFormFile ImageFile { get; set; }

        public List<ActorMovie> ActorMovies { get; set; }

    }
}
