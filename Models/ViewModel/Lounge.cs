using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLyNhaHang.Models.ViewModel
{
    public class Lounge
    {
        public int MaKhuVuc {  get; set; }
        public string TenKhuVuc { get; set; }

        public int? DanhGia { get; set; }
        public int MaTang {  get; set; }
        public string TenTang {  get; set; }

        public int MaLoaiKhuVuc { get; set; }
        public string TenLoaiKhuVuc { get; set; }

    }
}