﻿using Microsoft.AspNetCore.Mvc;

namespace FinalProjectCode.Controllers
{
    public class ShopController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
