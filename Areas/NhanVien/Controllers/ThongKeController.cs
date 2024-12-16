using QuanLyNhaHang.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QuanLyNhaHang.Areas.NhanVien.Controllers
{
    public class ThongKeController : Controller
    {
        DataContext db = new DataContext();
        // GET: NhanVien/ThongKe
        [HttpGet]
        public ActionResult TongSoLuongNhap()
        {
            return View(new ThongKeViewModel());
        }

        [HttpPost]
        public ActionResult TongSoLuongNhap(DateTime startDate, DateTime endDate)
        {
            var tongSoLuongNhap = db.ChiTietPhieuNhap
                .Where(c => c.PhieuNhap.NgayNhap >= startDate && c.PhieuNhap.NgayNhap <= endDate)
                .Sum(c => (int?)c.SoLuongNhap) ?? 0;

            var chiTietPhieuNhaps = db.ChiTietPhieuNhap
                .Where(c => c.PhieuNhap.NgayNhap >= startDate && c.PhieuNhap.NgayNhap <= endDate)
                .ToList();

            var viewModel = new ThongKeViewModel
            {
                StartDate = startDate,
                EndDate = endDate,
                TongSoLuongNhap = tongSoLuongNhap,
                ChiTietPhieuNhaps = chiTietPhieuNhaps
            };

            return View(viewModel);
        }
        [HttpGet]
        public ActionResult SoLuongNhapTheoSanPham()
        {
            return View(new ThongKeSanPhamViewModel());
        }

        [HttpPost]
        public ActionResult SoLuongNhapTheoSanPham(DateTime startDate, DateTime endDate)
        {
            var sanPhamThongKeList = db.ChiTietPhieuNhap
                .Where(c => c.PhieuNhap.NgayNhap >= startDate && c.PhieuNhap.NgayNhap <= endDate)
                .GroupBy(c => c.NguyenLieu.TenNguyenLieu)
                .Select(g => new SanPhamThongKe
                {
                    TenNguyenLieu = g.Key,
                    SoLuongNhap = g.Sum(c => (int?)c.SoLuongNhap) ?? 0
                })
                .ToList();

            var viewModel = new ThongKeSanPhamViewModel
            {
                StartDate = startDate,
                EndDate = endDate,
                SanPhamThongKeList = sanPhamThongKeList
            };

            return View(viewModel);
        }

        public ActionResult HangHoaSapHetHan()
        {
            return View(new HangHoaSapHetHanViewModel
            {
                CurrentDate = DateTime.Now,
                EndDate = DateTime.Now.AddDays(5)
            });
        }
        [HttpPost]
        public ActionResult HangHoaSapHetHan(DateTime currentDate, DateTime endDate)
        {
            var chiTietPhieuNhaps = db.ChiTietPhieuNhap
                 .Where(c => c.HanSuDung.HasValue && c.HanSuDung.Value >= currentDate && c.HanSuDung.Value <= endDate)
                 .ToList();

            var hangHoaHetHanList = chiTietPhieuNhaps.Select(c => new HangHoaHetHan
            {
                TenNguyenLieu = c.NguyenLieu.TenNguyenLieu,
                HanSuDung = c.HanSuDung.Value,
                NgayNhap = c.PhieuNhap.NgayNhap.Value,
                SoNgayConLai = (c.HanSuDung.Value - currentDate).Days
            }).ToList();

            var viewModel = new HangHoaSapHetHanViewModel
            {
                CurrentDate = currentDate,
                EndDate = endDate,
                HangHoaHetHanList = hangHoaHetHanList
            };

            return View(viewModel);
        }
        public ActionResult HangHoaDaHetHan(DateTime? currentDate)
        {
            if (!currentDate.HasValue)
            {
                currentDate = DateTime.Now;
            }

            var hangHoaDaHetHanList = db.ChiTietPhieuNhap
                .Where(c => c.HanSuDung.HasValue && c.HanSuDung.Value < currentDate.Value)
                .Select(c => new HangHoaDaHetHanViewModel
                {
                    MaNguyenLieu = c.MaNguyenLieu_id,
                    TenNguyenLieu = c.NguyenLieu.TenNguyenLieu,
                    MaPhieuNhap = c.MaPhieuNhap_id,
                    NgayNhap = c.PhieuNhap.NgayNhap ?? DateTime.MinValue,  // Sử dụng giá trị mặc định nếu NgayNhap là null
                    HanSuDung = c.HanSuDung.Value
                }).ToList();

            return View(hangHoaDaHetHanList);
        }
    }
}