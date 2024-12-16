namespace QuanLyNhaHang.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("KHUVUC")]
    public partial class KHUVUC
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public KHUVUC()
        {
            Ban = new HashSet<Ban>();
        }

        [Key]
        public int MaKhuVuc { get; set; }

        [Required]
        [StringLength(50)]
        public string TenKhuVuc { get; set; }

        public int? MaTang { get; set; }

        public int MaLoaiKhuVuc { get; set; }

        public int? DanhGia { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Ban> Ban { get; set; }

        public virtual LOAIKHUVUC LOAIKHUVUC { get; set; }

        public virtual Tang Tang { get; set; }
    }
}
