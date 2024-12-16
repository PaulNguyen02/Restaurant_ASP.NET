using QuanLyNhaHang.Models;
using QuanLyNhaHang.Models.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.Mvc;

namespace QuanLyNhaHang.Areas.NhanVien.Controllers
{
    public class QuanlykhoController : Controller
    {
        DataContext db = new DataContext();
        // GET: NhanVien/Quanlykho
        public ActionResult Index()
        {
            var total_return = db.NguyenLieu
                .Join(db.NguyenLieuTra,
                      nlt => nlt.MaNguyenLieu, // Khóa ngoại từ NguyenLieuTra
                      ht => ht.MaNguyenLieu_id,   // Khóa chính từ HoanTra
                      (nlt, ht) => ht.SoLuongTra) // Chỉ cần lấy cột SoLuongTra
                .Sum();

            var total_export = db.NguyenLieu
                .Join(db.NguyenLieuXuat,
                      nlt => nlt.MaNguyenLieu, // Khóa ngoại từ NguyenLieuTra
                      ht => ht.MaNguyenLieu_id,   // Khóa chính từ HoanTra
                      (nlt, ht) => ht.SoLuongXuat) // Chỉ cần lấy cột SoLuongTra
                .Sum();

            var detail = db.NguyenLieu
                .Join(db.ChiTietSanPham,
                      nlt => nlt.MaNguyenLieu, // Khóa ngoại từ NguyenLieuTra
                      ht => ht.MaNguyenLieu_id,   // Khóa chính từ HoanTra
                      (nlt, ht) => ht.SoLuongDung) // Chỉ cần lấy cột SoLuongTra
                .Sum();

            var return_items = db.NguyenLieuTra
            .Join(db.HoanTra,
                  nlt => nlt.MaHoanTra_id, // Khóa ngoại từ NguyenLieuTra
                  ht => ht.MaHoanTra,   // Khóa chính từ HoanTra
                  (nlt, ht) => new { nlt }) // Chỉ quan tâm tới NguyenLieuTra
            .Join(db.NguyenLieu,
                  joined => joined.nlt.MaNguyenLieu_id, // Khóa ngoại từ NguyenLieuTra
                  nl => nl.MaNguyenLieu,            // Khóa chính từ NguyenLieu
                  (joined, nl) => new { nl.TenNguyenLieu, joined.nlt.SoLuongTra, joined.nlt.DonGia }) // Kết quả cần thiết
            .GroupBy(x => x.TenNguyenLieu) // Nhóm theo tên nguyên liệu
            .Select(g => new Goods
            {
                name = g.Key, // Tên nguyên liệu
                quantity = (float) g.Sum(x => x.SoLuongTra), // Tổng số lượng hoàn trả
                price = (float) g.Sum(x => x.SoLuongTra * x.DonGia)
            })
            .ToList();

            var export_items = db.NguyenLieuXuat
            .Join(db.XuatKho,
                  nlt => nlt.MaXuatKho_id, // Khóa ngoại từ NguyenLieuTra
                  ht => ht.MaXuatKho,   // Khóa chính từ HoanTra
                  (nlt, ht) => new { nlt }) // Chỉ quan tâm tới NguyenLieuTra
            .Join(db.NguyenLieu,
                  joined => joined.nlt.MaNguyenLieu_id, // Khóa ngoại từ NguyenLieuTra
                  nl => nl.MaNguyenLieu,            // Khóa chính từ NguyenLieu
                  (joined, nl) => new { nl.TenNguyenLieu, joined.nlt.SoLuongXuat, joined.nlt.DonGia }) // Kết quả cần thiết
            .GroupBy(x => x.TenNguyenLieu) // Nhóm theo tên nguyên liệu
            .Select(g => new Goods
            {
                name = g.Key, // Tên nguyên liệu
                quantity = (float)g.Sum(x => x.SoLuongXuat), // Tổng số lượng hoàn trả
                price = (float)g.Sum(x => x.SoLuongXuat * x.DonGia)
            })
            .ToList();

            var model = new StorageStatisticViewModel() { 
                so_nguyen_lieu_tra = total_return,
                so_nguyen_lieu_xuat = total_export,
                so_chi_tiet_san_pham = detail,
                nguyen_lieu_tra = return_items,
                nguyen_lieu_xuat = export_items
            };

            return View(model);
        }
        public ActionResult Create()
        {
            var viewModel = new PhieuNhapViewModel
            {
                NgayNhap = DateTime.Now,
                NhaCungCapList = db.NhaCC.Select(ncc => new SelectListItem
                {
                    Value = ncc.MaNCC.ToString(),
                    Text = ncc.TenNCC
                }).ToList(),
                NhanVienList = db.NhanVien.Select(nv => new SelectListItem
                {
                    Value = nv.TaiKhoanNV,
                    Text = nv.TenNhanVien
                }).ToList(),
                NguyenLieuList = db.NguyenLieu.Select(nl => new SelectListItem
                {
                    Value = nl.MaNguyenLieu.ToString(),
                    Text = nl.TenNguyenLieu
                }).ToList(),
                ChiTietPhieuNhaps = new List<ChiTietPhieuNhapViewModel>
            {
                new ChiTietPhieuNhapViewModel() // add empty details to start with
            }
            };

            return View(viewModel);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(PhieuNhapViewModel viewModel)
        {
            if (ModelState.IsValid)
            {
                var phieuNhap = new PhieuNhap
                {
                    NgayNhap = viewModel.NgayNhap,
                    TongTien = viewModel.ChiTietPhieuNhaps.Sum(c => c.ThanhTien) ?? 0,
                    MANV = viewModel.TaiKhoanNV_id,
                    MaNCC_id = viewModel.MaNCC_id
                };

                db.PhieuNhap.Add(phieuNhap);
                db.SaveChanges();

                foreach (var chiTiet in viewModel.ChiTietPhieuNhaps)
                {
                    var chiTietPhieuNhap = new ChiTietPhieuNhap
                    {
                        MaNguyenLieu_id = chiTiet.MaNguyenLieu_id,
                        MaPhieuNhap_id = phieuNhap.MaPhieuNhap,
                        SoLuongNhap = chiTiet.SoLuongNhap,
                        GiaNhap = chiTiet.GiaNhap,
                        ThanhTien = chiTiet.ThanhTien
                    };
                    db.ChiTietPhieuNhap.Add(chiTietPhieuNhap);
                      var nguyenLieu = db.NguyenLieu.Find(chiTiet.MaNguyenLieu_id);
            if (nguyenLieu != null)
            {
                nguyenLieu.SoLuongHienCon += chiTiet.SoLuongNhap;
            }
                }

                db.SaveChanges();
                return RedirectToAction("Index","Quanlykho"); // or wherever you want to redirect after successful create
            }

            // If we got this far, something failed; redisplay form.
            viewModel.NhaCungCapList = db.NhaCC.Select(ncc => new SelectListItem
            {
                Value = ncc.MaNCC.ToString(),
                Text = ncc.TenNCC
            }).ToList();
            viewModel.NhanVienList = db.NhanVien.Select(nv => new SelectListItem
            {
                Value = nv.TaiKhoanNV,
                Text = nv.TenNhanVien
            }).ToList();
            viewModel.NguyenLieuList = db.NguyenLieu.Select(nl => new SelectListItem
            {
                Value = nl.MaNguyenLieu.ToString(),
                Text = nl.TenNguyenLieu
            }).ToList();

            return View(viewModel);
        }
      
    }
}