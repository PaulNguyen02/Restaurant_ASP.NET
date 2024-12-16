﻿using QuanLyNhaHang.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QuanLyNhaHang.Areas.NhanVien.Controllers
{
    public class HomeController : Controller
    {
        DataContext db = new DataContext();

        //Tranh chủ nhân viên bán hàng
        public ActionResult Index()
        {
            ViewBag.DoanhThu = DoanhThuDonHang();
            ViewBag.SumHoaDon = db.HoaDon.Count();
            ViewBag.SumMonAn = db.MonAn.Count();
            ViewBag.SumNhanVien = db.NhanVien.Count();
            ViewBag.SumBan = db.Ban.Count();
            ViewBag.Tang = db.Tang.Count();
            // Món Ăn Bán Chạy
            ViewBag.BanChay = db.MonAn.Where(n => n.MaLMA_id != 10 & n.MaMonAn != 1).ToList().OrderByDescending(n => n.SoLuongDaBan);
            // Hóa đơn
            //var list = db.HoaDons.ToList().Where(n =>n.NgayTao.Value.ToString("dd/MM/yyyy")== time2).FirstOrDefault();
            //ViewBag.HoaDOn = list;
            ViewBag.HoaDon = db.HoaDon.ToList();
            return View();
        }
        public double DoanhThuDonHang()
        {
            double TongDoanhThu = 0;
            if (0 < db.HoaDon.Count())
            {
                // doanh thu tất cả 
                TongDoanhThu = db.HoaDon.Where(n => n.TrangThai == 0).Sum(n => n.TongTien);
                return TongDoanhThu;
            }
            else
                return TongDoanhThu;
        }


        #region Hiển thị danh sách các bàn theo tầng khác nhau
        public ActionResult Ban(int iMaTang)
        {
            var tenTang = db.Tang.Find(iMaTang);
            ViewBag.Tang = tenTang.TenTang;

            var listBan = db.Ban.Where(n => n.MaTang_id == iMaTang).OrderBy(n => n.MaBan).ToList();
            return View(listBan);
        }
        public ActionResult Par_Tang()
        {
            var listTang = db.Tang.ToList().OrderBy(n => n.MaTang);
            return PartialView(listTang);
        }

        #endregion
    }
}