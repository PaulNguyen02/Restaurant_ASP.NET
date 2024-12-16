using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QuanLyNhaHang.Models;

namespace QuanLyNhaHang.Areas.Clients.Controllers
{
    public class CareerController : Controller
    {
        // GET: Clients/Career
        DataContext db =new DataContext();
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Apply(FormCollection fr) {
            string full_name = fr["full_name"];
            string day_of_birth = fr["dob"];
            DateTime dob = DateTime.Parse(day_of_birth);
            string address = fr["address"];
            string phone_number = fr["phone"];
            string position = fr["position"];
            DateTime ngay_nop = DateTime.Now;
            bool is_accept = false;
            var apply = new TuyenDung
            {
                Hoten = full_name,
                NgaySinh = dob,
                DiaChi = address,
                SDT = phone_number,
                Vitri = position,
                NgayNopDon = ngay_nop,
                Duyet = is_accept,
            };
            db.TuyenDung.Add(apply);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}