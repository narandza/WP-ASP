using eTickets.Data;
using eTickets.Data.Services;
using eTickets.Models;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace eTickets.Controllers
{
    public class ActorsController : Controller
    {
        private readonly IActorsService _service;
        private readonly IWebHostEnvironment _hostEnvironment;

        public ActorsController(IActorsService service, IWebHostEnvironment hostEnvironment)
        {
            _service = service; 
            _hostEnvironment = hostEnvironment;
        }

        private readonly AppDbContext _context;

     

        public async Task<IActionResult> Index()
        {
            var actors = await _service.GetAllAsync();
            return View(actors);
        }

        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Create([Bind(("FullName,ImageFile,Bio"))]Actor actor)
        {
            if (!ModelState.IsValid)
            {
                return View(actor);
            }
            string wwwRootPath = _hostEnvironment.WebRootPath;
            string fileName = Path.GetFileNameWithoutExtension(actor.ImageFile.FileName);
            string fileExtension = Path.GetExtension(actor.ImageFile.FileName);
            actor.ProfilePictureUrl = fileName = "img/" + fileName + DateTime.Now.ToString("yymmssfff") + fileExtension;
            string path = Path.Combine(wwwRootPath , fileName);
            using( var fileStream = new FileStream(path,FileMode.Create))
            {
                await actor.ImageFile.CopyToAsync(fileStream);
            }

            await _service.AddAsync(actor);
            return RedirectToAction(nameof(Index));
        }

        public async Task<IActionResult> Details(int id)
        {
            var actorDetails = await  _service.GetByIdAsync(id);
            if (actorDetails == null)
                return View("NotFound");
            return View(actorDetails);
        }

        public async Task<IActionResult> Edit(int id)
        {
            var actorDetails = await _service.GetByIdAsync(id);
            if (actorDetails == null)
                return View("NotFound");
            return View(actorDetails);
        }

        [HttpPost]
        public async Task<IActionResult> Edit(int id, [Bind(("Id,FullName,ImageFile,Bio"))] Actor actor)
        {
            if (!ModelState.IsValid)
            {
                return View(actor);
            }
            if(id == actor.Id)
            {
                string wwwRootPath = _hostEnvironment.WebRootPath;
                string fileName = Path.GetFileNameWithoutExtension(actor.ImageFile.FileName);
                string fileExtension = Path.GetExtension(actor.ImageFile.FileName);
                actor.ProfilePictureUrl = fileName = "img/" + fileName + DateTime.Now.ToString("yymmssfff") + fileExtension;
                actor.Id = id;
                string path = Path.Combine(wwwRootPath, fileName);
                using (var fileStream = new FileStream(path, FileMode.Create))
                {
                    await actor.ImageFile.CopyToAsync(fileStream);
                }

                _service.UpdateAsync(id, actor);
                return RedirectToAction(nameof(Index));
            }
            return View(actor);
        }


        public async Task<IActionResult> Delete(int id)
        {
            var actorDetails  = await _service.GetByIdAsync(id);
            if (actorDetails == null)
                return View("NotFound");
            return View(actorDetails);
        }

        [HttpPost, ActionName("Delete")]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var actorDetails = await _service.GetByIdAsync(id);
            if (actorDetails == null)
                return View("NotFound");

            await _service.DeleteAsync(id);
           
            return RedirectToAction(nameof(Index));
        }
    }
}
