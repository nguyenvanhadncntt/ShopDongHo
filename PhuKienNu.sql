USE [master]
GO
/****** Object:  Database [phukiennu]    Script Date: 1/20/2017 8:54:53 PM ******/
CREATE DATABASE [phukiennu]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Thoitrangnu', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.THEHAPROK\MSSQL\DATA\trangsucphukienteen.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Thoitrangnu_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.THEHAPROK\MSSQL\DATA\trangsucphukienteen_1.ldf' , SIZE = 20096KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [phukiennu] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [phukiennu].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [phukiennu] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [phukiennu] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [phukiennu] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [phukiennu] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [phukiennu] SET ARITHABORT OFF 
GO
ALTER DATABASE [phukiennu] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [phukiennu] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [phukiennu] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [phukiennu] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [phukiennu] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [phukiennu] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [phukiennu] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [phukiennu] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [phukiennu] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [phukiennu] SET  DISABLE_BROKER 
GO
ALTER DATABASE [phukiennu] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [phukiennu] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [phukiennu] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [phukiennu] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [phukiennu] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [phukiennu] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [phukiennu] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [phukiennu] SET RECOVERY FULL 
GO
ALTER DATABASE [phukiennu] SET  MULTI_USER 
GO
ALTER DATABASE [phukiennu] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [phukiennu] SET DB_CHAINING OFF 
GO
ALTER DATABASE [phukiennu] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [phukiennu] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [phukiennu] SET DELAYED_DURABILITY = DISABLED 
GO
USE [phukiennu]
GO
/****** Object:  UserDefinedFunction [dbo].[Soluonghangmua]    Script Date: 1/20/2017 8:54:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Soluonghangmua]( 
@email VARCHAR(50)
)  
RETURNS INT 
AS
BEGIN
	DECLARE @diemthuong int
	select @diemthuong=(select Sum(SOLUONG) from CHITIETDH cthd join  HOADON hd on cthd.MaHD=hd.MaHD where Email=@email)
	RETURN @diemthuong
END
GO
/****** Object:  UserDefinedFunction [dbo].[Sotiendamuahang]    Script Date: 1/20/2017 8:54:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Sotiendamuahang]( 
@email VARCHAR(50)
)  
RETURNS INT 
AS
BEGIN
	DECLARE @st int
	select @st=(select Sum(SOLUONG * DONGIA) from CHITIETDH cthd join  HOADON hd on cthd.MaHD=hd.MaHD where Email=@email)
	RETURN @st
END

GO
/****** Object:  Table [dbo].[CHITIETDH]    Script Date: 1/20/2017 8:54:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CHITIETDH](
	[MaHD] [varchar](50) NOT NULL,
	[MaSP] [varchar](50) NOT NULL,
	[SOLUONG] [int] NOT NULL,
	[DONGIA] [int] NOT NULL,
 CONSTRAINT [PK_CHITIETDH] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HOADON]    Script Date: 1/20/2017 8:54:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HOADON](
	[MaHD] [varchar](50) NOT NULL,
	[NgayDat] [date] NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[DiaChiGiaoHang] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_HOADON] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LOAIHANG]    Script Date: 1/20/2017 8:54:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOAIHANG](
	[MALOAI] [int] IDENTITY(1,1) NOT NULL,
	[TENLOAI] [nvarchar](50) NULL,
 CONSTRAINT [PK_LOAIHANG] PRIMARY KEY CLUSTERED 
(
	[MALOAI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NHOMHANG]    Script Date: 1/20/2017 8:54:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHOMHANG](
	[MANH] [int] NOT NULL,
	[TENNH] [nvarchar](50) NULL,
 CONSTRAINT [PK_NHOMHANG] PRIMARY KEY CLUSTERED 
(
	[MANH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QUANGCAO]    Script Date: 1/20/2017 8:54:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QUANGCAO](
	[MAQUANGCAO] [int] IDENTITY(1,1) NOT NULL,
	[TENCONGTY] [nvarchar](50) NULL,
	[DIACHI] [nvarchar](50) NULL,
	[SDT] [nvarchar](50) NULL,
	[EMAIL] [nvarchar](50) NULL,
	[ANHQUANGCAO] [ntext] NULL,
 CONSTRAINT [PK_QUANGCAO] PRIMARY KEY CLUSTERED 
(
	[MAQUANGCAO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SANPHAM]    Script Date: 1/20/2017 8:54:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SANPHAM](
	[MaSP] [varchar](50) NOT NULL,
	[TenSP] [nvarchar](50) NULL,
	[MaNH] [int] NULL,
	[ANHSP] [varchar](max) NULL,
	[SOLUONG] [int] NULL,
	[CHITIET] [ntext] NULL,
	[DONGIA] [float] NULL,
	[NGAYCAPNHAP] [date] NULL,
 CONSTRAINT [PK_SANPHAM] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TAIKHOAN]    Script Date: 1/20/2017 8:54:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TAIKHOAN](
	[Email] [varchar](50) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[GioiTinh] [int] NOT NULL,
	[DiaChi] [nvarchar](50) NOT NULL,
	[MatKhau] [varchar](50) NOT NULL,
	[SoDT] [varchar](15) NULL,
	[Quyen] [int] NOT NULL,
	[image] [nvarchar](50) NULL,
 CONSTRAINT [PK_TAIKHOAN] PRIMARY KEY CLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[v_spnew]    Script Date: 1/20/2017 8:54:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[v_spnew]
as
select top 24 s.*,n.TENNH from SANPHAM s join NHOMHANG n on s.MaNH=n.MANH where day(NGAYCAPNHAP)>15
GO
INSERT [dbo].[CHITIETDH] ([MaHD], [MaSP], [SOLUONG], [DONGIA]) VALUES (N'1', N'354', 1, 20000)
INSERT [dbo].[CHITIETDH] ([MaHD], [MaSP], [SOLUONG], [DONGIA]) VALUES (N'1', N'359', 1, 23000)
INSERT [dbo].[CHITIETDH] ([MaHD], [MaSP], [SOLUONG], [DONGIA]) VALUES (N'2', N'359', 2, 23000)
INSERT [dbo].[CHITIETDH] ([MaHD], [MaSP], [SOLUONG], [DONGIA]) VALUES (N'2', N'361', 1, 23000)
INSERT [dbo].[CHITIETDH] ([MaHD], [MaSP], [SOLUONG], [DONGIA]) VALUES (N'2', N'363', 1, 34000)
INSERT [dbo].[CHITIETDH] ([MaHD], [MaSP], [SOLUONG], [DONGIA]) VALUES (N'2', N'364', 1, 23000)
INSERT [dbo].[CHITIETDH] ([MaHD], [MaSP], [SOLUONG], [DONGIA]) VALUES (N'2', N'367', 1, 35000)
INSERT [dbo].[CHITIETDH] ([MaHD], [MaSP], [SOLUONG], [DONGIA]) VALUES (N'3', N'354', 1, 20000)
INSERT [dbo].[CHITIETDH] ([MaHD], [MaSP], [SOLUONG], [DONGIA]) VALUES (N'3', N'355', 1, 15000)
INSERT [dbo].[CHITIETDH] ([MaHD], [MaSP], [SOLUONG], [DONGIA]) VALUES (N'3', N'357', 1, 12000)
INSERT [dbo].[CHITIETDH] ([MaHD], [MaSP], [SOLUONG], [DONGIA]) VALUES (N'3', N'359', 2, 23000)
INSERT [dbo].[CHITIETDH] ([MaHD], [MaSP], [SOLUONG], [DONGIA]) VALUES (N'3', N'361', 1, 23000)
INSERT [dbo].[CHITIETDH] ([MaHD], [MaSP], [SOLUONG], [DONGIA]) VALUES (N'3', N'362', 1, 24000)
INSERT [dbo].[CHITIETDH] ([MaHD], [MaSP], [SOLUONG], [DONGIA]) VALUES (N'3', N'363', 1, 34000)
INSERT [dbo].[CHITIETDH] ([MaHD], [MaSP], [SOLUONG], [DONGIA]) VALUES (N'3', N'364', 1, 23000)
INSERT [dbo].[CHITIETDH] ([MaHD], [MaSP], [SOLUONG], [DONGIA]) VALUES (N'3', N'367', 1, 35000)
INSERT [dbo].[CHITIETDH] ([MaHD], [MaSP], [SOLUONG], [DONGIA]) VALUES (N'3', N'383', 1, 30000)
INSERT [dbo].[CHITIETDH] ([MaHD], [MaSP], [SOLUONG], [DONGIA]) VALUES (N'3', N'395', 1, 14000)
INSERT [dbo].[CHITIETDH] ([MaHD], [MaSP], [SOLUONG], [DONGIA]) VALUES (N'4', N'354', 1, 20000)
INSERT [dbo].[CHITIETDH] ([MaHD], [MaSP], [SOLUONG], [DONGIA]) VALUES (N'4', N'359', 1, 23000)
INSERT [dbo].[CHITIETDH] ([MaHD], [MaSP], [SOLUONG], [DONGIA]) VALUES (N'4', N'361', 2, 23000)
INSERT [dbo].[CHITIETDH] ([MaHD], [MaSP], [SOLUONG], [DONGIA]) VALUES (N'5', N'354', 2, 20000)
INSERT [dbo].[CHITIETDH] ([MaHD], [MaSP], [SOLUONG], [DONGIA]) VALUES (N'5', N'359', 3, 23000)
INSERT [dbo].[CHITIETDH] ([MaHD], [MaSP], [SOLUONG], [DONGIA]) VALUES (N'5', N'361', 1, 23000)
INSERT [dbo].[CHITIETDH] ([MaHD], [MaSP], [SOLUONG], [DONGIA]) VALUES (N'6', N'354', 1, 20000)
INSERT [dbo].[CHITIETDH] ([MaHD], [MaSP], [SOLUONG], [DONGIA]) VALUES (N'6', N'359', 1, 23000)
INSERT [dbo].[CHITIETDH] ([MaHD], [MaSP], [SOLUONG], [DONGIA]) VALUES (N'7', N'354', 1, 20000)
INSERT [dbo].[CHITIETDH] ([MaHD], [MaSP], [SOLUONG], [DONGIA]) VALUES (N'7', N'359', 1, 23000)
INSERT [dbo].[CHITIETDH] ([MaHD], [MaSP], [SOLUONG], [DONGIA]) VALUES (N'7', N'362', 1, 24000)
INSERT [dbo].[CHITIETDH] ([MaHD], [MaSP], [SOLUONG], [DONGIA]) VALUES (N'7', N'363', 1, 34000)
INSERT [dbo].[HOADON] ([MaHD], [NgayDat], [Email], [DiaChiGiaoHang]) VALUES (N'1', CAST(N'2016-06-07' AS Date), N'itou@gmail.com', N'205 B?ch Ð?ng')
INSERT [dbo].[HOADON] ([MaHD], [NgayDat], [Email], [DiaChiGiaoHang]) VALUES (N'2', CAST(N'2016-06-07' AS Date), N'thu@g.com', N'109 NGUYEN DU')
INSERT [dbo].[HOADON] ([MaHD], [NgayDat], [Email], [DiaChiGiaoHang]) VALUES (N'3', CAST(N'2016-06-07' AS Date), N'thehaprok@gmail.com', N'T? 105 Phu?ng An khê')
INSERT [dbo].[HOADON] ([MaHD], [NgayDat], [Email], [DiaChiGiaoHang]) VALUES (N'4', CAST(N'2016-06-07' AS Date), N'no@g.o', N'90 Ph?m Van Ngh?')
INSERT [dbo].[HOADON] ([MaHD], [NgayDat], [Email], [DiaChiGiaoHang]) VALUES (N'5', CAST(N'2016-06-07' AS Date), N'no@g.o', N'90 Ph?m Van Ngh?')
INSERT [dbo].[HOADON] ([MaHD], [NgayDat], [Email], [DiaChiGiaoHang]) VALUES (N'6', CAST(N'2016-06-08' AS Date), N'itou@gmail.com', N'205 Bạch Đằng')
INSERT [dbo].[HOADON] ([MaHD], [NgayDat], [Email], [DiaChiGiaoHang]) VALUES (N'7', CAST(N'2016-06-15' AS Date), N'itou@gmail.com', N'205 Bạch Đằng')
SET IDENTITY_INSERT [dbo].[LOAIHANG] ON 

INSERT [dbo].[LOAIHANG] ([MALOAI], [TENLOAI]) VALUES (1, N'trang sức nữ')
INSERT [dbo].[LOAIHANG] ([MALOAI], [TENLOAI]) VALUES (2, N'phụ kiện')
SET IDENTITY_INSERT [dbo].[LOAIHANG] OFF
INSERT [dbo].[NHOMHANG] ([MANH], [TENNH]) VALUES (1, N'New')
INSERT [dbo].[NHOMHANG] ([MANH], [TENNH]) VALUES (2, N'Casio')
INSERT [dbo].[NHOMHANG] ([MANH], [TENNH]) VALUES (3, N'Movado')
INSERT [dbo].[NHOMHANG] ([MANH], [TENNH]) VALUES (4, N'Rotary')
INSERT [dbo].[NHOMHANG] ([MANH], [TENNH]) VALUES (5, N'SEIKO')
INSERT [dbo].[NHOMHANG] ([MANH], [TENNH]) VALUES (6, N'PULSAR')
INSERT [dbo].[NHOMHANG] ([MANH], [TENNH]) VALUES (7, N'OP')
INSERT [dbo].[NHOMHANG] ([MANH], [TENNH]) VALUES (8, N'TIMEX')
INSERT [dbo].[NHOMHANG] ([MANH], [TENNH]) VALUES (16, N'TISSOT')
SET IDENTITY_INSERT [dbo].[QUANGCAO] ON 

INSERT [dbo].[QUANGCAO] ([MAQUANGCAO], [TENCONGTY], [DIACHI], [SDT], [EMAIL], [ANHQUANGCAO]) VALUES (1, N'Kem đánh răng PS', N'17 Lý Thường Kiệt', N'0124385472', N'ps@gmail.com', N'~/images/quangcao/ps.jpg')
INSERT [dbo].[QUANGCAO] ([MAQUANGCAO], [TENCONGTY], [DIACHI], [SDT], [EMAIL], [ANHQUANGCAO]) VALUES (2, N'Noikia', N'40 Phan Đình Phùng', N'0194585663', N'nokia@gmail.com', N'~/images/quangcao/nokia.jpg')
INSERT [dbo].[QUANGCAO] ([MAQUANGCAO], [TENCONGTY], [DIACHI], [SDT], [EMAIL], [ANHQUANGCAO]) VALUES (3, N'Bia huda', N'54 Trần Phú', N'0986747572', N'huda@gmail.com', N'~/images/quangcao/biahuda.jpg')
INSERT [dbo].[QUANGCAO] ([MAQUANGCAO], [TENCONGTY], [DIACHI], [SDT], [EMAIL], [ANHQUANGCAO]) VALUES (4, N'Mỹ phẩm Beyond', N'120 Hùng Vương', N'0129587879', N'beyond@gmail.com', N'~/images/quangcao/beyond.jpg')
SET IDENTITY_INSERT [dbo].[QUANGCAO] OFF
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'354', N'Đồng Hồ Nam', 2, N'~/images/sanpham/1.jpg', 49, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 20000, CAST(N'2106-06-01' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'355', N'C002', 2, N'~/images/sanpham/2.png', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 15000, CAST(N'2016-07-02' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'356', N'C003', 2, N'~/images/sanpham/3.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 15000, CAST(N'2016-03-15' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'357', N'C004', 2, N'~/images/sanpham/4.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 12000, CAST(N'2016-01-21' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'358', N'C005', 2, N'~/images/sanpham/5.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 100000, CAST(N'2016-01-30' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'359', N'C006', 2, N'~/images/sanpham/6.jpg', 49, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 23000, CAST(N'2016-02-02' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'360', N'C007', 2, N'~/images/sanpham/7.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 15000, CAST(N'2016-05-15' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'361', N'DC008', 2, N'~/images/sanpham/8.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 23000, CAST(N'2016-07-09' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'362', N'DC009', 2, N'~/images/sanpham/9.jpg', 49, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 24000, CAST(N'2016-02-01' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'363', N'DC010', 2, N'~/images/sanpham/10.jpg', 49, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 34000, CAST(N'2015-05-30' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'364', N'DC011', 2, N'~/images/sanpham/11.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 23000, CAST(N'2016-04-12' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'365', N'DC012', 2, N'~/images/sanpham/12.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 14000, CAST(N'2016-03-27' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'366', N'DC013', 2, N'~/images/sanpham/13.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 23000, CAST(N'2016-03-28' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'367', N'DC014', 2, N'~/images/sanpham/14.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 35000, CAST(N'2016-03-29' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'368', N'DC015', 2, N'~/images/sanpham/15.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 23000, CAST(N'2016-03-22' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'369', N'BT001', 3, N'~/images/sanpham/16.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 13000, CAST(N'2016-05-27' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'370', N'BT002', 3, N'~/images/sanpham/17.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 15000, CAST(N'2016-02-27' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'371', N'BT003', 3, N'~/images/sanpham/18.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 42000, CAST(N'2016-02-16' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'372', N'BT004', 3, N'~/images/sanpham/19.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 15000, CAST(N'2016-09-23' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'373', N'BT005', 3, N'~/images/sanpham/20.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 26000, CAST(N'2016-01-27' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'374', N'BT006', 3, N'~/images/sanpham/21.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 34000, CAST(N'2016-04-27' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'375', N'BT007', 3, N'~/images/sanpham/22.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 32000, CAST(N'2016-02-01' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'376', N'BT008', 3, N'~/images/sanpham/23.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 23000, CAST(N'2016-04-24' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'377', N'BT009', 3, N'~/images/sanpham/24.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 24000, CAST(N'2016-04-12' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'378', N'BT010', 3, N'~/images/sanpham/25.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 25000, CAST(N'2016-02-16' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'379', N'BT011', 3, N'~/images/sanpham/26.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 26000, CAST(N'2015-05-30' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'380', N'BT012', 3, N'~/images/sanpham/27.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 27000, CAST(N'2016-05-27' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'381', N'BT013', 3, N'~/images/sanpham/28.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 28000, CAST(N'2016-01-27' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'382', N'BT014', 3, N'~/images/sanpham/29.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 29000, CAST(N'2016-05-26' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'383', N'BT015', 3, N'~/images/sanpham/30.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 30000, CAST(N'2016-05-05' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'384', N'LC001', 4, N'~/images/sanpham/31.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 31000, CAST(N'2016-06-23' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'385', N'LC002', 4, N'~/images/sanpham/32.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 32000, CAST(N'2016-01-27' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'386', N'LC003', 4, N'~/images/sanpham/33.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 33000, CAST(N'2016-05-27' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'387', N'LC004', 4, N'~/images/sanpham/34.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 34000, CAST(N'2016-05-05' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'388', N'LC005', 4, N'~/images/sanpham/35.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 34000, CAST(N'2016-05-03' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'389', N'LC006', 4, N'~/images/sanpham/36.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 33000, CAST(N'2016-05-02' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'390', N'LC007', 4, N'~/images/sanpham/37.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 32000, CAST(N'2016-02-05' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'391', N'LC008', 4, N'~/images/sanpham/38.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 30000, CAST(N'2016-02-07' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'392', N'LC009', 4, N'~/images/sanpham/39.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 24000, CAST(N'2016-10-05' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'393', N'LC010', 4, N'~/images/sanpham/40.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 25000, CAST(N'2016-01-01' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'394', N'VT001', 5, N'~/images/sanpham/41.png', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 23000, CAST(N'2016-05-09' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'395', N'VT002', 5, N'~/images/sanpham/42.png', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 14000, CAST(N'2016-01-10' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'396', N'VT003', 5, N'~/images/sanpham/43.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 18000, CAST(N'2016-02-03' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'397', N'VT004', 5, N'~/images/sanpham/44.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 43000, CAST(N'2016-04-03' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'398', N'VT005', 5, N'~/images/sanpham/45.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 24000, CAST(N'2016-06-05' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'399', N'VT006', 5, N'~/images/sanpham/46.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 23000, CAST(N'2016-07-02' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'400', N'VT007', 5, N'~/images/sanpham/47.png', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 25000, CAST(N'2016-07-02' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'401', N'VT008', 5, N'~/images/sanpham/48.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 12000, CAST(N'2016-07-02' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'402', N'VT009', 5, N'~/images/sanpham/49.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 23000, CAST(N'2016-01-10' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'403', N'VT010', 5, N'~/images/sanpham/50.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 16000, CAST(N'2016-01-10' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'404', N'VT011', 5, N'~/images/sanpham/51.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 34000, CAST(N'2016-06-23' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'405', N'VT012', 5, N'~/images/sanpham/52.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 19000, CAST(N'2016-06-23' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'406', N'VT013', 5, N'~/images/sanpham/53.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 53000, CAST(N'2016-02-16' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'407', N'VT014', 5, N'~/images/sanpham/54.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 45000, CAST(N'2016-05-02' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'408', N'VT015', 5, N'~/images/sanpham/55.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 25000, CAST(N'2016-05-02' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'409', N'Đồng hồ huyền thoại', 6, N'~/images/sanpham/56.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 23000, CAST(N'2016-02-16' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'410', N'N002', 6, N'~/images/sanpham/57.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 24000, CAST(N'2016-07-15' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'411', N'N003', 6, N'~/images/sanpham/58.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 25000, CAST(N'2016-05-19' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'412', N'N004', 6, N'~/images/sanpham/59.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 44000, CAST(N'2016-05-06' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'413', N'N005', 6, N'~/images/sanpham/60.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 45000, CAST(N'2016-05-13' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'414', N'N006', 6, N'~/images/sanpham/61.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 25000, CAST(N'2016-05-12' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'415', N'N007', 6, N'~/images/sanpham/62.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 29000, CAST(N'2016-05-11' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'416', N'N008', 6, N'~/images/sanpham/63.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 20000, CAST(N'2016-05-10' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'417', N'N009', 6, N'~/images/sanpham/64.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 25000, CAST(N'2016-02-16' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'418', N'N010', 6, N'~/images/sanpham/65.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 23000, CAST(N'2016-02-16' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'419', N'N011', 6, N'~/images/sanpham/66.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 54000, CAST(N'2016-04-27' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'420', N'N012', 6, N'~/images/sanpham/67.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 65000, CAST(N'2016-07-02' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'421', N'N013', 6, N'~/images/sanpham/68.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 34000, CAST(N'2016-04-27' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'422', N'N014', 6, N'~/images/sanpham/69.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 24000, CAST(N'2016-01-21' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'423', N'N015', 6, N'~/images/sanpham/70.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 65000, CAST(N'2016-01-27' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'424', N'N016', 6, N'~/images/sanpham/71.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 25000, CAST(N'2016-01-21' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'425', N'N017', 6, N'~/images/sanpham/72.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 18000, CAST(N'2016-04-27' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'426', N'N018', 6, N'~/images/sanpham/73.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 29000, CAST(N'2016-07-02' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'427', N'N019', 6, N'~/images/sanpham/74.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 23000, CAST(N'2016-05-10' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'428', N'N020', 6, N'~/images/sanpham/75.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 35000, CAST(N'2016-01-21' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'429', N'M001', 8, N'~/images/sanpham/76.png', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 24000, CAST(N'2016-01-27' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'430', N'M002', 8, N'~/images/sanpham/77.png', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 19000, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'431', N'M003', 8, N'~/images/sanpham/78.png', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 20000, CAST(N'2016-05-10' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'432', N'M004', 8, N'~/images/sanpham/79.png', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 26000, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'433', N'M005', 8, N'~/images/sanpham/80.png', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 45000, CAST(N'2016-01-21' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'434', N'CL001', 7, N'~/images/sanpham/81.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 20000, CAST(N'2016-07-15' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'435', N'CL002', 7, N'~/images/sanpham/82.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 21000, CAST(N'2016-05-10' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'436', N'CL003', 7, N'~/images/sanpham/83.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 23000, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'437', N'CL004', 7, N'~/images/sanpham/84.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 26000, CAST(N'2016-07-02' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'438', N'CL005', 7, N'~/images/sanpham/85.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 28000, CAST(N'2016-05-10' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'439', N'CL006', 7, N'~/images/sanpham/86.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 30000, CAST(N'2016-07-15' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'440', N'CL007', 7, N'~/images/sanpham/87.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 34000, CAST(N'2016-04-27' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'441', N'CL008', 7, N'~/images/sanpham/88.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 35000, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'442', N'CL009', 7, N'~/images/sanpham/89.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 45000, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'443', N'K001', 16, N'~/images/sanpham/90.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 25000, CAST(N'2016-07-02' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'445', N'K002', 16, N'~/images/sanpham/91.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 19000, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'446', N'K003', 16, N'~/images/sanpham/92.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 56000, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'447', N'K004', 16, N'~/images/sanpham/93.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 34000, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'448', N'Hộp đựng trang sức', 16, N'~/images/sanpham/95.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 50000, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'449', N'K005', 16, N'~/images/sanpham/94.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 34000, CAST(N'2016-01-27' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'450', N'MO1', 1, N'~/images/sanpham/96.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 45000, CAST(N'2016-07-15' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'451', N'MO2', 1, N'~/images/sanpham/97.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 50000, CAST(N'2016-04-27' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'452', N'MO3', 1, N'~/images/sanpham/98.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 60000, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'453', N'MO4', 1, N'~/images/sanpham/99.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 45000, CAST(N'2016-05-10' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'454', N'MO5', 1, N'~/images/sanpham/100.PNG', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 56000, CAST(N'2016-01-27' AS Date))
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'455', N'M06', 1, N'~/images/sanpham/101.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 78000, CAST(N'2016-04-27' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'456', N'M07', 1, N'~/images/sanpham/102.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 56000, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaNH], [ANHSP], [SOLUONG], [CHITIET], [DONGIA], [NGAYCAPNHAP]) VALUES (N'457', N'M008', 1, N'~/images/sanpham/08a116.jpg', 50, N'Sản phẩm chính hiệu được nhiều người ưa chuộn được thiết kế tinh tế và tỉ mĩ bởi các hãng bán đồng hồ hàng đầu trên thế giới', 2000000, CAST(N'2016-05-10' AS Date))
INSERT [dbo].[TAIKHOAN] ([Email], [HoTen], [GioiTinh], [DiaChi], [MatKhau], [SoDT], [Quyen], [image]) VALUES (N'admin', N'admin', 0, N'105 Lê Đình Lý', N'admin', NULL, 1, N'tx.jpg')
INSERT [dbo].[TAIKHOAN] ([Email], [HoTen], [GioiTinh], [DiaChi], [MatKhau], [SoDT], [Quyen], [image]) VALUES (N'itou@gmail.com', N'Itou', 0, N'205 Bạch Đằng', N'123', N'01202234567', 2, N'itou.png')
INSERT [dbo].[TAIKHOAN] ([Email], [HoTen], [GioiTinh], [DiaChi], [MatKhau], [SoDT], [Quyen], [image]) VALUES (N'no@g.o', N'No Name', 0, N'90 Phạm Văn Nghị', N'123', N'01233999699', 2, N'talong.png')
INSERT [dbo].[TAIKHOAN] ([Email], [HoTen], [GioiTinh], [DiaChi], [MatKhau], [SoDT], [Quyen], [image]) VALUES (N'thehaprok', N'Nguyễn Văn Hà', 0, N'105 Lê Đình lý', N'thehaprok', N'01223546613', 2, N'talong.png')
INSERT [dbo].[TAIKHOAN] ([Email], [HoTen], [GioiTinh], [DiaChi], [MatKhau], [SoDT], [Quyen], [image]) VALUES (N'thehaprok@gmail.com', N'Văn Hà', 0, N'Tổ 105 Phường An khê', N'khongbiet', N'01223546677', 2, N'frau.jpg')
INSERT [dbo].[TAIKHOAN] ([Email], [HoTen], [GioiTinh], [DiaChi], [MatKhau], [SoDT], [Quyen], [image]) VALUES (N'thu@g.com', N'VH', 0, N'109 NGUYEN DU', N'123', N'0123456789', 2, N'14726avatar-meo-trang-cute.jpg')
ALTER TABLE [dbo].[SANPHAM]  WITH CHECK ADD  CONSTRAINT [FK_SANPHAM_NHOMHANG] FOREIGN KEY([MaNH])
REFERENCES [dbo].[NHOMHANG] ([MANH])
GO
ALTER TABLE [dbo].[SANPHAM] CHECK CONSTRAINT [FK_SANPHAM_NHOMHANG]
GO
/****** Object:  StoredProcedure [dbo].[capnhatdonhang1]    Script Date: 1/20/2017 8:54:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[capnhatdonhang1]
	-- Add the parameters for the stored procedure here
	@MADH INT,
	@TINHTRANG NVARCHAR(50),
	@GHICHU NVARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [DONHANG]
   SET [TINHTRANG] = @TINHTRANG
      ,[GHICHU] = @GHICHU
 WHERE MADH = @MADH
END

GO
/****** Object:  StoredProcedure [dbo].[capnhatmatkhau]    Script Date: 1/20/2017 8:54:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[capnhatmatkhau] 
	-- Add the parameters for the stored procedure here
	@TENDANGNHAP NVARCHAR(50),
	@MATKHAUMOI NVARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE NGUOIDUNG
   SET MATKHAU = @MATKHAUMOI
 WHERE TENDANGNHAP = @TENDANGNHAP
END

GO
/****** Object:  StoredProcedure [dbo].[capnhatnguoidung]    Script Date: 1/20/2017 8:54:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[capnhatnguoidung]
	-- Add the parameters for the stored procedure here
	@MANGUOIDUNG INT,
	@HOTEN NVARCHAR(50),
	@DIACHI NVARCHAR(50),
	@SDT NVARCHAR(50),
	@EMAIL NVARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE NGUOIDUNG
   SET HOTEN = @HOTEN
      ,DIACHI = @DIACHI
      ,SDT = @SDT
      ,EMAIL = @EMAIL
 WHERE MANGUOIDUNG = @MANGUOIDUNG
END

GO
/****** Object:  StoredProcedure [dbo].[capnhatnguoidungnd]    Script Date: 1/20/2017 8:54:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[capnhatnguoidungnd]
	-- Add the parameters for the stored procedure here
	@HOTEN NVARCHAR(50),
	@DIACHI NVARCHAR(50),
	@SDT NVARCHAR(50),
	@EMAIL NVARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [NGUOIDUNG]
   SET [DIACHI] = @DIACHI
      ,[SDT] = @SDT
      ,[EMAIL] =@EMAIL
 WHERE HOTEN = @HOTEN
END

GO
/****** Object:  StoredProcedure [dbo].[capnhatnhomhang]    Script Date: 1/20/2017 8:54:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[capnhatnhomhang]
	-- Add the parameters for the stored procedure here
	@MANH INT,
	@TENNH NVARCHAR(50),
	@MALOAI INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [NHOMHANG]
   SET [TENNH] = @TENNH
      ,[MALOAI] = @MALOAI
 WHERE MANH = @MANH
END

GO
/****** Object:  StoredProcedure [dbo].[capnhatquangcao]    Script Date: 1/20/2017 8:54:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[capnhatquangcao]
	-- Add the parameters for the stored procedure here
	@MAQUANGCAO INT,
	@TENCONGTY NVARCHAR(50),
	@DIACHI NVARCHAR(50),
	@SDT NVARCHAR(50),
	@EMAIL NVARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [QUANGCAO]
   SET [TENCONGTY] = @TENCONGTY
      ,[DIACHI] = @DIACHI
      ,[SDT] = @SDT
      ,[EMAIL] = @EMAIL    
 WHERE MAQUANGCAO = @MAQUANGCAO
END

GO
/****** Object:  StoredProcedure [dbo].[capnhatsanpham]    Script Date: 1/20/2017 8:54:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[capnhatsanpham]
	-- Add the parameters for the stored procedure here
	@TENSP NVARCHAR(50),
	@MANH INT,
	@SOLUONG INT,	
	@CHITIET NTEXT,
	@DONGIA FLOAT
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE SANPHAM
   SET MANH = @MANH
      ,SOLUONG = @SOLUONG    
      ,CHITIET = @CHITIET
      ,DONGIA = @DONGIA
 WHERE TENSP = @TENSP
END

GO
/****** Object:  StoredProcedure [dbo].[capnhatsanpham1]    Script Date: 1/20/2017 8:54:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[capnhatsanpham1]
	-- Add the parameters for the stored procedure here
	@MASP INT,
	@TENSP NVARCHAR(50),
	@MANH INT,	
	@SOLUONG INT,
	@CHITIET NTEXT,
	@DONGIA FLOAT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [SANPHAM]
   SET [TENSP] = @TENSP
      ,[MANH] = @MANH     
      ,[SOLUONG] = @SOLUONG
      ,[CHITIET] = @CHITIET
      ,[DONGIA] = @DONGIA
 WHERE MASP = @MASP
END

GO
/****** Object:  StoredProcedure [dbo].[capnhatsoluongsp]    Script Date: 1/20/2017 8:54:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[capnhatsoluongsp]
	-- Add the parameters for the stored procedure here
	@MASP INT,
	@SOLUONG INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [SANPHAM]
   SET SOLUONG = SOLUONG - @SOLUONG      
 WHERE MASP = @MASP
END

GO
/****** Object:  StoredProcedure [dbo].[hienthichitietdonhang]    Script Date: 1/20/2017 8:54:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[hienthichitietdonhang]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT MACHITIETDH, MADH, TENSP, GIA, CHITIETDONHANG.SOLUONG, THANHTIEN
	FROM SANPHAM, CHITIETDONHANG
	WHERE SANPHAM.MASP = CHITIETDONHANG.MASP
END

GO
/****** Object:  StoredProcedure [dbo].[hienthichitietdonhang2]    Script Date: 1/20/2017 8:54:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[hienthichitietdonhang2]
	-- Add the parameters for the stored procedure here
	@MADH INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT MACHITIETDH, CHITIETDONHANG.MADH, TENSP, GIA, CHITIETDONHANG.SOLUONG, THANHTIEN
	from SANPHAM, CHITIETDONHANG, DONHANG
	WHERE SANPHAM.MASP = CHITIETDONHANG.MASP
	      AND DONHANG.MADH = CHITIETDONHANG.MADH
	      AND CHITIETDONHANG.MADH = @MADH
END

GO
/****** Object:  StoredProcedure [dbo].[hienthidonhang]    Script Date: 1/20/2017 8:54:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[hienthidonhang]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from DONHANG
END

GO
/****** Object:  StoredProcedure [dbo].[hienthidonhang2]    Script Date: 1/20/2017 8:54:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[hienthidonhang2]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT MADH, HOTEN, DIACHI, SDT, EMAIL, NGAYDATHANG, CHUKY, TONGTIEN, PTTT, PTVC, TINHTRANG, GHICHU
	FROM DONHANG, NGUOIDUNG
	WHERE DONHANG.MANGUOIDUNG = NGUOIDUNG.MANGUOIDUNG
END

GO
/****** Object:  StoredProcedure [dbo].[hienthiloaihang]    Script Date: 1/20/2017 8:54:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[hienthiloaihang]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from LOAIHANG
END

GO
/****** Object:  StoredProcedure [dbo].[hienthinguoidung]    Script Date: 1/20/2017 8:54:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[hienthinguoidung]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from NGUOIDUNG
END

GO
/****** Object:  StoredProcedure [dbo].[hienthinhomhang]    Script Date: 1/20/2017 8:54:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[hienthinhomhang]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from NHOMHANG
END

GO
/****** Object:  StoredProcedure [dbo].[hienthinhomhang1]    Script Date: 1/20/2017 8:54:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[hienthinhomhang1]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from NHOMHANG
END

GO
/****** Object:  StoredProcedure [dbo].[hienthiphukiennu]    Script Date: 1/20/2017 8:54:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[hienthiphukiennu]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT TENNH
	FROM NHOMHANG
	WHERE MALOAI = 2
END

GO
/****** Object:  StoredProcedure [dbo].[hienthiquangcao]    Script Date: 1/20/2017 8:54:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[hienthiquangcao]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from QUANGCAO
	end

GO
/****** Object:  StoredProcedure [dbo].[hienthiquyen]    Script Date: 1/20/2017 8:54:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[hienthiquyen] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from QUYEN
END

GO
/****** Object:  StoredProcedure [dbo].[hienthisanpham]    Script Date: 1/20/2017 8:54:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[hienthisanpham]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from SANPHAM,NHOMHANG
	WHERE SANPHAM.MANH = NHOMHANG.MANH and SANPHAM.MANH != 1
END

GO
/****** Object:  StoredProcedure [dbo].[hienthisanphammoi]    Script Date: 1/20/2017 8:54:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[hienthisanphammoi]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from SANPHAM
	where MANH=1
END

GO
/****** Object:  StoredProcedure [dbo].[hienthisptheonhom]    Script Date: 1/20/2017 8:54:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE  [dbo].[hienthisptheonhom]
	-- Add the parameters for the stored procedure here
	(
		@TENNH nvarchar(50)
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
  FROM SANPHAM, NHOMHANG
  WHERE SANPHAM.MANH = NHOMHANG.MANH and TENNH = @TENNH
END
GO
/****** Object:  StoredProcedure [dbo].[hienthitatcasanpham]    Script Date: 1/20/2017 8:54:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[hienthitatcasanpham]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from SANPHAM
END

GO
/****** Object:  StoredProcedure [dbo].[hienthithoitrangnu]    Script Date: 1/20/2017 8:54:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[hienthithoitrangnu]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT TENNH
	FROM NHOMHANG
	WHERE MALOAI=1 and MANH!=1
	      END

GO
/****** Object:  StoredProcedure [dbo].[kiemtradangnhap]    Script Date: 1/20/2017 8:54:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[kiemtradangnhap]
	-- Add the parameters for the stored procedure here
	@TENDANGNHAP NVARCHAR(50),
	@MATKHAU NVARCHAR(50)
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM NGUOIDUNG
	WHERE TENDANGNHAP = @TENDANGNHAP AND MATKHAU = @MATKHAU
END

GO
/****** Object:  StoredProcedure [dbo].[kiemtramatkhau]    Script Date: 1/20/2017 8:54:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[kiemtramatkhau]
	-- Add the parameters for the stored procedure here
	@TENDANGNHAP NVARCHAR(50),
	@MATKHAUCU NVARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM NGUOIDUNG
	WHERE TENDANGNHAP = @TENDANGNHAP AND MATKHAU = @MATKHAUCU
END

GO
/****** Object:  StoredProcedure [dbo].[ktratendangnhapvaemail]    Script Date: 1/20/2017 8:54:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[ktratendangnhapvaemail]
	-- Add the parameters for the stored procedure here
	@TENDANGNHAP NVARCHAR(50),
	@EMAIL NVARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT TENDANGNHAP FROM NGUOIDUNG WHERE TENDANGNHAP = @TENDANGNHAP
	SELECT EMAIL FROM NGUOIDUNG WHERE EMAIL = @EMAIL
END
GO
/****** Object:  StoredProcedure [dbo].[laydoanhthuthang]    Script Date: 1/20/2017 8:54:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[laydoanhthuthang]
	-- Add the parameters for the stored procedure here
	@THANG INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT SUM(THANHTIEN) AS 'DOANHTHU'
	FROM CHITIETDONHANG, DONHANG
	WHERE DONHANG.MADH = CHITIETDONHANG.MADH
	     AND MONTH(NGAYDATHANG)= @THANG     
END

GO
/****** Object:  StoredProcedure [dbo].[layhoadontrongthang]    Script Date: 1/20/2017 8:54:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[layhoadontrongthang]
	-- Add the parameters for the stored procedure here
	@THANG INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT MACHITIETDH,CHITIETDONHANG.MADH, TENSP, GIA, CHITIETDONHANG.SOLUONG, THANHTIEN
	FROM SANPHAM, CHITIETDONHANG, DONHANG
	WHERE SANPHAM.MASP = CHITIETDONHANG.MASP	
	     AND DONHANG.MADH = CHITIETDONHANG.MADH
	     AND MONTH(NGAYDATHANG)= @THANG     
END

GO
/****** Object:  StoredProcedure [dbo].[laymahoadon]    Script Date: 1/20/2017 8:54:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[laymahoadon] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT COUNT(MADH)as 'ma'
	FROM DONHANG
END

GO
/****** Object:  StoredProcedure [dbo].[laymatkhau]    Script Date: 1/20/2017 8:54:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[laymatkhau] 
	-- Add the parameters for the stored procedure here
	@TENDANGNHAP NVARCHAR(50),
	@EMAIL NVARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT MATKHAU
	FROM NGUOIDUNG
	WHERE TENDANGNHAP = @TENDANGNHAP AND EMAIL = @EMAIL
END
GO
/****** Object:  StoredProcedure [dbo].[laytatcasp]    Script Date: 1/20/2017 8:54:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[laytatcasp]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from SANPHAM, NHOMHANG
	WHERE SANPHAM.MANH = NHOMHANG.MANH
END

GO
/****** Object:  StoredProcedure [dbo].[nguoidungdangky]    Script Date: 1/20/2017 8:54:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[nguoidungdangky]
	-- Add the parameters for the stored procedure here
	@MAQUYEN INT,
	@TENDANGNHAP NVARCHAR(50),
	@MATKHAU NVARCHAR(50),	
	@HOTEN NVARCHAR(50),
	@DIACHI NVARCHAR(50),
	@SDT NVARCHAR(50),
	@EMAIL NVARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    INSERT INTO [NGUOIDUNG]
           ([MAQUYEN]
           ,[TENDANGNHAP]
           ,[MATKHAU]
           ,[HOTEN]
           ,[DIACHI]
           ,[SDT]
           ,[EMAIL])
     VALUES
           (@MAQUYEN,@TENDANGNHAP, @MATKHAU, @HOTEN, @DIACHI, @SDT, @EMAIL)
	END
GO
/****** Object:  StoredProcedure [dbo].[sp_checkEmail]    Script Date: 1/20/2017 8:54:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_checkEmail](@email varchar(50))
as
begin
select * from TAIKHOAN where Email=@email 
end
GO
/****** Object:  StoredProcedure [dbo].[sp_insertCT]    Script Date: 1/20/2017 8:54:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_insertCT](@mahd varchar(50),
@masp varchar(50),
@soluong int,
@dongia int)
as
begin
insert into CHITTIETHD values(@mahd,@masp,@soluong,@dongia)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_insertHD]    Script Date: 1/20/2017 8:54:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_insertHD](@mahd varchar(50),
@Ngaylap date,
@email varchar(50),
@diachi nvarchar(50))
as
begin
insert into CHITTIETHD values(@mahd,@Ngaylap,@email,@diachi)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_insertHHD]    Script Date: 1/20/2017 8:54:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_insertHHD](@mahd varchar(50),@ngaymua date,@email varchar(50),@dc varchar(50))
as
begin
insert into HOADON values(@mahd,@ngaymua,@email,@dc)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_tk]    Script Date: 1/20/2017 8:54:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_tk](
@Email varchar(50),
@HoTen nvarchar(50),
@GioiTinh int,
@DiaChi nvarchar(50),
@SoDT varchar(15),
@image varchar(50)
)
as
begin
update TAIKHOAN set HoTen=@HoTen,GioiTinh=@GioiTinh,DiaChi=@DiaChi,image=@image where Email=@Email
end
GO
/****** Object:  StoredProcedure [dbo].[themchitietdonhang]    Script Date: 1/20/2017 8:54:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[themchitietdonhang]
	-- Add the parameters for the stored procedure here
	@MADH INT,
	@MASP INT,
	@GIA FLOAT,
	@SOLUONG INT,
	@THANHTIEN FLOAT
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [CHITIETDONHANG]
           ([MADH]
           ,[MASP]
           ,[GIA]
           ,[SOLUONG]
           ,[THANHTIEN])
     VALUES
           (@MADH, @MASP, @GIA, @SOLUONG, @THANHTIEN)
END

GO
/****** Object:  StoredProcedure [dbo].[themdonhang]    Script Date: 1/20/2017 8:54:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[themdonhang]
	-- Add the parameters for the stored procedure here
	@MANGUOIDUNG INT,
	@NGAYDATHANG NVARCHAR(50),
	@CHUKY NCHAR(10),
	@TONGTIEN FLOAT,
	@PTTT NVARCHAR(50),
	@PTVC NVARCHAR(50),
	@TINHTRANG NVARCHAR(50),
	@GHICHU NVARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [DONHANG]
           ([MANGUOIDUNG]
           ,[NGAYDATHANG]
           ,[CHUKY]
           ,[TONGTIEN]
           ,[PTTT]
           ,[PTVC]
           ,[TINHTRANG]
           ,[GHICHU])
     VALUES
           (@MANGUOIDUNG, @NGAYDATHANG, @CHUKY, @TONGTIEN, @PTTT, @PTVC, @TINHTRANG, @GHICHU)
END

GO
/****** Object:  StoredProcedure [dbo].[themnguoidung]    Script Date: 1/20/2017 8:54:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[themnguoidung]
	@MAQUYEN INT,
	@TENDANGNHAP NVARCHAR(50),
	@MATKHAU NVARCHAR(50),	
	@HOTEN NVARCHAR(50),
	@DIACHI NVARCHAR(50),
	@SDT NVARCHAR(50),
	@EMAIL NVARCHAR(50)
AS
BEGIN

	SET NOCOUNT ON;

	INSERT INTO [phukiennu].[dbo].[NGUOIDUNG]
           ([MAQUYEN]
           ,[TENDANGNHAP]
           ,[MATKHAU]
           ,[HOTEN]
           ,[DIACHI]
           ,[SDT]
           ,[EMAIL])
     VALUES
           (@MAQUYEN,@TENDANGNHAP, @MATKHAU,  @HOTEN, @DIACHI, @SDT, @EMAIL)
END
GO
/****** Object:  StoredProcedure [dbo].[themnhomhang]    Script Date: 1/20/2017 8:54:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[themnhomhang]
	-- Add the parameters for the stored procedure here
	@TENNH NVARCHAR(50),
	@MALOAI INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO NHOMHANG
           ([TENNH]
           ,[MALOAI])
     VALUES
           (@TENNH
             ,@MALOAI)
END

GO
/****** Object:  StoredProcedure [dbo].[themquangcao]    Script Date: 1/20/2017 8:54:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[themquangcao]
	-- Add the parameters for the stored procedure here
	@TENCONGTY NVARCHAR(50),
	@DIACHI NVARCHAR(50),
	@SDT NVARCHAR(50),
	@EMAIL NVARCHAR(50),
	@ANHQUANGCAO NTEXT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [QUANGCAO]
           ([TENCONGTY]
           ,[DIACHI]
           ,[SDT]
           ,[EMAIL]
           ,[ANHQUANGCAO])
     VALUES
           (@TENCONGTY, @DIACHI, @SDT, @EMAIL, @ANHQUANGCAO)
END

GO
/****** Object:  StoredProcedure [dbo].[themsanpham]    Script Date: 1/20/2017 8:54:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
cREATE PROCEDURE [dbo].[themsanpham]
	@TENSP NVARCHAR(50),
	@MANH INT,
	@ANHSP NTEXT,
	@SOLUONG INT,
	@CHITIET NTEXT,
	@DONGIA FLOAT
AS
BEGIN
	INSERT INTO [phukiennu].[dbo].[SANPHAM]
           ([TENSP]
           ,[MANH]
           ,[ANHSP]
           ,[SOLUONG]
           ,[CHITIET]
           ,[DONGIA])
     VALUES
           (@TENSP, @MANH, @ANHSP, @SOLUONG, @CHITIET, @DONGIA)
END

GO
/****** Object:  StoredProcedure [dbo].[thongkechitiethangcon]    Script Date: 1/20/2017 8:54:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[thongkechitiethangcon]
	-- Add the parameters for the stored procedure here
	@TENNH NVARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT TENSP,SUM(SOLUONG)AS 'SOLUONGCON'
	FROM SANPHAM, NHOMHANG
	WHERE SANPHAM.MANH = NHOMHANG.MANH
	     AND TENNH = @TENNH
	     AND SANPHAM.SOLUONG!= 0
	GROUP BY TENSP
END

GO
/****** Object:  StoredProcedure [dbo].[thongkedoanhthu]    Script Date: 1/20/2017 8:54:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[thongkedoanhthu]
	-- Add the parameters for the stored procedure here
	@THANG INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT SUM(TONGTIEN) AS 'DOANHTHU'
	FROM DONHANG
	WHERE MONTH(NGAYDATHANG)= @THANG
	SELECT MADH, TONGTIEN
	FROM DONHANG
	WHERE MONTH(NGAYDATHANG) = @THANG	
END

GO
/****** Object:  StoredProcedure [dbo].[thongkehangcontheonhom]    Script Date: 1/20/2017 8:54:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[thongkehangcontheonhom]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT TENNH,SUM(SOLUONG)AS 'SOLUONGCON'
	FROM SANPHAM, NHOMHANG
	WHERE SANPHAM.MANH = NHOMHANG.MANH
	GROUP BY TENNH
	END

GO
/****** Object:  StoredProcedure [dbo].[thongkesanphamconhang]    Script Date: 1/20/2017 8:54:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[thongkesanphamconhang]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT TENSP, TENNH, SOLUONG, DONGIA
	from SANPHAM, NHOMHANG
	WHERE SANPHAM.MANH = NHOMHANG.MANH
	      AND SANPHAM.MANH != 0
END

GO
/****** Object:  StoredProcedure [dbo].[thongkesanphamvasoluongbanduoc]    Script Date: 1/20/2017 8:54:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[thongkesanphamvasoluongbanduoc]
	-- Add the parameters for the stored procedure here
	@THANG INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT TENSP, SUM(CHITIETDONHANG.SOLUONG) AS 'SOLUONGSP'
	FROM CHITIETDONHANG, DONHANG, SANPHAM	
	WHERE DONHANG.MADH = CHITIETDONHANG.MADH
	      AND SANPHAM.MASP = CHITIETDONHANG.MASP
	      AND MONTH(NGAYDATHANG) = @THANG
	GROUP BY TENSP
END

GO
/****** Object:  StoredProcedure [dbo].[thongkesoluongbanduoc]    Script Date: 1/20/2017 8:54:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[thongkesoluongbanduoc]
	-- Add the parameters for the stored procedure here
	@THANG INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT TENSP,COUNT(CHITIETDONHANG.SOLUONG) AS 'SOLUONGBAN'
	FROM CHITIETDONHANG, DONHANG, SANPHAM
	WHERE DONHANG.MADH = CHITIETDONHANG.MADH
	     AND SANPHAM.MASP = CHITIETDONHANG.MASP
	     AND MONTH(NGAYDATHANG)= @THANG
	GROUP BY TENSP
END
GO
/****** Object:  StoredProcedure [dbo].[thongkesoluonghangban]    Script Date: 1/20/2017 8:54:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[thongkesoluonghangban]
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT TENSP,COUNT(CHITIETDONHANG.SOLUONG) AS 'SOLUONGBAN'
	FROM CHITIETDONHANG, SANPHAM
	WHERE  SANPHAM.MASP = CHITIETDONHANG.MASP	    
	GROUP BY TENSP
END

GO
/****** Object:  StoredProcedure [dbo].[thongketongsobanduoc]    Script Date: 1/20/2017 8:54:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[thongketongsobanduoc]
	-- Add the parameters for the stored procedure here
	@THANG INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT COUNT(CHITIETDONHANG.SOLUONG) AS 'TONGSOLUONG'
	FROM CHITIETDONHANG, DONHANG
	WHERE DONHANG.MADH = CHITIETDONHANG.MADH	    
	     AND MONTH(NGAYDATHANG)= @THANG	
END
GO
/****** Object:  StoredProcedure [dbo].[timdonhangtheoma]    Script Date: 1/20/2017 8:54:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[timdonhangtheoma]
	-- Add the parameters for the stored procedure here
	@MADH INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT MADH, HOTEN, DIACHI, SDT, EMAIL, NGAYDATHANG, CHUKY, TONGTIEN, PTTT, PTVC, TINHTRANG, GHICHU
	FROM DONHANG, NGUOIDUNG
	WHERE DONHANG.MANGUOIDUNG = NGUOIDUNG.MANGUOIDUNG
	     AND MADH = @MADH
END

GO
/****** Object:  StoredProcedure [dbo].[timdonhangtheotenkhachvathang]    Script Date: 1/20/2017 8:54:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[timdonhangtheotenkhachvathang] 
	-- Add the parameters for the stored procedure here
	@HOTEN NVARCHAR(50),
	@THANG INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT MADH, HOTEN, DIACHI, SDT, EMAIL, NGAYDATHANG, CHUKY, TONGTIEN, PTTT, PTVC, TINHTRANG, GHICHU
	FROM DONHANG, NGUOIDUNG
	WHERE DONHANG.MANGUOIDUNG = NGUOIDUNG.MANGUOIDUNG
	     and HOTEN like N'%'+ @HOTEN +'%'
	     AND MONTH(NGAYDATHANG) = @THANG
END

GO
/****** Object:  StoredProcedure [dbo].[timnguoidungtheoten]    Script Date: 1/20/2017 8:54:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[timnguoidungtheoten]
	-- Add the parameters for the stored procedure here
@HOTEN NVARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM NGUOIDUNG
	WHERE HOTEN like N'%'+ @HOTEN +'%'
END

GO
/****** Object:  StoredProcedure [dbo].[timnhomhangtheoma]    Script Date: 1/20/2017 8:54:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[timnhomhangtheoma]
	-- Add the parameters for the stored procedure here
	@MANH INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM NHOMHANG
	WHERE MANH = @MANH
END

GO
/****** Object:  StoredProcedure [dbo].[timquangcaotheoma]    Script Date: 1/20/2017 8:54:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[timquangcaotheoma]
	-- Add the parameters for the stored procedure here
	@MAQUANGCAO INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM QUANGCAO
	WHERE MAQUANGCAO = @MAQUANGCAO
END

GO
/****** Object:  StoredProcedure [dbo].[timsanphamtheoma]    Script Date: 1/20/2017 8:54:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[timsanphamtheoma]
	-- Add the parameters for the stored procedure here
	@MASP INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from SANPHAM
	where MASP = @MASP
END

GO
/****** Object:  StoredProcedure [dbo].[timspgiaduoi100]    Script Date: 1/20/2017 8:54:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[timspgiaduoi100] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from SANPHAM
	WHERE DONGIA<100000
END

GO
/****** Object:  StoredProcedure [dbo].[timspgiahon200]    Script Date: 1/20/2017 8:54:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[timspgiahon200]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from SANPHAM
	WHERE DONGIA>200000
END

GO
/****** Object:  StoredProcedure [dbo].[timspgiatu100den200]    Script Date: 1/20/2017 8:54:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[timspgiatu100den200]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from SANPHAM
	WHERE DONGIA BETWEEN 100000 AND 200000
END

GO
/****** Object:  StoredProcedure [dbo].[timsptheomanh]    Script Date: 1/20/2017 8:54:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[timsptheomanh]
	-- Add the parameters for the stored procedure here
	@MANH INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT MASP, TENSP, TENNH,ANHSP, SOLUONG, CHITIET, DONGIA
	FROM SANPHAM,	NHOMHANG
	WHERE SANPHAM.MANH = @MANH
	     and SANPHAM.MANH = NHOMHANG.MANH
END

GO
/****** Object:  StoredProcedure [dbo].[timsptheoten]    Script Date: 1/20/2017 8:54:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[timsptheoten] 
	-- Add the parameters for the stored procedure here
	@TENSP NVARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
  FROM SANPHAM
  WHERE TENSP like N'%'+ @TENSP +'%'
  end

GO
/****** Object:  StoredProcedure [dbo].[tongsoluongbanduoctheothang]    Script Date: 1/20/2017 8:54:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[tongsoluongbanduoctheothang]
	-- Add the parameters for the stored procedure here
	@THANG INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT SUM(SOLUONG) AS 'TONGSOLUONGBAN'
	FROM CHITIETDONHANG, DONHANG
	WHERE CHITIETDONHANG.MADH = DONHANG.MADH
	     AND MONTH(NGAYDATHANG) =@THANG
END

GO
/****** Object:  StoredProcedure [dbo].[xoadonhang]    Script Date: 1/20/2017 8:54:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[xoadonhang]
	-- Add the parameters for the stored procedure here
	@MADH INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM CHITIETDONHANG
	WHERE MADH = @MADH
	DELETE FROM DONHANG
	WHERE MADH = @MADH
END

GO
/****** Object:  StoredProcedure [dbo].[xoanguoidung]    Script Date: 1/20/2017 8:54:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[xoanguoidung]
	-- Add the parameters for the stored procedure here
	@MANGUOIDUNG INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete from NGUOIDUNG
	WHERE MANGUOIDUNG = @MANGUOIDUNG 
END

GO
/****** Object:  StoredProcedure [dbo].[xoanhomhang]    Script Date: 1/20/2017 8:54:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[xoanhomhang]
	-- Add the parameters for the stored procedure here
	@MANH INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    DELETE FROM CHITIETDONHANG
    FROM SANPHAM, NHOMHANG
    WHERE SANPHAM.MASP = CHITIETDONHANG.MASP
          AND SANPHAM.MANH = NHOMHANG.MANH
          AND NHOMHANG.MANH = @MANH
    DELETE FROM SANPHAM
    WHERE MANH = @MANH
	DELETE FROM NHOMHANG
	WHERE MANH = @MANH
END

GO
/****** Object:  StoredProcedure [dbo].[xoaquangcao]    Script Date: 1/20/2017 8:54:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[xoaquangcao]
	-- Add the parameters for the stored procedure here
	@MAQUANGCAO INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM QUANGCAO
	WHERE MAQUANGCAO = @MAQUANGCAO
END

GO
/****** Object:  StoredProcedure [dbo].[xoasanpham]    Script Date: 1/20/2017 8:54:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[xoasanpham]
	-- Add the parameters for the stored procedure here
	@MASP INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    DELETE FROM CHITIETDONHANG
    WHERE MASP = @MASP
	DELETE FROM SANPHAM
	WHERE MASP = @MASP
END

GO
USE [master]
GO
ALTER DATABASE [phukiennu] SET  READ_WRITE 
GO
