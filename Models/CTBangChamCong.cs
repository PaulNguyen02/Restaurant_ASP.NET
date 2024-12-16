namespace QuanLyNhaHang.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("CTBangChamCong")]
    public partial class CTBangChamCong
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(50)]
        public string MANV { get; set; }

        [Key]
        [Column(Order = 1)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int MaCC { get; set; }

        public int? SoGio { get; set; }

        public virtual BangChamCong BangChamCong { get; set; }

        public virtual NhanVien NhanVien { get; set; }
    }
}
