using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QuanLyNhaHang.Models;
using QuanLyNhaHang.Models.ViewModel;
namespace QuanLyNhaHang.Areas.Clients.Controllers
{
    public class MenuController : Controller
    {
        DataContext db = new DataContext();

        public ActionResult Dishes()
        {
            var item = db.MonAn
              .Join(db.LoaiMonAn,
                    monAn => monAn.MaLMA_id,
                    loai => loai.MaLMA,
                    (monAn, loai) => new ItemViewModel
                    {
                        Id = monAn.MaMonAn,
                        name = monAn.TenMonAn,
                        picture = monAn.HinhAnh,
                        info = monAn.ThongTin,
                        price = monAn.DonGia,
                        rating = monAn.DanhGia,
                        Loai_id = monAn.MaLMA_id,
                    }).Where(m => m.Loai_id != 10 && m.Loai_id != 11)
              .ToList();
            return View(item);
        }
        public ActionResult Beverage()
        {
            var item = db.MonAn
              .Join(db.LoaiMonAn,
                    monAn => monAn.MaLMA_id,
                    loai => loai.MaLMA,
                    (monAn, loai) => new ItemViewModel
                    {
                        Id = monAn.MaMonAn,
                        name = monAn.TenMonAn,
                        picture = monAn.HinhAnh,
                        info = monAn.ThongTin,
                        price = monAn.DonGia,
                        rating = monAn.DanhGia,
                        Loai_id = monAn.MaLMA_id,
                    }).Where(m => m.Loai_id == 10)
              .ToList();
            return View(item);
        }
        [HttpPost]
        public ActionResult Rating(int rating, int? itemId) {
            var item = db.MonAn.FirstOrDefault(r => r.MaMonAn == itemId);
            item.DanhGia = rating;
            db.SaveChanges();
            return Json(new { success = true, message = $"Cảm ơn bạn đã đánh giá {rating}/5 sao!" });
        }
    }
}