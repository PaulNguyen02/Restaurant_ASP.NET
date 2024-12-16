using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QuanLyNhaHang.Models;
using QuanLyNhaHang.Models.ViewModel;

namespace QuanLyNhaHang.Areas.Admin.Controllers
{
    public class RatingController : Controller
    {
        DataContext db = new DataContext();
        // GET: Admin/Rating
        public ActionResult Index()
        {
            var dishes = db.MonAn.ToList();
            var lounge = db.KHUVUC.ToList();
            var staffs = db.NhanVien.ToList();
            var overall_rating = new AdminRating();
            overall_rating.dishes = dishes;
            overall_rating.lounge = lounge;
            overall_rating.staffs = staffs;
            return View(overall_rating);
        }
    }
}