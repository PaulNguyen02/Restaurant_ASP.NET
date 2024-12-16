using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLyNhaHang.Models.ViewModel
{
    public class OrderRequest
    {
        public OrderFormRequest Form { get; set; }
        public List<OrderItem> Orders { get; set; }
        public float Deposit { get; set; }
    }
}