namespace QuanLyNhaHang.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("LOAIKHUVUC")]
    public partial class LOAIKHUVUC
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public LOAIKHUVUC()
        {
            KHUVUC = new HashSet<KHUVUC>();
        }

        [Key]
        public int MaLoaiKhuVuc { get; set; }

        [Required]
        [StringLength(50)]
        public string TenLoaiKhuVuc { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<KHUVUC> KHUVUC { get; set; }
    }
}
