using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLyNhaHang.Models.ViewModel
{
    public class TableReservation
    {
        public int Id { get; set; }
        public DateTime Date { get; set; }
        public TimeSpan Time { get; set; }
        public string CustomerName { get; set; }
        public int Table_id { get; set; }
        public int? People { get; set; }

        public string DishName { get; set; }
        public int DishQuantity { get; set; }

        public List<int> Tables_Id { get; set; }
        public List<DishModel> Dishes { get; set; }
    }
}