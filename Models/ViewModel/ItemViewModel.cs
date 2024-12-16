using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLyNhaHang.Models.ViewModel
{
    public class ItemViewModel
    {
        public int Id { get; set; }
        public string name { get; set; }
        public string picture { get; set; }
        public string info { get; set; }
        public double? price { get; set; }

        public int? rating { get; set; }
        public int? Loai_id { get; set; }
    }
}