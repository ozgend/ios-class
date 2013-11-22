using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace SampleDataService.Controllers
{
   
    public class CustomerController : Controller
    {
        public JsonResult List()
        {
            try
            {
                var list = CustomerRepository.GetCustomers();
                return Json(new { Ok = true, Customers = list }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new { Ok = false, Message = ex.Message }, JsonRequestBehavior.AllowGet);
            }
        }

        public JsonResult ListPaged(int targetPageNumber)
        {
            try
            {
                var list = CustomerRepository.GetCustomersPaged(targetPageNumber);
                return Json(new { Ok = true, Customers = list }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new { Ok = false, Message = ex.Message }, JsonRequestBehavior.AllowGet);
            }
        }

        public JsonResult Edit(Customer customer)
        {
            var message = string.Empty;
            var ok = true;

            try
            {
                CustomerRepository.EditCustomer(customer);
                message = "Customer information updated.";
            }
            catch (Exception ex)
            {
                ok = false;
                message = ex.Message;
            }
            return Json(new { Ok = ok, Message = message }, JsonRequestBehavior.AllowGet);
        }


        public JsonResult ListNames()
        {
            try
            {
                var list = CustomerRepository.GetCustomerNames();
                return Json(new { Ok = true, Names = list }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new { Ok = false, Message = ex.Message }, JsonRequestBehavior.AllowGet);
            }
        }
    }
}
