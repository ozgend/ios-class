using SampleDataService.Repository;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace SampleDataService
{
    public class TokenRequiredAttribute : ActionFilterAttribute, IActionFilter
    {

        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            var result = AuthenticateMobileRequest(filterContext.HttpContext.Request.Headers);

            if (result)
            {
                base.OnActionExecuting(filterContext);
            }
            else
            {
                filterContext.Result = new JsonResult
                {
                    Data = new { Ok = false, Message = "Invalid or no token." }
                };
            }

        }

        private bool AuthenticateMobileRequest(NameValueCollection headers)
        {
            var token = headers["Authentication-Token"];
            var result = UserRepository.Authenticate(token);
            return result;
        }
    }
}