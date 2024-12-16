﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLyNhaHang.Models.ViewModel
{
    public class OrderItem
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int Quantity { get; set; }
        public decimal Price { get; set; }
    }
}