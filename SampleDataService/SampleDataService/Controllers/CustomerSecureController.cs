using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SampleDataService.Controllers
{
    [TokenRequired]
    public class CustomerSecureController : CustomerController
    {
    }
}
