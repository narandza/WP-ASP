using eTickets.Data.Cart;
using eTickets.Data.Services;
using eTickets.Data.ViewModels;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;
using System.Threading.Tasks;

namespace eTickets.Controllers
{
    public class OrdersController : Controller
    {
        private readonly IMoviesService _moviesService;
        private readonly ShoppingCart _cart;
        private readonly IOrdersService _ordersService;

        public OrdersController(IMoviesService service, ShoppingCart cart, IOrdersService ordersService)
        {
            _moviesService = service;
            _cart = cart;
            _ordersService = ordersService; 
        }

        public async Task<IActionResult> Index()
        {
            string userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            string userRole = User.FindFirstValue(ClaimTypes.Role);
            var orders = await _ordersService.GetOrdersByUserIdAndRoleAsync(userId, userRole);
            return View(orders);
        }

        public IActionResult ShoppingCart()
        {
            var items = _cart.GetShoppingCartItems();
            _cart.ShoppingCartItems = items;

            var response = new ShoppingCartVM()
            {
                ShoppingCart = _cart,
                ShopingCartTotal = _cart.GetShoppingCartTotal(),
            };

            return View(response);
        }

        public async Task<IActionResult> AddToCart(int id)
        {
            var item = await _moviesService.GetMovieByIdAsync(id);
            if(item != null)
            {
                _cart.AddItemToCart(item);
            }
            return RedirectToAction(nameof(ShoppingCart));
        }

        public async Task<IActionResult> RemoveFromCart(int id)
        {
            var item = await _moviesService.GetMovieByIdAsync(id);
            if (item != null)
            {
                _cart.RemoveItemFromCart(item);
            }
            return RedirectToAction(nameof(ShoppingCart));
        }

        public async Task<IActionResult> CompleteOrder()
        {
            var items = _cart.GetShoppingCartItems();

            string userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            string userEmail = User.FindFirstValue(ClaimTypes.Email);

            await _ordersService.StoreOrderAsync(items, userId, userEmail);
            await _cart.ClearCartAsync();

            return View("OrderCompleted");
        }
    }
}
