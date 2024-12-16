using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http.Cors;
using System.Web.Http;

namespace QuanLyNhaHang.App_Start
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            // Cho phép tất cả các domain truy cập API
            var cors = new EnableCorsAttribute("*", "*", "*"); // (origins, headers, methods)
            config.EnableCors(cors);

            // Các cấu hình khác của API
            config.MapHttpAttributeRoutes();

            // ...
        }
    }
}