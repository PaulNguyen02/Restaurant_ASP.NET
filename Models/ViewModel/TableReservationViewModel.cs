using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLyNhaHang.Models.ViewModel
{
    public class TableReservationViewModel
    {
        public List<TableReservation> tableReservations {  get; set; }
        public List<TableReservation> partyReservations { get; set; }
    }
}