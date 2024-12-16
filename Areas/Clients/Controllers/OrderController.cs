using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using QuanLyNhaHang.Models;
using QuanLyNhaHang.Models.MomoService;
using QuanLyNhaHang.Models.ViewModel;
using Twilio.Http;

namespace QuanLyNhaHang.Areas.Clients.Controllers
{
    public class OrderController : Controller
    {
        DataContext db = new DataContext();
        private readonly MomoService _momoService = new MomoService();
        public ActionResult Index()
        {
            var mon_an = db.MonAn
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
                   }).Where(m => m.Loai_id != 10 && m.Loai_id != 11)
             .ToList();
            var nuoc_uong = db.MonAn
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
                  }).Where(m => m.Loai_id == 10)
            .ToList();
            OrderDishes dishes = new OrderDishes();
            dishes.mon_an = mon_an;
            dishes.nuoc_uong = nuoc_uong;
            return View(dishes);
        }
        public ActionResult Cart() {
            var tables = db.Ban.ToList();
            return View(tables);
        }
        

        [HttpPost]
        public async Task<ActionResult> PartyReserve()
        {
            try
            {
                // Đọc dữ liệu JSON từ body của request
                string jsonData;
                using (var reader = new System.IO.StreamReader(Request.InputStream))
                {
                    jsonData = reader.ReadToEnd();
                }

                // Deserialize JSON thành đối tượng
                var request = JsonConvert.DeserializeObject<OrderRequest>(jsonData);

                if (request == null || request.Form == null || request.Orders == null || request.Orders.Count == 0)
                {
                    return Json(new { success = false, message = "Dữ liệu không hợp lệ hoặc không đầy đủ." });
                }
                foreach (var order in request.Orders)
                {
                    Console.WriteLine($"{order.Id}- {order.Name}: {order.Quantity} x {order.Price} đ");
                }
                DateTime date = DateTime.Parse(request.Form.Ngay);
                DateTime dateTime = DateTime.Parse(request.Form.ThoiGian); 
                TimeSpan time = dateTime.TimeOfDay; 
                

                var momoService = new MomoService();
                string orderId = Guid.NewGuid().ToString();  // Mã đơn hàng MoMo
                string amount = Convert.ToString(request.Deposit);
                var response = await _momoService.CreatePaymentRequest(orderId, amount);
                var jsonResponse = JObject.Parse(response);

                // Kiểm tra xem có lỗi không
                if (jsonResponse["errorCode"] != null && jsonResponse["errorCode"].ToString() == "0")
                {
                    string payUrl = jsonResponse["payUrl"]?.ToString();
                    if (!string.IsNullOrEmpty(payUrl))
                    {
                        CreatePayment(date, dateTime, time, request); //Lưu vào database
                        return Redirect(payUrl);
                    }
                    else
                    {
                        return Json(new { success = false, message = "URL thanh toán không tồn tại." });
                    }

                }
                else
                {
                    // Nếu có lỗi, trả về thông báo lỗi
                    return Json(new { success = false, message = jsonResponse["message"].ToString() });
                }


                return Redirect("Index");

            }
            catch (Exception ex)
            {
                // Trả lỗi trong trường hợp có lỗi
                return Json(new { success = false, message = "Đã xảy ra lỗi khi xử lý đơn hàng.", error = ex.Message });
            }
        }

        public void CreatePayment(DateTime date, DateTime dateTime, TimeSpan time, OrderRequest request) {
            if (Session["user_id"] != null)
            {
                var phieu_dat = new PHIEUDATBAN();
                phieu_dat.Ngaydat = date;
                phieu_dat.Thoigian = time;
                phieu_dat.MaKH = Convert.ToInt32(Session["user_id"]);
                db.PHIEUDATBAN.Add(phieu_dat);
                db.SaveChanges();

                int maPhieuDB = phieu_dat.MaPhieuDB;
                var chitietPhieudat = new CTPHIEUDATBAN
                {
                    MaBan = request.Form.MaBan,
                    MaPhieuDB = maPhieuDB,
                    SLNguoi = request.Form.SoNguoi,
                };

                db.CTPHIEUDATBAN.Add(chitietPhieudat);
                db.SaveChanges();

                var phieuGoiMon = new PhieuGoiMon();
                phieuGoiMon.NgayGoi = date;
                phieuGoiMon.MAKH = Convert.ToInt32(Session["user_id"]);
                db.PhieuGoiMon.Add(phieuGoiMon);
                db.SaveChanges();

                int maPhieuGoi = phieuGoiMon.MaPhieuGoi;
                var danhSachChiTiet = new List<CTPhieuGoiMon>();
                foreach (var item in request.Orders)
                {
                    var chitietPhieugoi = new CTPhieuGoiMon
                    {
                        MaPhieuGoi = maPhieuGoi,
                        MaMonAn = item.Id,
                        TenMon = item.Name,
                        SLMon = item.Quantity,
                    };
                    danhSachChiTiet.Add(chitietPhieugoi);
                }
                db.CTPhieuGoiMon.AddRange(danhSachChiTiet);
                db.SaveChanges();


                // Trả phản hồi thành công
                //return Json(new { success = true, message = "Đơn hàng đã thực hiện" });

            }
            else
            {
                TempData["LoginMessage"] = "Vui lòng đăng nhập trước khi thực hiện đặt chỗ.";
                //return Json(new { success = false, message = "Đã xảy ra lỗi khi xử lý đơn hàng.", error = ex.Message });
            }
        }

        [HttpGet]
        public ActionResult PaymentCallBack(string errorCode, string orderId, string amount, string transId, string message, string signature)
        {
            // Xác thực chữ ký
            string rawHash = $"partnerCode={ConfigurationManager.AppSettings["PartnerCode"]}&orderId={orderId}&amount={amount}&errorCode={errorCode}&message={message}&transId={transId}";
            string generatedSignature = GenerateSignature(rawHash);

            if (signature == generatedSignature)
            {
                if (errorCode == "0")
                {
                    // Giao dịch thành công
                    ViewBag.Message = "Thanh toán thành công!";
                }
                else
                {
                    // Giao dịch thất bại
                    ViewBag.Message = $"Lỗi: {message}";
                }
            }
            else
            {
                ViewBag.Message = "Chữ ký không hợp lệ.";
            }

            return View();
        }

        private string GenerateSignature(string data)
        {
            using (var hmac = new HMACSHA256(Encoding.UTF8.GetBytes(ConfigurationManager.AppSettings["SecretKey"])))
            {
                var hash = hmac.ComputeHash(Encoding.UTF8.GetBytes(data));
                return BitConverter.ToString(hash).Replace("-", "").ToLower();
            }
        }

        [HttpPost]
        public ActionResult MomoNotify()
        {
            var requestBody = new StreamReader(Request.InputStream).ReadToEnd();
            JObject jsonResponse = JObject.Parse(requestBody);

            // Ghi log hoặc xử lý trạng thái thanh toán (thành công/thất bại)
            if (jsonResponse["errorCode"] != null && jsonResponse["errorCode"].ToString() == "0")
            {
                // Thanh toán thành công
                return new HttpStatusCodeResult(200); // Trả về OK
            }
            else
            {
                // Thanh toán thất bại
                return new HttpStatusCodeResult(400); // Trả về lỗi
            }
        }
    }
}