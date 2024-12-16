namespace QuanLyNhaHang.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TuyenDung")]
    public partial class TuyenDung
    {
        [Key]
        public int STT { get; set; }

        [Required]
        public string Hoten { get; set; }

        public DateTime NgaySinh { get; set; }

        [Required]
        public string DiaChi { get; set; }

        [Required]
        [StringLength(10)]
        public string SDT { get; set; }

        [Required]
        public string Vitri { get; set; }

        public DateTime NgayNopDon { get; set; }

        public bool? Duyet { get; set; }
    }
}
