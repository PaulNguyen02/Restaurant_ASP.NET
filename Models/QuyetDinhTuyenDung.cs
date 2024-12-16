namespace QuanLyNhaHang.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("QuyetDinhTuyenDung")]
    public partial class QuyetDinhTuyenDung
    {
        [Key]
        [Column(Order = 0)]
        public int SoQD { get; set; }

        public DateTime? NgayQD { get; set; }

        public int? TGThuViec { get; set; }

        public decimal? MucLuong { get; set; }

        public string NoiDung { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(50)]
        public string MaNV { get; set; }

        public int? MaPhongBan { get; set; }

        public virtual NhanVien NhanVien { get; set; }

        public virtual PhongBan PhongBan { get; set; }
    }
}
