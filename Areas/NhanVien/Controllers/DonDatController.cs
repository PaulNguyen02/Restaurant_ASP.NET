using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QuanLyNhaHang.Models;
using QuanLyNhaHang.Models.ViewModel;
namespace QuanLyNhaHang.Areas.NhanVien.Controllers
{
    public class DonDatController : Controller
    {
        // GET: NhanVien/DonDat
        DataContext db = new DataContext();  
        public ActionResult Index()
        {
            var table_reserve = db.PHIEUDATBAN.Join(db.KhachHang,
                reserve => reserve.MaKH,
                customer => customer.MaKH,
                (reserve, customer) => new { reserve, customer }).Join(db.CTPHIEUDATBAN,
                    rc => rc.reserve.MaPhieuDB,
                    table => table.MaPhieuDB,
                    (rc, table) => new 
                    {
                        Id = rc.reserve.MaPhieuDB,
                        Date = rc.reserve.Ngaydat,
                        Time = rc.reserve.Thoigian,
                        CustomerName = rc.customer.TenKH,
                        Table_id = table.MaBan,
                        People = table.SLNguoi
                    }).GroupBy(r => new
                    {
                        r.Id, // Nhóm theo mã phiếu đặt bàn
                        r.Date,
                        r.Time,
                        r.CustomerName,
                    })
                    .Select(group => new TableReservation
                    {
                        Id = group.Key.Id,
                        Date = group.Key.Date,
                        Time = group.Key.Time,
                        CustomerName = group.Key.CustomerName,
                        Tables_Id = group.Select(g => g.Table_id).Distinct().ToList()
                    }).ToList(); 
            
            var party_reserve = db.PHIEUDATBAN
                .Join(db.KhachHang,
                    reserve => reserve.MaKH,
                    customer => customer.MaKH,
                    (reserve, customer) => new { reserve, customer })
                .Join(db.CTPHIEUDATBAN,
                    rc => rc.reserve.MaPhieuDB,
                    table => table.MaPhieuDB,
                    (rc, table) => new { rc.reserve, rc.customer, table })
                .Join(db.PhieuGoiMon,
                    rct => rct.reserve.MaPhieuDB,
                    phieuGoiMon => phieuGoiMon.MaPhieuGoi,
                    (rct, phieuGoiMon) => new { rct.reserve, rct.customer, rct.table, phieuGoiMon })
                .Join(db.CTPhieuGoiMon,
                    rctp => rctp.phieuGoiMon.MaPhieuGoi,
                    ctPhieuGoiMon => ctPhieuGoiMon.MaPhieuGoi,
                    (rctp, ctPhieuGoiMon) => new 
                    {
                        Id = rctp.reserve.MaPhieuDB,
                        Date = rctp.reserve.Ngaydat,
                        Time = rctp.reserve.Thoigian,
                        CustomerName = rctp.customer.TenKH,
                        Table_id = rctp.table.MaBan,
                        People = rctp.table.SLNguoi,
                        OrderDate = rctp.phieuGoiMon.NgayGoi,
                        DishName = ctPhieuGoiMon.TenMon,
                        DishQuantity = ctPhieuGoiMon.SLMon
                    })
                    .GroupBy(r => new
                     {
                         r.Id,
                         r.Date,
                         r.Time,
                         r.CustomerName,
                         r.People,                      
                     })
                    .Select(group => new TableReservation
                    {
                        Id = group.Key.Id,
                        Date = group.Key.Date,
                        Time = group.Key.Time,
                        People = group.Key.People,
                        CustomerName = group.Key.CustomerName,
                        Tables_Id = group.Select(g => g.Table_id).Distinct().ToList(), // Danh sách bàn (độc nhất)
                        Dishes = group.Select(g => new DishModel
                        {
                            DishName = g.DishName,
                            DishQuantity = g.DishQuantity
                        }).ToList()
                    }).ToList();
            TableReservationViewModel tb = new TableReservationViewModel
            {
                tableReservations = table_reserve,
                partyReservations = party_reserve,
            };
            return View(tb);
        }
    }
}