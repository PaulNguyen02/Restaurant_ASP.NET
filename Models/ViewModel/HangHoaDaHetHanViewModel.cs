using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLyNhaHang.Models
{
    public class HangHoaDaHetHanViewModel
    {
        public int MaNguyenLieu { get; set; }
        public string TenNguyenLieu { get; set; }
        public int MaPhieuNhap { get; set; }
        public DateTime NgayNhap { get; set; }
        public DateTime HanSuDung { get; set; }
    }
}