using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SampleDataService.Controllers
{
    public class HomeController : Controller
    {
        public JsonResult Index()
        {
            return Json(new { mvc = "ok", api = "ok", apiUrl1 = "./customer/list", apiUrl2 = "./customer/listnames" }, JsonRequestBehavior.AllowGet);
        }
        
    }
}
