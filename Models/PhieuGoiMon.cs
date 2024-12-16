namespace QuanLyNhaHang.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("PhieuGoiMon")]
    public partial class PhieuGoiMon
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public PhieuGoiMon()
        {
            CTPhieuGoiMon = new HashSet<CTPhieuGoiMon>();
        }

        [Key]
        public int MaPhieuGoi { get; set; }

        [Column(TypeName = "date")]
        public DateTime NgayGoi { get; set; }

        public int MAKH { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CTPhieuGoiMon> CTPhieuGoiMon { get; set; }

        public virtual KhachHang KhachHang { get; set; }
    }
}
