using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLyNhaHang.Models.ViewModel
{
    public class OrderFormRequest
    {
        public int SoNguoi { get; set; }
        public int MaBan { get; set; }
        public string Ngay { get; set; }
        public string ThoiGian { get; set; }
    }
}