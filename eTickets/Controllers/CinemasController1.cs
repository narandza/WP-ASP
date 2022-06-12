using eTickets.Data;
using eTickets.Data.Services;
using eTickets.Models;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.IO;
using System.Threading.Tasks;

namespace eTickets.Controllers
{
    public class CinemasController : Controller
    {
        private readonly ICinemasService _service;
        private readonly IWebHostEnvironment _hostEnvironment;

        public CinemasController(ICinemasService service, IWebHostEnvironment hostEnvironment)
        {
            _service = service;
            _hostEnvironment = hostEnvironment;
        }

        public async Task<IActionResult> Index()
        {
            var cinemas = await _service.GetAllAsync();
            return View(cinemas);
        }

        //get: producers/details/1

        public async Task<IActionResult> Details(int id)
        {
            var cinemaDetails = await _service.GetByIdAsync(id);
            if (cinemaDetails == null)
                return View("NotFound");
            return View(cinemaDetails);
        }

        //get: producers/create

        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Create([Bind("Name,ImageFile,Description")] Cinema cinema)
        {

            if (!ModelState.IsValid)
                return View(cinema);
            string wwwRootPath = _hostEnvironment.WebRootPath;
            string fileName = Path.GetFileNameWithoutExtension(cinema.ImageFile.FileName);
            string fileExtension = Path.GetExtension(cinema.ImageFile.FileName);
            cinema.Logo = fileName = "img/" + fileName + DateTime.Now.ToString("yymmssfff") + fileExtension;
            string path = Path.Combine(wwwRootPath, fileName);
            using (var fileStream = new FileStream(path, FileMode.Create))
            {
                await cinema.ImageFile.CopyToAsync(fileStream);
            }

            await _service.AddAsync(cinema);
            return RedirectToAction(nameof(Index));
        }


        //get: producers/edit/1

        public async Task<IActionResult> Edit(int id)
        {
            var cinemaDetails = await _service.GetByIdAsync(id);
            if (cinemaDetails == null)
                return View("NotFound");
            return View(cinemaDetails);
        }

        [HttpPost]
        public async Task<IActionResult> Edit(int id, [Bind("Id,Name,ImageFile,Description")] Cinema cinema)
        {

            if (!ModelState.IsValid)
                return View(cinema);
            if (id == cinema.Id)
            {
                string wwwRootPath = _hostEnvironment.WebRootPath;
                string fileName = Path.GetFileNameWithoutExtension(cinema.ImageFile.FileName);
                string fileExtension = Path.GetExtension(cinema.ImageFile.FileName);
                cinema.Logo = fileName = "img/" + fileName + DateTime.Now.ToString("yymmssfff") + fileExtension;
                string path = Path.Combine(wwwRootPath, fileName);
                using (var fileStream = new FileStream(path, FileMode.Create))
                {
                    await cinema.ImageFile.CopyToAsync(fileStream);
                }

                await _service.UpdateAsync(id, cinema);
                return RedirectToAction(nameof(Index));
            }
            return View(cinema);
        }

        //get: producers/delete/1

        public async Task<IActionResult> Delete(int id)
        {
            var cinemaDetails = await _service.GetByIdAsync(id);
            if (cinemaDetails == null)
                return View("NotFound");
            return View(cinemaDetails);
        }

        [HttpPost, ActionName("Delete")]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var cinemaDetails = await _service.GetByIdAsync(id);
            if (cinemaDetails == null)
                return View("NotFound");

            await _service.DeleteAsync(id);
            return RedirectToAction(nameof(Index));

        }
    }
}
