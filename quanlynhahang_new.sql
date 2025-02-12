USE [master]
GO
/****** Object:  Database [NhaHang]    Script Date: 04/16/2024 08:42:23 ******/
CREATE DATABASE [NhaHang]
GO
USE [NhaHang]
GO
ALTER DATABASE [NhaHang] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NhaHang].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NhaHang] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NhaHang] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NhaHang] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NhaHang] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NhaHang] SET ARITHABORT OFF 
GO
ALTER DATABASE [NhaHang] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NhaHang] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NhaHang] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NhaHang] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NhaHang] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NhaHang] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NhaHang] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NhaHang] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NhaHang] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NhaHang] SET  DISABLE_BROKER 
GO
ALTER DATABASE [NhaHang] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NhaHang] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NhaHang] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NhaHang] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NhaHang] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NhaHang] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NhaHang] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NhaHang] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [NhaHang] SET  MULTI_USER 
GO
ALTER DATABASE [NhaHang] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NhaHang] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NhaHang] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NhaHang] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [NhaHang] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [NhaHang] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'NhaHang', N'ON'
GO
ALTER DATABASE [NhaHang] SET QUERY_STORE = OFF
GO
USE [NhaHang]
GO
/****** Object:  Table [dbo].[Ban]    Script Date: 04/16/2024 08:42:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[LOAIKHUVUC](
	[MaLoaiKhuVuc] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiKhuVuc] [nvarchar](50) NOT NULL,
	
PRIMARY KEY CLUSTERED 
(
	[MaLoaiKhuVuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[KHUVUC](
	[MaKhuVuc] [int] IDENTITY(1,1) NOT NULL,
	[TenKhuVuc] [nvarchar](50) NOT NULL,
	[MaTang] [int],
	[MaLoaiKhuVuc] [int] NOT NULL,
	[DanhGia] [int] NULL
PRIMARY KEY CLUSTERED 
(
	[MaKhuVuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[Ban](
	[MaBan] [int] IDENTITY(1,1) NOT NULL,
	[TenBan] [nvarchar](50) NOT NULL,
	[SoGhe] [int] NOT NULL,
	[Vip] [int] NULL,
	[TinhTrang] [int] NULL,
	[MaKhuVuc] [int] NOT NULL,
	[MaTang_id] [int] 
PRIMARY KEY CLUSTERED 
(
	[MaBan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[TenKH] [nvarchar](50) NOT NULL,
	[DiaChi] [nvarchar](MAX) NOT NULL,
	[SDT] [varchar](15) NOT NULL,
	[Username] [varchar] (15) NOT NULL,
	[Password] [varchar] (15)
PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[PHIEUDATBAN](
	[MaPhieuDB] [int] IDENTITY(1,1) NOT NULL,
	[Ngaydat] [Date] NOT NULL,
	[Thoigian] [Time] NOT NULL,
	[MaKH] [int],
PRIMARY KEY CLUSTERED 
(
	[MaPhieuDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[CTPHIEUDATBAN](
    [MaBan] [int] NOT NULL,
    [MaPhieuDB] [int] NOT NULL,
    [SLNguoi] [int],
    PRIMARY KEY CLUSTERED 
    (
        [MaBan], [MaPhieuDB]  -- Chỉ định cả hai cột làm khóa chính
    ) WITH (
        PAD_INDEX = OFF, 
        STATISTICS_NORECOMPUTE = OFF, 
        IGNORE_DUP_KEY = OFF, 
        ALLOW_ROW_LOCKS = ON, 
        ALLOW_PAGE_LOCKS = ON, 
        OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
    ) ON [PRIMARY]
) ON [PRIMARY];
GO

CREATE TABLE [dbo].[PhieuGoiMon](
	[MaPhieuGoi] [int] IDENTITY(1,1) NOT NULL,
	[NgayGoi] [date] NOT NULL,
	[MAKH] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPhieuGoi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[MonAn](
	[MaMonAn] [int] IDENTITY(1,1) NOT NULL,
	[TenMonAn] [nvarchar](255) NOT NULL,
	[HinhAnh] [nvarchar](MAX) NULL,
	[DonGia] [float] NULL,
	[NgayCapNhat] [date] NULL,
	[ThongTin] [nvarchar](max) NULL,
	[MoTa] [nvarchar](max) NULL,
	[SoLuongDaBan] [int] NULL,
	[MaNMA_id] [int] NULL,
	[MaLMA_id] [int] NULL,
	[DanhGia]  [int]
PRIMARY KEY CLUSTERED 
(
	[MaMonAn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE TABLE [dbo].[CTPhieuGoiMon](
    [MaPhieuGoi] [int] NOT NULL,
    [MaMonAn] [int] NOT NULL,
    [TenMon] [nvarchar](MAX) NOT NULL,
    [SLMon] [int] NOT NULL,
    PRIMARY KEY CLUSTERED 
    (
        [MaPhieuGoi], [MaMonAn]  -- Chỉ định cả hai cột làm khóa chính
    ) WITH (
        PAD_INDEX = OFF, 
        STATISTICS_NORECOMPUTE = OFF, 
        IGNORE_DUP_KEY = OFF, 
        ALLOW_ROW_LOCKS = ON, 
        ALLOW_PAGE_LOCKS = ON, 
        OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
    ) ON [PRIMARY]
) ON [PRIMARY];
GO

/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 04/16/2024 08:42:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[MaHoaDon_id] [int] NOT NULL,
	[MaMonAn_id] [int] NOT NULL,
	[SoLuongMua] [int] NOT NULL,
	[ThanhTien] [float] NOT NULL,
	[NgayGoi] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHoaDon_id] ASC,
	[MaMonAn_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietPhieuNhap]    Script Date: 04/16/2024 08:42:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietPhieuNhap](
	[MaNguyenLieu_id] [int] NOT NULL,
	[MaPhieuNhap_id] [int] NOT NULL,
	[SoLuongNhap] [float] NULL,
	[GiaNhap] [float] NOT NULL,
	[ThanhTien] [float] NULL,
	[HanSuDung] [date]
PRIMARY KEY CLUSTERED 
(
	[MaNguyenLieu_id] ASC,
	[MaPhieuNhap_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietSanPham]    Script Date: 04/16/2024 08:42:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietSanPham](
	[MaMonAn_id] [int] NOT NULL,
	[MaNguyenLieu_id] [int] NOT NULL,
	[SoLuongDung] [float] NOT NULL,
	[Tru] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaMonAn_id] ASC,
	[MaNguyenLieu_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 04/16/2024 08:42:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHoaDon] [int] IDENTITY(1,1) NOT NULL,
	[TenKhachHang] [nvarchar](100) NULL,
	[SDTKhachHang] [varchar](10) NULL,
	[TongHoaDon] [int] NULL,
	[NgayTao] [datetime] NULL,
	[NgayThanhToan] [datetime] NULL,
	[GhiChu] [nvarchar](200) NULL,
	[TongTien] [float] NOT NULL,
	[TrangThai] [int] NULL,
	[MaBan_id] [int] NULL,
	[Code] [varchar](6) NULL,
	[ThoiHan] [datetime] NULL,
 CONSTRAINT [PK__HoaDon__835ED13B19FCDE5C] PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoanTra]    Script Date: 04/16/2024 08:42:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoanTra](
	[MaHoanTra] [int] IDENTITY(1,1) NOT NULL,
	[NgayHoanTra] [datetime] NULL,
	[TongTien] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHoanTra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LichSuGoiMon]    Script Date: 04/16/2024 08:42:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LichSuGoiMon](
	[MaLichSu] [int] IDENTITY(1,1) NOT NULL,
	[SoLuongMua] [int] NOT NULL,
	[SoLuongTra] [int] NULL,
	[ThoiGianGoi] [datetime] NULL,
	[ThoiGianTra] [datetime] NULL,
	[MaHoaDon_id] [int] NULL,
	[MaMonAn_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLichSu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiMonAn]    Script Date: 04/16/2024 08:42:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiMonAn](
	[MaLMA] [int] IDENTITY(1,1) NOT NULL,
	[TenLMA] [nvarchar](100) NOT NULL,
	[TongSoLuong] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLMA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiNguyenLieu]    Script Date: 04/16/2024 08:42:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiNguyenLieu](
	[MaLNL] [int] IDENTITY(1,1) NOT NULL,
	[TenLNL] [nvarchar](100) NOT NULL,
	[TongSoLuong] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLNL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MonAn]    Script Date: 04/16/2024 08:42:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[NguyenLieu]    Script Date: 04/16/2024 08:42:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguyenLieu](
	[MaNguyenLieu] [int] IDENTITY(1,1) NOT NULL,
	[TenNguyenLieu] [nvarchar](200) NOT NULL,
	[SoLuongHienCon] [float] NULL,
	[GhiChu] [nvarchar](255) NULL,
	[GiaNhapCuoi] [float] NOT NULL,
	[MaLNL_id] [int] NULL,
	[HanSuDung] [datetime]
PRIMARY KEY CLUSTERED 
(
	[MaNguyenLieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NguyenLieuTra]    Script Date: 04/16/2024 08:42:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguyenLieuTra](
	[MaHoanTra_id] [int] NOT NULL,
	[MaNguyenLieu_id] [int] NOT NULL,
	[SoLuongTra] [float] NULL,
	[DonGia] [float] NULL,
	[ThanhTien] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHoanTra_id] ASC,
	[MaNguyenLieu_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NguyenLieuXuat]    Script Date: 04/16/2024 08:42:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguyenLieuXuat](
	[MaXuatKho_id] [int] NOT NULL,
	[MaNguyenLieu_id] [int] NOT NULL,
	[SoLuongXuat] [float] NULL,
	[DonGia] [float] NULL,
	[ThanhTien] [float] NULL,
 CONSTRAINT [PK__NguyenLi__AA75F991E3C77BBC] PRIMARY KEY CLUSTERED 
(
	[MaXuatKho_id] ASC,
	[MaNguyenLieu_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaCC]    Script Date: 04/16/2024 08:42:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCC](
	[MaNCC] [int] IDENTITY(1,1) NOT NULL,
	[TenNCC] [nvarchar](100) NOT NULL,
	[DiaChi] [nvarchar](200) NULL,
	[SoDienThoai] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 04/16/2024 08:42:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
    [MANV] [varchar](50) NOT NULL,
	[TaiKhoanNV] [varchar](50) NOT NULL,
	[MatKhauNV] [varchar](50) NOT NULL,
	[TenNhanVien] [nvarchar](100) NOT NULL,
	[NgaySinh] [date] NULL,
	[SoDienThoai] [varchar](10) NULL,
	[MaQuyen_id] [int] NULL,
	[TrangThai] [int] NULL,
	[DanhGia] [int] NULL
PRIMARY KEY CLUSTERED 
(
	[MANV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhomMonAn]    Script Date: 04/16/2024 08:42:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhomMonAn](
	[MaNMA] [int] IDENTITY(1,1) NOT NULL,
	[TenNMA] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNMA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuNhap]    Script Date: 04/16/2024 08:42:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuNhap](
	[MaPhieuNhap] [int] IDENTITY(1,1) NOT NULL,
	[NgayNhap] [date] NULL,
	[TongTien] [float] NULL,
	[MANV] [varchar](50) NULL,
	[MaNCC_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPhieuNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quyen]    Script Date: 04/16/2024 08:42:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quyen](
	[MaQuyen] [int] IDENTITY(1,1) NOT NULL,
	[TenQuyen] [nvarchar](50) NOT NULL,
	[GhiChu] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tang]    Script Date: 04/16/2024 08:42:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tang](
	[MaTang] [int] IDENTITY(1,1) NOT NULL,
	[TenTang] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[XuatKho]    Script Date: 04/16/2024 08:42:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XuatKho](
	[MaXuatKho] [int] IDENTITY(1,1) NOT NULL,
	[NgayNhap] [datetime] NULL,
	[NgayXuat] [datetime] NULL,
	[TongTien] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaXuatKho] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[BangChamCong](
	[MaCC] [int] IDENTITY(1,1) NOT NULL,
	[TuNgay] [datetime] NULL,
	[DenNgay] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[CTBangChamCong](
    [MANV] [varchar](50) NOT NULL,  -- Cột MANV là IDENTITY
    [MaCC] [int] NOT NULL,  -- Cột MaCC cũng là IDENTITY
    [SoGio] [INT] NULL,  -- Cột lưu số giờ
    PRIMARY KEY CLUSTERED 
    (
        [MANV], [MaCC]  -- Khóa chính hợp nhất (bao gồm cả 2 cột)
    ) WITH (
        PAD_INDEX = OFF, 
        STATISTICS_NORECOMPUTE = OFF, 
        IGNORE_DUP_KEY = OFF, 
        ALLOW_ROW_LOCKS = ON, 
        ALLOW_PAGE_LOCKS = ON, 
        OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
    ) ON [PRIMARY]
) ON [PRIMARY];
GO

CREATE TABLE [dbo].[PhongBan](
	[MaPhongBan] [int] IDENTITY(1,1) NOT NULL,
	[TenPhongBan] [nvarchar](Max) NULL,
	[SDT] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPhongBan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[QuyetDinhTuyenDung](
    [SoQD] [int] IDENTITY(1,1) NOT NULL,       -- Cột SoQD là IDENTITY
    [NgayQD] [datetime] NULL,                   -- Ngày quyết định
    [TGThuViec] [int] NULL,                     -- Thời gian thử việc
    [MucLuong] [decimal] NULL,                  -- Mức lương
    [NoiDung] [nvarchar](MAX),                  -- Nội dung quyết định
    [MaNV] [varchar](50) NOT NULL,                      -- Mã nhân viên
    [MaPhongBan] [int] NULL,                    -- Mã phòng ban
    PRIMARY KEY CLUSTERED 
    (
        [SoQD], [MaNV]  -- Khóa chính hợp nhất (bao gồm cả 2 cột SoQD và MaNV)
    ) WITH (
        PAD_INDEX = OFF, 
        STATISTICS_NORECOMPUTE = OFF, 
        IGNORE_DUP_KEY = OFF, 
        ALLOW_ROW_LOCKS = ON, 
        ALLOW_PAGE_LOCKS = ON, 
        OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
    ) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE TABLE [dbo].[TuyenDung](
    [STT] [int] IDENTITY(1,1) NOT NULL,                       
    [Hoten] [nvarchar] (Max) NOT NULL, 
	[NgaySinh] [datetime] NOT NULL, 
	[DiaChi] [nvarchar] (Max) NOT NULL,
	[SDT] [varchar] (10) NOT NULL,
	[Vitri] [nvarchar] (Max) NOT NULL, 
    [NgayNopDon] [datetime] NOT NULL,  
	[Duyet] [bit] NULL,
	PRIMARY KEY CLUSTERED 
	(
		[STT] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Ban] ON 

INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaKhuVuc]) VALUES (1, N'1 VIP', 8, 1, 0, 1)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaKhuVuc]) VALUES (2, N'2 VIP', 8, 1, 1, 1)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaKhuVuc]) VALUES (3, N'3 VIP', 16, 1, 1, 1)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaKhuVuc]) VALUES (4, N'4', 4, 0, 1, 1)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaKhuVuc]) VALUES (5, N'5', 4, 0, 0, 1)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaKhuVuc]) VALUES (6, N'6', 6, 0, 0, 1)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaKhuVuc]) VALUES (7, N'7', 6, 0, 0, 1)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaKhuVuc]) VALUES (8, N'8', 6, 0, 1, 1)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaKhuVuc]) VALUES (9, N'9', 6, 0, 0, 1)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaKhuVuc]) VALUES (10, N'10', 6, 0, 0, 1)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaKhuVuc]) VALUES (11, N'11', 6, 0, 0, 1)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaKhuVuc]) VALUES (12, N'12', 6, 0, 0, 1)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaKhuVuc]) VALUES (13, N'13', 6, 0, 0, 1)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaKhuVuc]) VALUES (14, N'14', 6, 0, 0, 1)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaKhuVuc]) VALUES (15, N'15', 6, 0, 1, 1)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaKhuVuc]) VALUES (16, N'16', 6, 0, 0, 1)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaKhuVuc]) VALUES (17, N'17', 6, 0, 0, 1)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaKhuVuc]) VALUES (18, N'18', 6, 0, 0, 1)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaKhuVuc]) VALUES (19, N'1 VIP', 8, 1, 0, 2)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaKhuVuc]) VALUES (20, N'2 VIP', 8, 1, 0, 2)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaKhuVuc]) VALUES (21, N'3 VIP', 16, 1, 0, 2)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaKhuVuc]) VALUES (22, N'4', 4, 0, 0, 2)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaKhuVuc]) VALUES (23, N'5', 4, 0, 0, 2)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaKhuVuc]) VALUES (24, N'6', 6, 0, 0, 2)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaKhuVuc]) VALUES (25, N'7', 6, 0, 0, 2)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaKhuVuc]) VALUES (26, N'8', 6, 0, 0, 2)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaKhuVuc]) VALUES (27, N'9', 6, 0, 1, 2)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaKhuVuc]) VALUES (28, N'10', 6, 0, 0, 2)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaKhuVuc]) VALUES (29, N'11', 6, 0, 0, 2)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaKhuVuc]) VALUES (30, N'12', 6, 0, 0, 2)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaKhuVuc]) VALUES (31, N'13', 6, 0, 0, 2)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaKhuVuc]) VALUES (32, N'14', 6, 0, 0, 2)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaKhuVuc]) VALUES (33, N'15', 6, 0, 0, 2)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaKhuVuc]) VALUES (34, N'16', 6, 0, 0, 2)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaKhuVuc]) VALUES (35, N'17', 6, 0, 0, 2)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaKhuVuc]) VALUES (36, N'18', 6, 0, 0, 2)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaKhuVuc]) VALUES (37, N'1 VIP', 8, 1, 0, 3)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaKhuVuc]) VALUES (38, N'2 VIP', 8, 1, 0, 3)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaKhuVuc]) VALUES (39, N'3 VIP', 16, 1, 0, 3)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaKhuVuc]) VALUES (40, N'4', 4, 0, 0, 3)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaKhuVuc]) VALUES (41, N'5', 4, 0, 0, 3)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaKhuVuc]) VALUES (42, N'6', 6, 0, 0, 3)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaKhuVuc]) VALUES (43, N'7', 6, 0, 0, 3)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaKhuVuc]) VALUES (44, N'8', 6, 0, 0, 3)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaKhuVuc]) VALUES (45, N'9', 6, 0, 0, 3)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaKhuVuc]) VALUES (46, N'10', 6, 0, 0, 3)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaKhuVuc]) VALUES (47, N'11', 6, 0, 0, 3)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaKhuVuc]) VALUES (48, N'12', 6, 0, 0, 3)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaKhuVuc]) VALUES (49, N'13', 6, 0, 0, 3)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaKhuVuc]) VALUES (50, N'14', 6, 0, 0, 3)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaKhuVuc]) VALUES (51, N'15', 6, 0, 0, 3)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaKhuVuc]) VALUES (52, N'16', 6, 0, 0, 3)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaKhuVuc]) VALUES (53, N'17', 6, 0, 0, 3)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaKhuVuc]) VALUES (54, N'18', 6, 0, 0, 3)
SET IDENTITY_INSERT [dbo].[Ban] OFF
GO
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (68, 1, 8, 80000, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (68, 2, 1, 40000, CAST(N'2023-11-17T23:06:14.680' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (68, 3, 1, 15000, CAST(N'2023-11-17T23:06:18.377' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (68, 9, 1, 50000, CAST(N'2023-11-17T23:06:20.427' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (69, 1, 8, 80000, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (70, 1, 16, 160000, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (71, 1, 4, 40000, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (72, 1, 6, 60000, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (73, 1, 6, 60000, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (74, 1, 2, 20000, CAST(N'2024-04-15T17:34:01.583' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (74, 2, 4, 160000, CAST(N'2024-04-15T17:33:51.503' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (74, 9, 2, 100000, CAST(N'2024-04-15T17:34:14.750' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (75, 1, 7, 70000, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (75, 5, 1, 50000, CAST(N'2024-04-15T17:35:06.313' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (75, 10, 1, 80000, CAST(N'2024-04-15T17:35:11.180' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (76, 1, 6, 60000, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (76, 2, 1, 40000, CAST(N'2024-04-15T21:36:32.813' AS DateTime))
GO
INSERT [dbo].[ChiTietPhieuNhap] ([MaNguyenLieu_id], [MaPhieuNhap_id], [SoLuongNhap], [GiaNhap], [ThanhTien]) VALUES (1, 7, 500, 5000, 2500000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaNguyenLieu_id], [MaPhieuNhap_id], [SoLuongNhap], [GiaNhap], [ThanhTien]) VALUES (4, 3, 50, 50000, 2500000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaNguyenLieu_id], [MaPhieuNhap_id], [SoLuongNhap], [GiaNhap], [ThanhTien]) VALUES (5, 4, 10, 10000, 100000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaNguyenLieu_id], [MaPhieuNhap_id], [SoLuongNhap], [GiaNhap], [ThanhTien]) VALUES (8, 4, 10, 50000, 500000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaNguyenLieu_id], [MaPhieuNhap_id], [SoLuongNhap], [GiaNhap], [ThanhTien]) VALUES (9, 4, 10, 30000, 300000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaNguyenLieu_id], [MaPhieuNhap_id], [SoLuongNhap], [GiaNhap], [ThanhTien]) VALUES (10, 4, 10, 100000, 1000000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaNguyenLieu_id], [MaPhieuNhap_id], [SoLuongNhap], [GiaNhap], [ThanhTien]) VALUES (11, 7, 10, 200000, 2000000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaNguyenLieu_id], [MaPhieuNhap_id], [SoLuongNhap], [GiaNhap], [ThanhTien]) VALUES (12, 4, 10, 40000, 400000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaNguyenLieu_id], [MaPhieuNhap_id], [SoLuongNhap], [GiaNhap], [ThanhTien]) VALUES (13, 5, 10, 200000, 2000000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaNguyenLieu_id], [MaPhieuNhap_id], [SoLuongNhap], [GiaNhap], [ThanhTien]) VALUES (14, 7, 10, 200000, 2000000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaNguyenLieu_id], [MaPhieuNhap_id], [SoLuongNhap], [GiaNhap], [ThanhTien]) VALUES (15, 5, 10, 50000, 500000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaNguyenLieu_id], [MaPhieuNhap_id], [SoLuongNhap], [GiaNhap], [ThanhTien]) VALUES (16, 5, 10, 40000, 400000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaNguyenLieu_id], [MaPhieuNhap_id], [SoLuongNhap], [GiaNhap], [ThanhTien]) VALUES (17, 4, 10, 80000, 800000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaNguyenLieu_id], [MaPhieuNhap_id], [SoLuongNhap], [GiaNhap], [ThanhTien]) VALUES (18, 3, 50, 100000, 5000000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaNguyenLieu_id], [MaPhieuNhap_id], [SoLuongNhap], [GiaNhap], [ThanhTien]) VALUES (19, 5, 10, 20000, 200000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaNguyenLieu_id], [MaPhieuNhap_id], [SoLuongNhap], [GiaNhap], [ThanhTien]) VALUES (20, 4, 10, 300000, 3000000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaNguyenLieu_id], [MaPhieuNhap_id], [SoLuongNhap], [GiaNhap], [ThanhTien]) VALUES (21, 4, 10, 70000, 700000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaNguyenLieu_id], [MaPhieuNhap_id], [SoLuongNhap], [GiaNhap], [ThanhTien]) VALUES (22, 3, 50, 200000, 10000000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaNguyenLieu_id], [MaPhieuNhap_id], [SoLuongNhap], [GiaNhap], [ThanhTien]) VALUES (23, 4, 10, 55000, 550000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaNguyenLieu_id], [MaPhieuNhap_id], [SoLuongNhap], [GiaNhap], [ThanhTien]) VALUES (24, 4, 10, 55000, 550000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaNguyenLieu_id], [MaPhieuNhap_id], [SoLuongNhap], [GiaNhap], [ThanhTien]) VALUES (25, 5, 10, 10000, 100000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaNguyenLieu_id], [MaPhieuNhap_id], [SoLuongNhap], [GiaNhap], [ThanhTien]) VALUES (26, 5, 10, 8000, 80000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaNguyenLieu_id], [MaPhieuNhap_id], [SoLuongNhap], [GiaNhap], [ThanhTien]) VALUES (27, 3, 50, 300000, 15000000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaNguyenLieu_id], [MaPhieuNhap_id], [SoLuongNhap], [GiaNhap], [ThanhTien]) VALUES (28, 5, 10, 180000, 1800000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaNguyenLieu_id], [MaPhieuNhap_id], [SoLuongNhap], [GiaNhap], [ThanhTien]) VALUES (29, 3, 50, 250000, 12500000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaNguyenLieu_id], [MaPhieuNhap_id], [SoLuongNhap], [GiaNhap], [ThanhTien]) VALUES (30, 3, 50, 400000, 20000000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaNguyenLieu_id], [MaPhieuNhap_id], [SoLuongNhap], [GiaNhap], [ThanhTien]) VALUES (31, 7, 10, 500000, 5000000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaNguyenLieu_id], [MaPhieuNhap_id], [SoLuongNhap], [GiaNhap], [ThanhTien]) VALUES (32, 5, 10, 30000, 300000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaNguyenLieu_id], [MaPhieuNhap_id], [SoLuongNhap], [GiaNhap], [ThanhTien]) VALUES (33, 5, 10, 25000, 250000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaNguyenLieu_id], [MaPhieuNhap_id], [SoLuongNhap], [GiaNhap], [ThanhTien]) VALUES (34, 4, 10, 100000, 1000000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaNguyenLieu_id], [MaPhieuNhap_id], [SoLuongNhap], [GiaNhap], [ThanhTien]) VALUES (35, 3, 50, 20000, 1000000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaNguyenLieu_id], [MaPhieuNhap_id], [SoLuongNhap], [GiaNhap], [ThanhTien]) VALUES (36, 7, 10, 50000, 500000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaNguyenLieu_id], [MaPhieuNhap_id], [SoLuongNhap], [GiaNhap], [ThanhTien]) VALUES (37, 3, 50, 150000, 7500000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaNguyenLieu_id], [MaPhieuNhap_id], [SoLuongNhap], [GiaNhap], [ThanhTien]) VALUES (38, 4, 10, 120000, 1200000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaNguyenLieu_id], [MaPhieuNhap_id], [SoLuongNhap], [GiaNhap], [ThanhTien]) VALUES (39, 4, 10, 300000, 3000000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaNguyenLieu_id], [MaPhieuNhap_id], [SoLuongNhap], [GiaNhap], [ThanhTien]) VALUES (40, 7, 100, 1000, 100000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaNguyenLieu_id], [MaPhieuNhap_id], [SoLuongNhap], [GiaNhap], [ThanhTien]) VALUES (41, 4, 10, 50000, 500000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaNguyenLieu_id], [MaPhieuNhap_id], [SoLuongNhap], [GiaNhap], [ThanhTien]) VALUES (42, 5, 10, 25000, 250000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaNguyenLieu_id], [MaPhieuNhap_id], [SoLuongNhap], [GiaNhap], [ThanhTien]) VALUES (43, 4, 10, 40000, 400000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaNguyenLieu_id], [MaPhieuNhap_id], [SoLuongNhap], [GiaNhap], [ThanhTien]) VALUES (44, 7, 50, 1000, 50000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaNguyenLieu_id], [MaPhieuNhap_id], [SoLuongNhap], [GiaNhap], [ThanhTien]) VALUES (45, 4, 10, 25000, 250000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaNguyenLieu_id], [MaPhieuNhap_id], [SoLuongNhap], [GiaNhap], [ThanhTien]) VALUES (46, 3, 50, 200000, 10000000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaNguyenLieu_id], [MaPhieuNhap_id], [SoLuongNhap], [GiaNhap], [ThanhTien]) VALUES (47, 4, 10, 80000, 800000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaNguyenLieu_id], [MaPhieuNhap_id], [SoLuongNhap], [GiaNhap], [ThanhTien]) VALUES (48, 4, 10, 90000, 900000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaNguyenLieu_id], [MaPhieuNhap_id], [SoLuongNhap], [GiaNhap], [ThanhTien]) VALUES (49, 6, 10, 90000, 900000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaNguyenLieu_id], [MaPhieuNhap_id], [SoLuongNhap], [GiaNhap], [ThanhTien]) VALUES (50, 6, 240, 16000, 3840000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaNguyenLieu_id], [MaPhieuNhap_id], [SoLuongNhap], [GiaNhap], [ThanhTien]) VALUES (51, 6, 240, 15000, 3600000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaNguyenLieu_id], [MaPhieuNhap_id], [SoLuongNhap], [GiaNhap], [ThanhTien]) VALUES (52, 6, 240, 15000, 3600000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaNguyenLieu_id], [MaPhieuNhap_id], [SoLuongNhap], [GiaNhap], [ThanhTien]) VALUES (53, 6, 240, 30000, 7200000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaNguyenLieu_id], [MaPhieuNhap_id], [SoLuongNhap], [GiaNhap], [ThanhTien]) VALUES (54, 6, 240, 15000, 3600000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaNguyenLieu_id], [MaPhieuNhap_id], [SoLuongNhap], [GiaNhap], [ThanhTien]) VALUES (55, 6, 240, 25000, 6000000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaNguyenLieu_id], [MaPhieuNhap_id], [SoLuongNhap], [GiaNhap], [ThanhTien]) VALUES (56, 6, 5, 4000000, 20000000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaNguyenLieu_id], [MaPhieuNhap_id], [SoLuongNhap], [GiaNhap], [ThanhTien]) VALUES (57, 6, 20, 10000000, 200000000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaNguyenLieu_id], [MaPhieuNhap_id], [SoLuongNhap], [GiaNhap], [ThanhTien]) VALUES (58, 6, 240, 16000, 3840000)
INSERT [dbo].[ChiTietPhieuNhap] ([MaNguyenLieu_id], [MaPhieuNhap_id], [SoLuongNhap], [GiaNhap], [ThanhTien]) VALUES (59, 6, 50, 100000, 5000000)
GO
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (1, 1, 1, 1)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (2, 4, 0.4, 1)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (2, 5, 0.2, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (3, 8, 0.1, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (3, 9, 0.2, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (3, 10, 0.1, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (4, 11, 0.5, 1)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (4, 12, 0.01, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (5, 8, 0.003, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (5, 11, 0.5, 1)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (5, 13, 0.003, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (7, 14, 0.5, 1)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (7, 15, 0.05, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (7, 16, 0.3, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (8, 17, 0.5, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (8, 18, 0.5, 1)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (8, 19, 0.3, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (9, 20, 2, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (9, 21, 0.2, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (9, 22, 0.5, 1)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (9, 23, 0.2, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (10, 25, 0.02, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (10, 26, 0.2, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (10, 27, 1, 1)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (10, 28, 0.3, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (11, 13, 0.02, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (11, 16, 0.2, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (11, 19, 0.2, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (11, 21, 0.02, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (11, 23, 0.05, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (11, 29, 0.5, 1)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (12, 11, 0.5, 1)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (12, 13, 0.2, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (12, 16, 0.2, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (12, 23, 0.2, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (12, 30, 0.5, 1)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (13, 5, 0.05, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (13, 8, 0.02, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (13, 21, 0.02, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (13, 31, 0.5, 1)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (13, 32, 0.03, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (13, 33, 0.03, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (14, 27, 0.5, 1)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (14, 29, 0.5, 1)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (14, 34, 0.2, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (14, 35, 0.5, 1)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (14, 36, 1, 1)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (15, 5, 0.2, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (15, 21, 0.2, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (15, 34, 0.2, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (15, 36, 1, 1)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (15, 37, 0.5, 1)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (15, 38, 0.2, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (15, 39, 0.2, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (16, 11, 0.5, 1)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (16, 13, 0.003, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (16, 16, 0.02, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (16, 40, 3, 1)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (17, 8, 0.2, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (17, 23, 0.1, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (17, 40, 3, 1)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (17, 41, 0.2, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (17, 42, 0.2, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (18, 8, 0.02, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (18, 16, 0.2, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (18, 23, 0.02, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (18, 43, 0.3, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (19, 5, 0.02, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (19, 19, 0.5, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (19, 23, 0.02, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (19, 44, 0.5, 1)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (20, 14, 1, 1)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (20, 19, 0.2, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (20, 45, 0.5, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (21, 10, 0.02, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (21, 23, 0.2, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (21, 31, 0.5, 1)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (21, 46, 0.5, 1)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (21, 47, 0.5, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (21, 48, 0.2, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (22, 49, 1, 1)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (23, 50, 1, 1)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (24, 51, 1, 1)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (25, 52, 1, 1)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (26, 53, 1, 1)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (27, 54, 1, 1)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (28, 55, 1, 1)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (29, 56, 1, 1)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (30, 57, 1, 1)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (31, 58, 1, 1)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (32, 59, 1, 1)

GO
SET IDENTITY_INSERT [dbo].[HoaDon] ON 

INSERT [dbo].[HoaDon] ([MaHoaDon], [TenKhachHang], [SDTKhachHang], [TongHoaDon], [NgayTao], [NgayThanhToan], [GhiChu], [TongTien], [TrangThai], [MaBan_id], [Code], [ThoiHan]) VALUES (68, N'Thanh Duy', N'0346923002', 2, CAST(N'2023-11-17T23:01:04.463' AS DateTime), CAST(N'2023-11-18T00:05:46.877' AS DateTime), NULL, 203500, 0, 1, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHoaDon], [TenKhachHang], [SDTKhachHang], [TongHoaDon], [NgayTao], [NgayThanhToan], [GhiChu], [TongTien], [TrangThai], [MaBan_id], [Code], [ThoiHan]) VALUES (69, N'Vãng Lai Cafeu', N'0123456789', 1, CAST(N'2023-11-17T23:56:28.613' AS DateTime), NULL, NULL, 88000, 1, 2, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHoaDon], [TenKhachHang], [SDTKhachHang], [TongHoaDon], [NgayTao], [NgayThanhToan], [GhiChu], [TongTien], [TrangThai], [MaBan_id], [Code], [ThoiHan]) VALUES (70, N'Vãng Lai Cafeu', N'0123456789', 1, CAST(N'2024-04-15T17:31:37.577' AS DateTime), NULL, NULL, 176000, 1, 3, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHoaDon], [TenKhachHang], [SDTKhachHang], [TongHoaDon], [NgayTao], [NgayThanhToan], [GhiChu], [TongTien], [TrangThai], [MaBan_id], [Code], [ThoiHan]) VALUES (71, N'Vãng Lai Cafeu', N'0123456789', 1, CAST(N'2024-04-15T17:32:20.130' AS DateTime), NULL, NULL, 40000, 1, 4, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHoaDon], [TenKhachHang], [SDTKhachHang], [TongHoaDon], [NgayTao], [NgayThanhToan], [GhiChu], [TongTien], [TrangThai], [MaBan_id], [Code], [ThoiHan]) VALUES (72, N'Vãng Lai Cafeu', N'0123456789', 1, CAST(N'2024-04-15T17:32:26.017' AS DateTime), NULL, NULL, 60000, 1, 15, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHoaDon], [TenKhachHang], [SDTKhachHang], [TongHoaDon], [NgayTao], [NgayThanhToan], [GhiChu], [TongTien], [TrangThai], [MaBan_id], [Code], [ThoiHan]) VALUES (73, N'Vãng Lai Cafeu', N'0123456789', 1, CAST(N'2024-04-15T17:32:42.287' AS DateTime), NULL, NULL, 60000, 1, 8, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHoaDon], [TenKhachHang], [SDTKhachHang], [TongHoaDon], [NgayTao], [NgayThanhToan], [GhiChu], [TongTien], [TrangThai], [MaBan_id], [Code], [ThoiHan]) VALUES (74, N'Vãng Lai Cafeu', N'0123456789', 1, CAST(N'2024-04-15T17:33:09.193' AS DateTime), CAST(N'2024-04-15T17:34:47.730' AS DateTime), NULL, 280000, 0, 26, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHoaDon], [TenKhachHang], [SDTKhachHang], [TongHoaDon], [NgayTao], [NgayThanhToan], [GhiChu], [TongTien], [TrangThai], [MaBan_id], [Code], [ThoiHan]) VALUES (75, N'Vãng Lai Cafeu', N'0123456789', 1, CAST(N'2024-04-15T17:34:55.993' AS DateTime), CAST(N'2024-04-15T17:35:23.397' AS DateTime), NULL, 200000, 0, 9, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHoaDon], [TenKhachHang], [SDTKhachHang], [TongHoaDon], [NgayTao], [NgayThanhToan], [GhiChu], [TongTien], [TrangThai], [MaBan_id], [Code], [ThoiHan]) VALUES (76, N'Vãng Lai Cafeu', N'0123456789', 1, CAST(N'2024-04-15T21:36:09.300' AS DateTime), NULL, NULL, 60000, 1, 27, NULL, NULL)
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
GO
SET IDENTITY_INSERT [dbo].[HoanTra] ON 

INSERT [dbo].[HoanTra] ([MaHoanTra], [NgayHoanTra], [TongTien]) VALUES (1, CAST(N'2024-04-15T17:33:12.767' AS DateTime), 0)
INSERT [dbo].[HoanTra] ([MaHoanTra], [NgayHoanTra], [TongTien]) VALUES (2, CAST(N'2024-04-15T21:36:19.560' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[HoanTra] OFF
GO
SET IDENTITY_INSERT [dbo].[LichSuGoiMon] ON 

INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (254, 8, 0, CAST(N'2023-11-17T23:01:04.503' AS DateTime), NULL, 68, 1)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (255, 1, 0, CAST(N'2023-11-17T23:06:14.843' AS DateTime), NULL, 68, 2)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (256, 1, 0, CAST(N'2023-11-17T23:06:18.397' AS DateTime), NULL, 68, 3)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (257, 1, 0, CAST(N'2023-11-17T23:06:20.447' AS DateTime), NULL, 68, 9)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (258, 8, 0, CAST(N'2023-11-17T23:56:28.663' AS DateTime), NULL, 69, 1)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (259, 16, 0, CAST(N'2024-04-15T17:31:37.807' AS DateTime), NULL, 70, 1)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (260, 4, 0, CAST(N'2024-04-15T17:32:20.257' AS DateTime), NULL, 71, 1)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (261, 6, 0, CAST(N'2024-04-15T17:32:26.140' AS DateTime), NULL, 72, 1)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (262, 6, 0, CAST(N'2024-04-15T17:32:42.440' AS DateTime), NULL, 73, 1)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (263, 6, 0, CAST(N'2024-04-15T17:33:09.317' AS DateTime), NULL, 74, 1)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (264, 0, 6, NULL, CAST(N'2024-04-15T17:33:12.727' AS DateTime), 74, 1)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (265, 1, 0, CAST(N'2024-04-15T17:33:51.577' AS DateTime), NULL, 74, 2)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (266, 2, 0, CAST(N'2024-04-15T17:34:01.647' AS DateTime), NULL, 74, 1)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (267, 1, 0, CAST(N'2024-04-15T17:34:07.513' AS DateTime), NULL, 74, 2)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (268, 2, 0, CAST(N'2024-04-15T17:34:14.820' AS DateTime), NULL, 74, 9)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (269, 6, 0, CAST(N'2024-04-15T17:34:56.137' AS DateTime), NULL, 75, 1)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (270, 1, 0, CAST(N'2024-04-15T17:35:00.727' AS DateTime), NULL, 75, 1)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (271, 1, 0, CAST(N'2024-04-15T17:35:06.373' AS DateTime), NULL, 75, 5)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (272, 1, 0, CAST(N'2024-04-15T17:35:11.243' AS DateTime), NULL, 75, 10)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (273, 6, 0, CAST(N'2024-04-15T21:36:09.493' AS DateTime), NULL, 76, 1)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (274, 0, 2, NULL, CAST(N'2024-04-15T21:36:19.303' AS DateTime), 76, 1)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (275, 1, 0, CAST(N'2024-04-15T21:36:27.537' AS DateTime), NULL, 76, 1)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (276, 1, 0, CAST(N'2024-04-15T21:36:32.883' AS DateTime), NULL, 76, 2)
SET IDENTITY_INSERT [dbo].[LichSuGoiMon] OFF
GO
SET IDENTITY_INSERT [dbo].[LoaiMonAn] ON 

INSERT [dbo].[LoaiMonAn] ([MaLMA], [TenLMA], [TongSoLuong]) VALUES (1, N'Khai Vị', 7)
INSERT [dbo].[LoaiMonAn] ([MaLMA], [TenLMA], [TongSoLuong]) VALUES (2, N'Món Gà', 2)
INSERT [dbo].[LoaiMonAn] ([MaLMA], [TenLMA], [TongSoLuong]) VALUES (3, N'Món Heo', 4)
INSERT [dbo].[LoaiMonAn] ([MaLMA], [TenLMA], [TongSoLuong]) VALUES (4, N'Shushi', 0)
INSERT [dbo].[LoaiMonAn] ([MaLMA], [TenLMA], [TongSoLuong]) VALUES (6, N'Cơm', 0)
INSERT [dbo].[LoaiMonAn] ([MaLMA], [TenLMA], [TongSoLuong]) VALUES (7, N'Món Lẩu', 2)
INSERT [dbo].[LoaiMonAn] ([MaLMA], [TenLMA], [TongSoLuong]) VALUES (8, N'Món Cháo', 0)
INSERT [dbo].[LoaiMonAn] ([MaLMA], [TenLMA], [TongSoLuong]) VALUES (9, N'Trái Cây', 0)
INSERT [dbo].[LoaiMonAn] ([MaLMA], [TenLMA], [TongSoLuong]) VALUES (10, N'Thức Uống', 11)
INSERT [dbo].[LoaiMonAn] ([MaLMA], [TenLMA], [TongSoLuong]) VALUES (11, N'Khác', 5)
SET IDENTITY_INSERT [dbo].[LoaiMonAn] OFF
GO
SET IDENTITY_INSERT [dbo].[LoaiNguyenLieu] ON 

INSERT [dbo].[LoaiNguyenLieu] ([MaLNL], [TenLNL], [TongSoLuong]) VALUES (1, N'Hải Sản', 9)
INSERT [dbo].[LoaiNguyenLieu] ([MaLNL], [TenLNL], [TongSoLuong]) VALUES (2, N'Rau Củ Quả', 18)
INSERT [dbo].[LoaiNguyenLieu] ([MaLNL], [TenLNL], [TongSoLuong]) VALUES (3, N'Gia Vị', 10)
INSERT [dbo].[LoaiNguyenLieu] ([MaLNL], [TenLNL], [TongSoLuong]) VALUES (4, N'Thức Uống', 11)
INSERT [dbo].[LoaiNguyenLieu] ([MaLNL], [TenLNL], [TongSoLuong]) VALUES (5, N'Khác', 7)
SET IDENTITY_INSERT [dbo].[LoaiNguyenLieu] OFF
GO
SET IDENTITY_INSERT [dbo].[MonAn] ON 

INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [HinhAnh], [DonGia], [NgayCapNhat], [ThongTin], [MoTa], [SoLuongDaBan], [MaNMA_id], [MaLMA_id]) VALUES (1, N'Khăn Lạnh', N'KhanLanh.jpg', 10000, CAST(N'2021-12-10' AS Date), N'Khăn lau miệng việt tiệp', N'<p>Khăn lau cho mọi người</p>', 75, 5, 11)
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [HinhAnh], [DonGia], [NgayCapNhat], [ThongTin], [MoTa], [SoLuongDaBan], [MaNMA_id], [MaLMA_id]) VALUES (2, N'Cá Lóc Đồng Kho Tộ (Ướp Sẵn)', N'https://daubepgiadinh.vn/wp-content/uploads/2017/01/cach-nau-ca-loc-kho-to.jpg', 40000, CAST(N'2021-12-10' AS Date), N'Cá lóc kho tộ ngon ngon', N'<p><span style="font-family: ''SF UI Text''; font-size: 15px; text-align: justify; white-space: pre-line;">C&aacute; L&oacute;c Kho Tộ l&agrave; một m&oacute;n ngon v&ocirc; c&ugrave;ng đưa cơm v&agrave; rất quen thuộc với c&aacute;c bữa ăn gia đ&igrave;nh Việt. Từng miếng c&aacute; kho ướm m&agrave;u n&acirc;u v&agrave;ng, b&oacute;ng bẩy đẹp mắt, dai ngon h&ograve;a quyện c&ugrave;ng sốt kho sệt qu&aacute;nh, đậm vị mặn ngọt chua cay của ti&ecirc;u, ớt, d&ugrave;ng c&ugrave;ng cơm trắng n&oacute;ng hổi chắc chắn l&agrave; sự lựa chọn tuyệt vời cho bữa cơm gia đ&igrave;nh.</span></p>', 6, 2, 11)
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [HinhAnh], [DonGia], [NgayCapNhat], [ThongTin], [MoTa], [SoLuongDaBan], [MaNMA_id], [MaLMA_id]) VALUES (3, N'Rau Muống Xào Tỏi', N'https://i-giadinh.vnecdn.net/2022/03/28/Thanh-pham-1-2759-1648467981.jpg', 15000, CAST(N'2021-12-10' AS Date), N'Rồng xanh vượt đại dương, món ăn rất quen thuộc đối với người Việt Nam', N'<p><span style="font-family: ''SF UI Text''; font-size: 15px; text-align: justify; white-space: pre-line;">M&oacute;n ăn Rau muống x&agrave;o tỏi chưa bao giờ lỗi thời bao cả! D&ugrave; bạn c&oacute; thử qua bao nhi&ecirc;u m&oacute;n ăn mới lạ th&igrave; chắc chắn rằng m&oacute;n rau muống x&agrave;o tỏi l&agrave; m&oacute;n ăn th&acirc;n thuộc kh&ocirc;ng thể n&agrave;o thiếu trong m&acirc;m cơm gia đ&igrave;nh Việt. M&oacute;n ăn dễ l&agrave;m, nguy&ecirc;n liệu lại đơn giản th&igrave; ngại g&igrave; kh&ocirc;ng order thử xem nh&eacute;. Cooky d&aacute;m chắc bạn sẽ l&agrave; đầu bếp của h&ocirc;m nay đấy.</span></p>', 1, 2, 1)
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [HinhAnh], [DonGia], [NgayCapNhat], [ThongTin], [MoTa], [SoLuongDaBan], [MaNMA_id], [MaLMA_id]) VALUES (4, N'Ba Rọi Heo Chiên Da Giòn', N'https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/hoamkt35/Blog/thit-ba-chi-chien-gion.jpg', 30000, CAST(N'2021-12-10' AS Date), N'Heo quay', N'<p><span style="font-family: ''SF UI Text''; font-size: 15px; text-align: justify; white-space: pre-line;">Da heo chi&ecirc;n v&agrave;ng gi&ograve;n rụm. Thịt heo b&ecirc;n trong mềm mại, mọng nước, thơm một c&aacute;ch ngọt ng&agrave;o, cắn một ph&aacute;t l&agrave; ghiền ngay chỉ c&oacute; thể l&agrave; m&oacute;n Ba Rọi Chi&ecirc;n Da Gi&ograve;n trứ danh. Rất nhiều chị em "ki&ecirc;ng nể" m&oacute;n ăn n&agrave;y v&igrave; sợ dầu văng, thịt b&ecirc;n ngo&agrave;i kh&eacute;t m&agrave; b&ecirc;n trong lại chưa ch&iacute;n hoặc thịt kh&ocirc;ng thấm gia vị,.</span></p>', 0, 2, 3)
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [HinhAnh], [DonGia], [NgayCapNhat], [ThongTin], [MoTa], [SoLuongDaBan], [MaNMA_id], [MaLMA_id]) VALUES (5, N'Ba Rọi Heo Kho Mắm Ruốc', N'https://gcs.tripi.vn/public-tripi/tripi-feed/img/473924jBE/thanhpham.png', 50000, CAST(N'2021-12-10' AS Date), N'Món kho thịt heo ngon ngon', N'<p><span style="font-family: ''SF UI Text''; font-size: 15px; text-align: justify; white-space: pre-line;">Ba rọi kho mắm ruốc l&agrave; sự kết hợp ho&agrave;n hảo giữa thịt ba chỉ b&eacute;o thơm c&ugrave;ng vị mằn mặn của mắm ruốc, vị cay của ớt v&agrave; thơm thơm của sả chắc chắn sẽ l&agrave;m bạn hao kha kh&aacute; cơm đấy. H&atilde;y order ngay g&oacute;i nguy&ecirc;n liệu "Ba rọi heo kho mắm ruốc ướp sẵn" đậm vị đến từ Chef Cooky v&agrave; trổ t&agrave;i cho bữa cơm gia đ&igrave;nh th&ecirc;m đa dạng nh&eacute;!</span></p>', 1, 2, 3)
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [HinhAnh], [DonGia], [NgayCapNhat], [ThongTin], [MoTa], [SoLuongDaBan], [MaNMA_id], [MaLMA_id]) VALUES (7, N'Đùi Gà Chiên Mắm Tỏi', N'https://cdn.tgdd.vn/2021/03/CookProduct/1-1200x676-63.jpg', 50000, CAST(N'2021-12-10' AS Date), N'Đùi gà ta chiên giòn', N'<div class="btn-desc-box" style="box-sizing: border-box; font-family: ''SF UI Text''; display: flex; -webkit-box-pack: center; justify-content: center; margin: 15px 0px; color: #000000; font-size: 15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: justify; text-indent: 0px; text-transform: none; white-space: pre-line; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">&nbsp;</div>
<div class="content-x" style="box-sizing: border-box; font-family: ''SF UI Text''; color: #000000; font-size: 15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: justify; text-indent: 0px; text-transform: none; white-space: pre-line; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Bạn đ&atilde; từng rụng rời với m&oacute;n Cơm G&agrave; Mắm Tỏi ở một qu&aacute;n ăn n&agrave;o đ&oacute;? Bạn ước m&igrave;nh c&oacute; thể thực hiện lại m&oacute;n g&agrave; "thần th&aacute;nh" đ&oacute; tại nh&agrave;? Ngại ng&ugrave;ng g&igrave; m&agrave; kh&ocirc;ng thử sức liền tay với m&oacute;n Đ&ugrave;i G&oacute;c Tư G&agrave; Chi&ecirc;n Mắm Tỏi.</div>', 0, 2, 2)
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [HinhAnh], [DonGia], [NgayCapNhat], [ThongTin], [MoTa], [SoLuongDaBan], [MaNMA_id], [MaLMA_id]) VALUES (8, N'Gỏi Xoài Tôm Khô', N'https://amthuc10phut.vn/wp-content/uploads/2022/11/cach-lam-goi-xoai-tom-kho.jpg', 50000, CAST(N'2021-12-10' AS Date), N'Món gõi xoài chua ngọt rất ngon miệng', N'<p><span style="font-family: ''SF UI Text''; font-size: 15px; text-align: justify; white-space: pre-line;">Gỏi xo&agrave;i t&ocirc;m kh&ocirc; với vẻ ngo&agrave;i bắt mắt bởi m&agrave;u sắc c&ugrave;ng vị chua cay mặn ngọt h&agrave;i h&ograve;a, đậm đ&agrave; m&agrave; vừa miệng. T&ocirc;m kh&ocirc; ngọt ngọt, xo&agrave;i ớt chua chua cay cay h&ograve;a với vị đậm đ&agrave; của nước mắm, c&aacute;i gi&ograve;n tan của đậu phộng rang, th&ecirc;m v&agrave;i chiếc b&aacute;nh phồng t&ocirc;m th&igrave; v&ocirc; c&ugrave;ng ho&agrave;n hảo.</span></p>', 0, 2, 1)
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [HinhAnh], [DonGia], [NgayCapNhat], [ThongTin], [MoTa], [SoLuongDaBan], [MaNMA_id], [MaLMA_id]) VALUES (9, N'Ếch Xào Sả Ớt', N'https://www.cet.edu.vn/wp-content/uploads/2018/04/ech-xao-sa-te.jpg', 50000, CAST(N'2021-12-10' AS Date), N'Ếch ta sào sả ớt', N'<p><span style="font-family: ''SF UI Text''; font-size: 15px; text-align: justify; white-space: pre-line;">M&oacute;n ăn quen thuộc cho kh&aacute;ch nhậu</span></p>', 3, 2, 1)
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [HinhAnh], [DonGia], [NgayCapNhat], [ThongTin], [MoTa], [SoLuongDaBan], [MaNMA_id], [MaLMA_id]) VALUES (10, N'Tôm Sú Nướng Sốt/Muối Ớt/Mật Ong', N'https://alaskavietnam.net/wp-content/uploads/2019/03/huong-dan-lam-tom-su-nuong-muoi-ot-cuc-ngon-tai-nha.jpg', 80000, CAST(N'2021-12-10' AS Date), N'Tôm sú nướng than', N'<p><span style="font-family: ''SF UI Text''; font-size: 15px; text-align: justify; white-space: pre-line;">M&oacute;n t&ocirc;m s&uacute; nướng thơm lừng đảm bảo sẽ l&agrave; m&oacute;n h&uacute;t hồn bạn nhất trong bữa tiệc tự tay nấu của bạn v&agrave; gia đ&igrave;nh cho m&agrave; xem, với t&ocirc;m s&uacute; tươi ngon, phủ đẫm sốt tự chọn (sốt sa tế/sốt chao/sốt riềng mẻ/sốt mật ong...) t&ugrave;y v&agrave;o khẩu vị của bạn v&agrave; bạn b&egrave; gia đ&igrave;nh m&agrave; lựa chọn để nướng ra được m&oacute;n hợp vị khẩu nhất, ngon nhất.</span></p>', 1, 2, 11)
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [HinhAnh], [DonGia], [NgayCapNhat], [ThongTin], [MoTa], [SoLuongDaBan], [MaNMA_id], [MaLMA_id]) VALUES (11, N'Mực Xào Chua Ngọt', N'https://i-giadinh.vnecdn.net/2021/03/31/muc1-1617182767-1435-1617182779.jpg', 60000, CAST(N'2021-12-10' AS Date), N'Món mực sào chua ngọt', N'<p><span style="font-family: ''SF UI Text''; font-size: 15px; text-align: justify; white-space: pre-line;">Mực x&agrave;o chua ngọt c&oacute; lẽ l&agrave; m&oacute;n ăn đổi vị quen thuộc trong bữa cơm nh&agrave; sau những ng&agrave;y thịt th&agrave; ph&aacute;t ng&aacute;n.Miếng mực tươi h&ograve;a quyện với ch&uacute;t ngọt ngọt chua chua tự nhi&ecirc;n từ thơm, c&agrave; chua, h&agrave;nh t&acirc;y c&ugrave;ng g&oacute;i sốt đậm đ&agrave; độc quyền của Cooky Chefs nhất định sẽ khiến cả nh&agrave; thả "like" kh&ocirc;ng ngừng tay!</span></p>', 0, 2, 11)
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [HinhAnh], [DonGia], [NgayCapNhat], [ThongTin], [MoTa], [SoLuongDaBan], [MaNMA_id], [MaLMA_id]) VALUES (12, N'Cá Kèo Kho Thịt Ba Rọi', N'https://cdn.tgdd.vn/2021/02/CookProduct/thumnaildo-1200x675.jpg', 80000, CAST(N'2021-12-10' AS Date), N'Cá kèo kho kèm với thịt heo', N'<p><span style="font-family: ''SF UI Text''; font-size: 15px; text-align: justify; white-space: pre-line;">Để gi&uacute;p cho bạn c&oacute; một thực đơn đa dạng hơn, Cooky m&aacute;ch ri&ecirc;ng cho bạn m&oacute;n ăn d&acirc;n d&atilde; nhưng hao cơm lắm đấy nh&eacute;. C&aacute; k&egrave;o kho tộ ch&iacute;nh l&agrave; một trong những m&oacute;n ăn rất đặc trưng của người Miền Nam n&oacute;i chung v&agrave; người miền T&acirc;y n&oacute;i ri&ecirc;ng.</span></p>', 0, 2, 3)
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [HinhAnh], [DonGia], [NgayCapNhat], [ThongTin], [MoTa], [SoLuongDaBan], [MaNMA_id], [MaLMA_id]) VALUES (13, N'Sườn Non Heo Xào Chua Ngọt', N'https://i-giadinh.vnecdn.net/2021/12/17/Thnhphm2-1639750764-6880-1639751430.jpg', 100000, CAST(N'2021-12-10' AS Date), N'Sườn heo non sào kiểu tây chua chua ngọt ngọt', N'<p><span style="font-family: ''SF UI Text''; font-size: 15px; text-align: justify; white-space: pre-line;">Bạn m&ecirc; sườn, bạn kh&ocirc;ng thể n&agrave;o sống thiếu sườn, l&agrave;m sao bạn bỏ lỡ m&oacute;n Sườn Non X&agrave;o Chua Ngọt trong cuộc đời m&igrave;nh được? Sự h&ograve;a quyện tinh tế giữa vị chua chua, ngọt ngọt, ch&uacute;t b&ugrave;i b&ugrave;i, thơm thơm sẽ đưa bạn đến "đỉnh cao của vị gi&aacute;c" ngay trong bữa cơm đơn giản hằng ng&agrave;y.</span></p>', 0, 2, 3)
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [HinhAnh], [DonGia], [NgayCapNhat], [ThongTin], [MoTa], [SoLuongDaBan], [MaNMA_id], [MaLMA_id]) VALUES (14, N'Lẩu Thái Hải Sản', N'https://haisanviet.com.vn/upload_content/lau-thai-tomyum-giang-vo-ba-dinh.jpg', 120000, CAST(N'2021-12-10' AS Date), N'Lẩu thái thập cẩm ngon ngon', N'<p><span style="font-family: ''SF UI Text''; font-size: 15px; text-align: justify; white-space: pre-line;">Lẩu Th&aacute;i hải sản chua cay l&agrave; m&oacute;n ngon cuối tuần, cho bữa tiệc gia đ&igrave;nh. Lẩu Th&aacute;i hải sản chua cay ngon đ&uacute;ng chuẩn sẽ c&oacute; nước d&ugrave;ng chua ngọt, cay nồng từ sả ớt, k&iacute;ch th&iacute;ch vị gi&aacute;c, gi&uacute;p ăn ngon miệng hơn. Đặc biệt, những ng&agrave;y trời lạnh ngồi qu&acirc;y quần b&ecirc;n nồi lẩu Th&aacute;i chua cay tỏa hương thơm nồng th&igrave; ấm l&ograve;ng hết biết</span></p>', 0, 5, 7)
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [HinhAnh], [DonGia], [NgayCapNhat], [ThongTin], [MoTa], [SoLuongDaBan], [MaNMA_id], [MaLMA_id]) VALUES (15, N'Lẩu Cá Thác Lác Khổ Qua', N'https://cdn.homestory.com.vn/wp-content/uploads/2023/06/lau-ca-thac-lac.jpg', 100000, CAST(N'2021-12-10' AS Date), N'Lẩu cá thác lác ăn kèm khổ khoa + rau sống + cá thác lác ', N'<p><span style="font-family: ''SF UI Text''; font-size: 15px; text-align: justify; white-space: pre-line;">Đảm bảo nếu một lần được thử qua m&oacute;n Lẩu khổ qua c&aacute; th&aacute;c l&aacute;c bạn sẽ ấn tượng ngay bởi sự kết hợp độc đ&aacute;o giữa ch&uacute;t dai, ngọt tự nhi&ecirc;n của c&aacute; th&aacute;c l&aacute;c v&agrave; vị đắng nhẫn nhẫn của khổ qua tạo n&ecirc;n thứ nước d&ugrave;ng thanh đạm, nhẹ nh&agrave;ng nhưng vẫn kh&ocirc;ng k&eacute;m phần</span></p>', 0, 2, 7)
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [HinhAnh], [DonGia], [NgayCapNhat], [ThongTin], [MoTa], [SoLuongDaBan], [MaNMA_id], [MaLMA_id]) VALUES (16, N'Trứng Chiên Thịt Bằm', N'https://www.cet.edu.vn/wp-content/uploads/2019/08/trung-chien-thit-bam.jpg', 20000, CAST(N'2021-12-10' AS Date), N'Trứng chiên kèm thịt heo có vị béo, thơm ngon', N'<p><span style="font-family: ''SF UI Text''; font-size: 15px; text-align: justify; white-space: pre-line;">V&agrave;o những ng&agrave;y lười nấu ăn th&igrave; chỉ với c&aacute;c nguy&ecirc;n liệu cực quen thuộc l&agrave; trứng, thịt bằm, h&agrave;nh l&aacute; v&agrave; ti&ecirc;u xay l&agrave; bạn đ&atilde; c&oacute; ngay m&oacute;n trứng chi&ecirc;n thịt bằm vừa dễ ăn m&agrave; lại đơn giản, tiết kiệm thời gian rồi.</span></p>', 0, 3, 1)
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [HinhAnh], [DonGia], [NgayCapNhat], [ThongTin], [MoTa], [SoLuongDaBan], [MaNMA_id], [MaLMA_id]) VALUES (17, N'Trứng Ngâm Tương Hàn Quốc', N'https://vietair.com.vn/Media/Images/vietair/Tin-tuc/2022/10/trung-ngam-tuong-han-quoc.jpg', 20000, CAST(N'2021-12-10' AS Date), N'Trứng ngâm xì dầu kiểu Nhật Bản', N'<p><span style="font-family: ''SF UI Text''; font-size: 15px; text-align: justify; white-space: pre-line;">Trứng ng&acirc;m nước tương H&agrave;n Quốc đ&atilde; kh&ocirc;ng c&ograve;n xa lạ nữa m&agrave; c&ograve;n lại nổi tiếng như cồn khi được h&agrave;ng loạt c&aacute;c hot mom, food blogger v&agrave; c&aacute;c nghệ sĩ nổi tiếng l&agrave;m thử. "Thời đến cản kh&ocirc;ng kịp" l&agrave; c&oacute; thật, m&oacute;n trứng ng&acirc;m n&agrave;y đ&atilde; v&agrave; đang trở th&agrave;nh hiện tượng được nhiều người t&igrave;m hiểu. Nếu bạn cũng c&oacute; &yacute; định l&agrave;m thử m&oacute;n ăn n&agrave;y, nhưng lại ngại phải đi chợ v&agrave; chưa nắm r&otilde; được c&ocirc;ng thức chế biến, m&igrave;nh sẽ gi&uacute;p bạn ngay đ&acirc;y.</span></p>', 0, 3, 1)
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [HinhAnh], [DonGia], [NgayCapNhat], [ThongTin], [MoTa], [SoLuongDaBan], [MaNMA_id], [MaLMA_id]) VALUES (18, N'Cải Thìa Xào Tỏi Chay', N'https://quanoct2.com/wp-content/uploads/2021/12/cai-thia-xao-toi-quanoct2.com_.png', 20000, CAST(N'2021-12-10' AS Date), N'Cải thìa sào tỏi ít cay dành cho người ăn chay hoặc ăn kiêng', N'<div class="btn-desc-box" style="box-sizing: border-box; font-family: ''SF UI Text''; display: flex; -webkit-box-pack: center; justify-content: center; margin: 15px 0px; color: #000000; font-size: 15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: justify; text-indent: 0px; text-transform: none; white-space: pre-line; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">&nbsp;</div>
<div class="content-x" style="box-sizing: border-box; font-family: ''SF UI Text''; color: #000000; font-size: 15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: justify; text-indent: 0px; text-transform: none; white-space: pre-line; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Trong bữa cơm gia đ&igrave;nh kh&ocirc;ng thể kh&ocirc;ng c&oacute; m&oacute;n rau x&agrave;o, đ&acirc;y l&agrave; m&oacute;n ăn gi&uacute;p ch&uacute;ng ta cảm thấy ngon miệng hơn lại gi&agrave;u vitamin , l&agrave;m m&aacute;t cơ thể. Cải th&igrave;a x&agrave;o tỏi l&agrave; một trong c&aacute;c m&oacute;n rau ăn k&egrave;m rất ngon v&agrave; v&ocirc; c&ugrave;ng đưa cơm. Vị ngọt của rau cải th&igrave;a quyện với vị thơm của tỏi tạo n&ecirc;n một hương vị thơm ngon kh&oacute; cưỡng. Hơn nữa đ&acirc;y c&ograve;n l&agrave; 1 m&oacute;n ăn d&acirc;n d&atilde; dễ thực hiện d&ugrave; bạn chưa c&oacute; nhiều kinh nghiệm bếp n&uacute;c.</div>', 0, 1, 1)
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [HinhAnh], [DonGia], [NgayCapNhat], [ThongTin], [MoTa], [SoLuongDaBan], [MaNMA_id], [MaLMA_id]) VALUES (19, N'Đậu Hũ Cay Sốt Nấm Chay', N'https://abcfood.vn/wp-content/uploads/2023/11/sot-dau-phu-ca-chua.png', 20000, CAST(N'2021-12-10' AS Date), N'Đậu phụ non ', N'<p><span style="font-family: ''SF UI Text''; font-size: 15px; text-align: justify; white-space: pre-line;">Đậu hũ chắc chắn l&agrave; m&oacute;n ăn quen thuộc với mỗi bữa cơm gia đ&igrave;nh. Tuy nhi&ecirc;n, đừng chỉ ăn ho&agrave;i một m&oacute;n đậu hũ chi&ecirc;n, đậu hũ kho. H&atilde;y để Cooky Market giới thiệu cho bạn m&oacute;n Đậu hũ cay sốt nấm hương, chỉ với một thay đổi nhỏ l&agrave; nấm hương v&agrave; sốt cay cũng đủ khiến m&oacute;n ăn th&ecirc;m phần hấp dẫn rồi.</span></p>', 0, 1, 1)
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [HinhAnh], [DonGia], [NgayCapNhat], [ThongTin], [MoTa], [SoLuongDaBan], [MaNMA_id], [MaLMA_id]) VALUES (20, N'Đùi Gà Góc Tư Nấu Nấm Đông Cô', N'https://cdn2.fptshop.com.vn/unsafe/1920x0/filters:quality(100)/2024_1_12_638406885814966017_ga-nau-nam-dong-co-0.jpg', 100000, CAST(N'2021-12-10' AS Date), N'Gà được hầm với nấm tạo ra mùi hương quyến rũ, khó quên', N'<p><span style="font-family: ''SF UI Text''; font-size: 15px; text-align: justify; white-space: pre-line;">Cuối tuần n&agrave;y cả nh&agrave; m&igrave;nh đổi vị với m&oacute;n Đ&ugrave;i g&agrave; g&oacute;c tư nấu nấm đ&ocirc;ng c&ocirc; mới lạ xem nh&eacute;! G&agrave; v&agrave; nấm đ&ocirc;ng c&ocirc; l&agrave; hai nguy&ecirc;n liệu quen thuộc, khi kết hợp với nhau lại tạo n&ecirc;n một cảm gi&aacute;c rất kh&oacute; qu&ecirc;n, một sự h&agrave;i h&ograve;a đến kinh ngạc. Thịt g&agrave; săn chắc, nấm đ&ocirc;ng c&ocirc; thơm m&ugrave;i vị đặc trưng, đắm m&igrave;nh trong sốt chứa pate b&eacute;o ngậy.</span></p>', 0, 4, 2)
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [HinhAnh], [DonGia], [NgayCapNhat], [ThongTin], [MoTa], [SoLuongDaBan], [MaNMA_id], [MaLMA_id]) VALUES (21, N'Thịt kho tàu', N'https://static-images.vnncdn.net/files/publish/2023/3/31/thit-kho-tau-2-183.jpg', 55000, CAST(N'2021-12-10' AS Date), N'Món thịt kho tàu đậm vị truyền thống ngày tết', N'<p>Combo gồm 3 m&oacute;n gi&aacute; si&ecirc;u si&ecirc;u tiết kiệm</p>', 0, 2, 11)
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [HinhAnh], [DonGia], [NgayCapNhat], [ThongTin], [MoTa], [SoLuongDaBan], [MaNMA_id], [MaLMA_id]) VALUES (22, N'Rượu Soju Jinro Hương Mận', N'https://havamall.com/wp-content/uploads/2020/11/soju11.jpg', 60000, CAST(N'2021-12-10' AS Date), N'Rượu Soju Jinro Hương Mận', N'<p>Rượu nhập khẩu H&agrave;n</p>', 0, 5, 10)
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [HinhAnh], [DonGia], [NgayCapNhat], [ThongTin], [MoTa], [SoLuongDaBan], [MaNMA_id], [MaLMA_id]) VALUES (23, N'Bia Tiger', N'https://hangtot247.com/images/products/2024/04/17/8934822842338-1-jpg-342.jpg', 12000, CAST(N'2021-12-10' AS Date), N'Bia tigger được nhập đóng lon tại Việt Nam', N'<p>Loại bia số 1 b&aacute;n chạy Việt nam</p>', 0, 5, 10)
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [HinhAnh], [DonGia], [NgayCapNhat], [ThongTin], [MoTa], [SoLuongDaBan], [MaNMA_id], [MaLMA_id]) VALUES (24, N'Nước Ngọt Có Ga Sprite', N'https://product.hstatic.net/1000288770/product/nuoc_ngot_sprite_huong_chanh_thung_24_chai_x_390ml_38e1b436634e4de39f81ec8091b88193_master.jpg', 15000, CAST(N'2021-12-10' AS Date), N'Nước ngọt có ga không màu, hương vị chanh', N'<p>Loại nước uống sản xuất tại việt nam</p>', 0, 5, 10)
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [HinhAnh], [DonGia], [NgayCapNhat], [ThongTin], [MoTa], [SoLuongDaBan], [MaNMA_id], [MaLMA_id]) VALUES (25, N'Nước Ngọt Có Ga CoCa CoLa', N'https://www.hangngoainhap.com.vn/images/202301/goods_img/3736-p2-1673854381.jpg', 15000, CAST(N'2021-12-10' AS Date), N'Nước ngọt nhập khẩu', N'<p>Nước ngọt c&oacute; doanh thu b&aacute;n lớn nhất Việt Nam 2021</p>', 0, 5, 10)
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [HinhAnh], [DonGia], [NgayCapNhat], [ThongTin], [MoTa], [SoLuongDaBan], [MaNMA_id], [MaLMA_id]) VALUES (26, N'Bia Heineken', N'https://bizweb.dktcdn.net/thumb/grande/100/469/765/products/f570603e69347f0b09d9a7fd0035f877-2d1adefe-4f01-4688-bb06-7c3cb54cd967-90bd225c-6400-4085-925c-d08a65510e9b.jpg', 30000, CAST(N'2021-12-10' AS Date), N'Nước uống có cồn nhập khẩu từ Pháp', N'<p>hương vị l&uacute;a mạch</p>', 0, 5, 10)
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [HinhAnh], [DonGia], [NgayCapNhat], [ThongTin], [MoTa], [SoLuongDaBan], [MaNMA_id], [MaLMA_id]) VALUES (27, N'Nước Tăng Lực Sting Hương Dâu', N'https://storage.googleapis.com/mm-online-bucket/ecommerce-website/uploads/media/386205.jpg', 15000, CAST(N'2021-12-10' AS Date), N'Nước uống có ga vị dâu', N'<p>L&agrave; loại nước uống c&oacute; doanh số b&aacute;n chạy tại Việt Nam</p>', 0, 5, 10)
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [HinhAnh], [DonGia], [NgayCapNhat], [ThongTin], [MoTa], [SoLuongDaBan], [MaNMA_id], [MaLMA_id]) VALUES (28, N'Nước Tăng Lực Redbull', N'https://product.hstatic.net/200000073345/product/nuoc-tang-luc-redbull-chai-150ml-202111260906565259_7719ff4369e546c384aee1c6913fd33e_1024x1024.jpg', 20000, CAST(N'2021-12-10' AS Date), N'Nước uống nhập khẩu Thái Lan', N'<p>Nhập khẩu th&aacute;i</p>', 0, 5, 10)
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [HinhAnh], [DonGia], [NgayCapNhat], [ThongTin], [MoTa], [SoLuongDaBan], [MaNMA_id], [MaLMA_id]) VALUES (29, N'Rượu vang Berri', N'https://caithunggo.com/wp-content/uploads/2024/06/z62.png', 3000000, CAST(N'2021-12-10' AS Date), N'Rượu vang Berri Estates Cabernet Sauvignon 13% chai 750ml', N'<p>Hạn sử dụng sau 3 năm. Nồng độ cồn 13%</p>', 0, 5, 10)
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [HinhAnh], [DonGia], [NgayCapNhat], [ThongTin], [MoTa], [SoLuongDaBan], [MaNMA_id], [MaLMA_id]) VALUES (30, N'Rượu vang Ramirana', N'https://icheckcdn.net/images/original/-TheHulk/63232529b3/1489394147_d61d9f4b9f564d5d87f37968f17ded5e_16e461.jpg', 6000000, CAST(N'2021-12-10' AS Date), N'Rượu ngoại', N'<h1 class="nameproduct" style="margin: 0px 0px 10px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: normal; font-stretch: normal; font-size: 22px; line-height: 1.3em; font-family: Helvetica, Arial, sans-serif; color: #4a4a4a; outline: none; -webkit-font-smoothing: antialiased; text-rendering: geometricprecision; overflow: hidden; background-color: #ffffff;">Rượu vang Ramirana Cabernet Sauvignon 12.5% chai 750ml</h1>', 0, 5, 10)
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [HinhAnh], [DonGia], [NgayCapNhat], [ThongTin], [MoTa], [SoLuongDaBan], [MaNMA_id], [MaLMA_id]) VALUES (31, N'Bia Huda', N'https://salt.tikicdn.com/ts/product/4d/d9/98/ef6541d343eb964388ee21267e099e44.jpg', 15000, CAST(N'2021-12-10' AS Date), N'Bia huda Huế. Đậm tình miền trung', N'<p><span style="color: #333333; font-family: Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff;">Sản phẩm được sản xuất theo quy tr&igrave;nh hiện đại v&agrave; kh&ocirc;ng chứa h&oacute;a chất độc hại mang đến chất lượng ho&agrave;n hảo cho người sử dụng. bia </span><span style="color: #333333; font-family: Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff;">c&oacute; m&agrave;u v&agrave;ng &oacute;ng, m&ugrave;i thơm đặc trưng, hương vị đậm đ&agrave;, hấp dẫn vị gi&aacute;c. Sản phẩm từ thương hiệu Huda </span><span style="color: #333333; font-family: Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff;">chất lượng với c&ocirc;ng nghệ&nbsp; bia </span><span style="color: #333333; font-family: Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff;">Đan Mạch</span></p>', 0, 5, 10)
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [HinhAnh], [DonGia], [NgayCapNhat], [ThongTin], [MoTa], [SoLuongDaBan], [MaNMA_id], [MaLMA_id]) VALUES (32, N'Rượu Vodka Men', N'https://ruouhcm.com/upload/Vodka/Ruou_Vodka_Men.1.jpg', 80000, CAST(N'2021-12-10' AS Date), N'Rượu Vodka Men 39.5% chai 500ml', N'<p>D&agrave;nh cho người tr&ecirc;n 18 tuổi</p>', 0, 5, 10)

SET IDENTITY_INSERT [dbo].[MonAn] OFF
GO
SET IDENTITY_INSERT [dbo].[NguyenLieu] ON 

INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (1, N'Khăn Lạnh', 503, N'Khăn lạnh dùng để lau miệng', 5000, 5)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (4, N'Cá Lóc', 47.6, N'Cá lóc hải sản', 50000, 1)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (5, N'Hành Lá', 10, N'Gia vị hàng lá', 10000, 2)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (8, N'Tỏi', 10, N'Tỏi nguyên liệu Việt', 50000, 2)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (9, N'Rau Muống', 10, N'Rau muốn trồng tại ao ', 30000, 2)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (10, N'Mè', 10, N'Mè trắng', 100000, 2)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (11, N'Thịt Heo', 9.5, N'Heo ba rọi (heo tơ)', 200000, 5)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (12, N'Xà lách', 10, N'rau xà lách', 40000, 2)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (13, N'Tiêu', 10, N'Hạt tiêu nhập từ DakLak', 200000, 3)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (14, N'Gà', 10, N'Gà kiến việt nam', 200000, 5)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (15, N'Bột Chiên', 10, N'Bột Chiên các món ăn như đùi gà chiên, chả cá chiên...', 50000, 3)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (16, N'Dầu Ăn', 10, N'Dầu để chiên', 40000, 3)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (17, N'Xoài', 10, N'Xoài bào nhỏ theo sợi để làm gỏi hoặc làm trái cây tráng miệng', 80000, 2)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (18, N'Tôm Khô', 50, N'Tôm sấy khô sẵn', 100000, 1)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (19, N'Bột Gia Vị', 10, N'Bột dùng để làm gõi chua ngọt', 20000, 3)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (20, N'Sả ', 10, N'Sả để làm nguyên liệu chế biến', 300000, 2)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (21, N'Hành Tím', 10, N'Hành tím để làm nguyên liệu chế biến', 70000, 2)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (22, N'Ếch', 48.5, N'Ếch đồng việt nam', 200000, 1)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (23, N'Ớt Trái Đỏ', 10, N'Ớt trái đỏ, loại cay', 55000, 2)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (24, N'Ớt Trái Xanh', 10, N'Ớt trái xanh, loại ít cay hoặc không cay', 55000, 2)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (25, N'Muối Ớt Xanh', 10, N'Muối ớt nhập từ Mỹ đễ có mùi vị ngon nhất', 10000, 3)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (26, N'Sốt Nướng Sa Tế', 10, N'Gia vị để làm màu khi nướng BBQ', 8000, 3)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (27, N'Tôm Sú', 49, N'Tôm sú nuôi loại to', 300000, 1)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (28, N'Mật Ong', 10, N'Mật ong rừng nguyên chất để làm gia vị', 180000, 3)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (29, N'Mực Lá', 50, N'Mực lá tươi (con lớn)', 250000, 1)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (30, N'Cá Kèo', 50, N'Cá kèo to', 400000, 1)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (31, N'Sườn Heo', 10, N'Sườn heo non thịt ngon', 500000, 5)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (32, N'Đường', 10, N'Đường, gia vị món ăn', 30000, 3)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (33, N'Giấm', 10, N'Gia vị món ăn thêm chua, ngon miệng', 25000, 3)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (34, N'Rau Sống Các Loại', 10, N'Rau sống được mix đủ các loại như (Giá, sà lách, rau thơi, rau muốn chỉ...) để làm rau sống', 100000, 2)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (35, N'Cá Viên', 50, N'Cá viên làm cừ cá thác lác, basa, thịt heo', 20000, 1)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (36, N'Nước Cốt Lẩu Chua Cay', 10, N'Nước cố được chế biến sẵn, làm lẩu nhanh', 50000, 5)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (37, N'Cá Thác Lác Nguyên Chất', 50, N'Cá thác lám bằm làm chả nguyên chất, tự nhiên không chất bảo quản', 150000, 1)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (38, N'Khổ Qua', 10, N'Khổ qua đắng trồng và nhập khẩu từ Đà Lạt', 120000, 2)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (39, N'Tiêu Xanh', 10, N'Tiêu xanh daklak', 300000, 2)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (40, N'Trứng Gà Công Nghiệp', 100, N'trứng gà nuôi công nghiệp nhập khẩu', 1000, 5)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (41, N'Kim Chi', 10, N'Kim chi Hàn Quốc', 50000, 2)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (42, N'Tương (Xì Dầu)', 10, N'Nước chấm xì dầu (chay)', 25000, 3)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (43, N'Cải Thìa', 10, N'Cải thìa bẹ to Trung Quốc', 40000, 2)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (44, N'Đậu Hũ (Đậu Phụ Thối)', 50, N'Đậu nành lên men nguyên chất', 1000, 5)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (45, N'Nấm Công Đô', 10, N'Nấm công đô Hàn Quốc', 25000, 2)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (46, N'Cá Nục', 50, N'Cá nục ướp đá đánh bắt', 200000, 1)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (47, N'Đậu Que', 10, N'Đậu que hay còn gọi là đậu Lave', 80000, 2)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (48, N'Cà Chua', 10, N'Cà chua đỏ đà lạt', 90000, 2)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (49, N'Rượu Soju Jinro Hương Mận', 10, N'Rượu nhập khẩu Hàn Quốc', 90000, 4)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (50, N'Bia Tiger', 240, N'Bia Tiger nâu lon', 16000, 4)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (51, N'Nước Ngọt Có Ga Sprite', 240, N'Nước ngọt có ga lon', 15000, 4)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (52, N'Nước Ngọt Có Ga CoCa CoLa', 240, N'Nước ngọt có ga lon coca cola', 15000, 4)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (53, N'Bia Heineken', 240, N'Nước uống có cồn', 30000, 4)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (54, N'Nước Tăng Lực Sting Hương Dâu', 240, N'Nước uống ga màu đỏ', 15000, 4)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (55, N'Nước Tăng Lực Redbull', 240, N'Nước uống không có ga mùi bạc hà, màu vàng', 25000, 4)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (56, N'Rượu vang Berri Estates', 5, N'Rượu vang Berri Estates Cabernet Sauvignon 13% chai 750ml', 4000000, 4)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (57, N'Rượu vang Ramirana ', 20, N'Rượu vang Ramirana Cabernet Sauvignon 12.5% chai 750ml', 10000000, 4)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (58, N'Bia Huda', 240, N'Bia Huda 330ml', 16000, 4)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (59, N'Rượu Vodka Men', 50, N'Rượu có cồn cao', 100000, 4)
SET IDENTITY_INSERT [dbo].[NguyenLieu] OFF
GO
INSERT [dbo].[NguyenLieuTra] ([MaHoanTra_id], [MaNguyenLieu_id], [SoLuongTra], [DonGia], [ThanhTien]) VALUES (1, 1, 6, NULL, NULL)
INSERT [dbo].[NguyenLieuTra] ([MaHoanTra_id], [MaNguyenLieu_id], [SoLuongTra], [DonGia], [ThanhTien]) VALUES (2, 1, 2, NULL, NULL)
GO
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (106, 4, 0.4, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (108, 22, 0.5, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (109, 4, 0.4, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (110, 1, 1, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (111, 4, 0.4, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (111, 5, 0.2, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (112, 22, 0.5, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (113, 1, 1, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (114, 11, 0.5, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (115, 27, 1, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (116, 1, 1, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (117, 4, 0.4, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[NhaCC] ON 

INSERT [dbo].[NhaCC] ([MaNCC], [TenNCC], [DiaChi], [SoDienThoai]) VALUES (1, N'Cung Cấp Hải Sản Tươi Cần Thơ', N'Cần Thơ', N'0971024568')
INSERT [dbo].[NhaCC] ([MaNCC], [TenNCC], [DiaChi], [SoDienThoai]) VALUES (2, N'Cung Cấp Rau Sạch DaLatVegatable', N'Sài Gòn', N'0971024568')
INSERT [dbo].[NhaCC] ([MaNCC], [TenNCC], [DiaChi], [SoDienThoai]) VALUES (3, N'Cung Cấp Gia Vị Trường An', N'Sài Gòn', N'0971024568')
INSERT [dbo].[NhaCC] ([MaNCC], [TenNCC], [DiaChi], [SoDienThoai]) VALUES (4, N'Cung Cấp Gia Vị Thuận Phát', N'Sài Gòn', N'0654251543')
INSERT [dbo].[NhaCC] ([MaNCC], [TenNCC], [DiaChi], [SoDienThoai]) VALUES (5, N'Đại Lý Bia Sài Gòn', N'Sài Gòn', N'0254587854')
INSERT [dbo].[NhaCC] ([MaNCC], [TenNCC], [DiaChi], [SoDienThoai]) VALUES (6, N'Đại Lý Bia Và Nước Uống Chánh Thắng', N'Sài Gòn', N'0123654585')
INSERT [dbo].[NhaCC] ([MaNCC], [TenNCC], [DiaChi], [SoDienThoai]) VALUES (8, N'Vinmart Cần Thơ', N'Cần Thơ', N'0123456778')
SET IDENTITY_INSERT [dbo].[NhaCC] OFF
GO
INSERT [dbo].[NhanVien] ([MANV], [TaiKhoanNV] ,[MatKhauNV], [TenNhanVien], [NgaySinh], [SoDienThoai], [MaQuyen_id], [TrangThai]) VALUES (1, N'Admin', N'abc123', N'NV Admin', CAST(N'2000-05-05' AS Date), N'0347234567', 3, 1)
INSERT [dbo].[NhanVien] ([MANV], [TaiKhoanNV] ,[MatKhauNV], [TenNhanVien], [NgaySinh], [SoDienThoai], [MaQuyen_id], [TrangThai]) VALUES (2, N'Duy', N'abc123', N'Duy', CAST(N'2001-05-06' AS Date), N'0346923002', 4, 0)
INSERT [dbo].[NhanVien] ([MANV], [TaiKhoanNV] ,[MatKhauNV], [TenNhanVien], [NgaySinh], [SoDienThoai], [MaQuyen_id], [TrangThai]) VALUES (3, N'kho', N'abc123', N'kho', CAST(N'2024-04-04' AS Date), N'0987654444', 2, NULL)
INSERT [dbo].[NhanVien] ([MANV], [TaiKhoanNV] ,[MatKhauNV], [TenNhanVien], [NgaySinh], [SoDienThoai], [MaQuyen_id], [TrangThai]) VALUES (4, N'Nam', N'abc123', N'Nam', CAST(N'2001-02-03' AS Date), N'0972938432', 4, 0)
INSERT [dbo].[NhanVien] ([MANV], [TaiKhoanNV] ,[MatKhauNV], [TenNhanVien], [NgaySinh], [SoDienThoai], [MaQuyen_id], [TrangThai]) VALUES (5, N'NhanVienA', N'abc123', N'Nhân Viên', CAST(N'1998-02-08' AS Date), N'0123654875', 2, 0)
INSERT [dbo].[NhanVien] ([MANV], [TaiKhoanNV] ,[MatKhauNV], [TenNhanVien], [NgaySinh], [SoDienThoai], [MaQuyen_id], [TrangThai]) VALUES (6, N'PhuongNam', N'abc123', N'Phương Nam', CAST(N'1998-08-08' AS Date), N'0974542845', 2, 0)
INSERT [dbo].[NhanVien] ([MANV], [TaiKhoanNV] ,[MatKhauNV], [TenNhanVien], [NgaySinh], [SoDienThoai], [MaQuyen_id], [TrangThai]) VALUES (7, N'ThanhDuy', N'abc123', N'Thanh Duy', CAST(N'1998-02-08' AS Date), N'0123654875', 1, 0)
INSERT [dbo].[NhanVien] ([MANV], [TaiKhoanNV] ,[MatKhauNV], [TenNhanVien], [NgaySinh], [SoDienThoai], [MaQuyen_id], [TrangThai]) VALUES (8, N'VanA', N'abc123', N'Nguyễn Văn A', CAST(N'2001-11-18' AS Date), N'0873636363', 4, 0)
GO
SET IDENTITY_INSERT [dbo].[NhomMonAn] ON 

INSERT [dbo].[NhomMonAn] ([MaNMA], [TenNMA]) VALUES (1, N'Món Chay')
INSERT [dbo].[NhomMonAn] ([MaNMA], [TenNMA]) VALUES (2, N'Món Việt')
INSERT [dbo].[NhomMonAn] ([MaNMA], [TenNMA]) VALUES (3, N'Món Nhật')
INSERT [dbo].[NhomMonAn] ([MaNMA], [TenNMA]) VALUES (4, N'Món Âu')
INSERT [dbo].[NhomMonAn] ([MaNMA], [TenNMA]) VALUES (5, N'Món Khác')
SET IDENTITY_INSERT [dbo].[NhomMonAn] OFF
GO
SET IDENTITY_INSERT [dbo].[PhieuNhap] ON 

INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [TongTien], [MANV], [MaNCC_id]) VALUES (3, CAST(N'2023-11-17' AS Date), 83500000, 1, 1)
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [TongTien], [MANV], [MaNCC_id]) VALUES (4, CAST(N'2023-11-17' AS Date), 15950000, 2, 2)
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [TongTien], [MANV], [MaNCC_id]) VALUES (5, CAST(N'2023-11-17' AS Date), 5880000, 3, 3)
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [TongTien], [MANV], [MaNCC_id]) VALUES (6, CAST(N'2023-11-17' AS Date), 257580000, 4, 6)
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [TongTien], [MANV], [MaNCC_id]) VALUES (7, CAST(N'2023-11-17' AS Date), 12150000, 5, 8)
SET IDENTITY_INSERT [dbo].[PhieuNhap] OFF
GO
SET IDENTITY_INSERT [dbo].[Quyen] ON 

INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen], [GhiChu]) VALUES (1, N'Nhân Viên', N'Nhân viên sử dụng phần mềm để order')
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen], [GhiChu]) VALUES (2, N'Nhân Viên Kho', N'Nhân viên sử dụng phần mềm để quản lý kho')
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen], [GhiChu]) VALUES (3, N'Nhân Viên Admin', N'Nhân viên sử dụng phần mềm để quản lý nhân viên và nhân viên kho')
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen], [GhiChu]) VALUES (4, N'Nhân Viên Phục Vụ', N'Nhân viên không sử dụng phần mềm. Nhưng được dùng để quản lý thông tin làm việc')
SET IDENTITY_INSERT [dbo].[Quyen] OFF
GO
SET IDENTITY_INSERT [dbo].[Tang] ON 

INSERT [dbo].[Tang] ([MaTang], [TenTang]) VALUES (1, N'Tầng 1')
INSERT [dbo].[Tang] ([MaTang], [TenTang]) VALUES (2, N'Tầng 2')
INSERT [dbo].[Tang] ([MaTang], [TenTang]) VALUES (3, N'Tầng 3')
SET IDENTITY_INSERT [dbo].[Tang] OFF
GO
SET IDENTITY_INSERT [dbo].[XuatKho] ON 

INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (106, CAST(N'2023-11-17T23:06:14.907' AS DateTime), CAST(N'2023-11-17T23:06:14.897' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (107, CAST(N'2023-11-17T23:06:18.423' AS DateTime), CAST(N'2023-11-17T23:06:18.417' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (108, CAST(N'2023-11-17T23:06:20.493' AS DateTime), CAST(N'2023-11-17T23:06:20.487' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (109, CAST(N'2024-04-15T17:33:51.760' AS DateTime), CAST(N'2024-04-15T17:33:51.707' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (110, CAST(N'2024-04-15T17:34:01.810' AS DateTime), CAST(N'2024-04-15T17:34:01.780' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (111, CAST(N'2024-04-15T17:34:07.723' AS DateTime), CAST(N'2024-04-15T17:34:07.683' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (112, CAST(N'2024-04-15T17:34:14.977' AS DateTime), CAST(N'2024-04-15T17:34:14.953' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (113, CAST(N'2024-04-15T17:35:00.910' AS DateTime), CAST(N'2024-04-15T17:35:00.883' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (114, CAST(N'2024-04-15T17:35:06.527' AS DateTime), CAST(N'2024-04-15T17:35:06.497' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (115, CAST(N'2024-04-15T17:35:11.393' AS DateTime), CAST(N'2024-04-15T17:35:11.363' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (116, CAST(N'2024-04-15T21:36:27.730' AS DateTime), CAST(N'2024-04-15T21:36:27.687' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (117, CAST(N'2024-04-15T21:36:33.030' AS DateTime), CAST(N'2024-04-15T21:36:33.003' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[XuatKho] OFF
GO

DECLARE @StartDate DATE = '2024-12-01'; -- Ngày bắt đầu
DECLARE @EndDate DATE = '2024-12-10';   -- Ngày kết thúc
DECLARE @CurrentDate DATE = @StartDate;

WHILE @CurrentDate <= @EndDate
BEGIN
    INSERT INTO BangChamCong (TuNgay, DenNgay)
    VALUES (
        CAST(@CurrentDate AS DATETIME) + '08:00:00', -- TuNgay
        CAST(@CurrentDate AS DATETIME) + '17:00:00'  -- DenNgay
    );

    SET @CurrentDate = DATEADD(DAY, 1, @CurrentDate); -- Sang ngày tiếp theo
END;

GO
ALTER TABLE [dbo].[Ban] ADD  DEFAULT ((4)) FOR [SoGhe]
GO
ALTER TABLE [dbo].[Ban] ADD  DEFAULT ((0)) FOR [Vip]
GO
ALTER TABLE [dbo].[Ban] ADD  DEFAULT ((0)) FOR [TinhTrang]
GO
ALTER TABLE [dbo].[ChiTietHoaDon] ADD  DEFAULT (getdate()) FOR [NgayGoi]
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap] ADD  DEFAULT ((0)) FOR [SoLuongNhap]
GO
ALTER TABLE [dbo].[ChiTietSanPham] ADD  DEFAULT ((0)) FOR [SoLuongDung]
GO
ALTER TABLE [dbo].[ChiTietSanPham] ADD  DEFAULT ((0)) FOR [Tru]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF__HoaDon__TenKhach__5441852A]  DEFAULT (N'Khach Hang A') FOR [TenKhachHang]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF__HoaDon__NgayTao__5535A963]  DEFAULT (getdate()) FOR [NgayTao]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF__HoaDon__TrangTha__5629CD9C]  DEFAULT ((0)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[HoanTra] ADD  DEFAULT (getdate()) FOR [NgayHoanTra]
GO
ALTER TABLE [dbo].[HoanTra] ADD  DEFAULT ((0)) FOR [TongTien]
GO
ALTER TABLE [dbo].[LichSuGoiMon] ADD  DEFAULT (getdate()) FOR [ThoiGianGoi]
GO
ALTER TABLE [dbo].[LichSuGoiMon] ADD  DEFAULT (getdate()) FOR [ThoiGianTra]
GO
ALTER TABLE [dbo].[LoaiMonAn] ADD  DEFAULT ((0)) FOR [TongSoLuong]
GO
ALTER TABLE [dbo].[LoaiNguyenLieu] ADD  DEFAULT ((0)) FOR [TongSoLuong]
GO
ALTER TABLE [dbo].[MonAn] ADD  DEFAULT ((0)) FOR [DonGia]
GO
ALTER TABLE [dbo].[MonAn] ADD  DEFAULT (getdate()) FOR [NgayCapNhat]
GO
ALTER TABLE [dbo].[MonAn] ADD  DEFAULT ((0)) FOR [SoLuongDaBan]
GO
ALTER TABLE [dbo].[NguyenLieu] ADD  DEFAULT ((0)) FOR [SoLuongHienCon]
GO
ALTER TABLE [dbo].[NguyenLieu] ADD  DEFAULT ((0)) FOR [GiaNhapCuoi]
GO
ALTER TABLE [dbo].[NguyenLieuXuat] ADD  CONSTRAINT [DF__NguyenLie__SoLuo__68487DD7]  DEFAULT ((0)) FOR [SoLuongXuat]
GO
ALTER TABLE [dbo].[PhieuNhap] ADD  DEFAULT (getdate()) FOR [NgayNhap]
GO
ALTER TABLE [dbo].[PhieuNhap] ADD  DEFAULT ((0)) FOR [TongTien]
GO
ALTER TABLE [dbo].[XuatKho] ADD  DEFAULT (getdate()) FOR [NgayNhap]
GO
ALTER TABLE [dbo].[XuatKho] ADD  DEFAULT ((0)) FOR [TongTien]
GO

SET IDENTITY_INSERT [dbo].[LOAIKHUVUC] ON
GO
INSERT INTO LOAIKHUVUC (MaLoaiKhuVuc, TenLoaiKhuVuc)
VALUES
(1, 'Loại 1'),
(2, 'Loại 2'),
(3, 'Loại 3'),
(4, 'Loại 4');
SET IDENTITY_INSERT [dbo].[LOAIKHUVUC] OFF
GO

SET IDENTITY_INSERT [dbo].[KHUVUC] ON
GO
INSERT INTO KhuVuc (MaKhuVuc, TenKhuVuc, MaTang, MaLoaiKhuVuc)
VALUES
(1, 'Khu Vuc 1', NULL, 1),
(2, 'Khu Vuc 2', 1, 2),
(3, 'Khu Vuc 3', 2, 3),
(4, 'Khu Vuc 4', NULL, 4);
SET IDENTITY_INSERT [dbo].[KHUVUC] OFF
GO

-- Tạo ràng buộc khóa ngoại giữa Ban và KHUVUC
ALTER TABLE [dbo].[Ban]
ADD CONSTRAINT FK_Ban_KhuVuc
FOREIGN KEY (MaKhuVuc)
REFERENCES [dbo].[KHUVUC] (MaKhuVuc);

-- Tạo ràng buộc khóa ngoại giữa KHUVUC và Tang
ALTER TABLE [dbo].[KHUVUC]
ADD CONSTRAINT FK_KhuVuc_Tang
FOREIGN KEY (MaTang)
REFERENCES [dbo].[Tang] (MaTang);

ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK__ChiTietHo__MaHoa__5AEE82B9] FOREIGN KEY([MaHoaDon_id])
REFERENCES [dbo].[HoaDon] ([MaHoaDon])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK__ChiTietHo__MaHoa__5AEE82B9]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD FOREIGN KEY([MaMonAn_id])
REFERENCES [dbo].[MonAn] ([MaMonAn])
GO
ALTER TABLE [dbo].[KhuVuc]  WITH CHECK ADD FOREIGN KEY([MaLoaiKhuVuc])
REFERENCES [dbo].[LoaiKhuVuc] ([MaLoaiKhuVuc])

GO

/*
ALTER TABLE [dbo].[Ban]  WITH CHECK ADD FOREIGN KEY([MaKhuVuc])
REFERENCES [dbo].[KhuVuc] ([MaKhuVuc])
GO
*/

ALTER TABLE [dbo].[CTPHIEUDATBAN]  WITH CHECK ADD FOREIGN KEY([MaBan])
REFERENCES [dbo].[Ban] ([MaBan])

GO
ALTER TABLE [dbo].[CTPHIEUDATBAN]  WITH CHECK ADD FOREIGN KEY([MaPhieuDB])
REFERENCES [dbo].[PHIEUDATBAN] ([MaPhieuDB])

GO
ALTER TABLE [dbo].[PHIEUDATBAN]  WITH CHECK ADD FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])

GO
ALTER TABLE [dbo].[PHIEUGOIMON]  WITH CHECK ADD FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])

GO
ALTER TABLE [dbo].[CTPhieuGoiMon]  WITH CHECK ADD FOREIGN KEY([MaPhieuGoi])
REFERENCES [dbo].[PhieuGoiMon] ([MaPhieuGoi])

GO
ALTER TABLE [dbo].[CTPhieuGoiMon]  WITH CHECK ADD FOREIGN KEY([MaMonAn])
REFERENCES [dbo].[MonAn] ([MaMonAn])

GO
ALTER TABLE [dbo].[CTBangChamCong]  WITH CHECK ADD FOREIGN KEY([MANV])
REFERENCES [dbo].[NhanVien] ([MANV])

GO
ALTER TABLE [dbo].[CTBangChamCong]  WITH CHECK ADD FOREIGN KEY([MACC])
REFERENCES [dbo].[BangChamCong] ([MACC])

GO
ALTER TABLE [dbo].[QuyetDinhTuyenDung]  WITH CHECK ADD FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])

GO
ALTER TABLE [dbo].[QuyetDinhTuyenDung]  WITH CHECK ADD FOREIGN KEY([MaPhongBan])
REFERENCES [dbo].[PhongBan] ([MaPhongBan])

GO
ALTER TABLE [dbo].[ChiTietPhieuNhap]  WITH CHECK ADD FOREIGN KEY([MaNguyenLieu_id])
REFERENCES [dbo].[NguyenLieu] ([MaNguyenLieu])
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap]  WITH CHECK ADD FOREIGN KEY([MaPhieuNhap_id])
REFERENCES [dbo].[PhieuNhap] ([MaPhieuNhap])
GO
ALTER TABLE [dbo].[ChiTietSanPham]  WITH CHECK ADD FOREIGN KEY([MaMonAn_id])
REFERENCES [dbo].[MonAn] ([MaMonAn])
GO
ALTER TABLE [dbo].[ChiTietSanPham]  WITH CHECK ADD FOREIGN KEY([MaNguyenLieu_id])
REFERENCES [dbo].[NguyenLieu] ([MaNguyenLieu])
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK__HoaDon__MaBan_id__571DF1D5] FOREIGN KEY([MaBan_id])
REFERENCES [dbo].[Ban] ([MaBan])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK__HoaDon__MaBan_id__571DF1D5]
GO
ALTER TABLE [dbo].[LichSuGoiMon]  WITH CHECK ADD FOREIGN KEY([MaMonAn_id])
REFERENCES [dbo].[MonAn] ([MaMonAn])
GO
ALTER TABLE [dbo].[LichSuGoiMon]  WITH CHECK ADD  CONSTRAINT [FK__LichSuGoi__MaMon__60A75C0F] FOREIGN KEY([MaHoaDon_id])
REFERENCES [dbo].[HoaDon] ([MaHoaDon])
GO
ALTER TABLE [dbo].[LichSuGoiMon] CHECK CONSTRAINT [FK__LichSuGoi__MaMon__60A75C0F]
GO
ALTER TABLE [dbo].[MonAn]  WITH CHECK ADD FOREIGN KEY([MaLMA_id])
REFERENCES [dbo].[LoaiMonAn] ([MaLMA])
GO
ALTER TABLE [dbo].[MonAn]  WITH CHECK ADD FOREIGN KEY([MaNMA_id])
REFERENCES [dbo].[NhomMonAn] ([MaNMA])
GO
ALTER TABLE [dbo].[NguyenLieu]  WITH CHECK ADD FOREIGN KEY([MaLNL_id])
REFERENCES [dbo].[LoaiNguyenLieu] ([MaLNL])
GO
ALTER TABLE [dbo].[NguyenLieuTra]  WITH CHECK ADD FOREIGN KEY([MaHoanTra_id])
REFERENCES [dbo].[HoanTra] ([MaHoanTra])
GO
ALTER TABLE [dbo].[NguyenLieuTra]  WITH CHECK ADD FOREIGN KEY([MaNguyenLieu_id])
REFERENCES [dbo].[NguyenLieu] ([MaNguyenLieu])
GO
ALTER TABLE [dbo].[NguyenLieuXuat]  WITH CHECK ADD  CONSTRAINT [FK__NguyenLie__MaNgu__6A30C649] FOREIGN KEY([MaNguyenLieu_id])
REFERENCES [dbo].[NguyenLieu] ([MaNguyenLieu])
GO
ALTER TABLE [dbo].[NguyenLieuXuat] CHECK CONSTRAINT [FK__NguyenLie__MaNgu__6A30C649]
GO
ALTER TABLE [dbo].[NguyenLieuXuat]  WITH CHECK ADD  CONSTRAINT [FK__NguyenLie__MaXua__693CA210] FOREIGN KEY([MaXuatKho_id])
REFERENCES [dbo].[XuatKho] ([MaXuatKho])
GO
ALTER TABLE [dbo].[NguyenLieuXuat] CHECK CONSTRAINT [FK__NguyenLie__MaXua__693CA210]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD FOREIGN KEY([MaQuyen_id])
REFERENCES [dbo].[Quyen] ([MaQuyen])
GO
ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD FOREIGN KEY([MaNCC_id])
REFERENCES [dbo].[NhaCC] ([MaNCC])
GO
ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD FOREIGN KEY([MANV])
REFERENCES [dbo].[NhanVien] ([MANV])
GO

ALTER TABLE [dbo].[Ban]  WITH CHECK ADD FOREIGN KEY([MaTang_id])
REFERENCES [dbo].[Tang] ([MaTang])
GO

ALTER DATABASE [NhaHang] SET  READ_WRITE 
GO

USE [master]
GO