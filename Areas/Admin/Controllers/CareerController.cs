using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Newtonsoft.Json;
using QuanLyNhaHang.Models;
using QuanLyNhaHang.Models.ViewModel;
namespace QuanLyNhaHang.Areas.Admin.Controllers
{
    public class CareerController : Controller
    {
        DataContext db = new DataContext();
        // GET: Admin/Career
        public ActionResult Index()
        {
            var cadidates = db.TuyenDung.ToList();
            return View(cadidates);
        }

        [HttpPost]
        public ActionResult Approve() {
            try
            {
                string jsonString;
                using (var reader = new System.IO.StreamReader(Request.InputStream))
                {
                    jsonString = reader.ReadToEnd();
                }
                // Deserialize JSON thành object
                var request = JsonConvert.DeserializeObject<Approve>(jsonString);
                // Kiểm tra dữ liệu đầu vào
                if (request == null || request.id <= 0)
                {
                    return Json(new { success = false, message = "Dữ liệu không hợp lệ." });
                }
                var candidate = db.TuyenDung.Where(td => td.STT == request.id).SingleOrDefault();
                candidate.Duyet = request.approved;
                db.SaveChanges();
                return Json(new { success = true, message = "Cập nhật thành công!" });
            }
            catch (Exception ex)
            {
                // Xử lý lỗi và trả về thông báo
                return Json(new { success = false, message = "Đã xảy ra lỗi.", error = ex.Message });
            }
        }
    }
}