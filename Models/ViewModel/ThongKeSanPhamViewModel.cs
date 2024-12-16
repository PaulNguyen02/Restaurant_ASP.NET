using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLyNhaHang.Models
{
    public class ThongKeSanPhamViewModel
    {
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public List<SanPhamThongKe> SanPhamThongKeList { get; set; } = new List<SanPhamThongKe>();
    }
    public class SanPhamThongKe
    {
        public string TenNguyenLieu { get; set; }
        public int SoLuongNhap { get; set; }
    }
}