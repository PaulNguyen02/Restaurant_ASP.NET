using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLyNhaHang.Models
{
    public class NguyenLieuViewModel
    {
        public int MaNguyenLieu { get; set; }
        public string TenNguyenLieu { get; set; }
        public double? SoLuongHienCon { get; set; }
        public string GhiChu { get; set; }
        public double GiaNhapCuoi { get; set; }
        public string TenLoaiNguyenLieu { get; set; }
        public DateTime? HanSuDung { get; set; }
        public DateTime NgayNhap { get; set; } // Ngày nhập hàng
        public DateTime HanSuDungMacDinh { get; set; } // Hạn sử dụng mặc định
        public int SoNgayHanSuDung { get; set; } // Số ngày hạn sử dụng
        public virtual ICollection<PhieuNhap> PhieuNhaps { get; set; }
    }
}