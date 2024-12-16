using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLyNhaHang.Models.ViewModel
{
    public class AdminRating
    {
        public List<MonAn> dishes {  get; set; }
        public List<KHUVUC> lounge { get; set; }

        public List<NhanVien> staffs { get; set; }
    }
}