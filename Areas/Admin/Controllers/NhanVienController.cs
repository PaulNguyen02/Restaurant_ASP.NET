﻿using QuanLyNhaHang.Models;
using System.Data.Entity;
using System.Linq;
using System.Web.Mvc;

namespace QuanLyNhaHang.Areas.Admin.Controllers
{
    public class NhanVienController : Controller
    {
        DataContext db = new DataContext();

        // Hiển thị danh sách nhân viên 
        public ActionResult DSNhanVien()
        {
            var list = db.NhanVien.Where(n => n.MaQuyen_id == 1 && n.TrangThai != 4).ToList();
            return View(list);
        }

        // Hiển thị danh sách phục vụ
        public ActionResult DSNhanVienPhucVu()
        {
            var list = db.NhanVien.Where(n => n.MaQuyen_id == 4).ToList();
            return View(list);
        }

        public ActionResult DSNhanVienKho()
        {
            var list = db.NhanVien.Where(n => n.MaQuyen_id == 2).OrderBy(n => n.MaQuyen_id).ToList();
            return View(list);
        }

        // Danh sách nhân viên có tài khoản bị khóa 
        public ActionResult DSNhanVienKhoa()
        {
            var list = db.NhanVien.Where(n => n.TrangThai == 4).ToList();
            return View(list);
        }

        // Mở/Khóa tài khoản
        public ActionResult LockAccount(string sTaiKhoanNV)
        {
            var nhanvien = db.NhanVien.FirstOrDefault(n => n.TaiKhoanNV == sTaiKhoanNV);
            if (nhanvien.TrangThai == 4) // Đang bị khóa
            {
                nhanvien.TrangThai = 0;
                db.SaveChanges();

                if (nhanvien.MaQuyen_id == 1)
                {
                    return RedirectToAction("DSNhanVien", "Nhanvien");

                }
                else if (nhanvien.MaQuyen_id == 2)
                {
                    return RedirectToAction("DSNhanVienKho", "Nhanvien");
                }
                //else
                //{
                //    return RedirectToAction("DSNhanVienKho", "Nhanvien");
                //}
            }
            else // Chưa khóa 
            {
                nhanvien.TrangThai = 4;
                db.SaveChanges();
            }

            return RedirectToAction("DSNhanVienKhoa", "Nhanvien");
        }

        // Thêm mới nhân vien
        public ActionResult ThemNhanVien()
        {
            ViewBag.Quyen = db.Quyen.ToList();
            return View();
        }

        [HttpPost]
        public ActionResult ThemNhanVien(QuanLyNhaHang.Models.NhanVien Model)
        {
            db.NhanVien.Add(Model);
            db.SaveChanges();
            return RedirectToAction("DSNhanVien", "NhanVien");
        }

        // Xóa nhân viên
        public ActionResult Xoa(string sTaiKhoanid)
        {
            var nhanVien = db.NhanVien.Find(sTaiKhoanid);
            db.NhanVien.Remove(nhanVien);
            db.SaveChanges();
            return RedirectToAction("DSNhanVien", "NhanVien");
        }

        // Xem chi tiết nhân viên
        public ActionResult XemChiTiet(string sTaiKhoanid)
        {
            var nhanVien = db.NhanVien.Find(sTaiKhoanid);
            return View(nhanVien);
        }

        // Cập nhật nhân viên
        public ActionResult CapNhat(string sTaiKhoanid)
        {
            QuanLyNhaHang.Models.NhanVien nhanVien = db.NhanVien.Find(sTaiKhoanid);
            ViewBag.MaQuyen_id = new SelectList(db.Quyen, "MaQuyen", "TenQuyen", nhanVien.MaQuyen_id);
            return View(nhanVien);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CapNhat([Bind(Include = "TaiKhoanNV,MatKhauNV,TenNhanVien,NgaySinh,SoDienThoai,MaQuyen_id")] QuanLyNhaHang.Models.NhanVien nhanVien)
        {
            if (ModelState.IsValid)
            {
                db.Entry(nhanVien).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("DSNhanVien", "NhanVien");
            }
            ViewBag.MaQuyen_id = new SelectList(db.Quyen, "MaQuyen", "TenQuyen", nhanVien.MaQuyen_id);
            return View();
        }
    }
}