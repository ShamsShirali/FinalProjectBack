using Microsoft.AspNetCore.Mvc;

namespace FinalProjectCode.Controllers
{
    public class BlogController : Controller
    {
        public IActionResult Index()
        {
            
            return View();
        }
    }
}
