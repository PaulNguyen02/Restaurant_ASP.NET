using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QuanLyNhaHang.Models
{
    public class PhieuNhapViewModel
    {
        public int MaPhieuNhap { get; set; }
        public DateTime? NgayNhap { get; set; }
        public double? TongTien { get; set; }
        public string TaiKhoanNV_id { get; set; }
        public int? MaNCC_id { get; set; }
        public List<ChiTietPhieuNhapViewModel> ChiTietPhieuNhaps { get; set; }

        public IEnumerable<SelectListItem> NhaCungCapList { get; set; }
        public IEnumerable<SelectListItem> NhanVienList { get; set; }
        public IEnumerable<SelectListItem> NguyenLieuList { get; set; }
        public virtual NguyenLieu NguyenLieu { get; set; }
    }
}