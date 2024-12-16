using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
namespace QuanLyNhaHang.Models.ViewModel
{
    public class OrderDishes
    {
        public List<ItemViewModel> mon_an { get; set; }
        public List<ItemViewModel> nuoc_uong { get; set; }

        public List<Ban> ban { get; set; }
    }
}