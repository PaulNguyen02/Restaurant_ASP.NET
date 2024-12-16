using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Security.Cryptography;
using System.Security.Cryptography.Xml;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using Newtonsoft.Json;

namespace QuanLyNhaHang.Models.MomoService
{
    public class MomoService
    {
        private readonly string _momoApiUrl = ConfigurationManager.AppSettings["MomoApiUrl"];
        private readonly string _partnerCode = ConfigurationManager.AppSettings["PartnerCode"];
        private readonly string _accessKey = ConfigurationManager.AppSettings["AccessKey"];
        private readonly string _secretKey = ConfigurationManager.AppSettings["SecretKey"];
        private readonly string _returnUrl = ConfigurationManager.AppSettings["ReturnUrl"];
        private readonly string _notifyUrl = ConfigurationManager.AppSettings["NotifyUrl"];
        private readonly string _requestType = ConfigurationManager.AppSettings["RequestType"];

        public async Task<string> CreatePaymentRequest(string orderId, string amount, string orderInfo = "Thanh toán đơn đặt MoMo")
        {
            var client = new HttpClient();
            string requestId = Guid.NewGuid().ToString();
            string extraData = "Thanh toán đơn hàng";
            client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
            string rawData =
             $"partnerCode={_partnerCode}" +
             $"&accessKey={_accessKey}" +
             $"&requestId={requestId}" +
             $"&amount={amount}" +
             $"&orderId={orderId}" +
             $"&orderInfo={orderInfo}" +
             $"&returnUrl={_returnUrl}" +
             $"&notifyUrl={_notifyUrl}" +
             $"&extraData={extraData}";

            string signature = ComputeHmacSha256(rawData, _secretKey);
            var payload = new
            {
                partnerCode = _partnerCode,
                accessKey = _accessKey,
                requestId = requestId,
                amount = amount,
                orderId = orderId,
                orderInfo = orderInfo,
                returnUrl = _returnUrl,
                notifyUrl = _notifyUrl,
                requestType = _requestType,
                signature = signature,
                extraData = extraData
            };

            var content = new StringContent(JsonConvert.SerializeObject(payload), Encoding.UTF8, "application/json");

            var response = client.PostAsync(_momoApiUrl, content).Result;

            if (response.IsSuccessStatusCode)
            {
                var responseContent = response.Content.ReadAsStringAsync().Result;
                return responseContent;
            }
            else
            {
                return null;
            }
        }

        private string ComputeHmacSha256(string message, string secretKey)
        {
            var keyBytes = Encoding.UTF8.GetBytes(secretKey);
            var messageBytes = Encoding.UTF8.GetBytes(message);

            byte[] hashBytes;

            using (var hmac = new HMACSHA256(keyBytes))
            {
                hashBytes = hmac.ComputeHash(messageBytes);
            }

            var hashString = BitConverter.ToString(hashBytes).Replace("-", "").ToLower();

            return hashString;
        }
    }

}
