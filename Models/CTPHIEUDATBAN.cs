namespace QuanLyNhaHang.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("CTPHIEUDATBAN")]
    public partial class CTPHIEUDATBAN
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int MaBan { get; set; }

        [Key]
        [Column(Order = 1)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int MaPhieuDB { get; set; }

        public int? SLNguoi { get; set; }

        public virtual Ban Ban { get; set; }

        public virtual PHIEUDATBAN PHIEUDATBAN { get; set; }
    }
}
