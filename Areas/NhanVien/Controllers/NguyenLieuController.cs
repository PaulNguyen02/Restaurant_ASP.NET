using QuanLyNhaHang.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace QuanLyNhaHang.Areas.NhanVien.Controllers
{
    public class NguyenLieuController : Controller
    {
        DataContext db = new DataContext();
        // GET: NhanVien/NguyenLieu
       
        public ActionResult Index()
        {
            var nguyenLieuList = db.NguyenLieu.Select(nl => new NguyenLieuViewModel
            {
                MaNguyenLieu = nl.MaNguyenLieu,
                TenNguyenLieu = nl.TenNguyenLieu,
                SoLuongHienCon = nl.SoLuongHienCon,
                GhiChu = nl.GhiChu,
                GiaNhapCuoi = nl.GiaNhapCuoi,
                TenLoaiNguyenLieu = nl.LoaiNguyenLieu.TenLNL // Assuming LoaiNguyenLieu is a navigation property
            }).ToList();

            return View(nguyenLieuList);
        }

        public ActionResult QLKHanSuDung
            ()
        {
            var nguyenLieuList = db.NguyenLieu.Select(nl => new NguyenLieuViewModel
            {
                MaNguyenLieu = nl.MaNguyenLieu,
                TenNguyenLieu = nl.TenNguyenLieu,
                SoLuongHienCon = nl.SoLuongHienCon,
                GhiChu = nl.GhiChu,
                GiaNhapCuoi = nl.GiaNhapCuoi,
                TenLoaiNguyenLieu = nl.LoaiNguyenLieu.TenLNL, // Accessing through the relationship
                HanSuDung = nl.HanSuDung
            }).ToList();

            return View(nguyenLieuList);
        }
        public ActionResult QLKChinhSuaHSD(int id)
        {
            var nguyenLieu = db.NguyenLieu.Find(id);
            if (nguyenLieu == null)
            {
                return HttpNotFound();
            }

            var viewModel = new NguyenLieuViewModel
            {
                MaNguyenLieu = nguyenLieu.MaNguyenLieu,
                TenNguyenLieu = nguyenLieu.TenNguyenLieu,
                SoLuongHienCon = nguyenLieu.SoLuongHienCon,
                GhiChu = nguyenLieu.GhiChu,
                GiaNhapCuoi = nguyenLieu.GiaNhapCuoi,
                HanSuDung = nguyenLieu.HanSuDung
            };

            return View(viewModel);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult QLKChinhSuaHSD(NguyenLieuViewModel viewModel)
        {
            if (ModelState.IsValid)
            {
                var nguyenLieu = db.NguyenLieu.Find(viewModel.MaNguyenLieu);
                if (nguyenLieu == null)
                {
                    return HttpNotFound();
                }

                nguyenLieu.TenNguyenLieu = viewModel.TenNguyenLieu;
                nguyenLieu.SoLuongHienCon = viewModel.SoLuongHienCon;
                nguyenLieu.GhiChu = viewModel.GhiChu;
                nguyenLieu.GiaNhapCuoi = viewModel.GiaNhapCuoi;
                nguyenLieu.HanSuDung = viewModel.HanSuDung;

                db.SaveChanges();
                return RedirectToAction("QLKHanSuDung");
            }

            return View(viewModel);
        }
        public ActionResult QLKPhieuNhapHang()
        {
            var phieuNhaps = db.PhieuNhap.ToList();
            return View(phieuNhaps);
        }
        public ActionResult QLKChiTietPhieuNhapHang(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            var phieuNhap = db.PhieuNhap.Find(id);
            if (phieuNhap == null)
            {
                return HttpNotFound();
            }

            var chiTietPhieuNhap = db.ChiTietPhieuNhap
                .Where(c => c.MaPhieuNhap_id == id)
                .Select(c => new ChiTietPhieuNhapViewModel
                {
                    MaNguyenLieu_id = c.MaNguyenLieu_id,
                    SoLuongNhap = c.SoLuongNhap,
                    GiaNhap = c.GiaNhap,
                    ThanhTien = c.ThanhTien,
                    NguyenLieu = c.NguyenLieu,
                    HanSuDung = c.HanSuDung,
                    DaysLeft = DbFunctions.DiffDays(phieuNhap.NgayNhap, c.HanSuDung).Value // Tính số ngày còn lại
                }).ToList();

            ViewBag.PhieuNhap = phieuNhap;
            return View(chiTietPhieuNhap);
        }
        [HttpPost]
        public ActionResult UpdateHanSuDung(int maPhieuNhap_id, int maNguyenLieu_id, DateTime hanSuDung)
        {
            var chiTiet = db.ChiTietPhieuNhap.FirstOrDefault(c => c.MaPhieuNhap_id == maPhieuNhap_id && c.MaNguyenLieu_id == maNguyenLieu_id);
            if (chiTiet != null)
            {
                chiTiet.HanSuDung = hanSuDung;
                db.SaveChanges();
                return Json(new { success = true });
            }
            return Json(new { success = false, message = "Không tìm thấy chi tiết phiếu nhập." });
        }

    }
}