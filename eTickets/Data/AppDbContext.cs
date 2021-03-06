using eTickets.Models;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
namespace eTickets.Data
{
    public class AppDbContext: IdentityDbContext<ApplicationUser>
    {
        public AppDbContext(DbContextOptions<AppDbContext> options): base(options)
        {

        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Actor>().HasKey(a => a.Id);
            modelBuilder.Entity<Producer>().HasKey(p => p.Id);
            modelBuilder.Entity<Cinema>().HasKey(c => c.Id);
            modelBuilder.Entity<ActorMovie>().HasKey(am => new { am.ActorId, am.MovieId });
            modelBuilder.Entity<ActorMovie>().HasOne(m => m.Movie).WithMany(am => am.ActorMovies).HasForeignKey(m => m.MovieId);;
            modelBuilder.Entity<ActorMovie>().HasOne(a => a.Actor).WithMany(am => am.ActorMovies).HasForeignKey(a => a.ActorId);



            base.OnModelCreating(modelBuilder);
        }

        public DbSet<Actor> Actors { get; set; }
        public DbSet<Movie> Movies { get; set; }
        public DbSet<Producer> Producers { get; set; }
        public DbSet<ActorMovie> ActorMovies { get; set; }
        public DbSet<Cinema> Cinemas { get; set; }
        public DbSet<Order> Orders { get; set; }
        public DbSet<OrderItem> OrderItems { get; set; }
        public DbSet<ShoppingCartItem> ShoppingCartItems { get; set; }
        
    }
}
