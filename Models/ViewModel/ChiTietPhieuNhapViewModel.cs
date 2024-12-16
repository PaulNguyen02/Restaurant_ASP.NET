using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLyNhaHang.Models
{
    public class ChiTietPhieuNhapViewModel
    {
        public int MaNguyenLieu_id { get; set; }
        public double? SoLuongNhap { get; set; }
        public double GiaNhap { get; set; }
        public double? ThanhTien { get; set; }
        public virtual NguyenLieu NguyenLieu { get; set; }

        public virtual PhieuNhap PhieuNhap { get; set; }
        public int MaPhieuNhap_id { get; set; }
        public DateTime? HanSuDung { get; set; }
        public int? DaysLeft { get; set; }
    }
}