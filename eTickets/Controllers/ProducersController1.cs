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
    public class ProducersController : Controller
    {

        private readonly IProducerService _service;
        private readonly IWebHostEnvironment _hostEnvironment;

        public ProducersController(IProducerService service, IWebHostEnvironment hostEnvironment)
        {
            _service = service;
            _hostEnvironment = hostEnvironment;
        }

        public async Task<IActionResult> Index()
        {
            var producers = await _service.GetAllAsync();
            return View(producers);
        }

        //get: producers/details/1

        public async Task<IActionResult> Details(int id)
        {
            var producerDetails = await _service.GetByIdAsync(id);
            if (producerDetails == null) 
                return View("NotFound");
            return View(producerDetails);
        }

        //get: producers/create

        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Create([Bind("FullName,ImageFile,Bio")]Producer producer)
        {
          
                if (!ModelState.IsValid)
                    return View(producer);
                string wwwRootPath = _hostEnvironment.WebRootPath;
                string fileName = Path.GetFileNameWithoutExtension(producer.ImageFile.FileName);
                string fileExtension = Path.GetExtension(producer.ImageFile.FileName);
                producer.ProfilePictureUrl = fileName = "img/" + fileName + DateTime.Now.ToString("yymmssfff") + fileExtension;
                string path = Path.Combine(wwwRootPath, fileName);
                using (var fileStream = new FileStream(path, FileMode.Create))
                {
                    await producer.ImageFile.CopyToAsync(fileStream);
                }

                await _service.AddAsync(producer);
                return RedirectToAction(nameof(Index));
        }


        //get: producers/edit/1

        public async Task<IActionResult> Edit(int id)
        {
            var producerdDetails = await _service.GetByIdAsync(id);
            if (producerdDetails == null)
                return View("NotFound");
            return View(producerdDetails);
        }

        [HttpPost]
        public async Task<IActionResult> Edit(int id, [Bind("Id,FullName,ImageFile,Bio")] Producer producer)
        {

            if (!ModelState.IsValid)
                return View(producer);
            if(id == producer.Id)
            {
                string wwwRootPath = _hostEnvironment.WebRootPath;
                string fileName = Path.GetFileNameWithoutExtension(producer.ImageFile.FileName);
                string fileExtension = Path.GetExtension(producer.ImageFile.FileName);
                producer.ProfilePictureUrl = fileName = "img/" + fileName + DateTime.Now.ToString("yymmssfff") + fileExtension;
                string path = Path.Combine(wwwRootPath, fileName);
                using (var fileStream = new FileStream(path, FileMode.Create))
                {
                    await producer.ImageFile.CopyToAsync(fileStream);
                }

                await _service.UpdateAsync(id, producer);
                return RedirectToAction(nameof(Index));
            }
            return View(producer);
        }

        //get: producers/delete/1

        public async Task<IActionResult> Delete(int id)
        {
            var producerdDetails = await _service.GetByIdAsync(id);
            if (producerdDetails == null)
                return View("NotFound");
            return View(producerdDetails);
        }

        [HttpPost, ActionName("Delete")]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var producerdDetails = await _service.GetByIdAsync(id);
            if (producerdDetails == null)
                return View("NotFound");

            await _service.DeleteAsync(id);
            return RedirectToAction(nameof(Index));

        }
    }
}
