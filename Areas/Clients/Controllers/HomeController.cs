using QuanLyNhaHang.Models;
using QuanLyNhaHang.Models.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace QuanLyNhaHang.Areas.Clients.Controllers
{
    public class HomeController : Controller
    {
        // GET: Clients/Home
        DataContext db = new DataContext();
        public ActionResult Index()
        {
            var items = db.MonAn
              .Join(db.LoaiMonAn,
                    monAn => monAn.MaLMA_id,
                    loai => loai.MaLMA,
                    (monAn, loai) => new ItemViewModel
                    {
                        Id = monAn.MaMonAn,
                        name = monAn.TenMonAn,
                        picture = monAn.HinhAnh,
                        info = monAn.ThongTin,
                        price = monAn.DonGia,
                        rating = monAn.DanhGia,
                        Loai_id = monAn.MaLMA_id,
                    }).Where(m => m.Loai_id != 10 && m.Loai_id != 11 && m.rating > 4).Take(6)
              .ToList();
            var table = db.Ban.ToList();
            OrderDishes od = new OrderDishes();
            od.mon_an = items;
            od.ban = table;
            return View(od);
        }
        public ActionResult Contact() {
            return View();       
        }
        [HttpPost]
        public ActionResult Signin(FormCollection fr) {
            string usr_name = fr["username"];
            string pass = fr["password"];
            var user = db.KhachHang.Where(c => c.Username == usr_name && c.Password == pass).SingleOrDefault();
            if (user == null)
            {
                return RedirectToAction("Signup");
            }
            else {
                Session["user_id"] = user.MaKH;
                Session["user_name"] = user.TenKH;             
                return RedirectToAction("Index");
            }
        }

        public ActionResult Signup() {
            return View();
        }
        [HttpPost]
        public ActionResult Signup(FormCollection fr)
        {
            string name = fr["name"];
            string address = fr["address"];
            string phone = fr["phone"];
            string username = fr["username"];
            string password = fr["password"];
            //string pass = ComputeSha256Hash(password);
            var customer = new KhachHang
            {
                TenKH = name,
                DiaChi = address,
                SDT = phone,
                Username = username,
                Password = password
            };
            db.KhachHang.Add(customer);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        [HttpPost]
        public ActionResult Reserve(FormCollection fr)
        {
            int nguoi = int.Parse(fr["number"]);
            int maban = int.Parse(fr["selected_table"]);
            DateTime date = DateTime.Parse(fr["date"]);
            string selected_time = fr["time"];
            DateTime dateTime = DateTime.Parse(selected_time); // Chuyển thành DateTime
            TimeSpan time = dateTime.TimeOfDay; // Lấy TimeSpan từ DateTime
            if (Session["user_id"] == null)
            {
                TempData["LoginMessage"] = "Vui lòng đăng nhập trước khi thực hiện đặt chỗ.";
                return RedirectToAction("Index");
            }
            else
            {
                var Phieudat = new PHIEUDATBAN
                {
                    Ngaydat = date,
                    Thoigian = time,
                    MaKH = Convert.ToInt32(Session["user_id"])
                };
                db.PHIEUDATBAN.Add(Phieudat);
                db.SaveChanges();
                int maPhieuDB = Phieudat.MaPhieuDB;
                var chitietPhieudat = new CTPHIEUDATBAN
                {
                    MaBan = maban,
                    MaPhieuDB = maPhieuDB,
                    SLNguoi = nguoi,
                };

                db.CTPHIEUDATBAN.Add(chitietPhieudat);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
        }
    }
}