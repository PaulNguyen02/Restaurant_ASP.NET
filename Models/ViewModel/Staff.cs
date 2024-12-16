using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLyNhaHang.Models.ViewModel
{
    public class Staff
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public string Quyen {  get; set; }
        public int? Danhgia { get; set; }
    }
}