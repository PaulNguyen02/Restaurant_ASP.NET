using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLyNhaHang.Models.ViewModel
{
    public class StorageStatisticViewModel
    {
        public double? so_nguyen_lieu_tra {  get; set; }
        public double? so_nguyen_lieu_xuat { get; set; }
        public double? so_chi_tiet_san_pham { get; set; }

        public List<Goods> nguyen_lieu_tra { get; set; }
        public List<Goods> nguyen_lieu_xuat { get; set; }

    }
}