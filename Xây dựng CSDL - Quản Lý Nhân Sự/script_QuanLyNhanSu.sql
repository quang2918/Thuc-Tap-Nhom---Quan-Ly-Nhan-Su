USE [master]
GO
/****** Object:  Database [QuanLyNhanSu]    Script Date: 2017-03-09 9:15:41 AM ******/
CREATE DATABASE [QuanLyNhanSu]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyNhanSu', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QuanLyNhanSu.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QuanLyNhanSu_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QuanLyNhanSu_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QuanLyNhanSu] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyNhanSu].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyNhanSu] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyNhanSu] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyNhanSu] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyNhanSu] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuanLyNhanSu] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyNhanSu] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuanLyNhanSu] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyNhanSu] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyNhanSu] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyNhanSu] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [QuanLyNhanSu]
GO
/****** Object:  StoredProcedure [dbo].[personnel_search]    Script Date: 2017-03-09 9:15:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[personnel_search]
	@key nvarchar(50)
as begin
	select * from NhanVien where Manv like N'%'+@key+'%' or HoTen like N'%'+@key+'%'
	or QueQuan like N'%'+@key+'%' or GioiTinh like N'%'+@key+'%'
	or DanToc like N'%'+@key+'%' or MaPB like N'%'+@key+'%' or matdhv like N'%'+@key+'%'
	or bacluong like N'%'+@key+'%' or NgaySinh like N'%'+@key+'%'
end

alter table NhanVien alter column GioiTinh nvarchar(20)
alter table NhanVien alter column ngaysinh datetime
alter table NhanVien alter column quequan nvarchar(100)
GO
/****** Object:  Table [dbo].[ChucVu]    Script Date: 2017-03-09 9:15:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChucVu](
	[MaCV] [varchar](10) NOT NULL,
	[TenCV] [nvarchar](50) NULL,
 CONSTRAINT [PK_ChucVu] PRIMARY KEY CLUSTERED 
(
	[MaCV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Luong]    Script Date: 2017-03-09 9:15:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Luong](
	[BacLuong] [int] NOT NULL,
	[LuongCoban] [int] NULL,
	[HeSoLuong] [int] NULL,
	[HeSoPhuCap] [int] NULL,
 CONSTRAINT [PK_Luong] PRIMARY KEY CLUSTERED 
(
	[BacLuong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 2017-03-09 9:15:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [varchar](10) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[NgaySinh] [datetime] NULL,
	[QueQuan] [nvarchar](100) NULL,
	[GioiTinh] [nvarchar](20) NULL,
	[DanToc] [nvarchar](20) NULL,
	[SDTNhanVien] [varchar](15) NULL,
	[MaPB] [varchar](10) NULL,
	[MaTDHV] [varchar](10) NULL,
	[BacLuong] [int] NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PhongBan]    Script Date: 2017-03-09 9:15:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PhongBan](
	[MaPB] [varchar](10) NOT NULL,
	[TenPB] [nvarchar](30) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[SoDienThoaiPB] [varchar](15) NULL,
 CONSTRAINT [PK_PhongBan] PRIMARY KEY CLUSTERED 
(
	[MaPB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ThoiGianCongTac]    Script Date: 2017-03-09 9:15:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ThoiGianCongTac](
	[MaNV] [varchar](10) NOT NULL,
	[MaCV] [varchar](10) NOT NULL,
	[NgayNhanChuc] [date] NULL,
 CONSTRAINT [pk] PRIMARY KEY CLUSTERED 
(
	[MaCV] ASC,
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TrinhDoHocVan]    Script Date: 2017-03-09 9:15:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TrinhDoHocVan](
	[MaTDHV] [varchar](10) NOT NULL,
	[TenTrinhDo] [nvarchar](50) NULL,
	[ChuyenNghanh] [nvarchar](50) NULL,
 CONSTRAINT [PK_TrinhDoHocVan] PRIMARY KEY CLUSTERED 
(
	[MaTDHV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_Luong] FOREIGN KEY([BacLuong])
REFERENCES [dbo].[Luong] ([BacLuong])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_Luong]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_PhongBan] FOREIGN KEY([MaPB])
REFERENCES [dbo].[PhongBan] ([MaPB])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_PhongBan]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_TrinhDoHocVan] FOREIGN KEY([MaTDHV])
REFERENCES [dbo].[TrinhDoHocVan] ([MaTDHV])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_TrinhDoHocVan]
GO
ALTER TABLE [dbo].[ThoiGianCongTac]  WITH CHECK ADD  CONSTRAINT [FK_ThoiGianCongTac_ChucVu] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[ThoiGianCongTac] CHECK CONSTRAINT [FK_ThoiGianCongTac_ChucVu]
GO
ALTER TABLE [dbo].[ThoiGianCongTac]  WITH CHECK ADD  CONSTRAINT [FK_ThoiGianCongTac_ChucVu1] FOREIGN KEY([MaCV])
REFERENCES [dbo].[ChucVu] ([MaCV])
GO
ALTER TABLE [dbo].[ThoiGianCongTac] CHECK CONSTRAINT [FK_ThoiGianCongTac_ChucVu1]
GO
USE [master]
GO
ALTER DATABASE [QuanLyNhanSu] SET  READ_WRITE 
GO
