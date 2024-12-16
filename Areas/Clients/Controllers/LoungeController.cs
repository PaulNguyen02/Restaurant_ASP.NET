using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QuanLyNhaHang.Models;
using QuanLyNhaHang.Models.ViewModel;

namespace QuanLyNhaHang.Areas.Clients.Controllers
{
    public class LoungeController : Controller
    {
        private DataContext db = new DataContext();
        // GET: Clients/Lounge
        public ActionResult Index()
        {
            var result = db.KHUVUC
            .Join(db.LOAIKHUVUC,
                  kv => kv.MaLoaiKhuVuc,
                  lkv => lkv.MaLoaiKhuVuc,
                  (kv, lkv) => new { kv, lkv })
            .Join(db.Tang,
                  kvlkv => kvlkv.kv.MaTang,
                  t => t.MaTang,
                  (kvlkv, t) => new Lounge
                  {
                      MaKhuVuc = kvlkv.kv.MaKhuVuc,
                      TenKhuVuc = kvlkv.kv.TenKhuVuc,
                      TenLoaiKhuVuc = kvlkv.lkv.TenLoaiKhuVuc,
                      TenTang = t.TenTang,
                      DanhGia = kvlkv.kv.DanhGia
                  })
            .ToList();
            return View(result);
        }
        [HttpPost]
        public ActionResult Rating(int rating, int? itemId) {
            var item = db.KHUVUC.FirstOrDefault(r => r.MaKhuVuc == itemId);
            item.DanhGia = rating;
            db.SaveChanges();
            return Json(new { success = true, message = $"Cảm ơn bạn đã đánh giá {rating}/5 sao!" });
        }
    }
}