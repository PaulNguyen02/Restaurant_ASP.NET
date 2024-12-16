using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLyNhaHang.Models
{
    public class HangHoaSapHetHanViewModel
    {
        public DateTime CurrentDate { get; set; }
        public DateTime EndDate { get; set; }
        public List<HangHoaHetHan> HangHoaHetHanList { get; set; } = new List<HangHoaHetHan>();
    }
    public class HangHoaHetHan
    {
        public string TenNguyenLieu { get; set; }
        public DateTime HanSuDung { get; set; }
        public DateTime NgayNhap { get; set; }
        public int SoNgayConLai { get; set; }
    }
}