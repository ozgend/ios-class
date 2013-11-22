using SampleDataService.Models;
using SampleDataService.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SampleDataService.Controllers
{
    public class UserController : Controller
    {

        public JsonResult Login(User user)
        {
            try
            {
                var token = UserRepository.Authenticate(user);
                return Json(new { Ok = true, Token = token }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new { Ok = false, Message = ex.Message }, JsonRequestBehavior.AllowGet);
            }
        }

    }
}
