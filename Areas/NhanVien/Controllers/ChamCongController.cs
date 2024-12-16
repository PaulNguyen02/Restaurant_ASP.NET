using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using QRCoder;
using QuanLyNhaHang.Models;

namespace QuanLyNhaHang.Areas.NhanVien.Controllers
{
    public class ChamCongController : Controller
    {
        DataContext db = new DataContext();
        public ActionResult Index() { //Hiển thị View chứa QR
            var nhan_vien = (QuanLyNhaHang.Models.NhanVien)Session["TaiKhoanNV"];
            string employeeId;
            if (nhan_vien != null) {
                employeeId = nhan_vien.MANV;
                string qrCodeUrl = Url.Action("GenerateQR", "ChamCong", new { employeeId = employeeId });

                ViewBag.QRCodeUrl = qrCodeUrl;
            }
            
            return View();
        }
        public ActionResult IndexKho() {
            var nhan_vien_kho = (QuanLyNhaHang.Models.NhanVien)Session["TaiKhoanKho"];
            string employeeId;
            if (nhan_vien_kho != null)
            {
                employeeId = nhan_vien_kho.MANV;
                string qrCodeUrl = Url.Action("GenerateQR", "ChamCong", new { employeeId = employeeId });

                ViewBag.QRCodeUrl = qrCodeUrl;
            }
            return View();
        }
        // GET: NhanVien/ChamCong
        public ActionResult GenerateQR(string employeeId)
        {
            if (string.IsNullOrEmpty(employeeId))
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest, "EmployeeId is required");
            }

            string url = Url.Action("ConfirmAttendance", "ChamCong", new { employeeId = employeeId }, Request.Url.Scheme);

            using (var qrGenerator = new QRCodeGenerator())
            {
                var qrCodeData = qrGenerator.CreateQrCode(url, QRCodeGenerator.ECCLevel.Q);
                using (var qrCode = new QRCode(qrCodeData))
                {
                    using (var qrCodeImage = qrCode.GetGraphic(20))
                    {
                        using (var ms = new MemoryStream())
                        {
                            qrCodeImage.Save(ms, System.Drawing.Imaging.ImageFormat.Png);
                            ms.Seek(0, SeekOrigin.Begin);
                            return File(ms.ToArray(), "image/png");
                        }
                    }
                }
            }
        }
        public ActionResult ConfirmAttendance(string employeeId)
        {
            if (string.IsNullOrEmpty(employeeId))
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest, "EmployeeId is required");
            }

            ViewBag.EmployeeId = employeeId; // Truyền employeeId sang View
            return View();
        }
        [HttpPost]
        public JsonResult ScanQR(string employeeId)
        {
            int Manv = int.Parse(employeeId);
            DateTime thoigianvaoca = DateTime.Now;
            var bangChamCong = db.BangChamCong
                                 .FirstOrDefault(b => thoigianvaoca >= b.TuNgay && thoigianvaoca <= b.DenNgay);
            if (bangChamCong == null)
            {
                return Json(new { success = false, message = "Không có bảng chấm công hiện tại." });
            }
            var chiTiet = db.CTBangChamCong.FirstOrDefault(ct => ct.MANV == employeeId && ct.MaCC == bangChamCong.MaCC);
            if (chiTiet == null)
            {
                // Nếu chưa có bản ghi, tạo mới (Check-in)
                var newDetail = new CTBangChamCong
                {
                    MANV = employeeId,
                    MaCC = bangChamCong.MaCC,
                    SoGio = 0 // Mặc định số giờ là 0
                };

                db.CTBangChamCong.Add(newDetail);
                db.SaveChanges();

                return Json(new { success = true, message = "Check-in thành công." });
            }
            else
            {
                // Nếu đã có bản ghi, cập nhật (Check-out)
                TimeSpan soGioLam = (TimeSpan)(thoigianvaoca - bangChamCong.TuNgay);
                chiTiet.SoGio += (int)soGioLam.TotalHours;

                db.SaveChanges();
                return Json(new { success = true, message = "Check-out thành công." });
            }
        }
    }
}