using QuanLyNhaHang.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QuanLyNhaHang.Areas.NhanVien.Controllers
{
    public class TangController : Controller
    {
        DataContext db = new DataContext();
        public ActionResult DanhSachTang()
        {
            ViewBag.Tang = db.Tang.Count();
            var list = db.Tang.ToList();
            return View(list);
        }
        public ActionResult XemChiTiet(int iMaTang)
        {
            var tang = db.Tang.SingleOrDefault(n => n.MaTang == iMaTang);
            // Tổng số bàn 
            ViewBag.Tang = db.Ban.Where(n => n.MaTang_id == iMaTang).Count();
            return View(tang);
        }
        public ActionResult CapNhat(int iMaTang)
        {
            var tang = db.Tang.SingleOrDefault(n => n.MaTang == iMaTang);
            // Tổng số bàn 
            ViewBag.Tang = db.Ban.Where(n => n.MaTang_id == iMaTang).Count();
            return View(tang);
        }
    }
}