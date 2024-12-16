namespace QuanLyNhaHang.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("PHIEUDATBAN")]
    public partial class PHIEUDATBAN
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public PHIEUDATBAN()
        {
            CTPHIEUDATBAN = new HashSet<CTPHIEUDATBAN>();
        }

        [Key]
        public int MaPhieuDB { get; set; }

        [Column(TypeName = "date")]
        public DateTime Ngaydat { get; set; }

        public TimeSpan Thoigian { get; set; }

        public int? MaKH { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CTPHIEUDATBAN> CTPHIEUDATBAN { get; set; }

        public virtual KhachHang KhachHang { get; set; }
    }
}
