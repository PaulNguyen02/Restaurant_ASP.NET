using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QuanLyNhaHang.Models.ViewModel;
using QuanLyNhaHang.Models;

namespace QuanLyNhaHang.Areas.Clients.Controllers
{
    public class StaffController : Controller
    {
        private DataContext db = new DataContext();
        // GET: Clients/Lounge
        public ActionResult Index()
        {
            var result = db.NhanVien
            .Join(db.Quyen,
                  nv => nv.MaQuyen_id,
                  quyen => quyen.MaQuyen,
                  (nv, quyen) => new Staff { 
                      Id = nv.MANV,
                      Name = nv.TenNhanVien,
                      Quyen = quyen.TenQuyen,
                      Danhgia = nv.DanhGia 
                  }).ToList();
            return View(result);
        }
        [HttpPost]
        public ActionResult Rating(int rating, int? itemId)
        {
            string manv = Convert.ToString(rating);
            var item = db.NhanVien.FirstOrDefault(r => r.MANV == manv);
            item.DanhGia = rating;
            db.SaveChanges();
            return Json(new { success = true, message = $"Cảm ơn bạn đã đánh giá {rating}/5 sao!" });
        }
    }
}