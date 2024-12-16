namespace QuanLyNhaHang.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("CTPhieuGoiMon")]
    public partial class CTPhieuGoiMon
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int MaPhieuGoi { get; set; }

        [Key]
        [Column(Order = 1)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int MaMonAn { get; set; }

        [Required]
        public string TenMon { get; set; }

        public int SLMon { get; set; }

        public virtual MonAn MonAn { get; set; }

        public virtual PhieuGoiMon PhieuGoiMon { get; set; }
    }
}
