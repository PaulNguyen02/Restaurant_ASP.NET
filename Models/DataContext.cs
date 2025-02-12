using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace QuanLyNhaHang.Models
{
    public partial class DataContext : DbContext
    {
        public DataContext()
            : base("name=DatabaseQuanLyNhaHang")
        {
        }

        public virtual DbSet<Ban> Ban { get; set; }
        public virtual DbSet<BangChamCong> BangChamCong { get; set; }
        public virtual DbSet<CTBangChamCong> CTBangChamCong { get; set; }
        public virtual DbSet<CTPHIEUDATBAN> CTPHIEUDATBAN { get; set; }
        public virtual DbSet<CTPhieuGoiMon> CTPhieuGoiMon { get; set; }
        public virtual DbSet<ChiTietHoaDon> ChiTietHoaDon { get; set; }
        public virtual DbSet<ChiTietPhieuNhap> ChiTietPhieuNhap { get; set; }
        public virtual DbSet<ChiTietSanPham> ChiTietSanPham { get; set; }
        public virtual DbSet<HoaDon> HoaDon { get; set; }
        public virtual DbSet<HoanTra> HoanTra { get; set; }
        public virtual DbSet<KhachHang> KhachHang { get; set; }
        public virtual DbSet<KHUVUC> KHUVUC { get; set; }
        public virtual DbSet<LichSuGoiMon> LichSuGoiMon { get; set; }
        public virtual DbSet<LOAIKHUVUC> LOAIKHUVUC { get; set; }
        public virtual DbSet<LoaiMonAn> LoaiMonAn { get; set; }
        public virtual DbSet<LoaiNguyenLieu> LoaiNguyenLieu { get; set; }
        public virtual DbSet<MonAn> MonAn { get; set; }
        public virtual DbSet<NguyenLieu> NguyenLieu { get; set; }
        public virtual DbSet<NguyenLieuTra> NguyenLieuTra { get; set; }
        public virtual DbSet<NguyenLieuXuat> NguyenLieuXuat { get; set; }
        public virtual DbSet<NhaCC> NhaCC { get; set; }
        public virtual DbSet<NhanVien> NhanVien { get; set; }
        public virtual DbSet<NhomMonAn> NhomMonAn { get; set; }
        public virtual DbSet<PHIEUDATBAN> PHIEUDATBAN { get; set; }
        public virtual DbSet<PhieuGoiMon> PhieuGoiMon { get; set; }
        public virtual DbSet<PhieuNhap> PhieuNhap { get; set; }
        public virtual DbSet<PhongBan> PhongBan { get; set; }
        public virtual DbSet<Quyen> Quyen { get; set; }
        public virtual DbSet<QuyetDinhTuyenDung> QuyetDinhTuyenDung { get; set; }
        public virtual DbSet<Tang> Tang { get; set; }
        public virtual DbSet<TuyenDung> TuyenDung { get; set; }
        public virtual DbSet<XuatKho> XuatKho { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Ban>()
                .HasMany(e => e.CTPHIEUDATBAN)
                .WithRequired(e => e.Ban)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Ban>()
                .HasMany(e => e.HoaDon)
                .WithOptional(e => e.Ban)
                .HasForeignKey(e => e.MaBan_id);

            modelBuilder.Entity<BangChamCong>()
                .HasMany(e => e.CTBangChamCong)
                .WithRequired(e => e.BangChamCong)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<CTBangChamCong>()
                .Property(e => e.MANV)
                .IsUnicode(false);

            modelBuilder.Entity<HoaDon>()
                .Property(e => e.SDTKhachHang)
                .IsUnicode(false);

            modelBuilder.Entity<HoaDon>()
                .Property(e => e.Code)
                .IsUnicode(false);

            modelBuilder.Entity<HoaDon>()
                .HasMany(e => e.ChiTietHoaDon)
                .WithRequired(e => e.HoaDon)
                .HasForeignKey(e => e.MaHoaDon_id)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<HoaDon>()
                .HasMany(e => e.LichSuGoiMon)
                .WithOptional(e => e.HoaDon)
                .HasForeignKey(e => e.MaHoaDon_id);

            modelBuilder.Entity<HoanTra>()
                .HasMany(e => e.NguyenLieuTra)
                .WithRequired(e => e.HoanTra)
                .HasForeignKey(e => e.MaHoanTra_id)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<KhachHang>()
                .Property(e => e.SDT)
                .IsUnicode(false);

            modelBuilder.Entity<KhachHang>()
                .Property(e => e.Username)
                .IsUnicode(false);

            modelBuilder.Entity<KhachHang>()
                .Property(e => e.Password)
                .IsUnicode(false);

            modelBuilder.Entity<KhachHang>()
                .HasMany(e => e.PhieuGoiMon)
                .WithRequired(e => e.KhachHang)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<KHUVUC>()
                .HasMany(e => e.Ban)
                .WithRequired(e => e.KHUVUC)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<LOAIKHUVUC>()
                .HasMany(e => e.KHUVUC)
                .WithRequired(e => e.LOAIKHUVUC)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<LoaiMonAn>()
                .HasMany(e => e.MonAn)
                .WithOptional(e => e.LoaiMonAn)
                .HasForeignKey(e => e.MaLMA_id);

            modelBuilder.Entity<LoaiNguyenLieu>()
                .HasMany(e => e.NguyenLieu)
                .WithOptional(e => e.LoaiNguyenLieu)
                .HasForeignKey(e => e.MaLNL_id);

            modelBuilder.Entity<MonAn>()
                .HasMany(e => e.CTPhieuGoiMon)
                .WithRequired(e => e.MonAn)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<MonAn>()
                .HasMany(e => e.ChiTietHoaDon)
                .WithRequired(e => e.MonAn)
                .HasForeignKey(e => e.MaMonAn_id)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<MonAn>()
                .HasMany(e => e.ChiTietSanPham)
                .WithRequired(e => e.MonAn)
                .HasForeignKey(e => e.MaMonAn_id)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<MonAn>()
                .HasMany(e => e.LichSuGoiMon)
                .WithOptional(e => e.MonAn)
                .HasForeignKey(e => e.MaMonAn_id);

            modelBuilder.Entity<NguyenLieu>()
                .HasMany(e => e.ChiTietPhieuNhap)
                .WithRequired(e => e.NguyenLieu)
                .HasForeignKey(e => e.MaNguyenLieu_id)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<NguyenLieu>()
                .HasMany(e => e.ChiTietSanPham)
                .WithRequired(e => e.NguyenLieu)
                .HasForeignKey(e => e.MaNguyenLieu_id)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<NguyenLieu>()
                .HasMany(e => e.NguyenLieuTra)
                .WithRequired(e => e.NguyenLieu)
                .HasForeignKey(e => e.MaNguyenLieu_id)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<NguyenLieu>()
                .HasMany(e => e.NguyenLieuXuat)
                .WithRequired(e => e.NguyenLieu)
                .HasForeignKey(e => e.MaNguyenLieu_id)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<NhaCC>()
                .Property(e => e.SoDienThoai)
                .IsUnicode(false);

            modelBuilder.Entity<NhaCC>()
                .HasMany(e => e.PhieuNhap)
                .WithOptional(e => e.NhaCC)
                .HasForeignKey(e => e.MaNCC_id);

            modelBuilder.Entity<NhanVien>()
                .Property(e => e.MANV)
                .IsUnicode(false);

            modelBuilder.Entity<NhanVien>()
                .Property(e => e.TaiKhoanNV)
                .IsUnicode(false);

            modelBuilder.Entity<NhanVien>()
                .Property(e => e.MatKhauNV)
                .IsUnicode(false);

            modelBuilder.Entity<NhanVien>()
                .Property(e => e.SoDienThoai)
                .IsUnicode(false);

            modelBuilder.Entity<NhanVien>()
                .HasMany(e => e.CTBangChamCong)
                .WithRequired(e => e.NhanVien)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<NhanVien>()
                .HasMany(e => e.QuyetDinhTuyenDung)
                .WithRequired(e => e.NhanVien)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<NhomMonAn>()
                .HasMany(e => e.MonAn)
                .WithOptional(e => e.NhomMonAn)
                .HasForeignKey(e => e.MaNMA_id);

            modelBuilder.Entity<PHIEUDATBAN>()
                .HasMany(e => e.CTPHIEUDATBAN)
                .WithRequired(e => e.PHIEUDATBAN)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<PhieuGoiMon>()
                .HasMany(e => e.CTPhieuGoiMon)
                .WithRequired(e => e.PhieuGoiMon)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<PhieuNhap>()
                .Property(e => e.MANV)
                .IsUnicode(false);

            modelBuilder.Entity<PhieuNhap>()
                .HasMany(e => e.ChiTietPhieuNhap)
                .WithRequired(e => e.PhieuNhap)
                .HasForeignKey(e => e.MaPhieuNhap_id)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<PhongBan>()
                .Property(e => e.SDT)
                .IsUnicode(false);

            modelBuilder.Entity<Quyen>()
                .HasMany(e => e.NhanVien)
                .WithOptional(e => e.Quyen)
                .HasForeignKey(e => e.MaQuyen_id);

            modelBuilder.Entity<QuyetDinhTuyenDung>()
                .Property(e => e.MucLuong)
                .HasPrecision(18, 0);

            modelBuilder.Entity<QuyetDinhTuyenDung>()
                .Property(e => e.MaNV)
                .IsUnicode(false);

            modelBuilder.Entity<Tang>()
                .HasMany(e => e.Ban)
                .WithOptional(e => e.Tang)
                .HasForeignKey(e => e.MaTang_id);

            modelBuilder.Entity<TuyenDung>()
                .Property(e => e.SDT)
                .IsUnicode(false);

            modelBuilder.Entity<XuatKho>()
                .HasMany(e => e.NguyenLieuXuat)
                .WithRequired(e => e.XuatKho)
                .HasForeignKey(e => e.MaXuatKho_id)
                .WillCascadeOnDelete(false);
        }
    }
}
