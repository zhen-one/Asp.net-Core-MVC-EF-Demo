USE [master]
GO
/****** Object:  Database [testDb]    Script Date: 2020/3/29 13:34:17 ******/
CREATE DATABASE [testDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'testDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\testDb.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'testDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\testDb_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [testDb] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [testDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [testDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [testDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [testDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [testDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [testDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [testDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [testDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [testDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [testDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [testDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [testDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [testDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [testDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [testDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [testDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [testDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [testDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [testDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [testDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [testDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [testDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [testDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [testDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [testDb] SET  MULTI_USER 
GO
ALTER DATABASE [testDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [testDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [testDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [testDb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [testDb] SET DELAYED_DURABILITY = DISABLED 
GO
USE [testDb]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 2020/3/29 13:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MachinePosition]    Script Date: 2020/3/29 13:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MachinePosition](
	[id] [int] NOT NULL,
	[machinePosition_No] [varchar](50) NULL,
	[machinePosition_Name] [varchar](50) NULL,
	[delete_flag] [char](1) NULL,
	[enable_flag] [char](1) NULL,
	[create_time] [datetime] NULL,
 CONSTRAINT [PK_MachinePosition] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MachineUnit]    Script Date: 2020/3/29 13:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MachineUnit](
	[id] [int] NOT NULL,
	[machineUnit_No] [varchar](50) NULL,
	[machineUnit_name] [varchar](50) NULL,
	[enable_flag] [char](1) NULL,
	[delete_flag] [char](1) NULL,
	[create_time] [datetime] NULL CONSTRAINT [DF_MachineUnit_create_time]  DEFAULT (getdate()),
 CONSTRAINT [PK_MachineUnit] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MonitorDatas]    Script Date: 2020/3/29 13:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MonitorDatas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[machineUnit_id] [int] NULL,
	[machineUnit_Name] [nvarchar](100) NULL,
	[position_id] [int] NULL,
	[position] [nvarchar](50) NULL,
	[value1] [decimal](18, 2) NULL,
	[value2] [decimal](18, 2) NULL,
	[value3] [decimal](18, 2) NULL,
	[value4] [decimal](18, 2) NULL,
	[value5] [decimal](18, 2) NULL,
	[create_time] [datetime] NULL CONSTRAINT [DF_tb_monitorData_create_time]  DEFAULT (getdate()),
 CONSTRAINT [PK_tb_monitorData] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[MachinePosition] ([id], [machinePosition_No], [machinePosition_Name], [delete_flag], [enable_flag], [create_time]) VALUES (1, N'test01', N'机舱', N'N', N'Y', NULL)
GO
INSERT [dbo].[MachinePosition] ([id], [machinePosition_No], [machinePosition_Name], [delete_flag], [enable_flag], [create_time]) VALUES (2, N'test02', N'塔基', N'N', N'Y', NULL)
GO
INSERT [dbo].[MachineUnit] ([id], [machineUnit_No], [machineUnit_name], [enable_flag], [delete_flag], [create_time]) VALUES (1, N'ZLFJ01', N'轴流风机01', N'Y', N'N', CAST(N'2020-03-29 11:01:28.753' AS DateTime))
GO
INSERT [dbo].[MachineUnit] ([id], [machineUnit_No], [machineUnit_name], [enable_flag], [delete_flag], [create_time]) VALUES (2, N'ZLFJ02', N'轴流风机02', N'Y', N'N', CAST(N'2020-03-29 11:01:28.753' AS DateTime))
GO
INSERT [dbo].[MachineUnit] ([id], [machineUnit_No], [machineUnit_name], [enable_flag], [delete_flag], [create_time]) VALUES (3, N'ZLFJ03', N'轴流风机03', N'Y', N'N', CAST(N'2020-03-29 11:01:28.753' AS DateTime))
GO
INSERT [dbo].[MachineUnit] ([id], [machineUnit_No], [machineUnit_name], [enable_flag], [delete_flag], [create_time]) VALUES (4, N'LXFJ01', N'离心风机01', N'Y', N'N', CAST(N'2020-03-29 11:02:22.410' AS DateTime))
GO
INSERT [dbo].[MachineUnit] ([id], [machineUnit_No], [machineUnit_name], [enable_flag], [delete_flag], [create_time]) VALUES (5, N'LXFJ02', N'离心风机02', N'Y', N'N', CAST(N'2020-03-29 11:02:29.310' AS DateTime))
GO
INSERT [dbo].[MachineUnit] ([id], [machineUnit_No], [machineUnit_name], [enable_flag], [delete_flag], [create_time]) VALUES (6, N'PYFJ01', N'排烟风机01', N'Y', N'N', CAST(N'2020-03-29 11:02:47.170' AS DateTime))
GO
INSERT [dbo].[MachineUnit] ([id], [machineUnit_No], [machineUnit_name], [enable_flag], [delete_flag], [create_time]) VALUES (7, N'PYFJ02', N'排烟风机02', N'Y', N'N', CAST(N'2020-03-29 11:03:07.530' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[MonitorDatas] ON 

GO
INSERT [dbo].[MonitorDatas] ([id], [machineUnit_id], [machineUnit_Name], [position_id], [position], [value1], [value2], [value3], [value4], [value5], [create_time]) VALUES (1, 1, N'轴流风机01', 1, N'机舱', CAST(100.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(1.10 AS Decimal(18, 2)), CAST(10.50 AS Decimal(18, 2)), CAST(12.21 AS Decimal(18, 2)), CAST(N'2020-01-01 12:00:00.000' AS DateTime))
GO
INSERT [dbo].[MonitorDatas] ([id], [machineUnit_id], [machineUnit_Name], [position_id], [position], [value1], [value2], [value3], [value4], [value5], [create_time]) VALUES (2, 1, N'轴流风机01', 1, N'机舱', CAST(200.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(1.10 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), CAST(12.21 AS Decimal(18, 2)), CAST(N'2020-02-01 11:15:00.000' AS DateTime))
GO
INSERT [dbo].[MonitorDatas] ([id], [machineUnit_id], [machineUnit_Name], [position_id], [position], [value1], [value2], [value3], [value4], [value5], [create_time]) VALUES (3, 1, N'轴流风机01', 1, N'机舱', CAST(300.00 AS Decimal(18, 2)), CAST(-3.00 AS Decimal(18, 2)), CAST(11.10 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), CAST(12.21 AS Decimal(18, 2)), CAST(N'2020-03-01 15:00:00.000' AS DateTime))
GO
INSERT [dbo].[MonitorDatas] ([id], [machineUnit_id], [machineUnit_Name], [position_id], [position], [value1], [value2], [value3], [value4], [value5], [create_time]) VALUES (4, 1, N'轴流风机01', 2, N'塔基', CAST(400.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), CAST(12.21 AS Decimal(18, 2)), CAST(N'2020-04-01 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MonitorDatas] ([id], [machineUnit_id], [machineUnit_Name], [position_id], [position], [value1], [value2], [value3], [value4], [value5], [create_time]) VALUES (5, 1, N'轴流风机01', 2, N'塔基', CAST(500.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(13.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(12.21 AS Decimal(18, 2)), CAST(N'2020-05-01 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MonitorDatas] ([id], [machineUnit_id], [machineUnit_Name], [position_id], [position], [value1], [value2], [value3], [value4], [value5], [create_time]) VALUES (6, 1, N'轴流风机01', 2, N'塔基', CAST(600.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), CAST(21.00 AS Decimal(18, 2)), CAST(10.50 AS Decimal(18, 2)), CAST(12.21 AS Decimal(18, 2)), CAST(N'2020-06-01 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MonitorDatas] ([id], [machineUnit_id], [machineUnit_Name], [position_id], [position], [value1], [value2], [value3], [value4], [value5], [create_time]) VALUES (7, 1, N'轴流风机01', 2, N'塔基', CAST(700.00 AS Decimal(18, 2)), CAST(-5.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), CAST(6.90 AS Decimal(18, 2)), CAST(12.21 AS Decimal(18, 2)), CAST(N'2020-01-01 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MonitorDatas] ([id], [machineUnit_id], [machineUnit_Name], [position_id], [position], [value1], [value2], [value3], [value4], [value5], [create_time]) VALUES (8, 2, N'轴流风机02', 1, N'机舱', CAST(300.00 AS Decimal(18, 2)), CAST(-4.00 AS Decimal(18, 2)), CAST(1.10 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), CAST(12.21 AS Decimal(18, 2)), CAST(N'2020-02-01 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MonitorDatas] ([id], [machineUnit_id], [machineUnit_Name], [position_id], [position], [value1], [value2], [value3], [value4], [value5], [create_time]) VALUES (9, 2, N'轴流风机02', 2, N'塔基', CAST(332.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), CAST(10.50 AS Decimal(18, 2)), CAST(12.21 AS Decimal(18, 2)), CAST(N'2020-03-01 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MonitorDatas] ([id], [machineUnit_id], [machineUnit_Name], [position_id], [position], [value1], [value2], [value3], [value4], [value5], [create_time]) VALUES (10, 2, N'轴流风机02', 1, N'机舱', CAST(450.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), CAST(8.60 AS Decimal(18, 2)), CAST(12.21 AS Decimal(18, 2)), CAST(N'2020-04-01 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MonitorDatas] ([id], [machineUnit_id], [machineUnit_Name], [position_id], [position], [value1], [value2], [value3], [value4], [value5], [create_time]) VALUES (11, 2, N'轴流风机02', 2, N'塔基', CAST(510.67 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(1.10 AS Decimal(18, 2)), CAST(11.00 AS Decimal(18, 2)), CAST(12.21 AS Decimal(18, 2)), CAST(N'2020-05-01 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MonitorDatas] ([id], [machineUnit_id], [machineUnit_Name], [position_id], [position], [value1], [value2], [value3], [value4], [value5], [create_time]) VALUES (12, 2, N'轴流风机02', 1, N'机舱', CAST(585.67 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), CAST(12.21 AS Decimal(18, 2)), CAST(N'2020-06-01 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MonitorDatas] ([id], [machineUnit_id], [machineUnit_Name], [position_id], [position], [value1], [value2], [value3], [value4], [value5], [create_time]) VALUES (13, 3, N'轴流风机03', 1, N'机舱', CAST(300.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), CAST(12.21 AS Decimal(18, 2)), CAST(N'2020-01-01 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MonitorDatas] ([id], [machineUnit_id], [machineUnit_Name], [position_id], [position], [value1], [value2], [value3], [value4], [value5], [create_time]) VALUES (14, 3, N'轴流风机03', 2, N'塔基', CAST(222.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(12.21 AS Decimal(18, 2)), CAST(N'2020-02-01 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MonitorDatas] ([id], [machineUnit_id], [machineUnit_Name], [position_id], [position], [value1], [value2], [value3], [value4], [value5], [create_time]) VALUES (15, 3, N'轴流风机03', 1, N'机舱', CAST(551.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), CAST(1.10 AS Decimal(18, 2)), CAST(10.50 AS Decimal(18, 2)), CAST(12.21 AS Decimal(18, 2)), CAST(N'2020-03-01 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MonitorDatas] ([id], [machineUnit_id], [machineUnit_Name], [position_id], [position], [value1], [value2], [value3], [value4], [value5], [create_time]) VALUES (16, 3, N'轴流风机03', 1, N'机舱', CAST(125.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), CAST(12.21 AS Decimal(18, 2)), CAST(N'2020-04-01 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MonitorDatas] ([id], [machineUnit_id], [machineUnit_Name], [position_id], [position], [value1], [value2], [value3], [value4], [value5], [create_time]) VALUES (17, 3, N'轴流风机03', 1, N'机舱', CAST(777.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(12.21 AS Decimal(18, 2)), CAST(N'2020-05-01 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MonitorDatas] ([id], [machineUnit_id], [machineUnit_Name], [position_id], [position], [value1], [value2], [value3], [value4], [value5], [create_time]) VALUES (18, 3, N'轴流风机03', 2, N'塔基', CAST(888.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(12.21 AS Decimal(18, 2)), CAST(N'2020-06-01 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MonitorDatas] ([id], [machineUnit_id], [machineUnit_Name], [position_id], [position], [value1], [value2], [value3], [value4], [value5], [create_time]) VALUES (19, 3, N'轴流风机03', 2, N'塔基', CAST(1222.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), CAST(12.21 AS Decimal(18, 2)), CAST(N'2020-01-01 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MonitorDatas] ([id], [machineUnit_id], [machineUnit_Name], [position_id], [position], [value1], [value2], [value3], [value4], [value5], [create_time]) VALUES (20, 4, N'离心风机01', 2, N'塔基', CAST(234.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(10.50 AS Decimal(18, 2)), CAST(12.21 AS Decimal(18, 2)), CAST(N'2020-02-01 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MonitorDatas] ([id], [machineUnit_id], [machineUnit_Name], [position_id], [position], [value1], [value2], [value3], [value4], [value5], [create_time]) VALUES (21, 4, N'离心风机01', 1, N'机舱', CAST(123.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), CAST(12.21 AS Decimal(18, 2)), CAST(N'2020-03-01 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MonitorDatas] ([id], [machineUnit_id], [machineUnit_Name], [position_id], [position], [value1], [value2], [value3], [value4], [value5], [create_time]) VALUES (22, 4, N'离心风机01', 2, N'塔基', CAST(421.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), CAST(12.21 AS Decimal(18, 2)), CAST(N'2020-04-01 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MonitorDatas] ([id], [machineUnit_id], [machineUnit_Name], [position_id], [position], [value1], [value2], [value3], [value4], [value5], [create_time]) VALUES (23, 4, N'离心风机01', 2, N'塔基', CAST(444.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), CAST(12.21 AS Decimal(18, 2)), CAST(N'2020-05-01 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MonitorDatas] ([id], [machineUnit_id], [machineUnit_Name], [position_id], [position], [value1], [value2], [value3], [value4], [value5], [create_time]) VALUES (24, 4, N'离心风机01', 2, N'塔基', CAST(666.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), CAST(8.00 AS Decimal(18, 2)), CAST(12.21 AS Decimal(18, 2)), CAST(N'2020-06-01 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MonitorDatas] ([id], [machineUnit_id], [machineUnit_Name], [position_id], [position], [value1], [value2], [value3], [value4], [value5], [create_time]) VALUES (25, 4, N'离心风机01', 2, N'塔基', CAST(1233.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), CAST(12.21 AS Decimal(18, 2)), CAST(N'2020-01-01 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MonitorDatas] ([id], [machineUnit_id], [machineUnit_Name], [position_id], [position], [value1], [value2], [value3], [value4], [value5], [create_time]) VALUES (26, 5, N'离心风机02', 1, N'机舱', CAST(700.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), CAST(23.00 AS Decimal(18, 2)), CAST(12.21 AS Decimal(18, 2)), CAST(N'2020-02-01 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MonitorDatas] ([id], [machineUnit_id], [machineUnit_Name], [position_id], [position], [value1], [value2], [value3], [value4], [value5], [create_time]) VALUES (27, 5, N'离心风机02', 2, N'塔基', CAST(122.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(24.00 AS Decimal(18, 2)), CAST(13.00 AS Decimal(18, 2)), CAST(12.21 AS Decimal(18, 2)), CAST(N'2020-03-01 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MonitorDatas] ([id], [machineUnit_id], [machineUnit_Name], [position_id], [position], [value1], [value2], [value3], [value4], [value5], [create_time]) VALUES (28, 5, N'离心风机02', 2, N'塔基', CAST(344.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), CAST(12.21 AS Decimal(18, 2)), CAST(N'2020-04-01 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MonitorDatas] ([id], [machineUnit_id], [machineUnit_Name], [position_id], [position], [value1], [value2], [value3], [value4], [value5], [create_time]) VALUES (29, 5, N'离心风机02', 2, N'塔基', CAST(1111.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(12.21 AS Decimal(18, 2)), CAST(N'2020-05-01 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MonitorDatas] ([id], [machineUnit_id], [machineUnit_Name], [position_id], [position], [value1], [value2], [value3], [value4], [value5], [create_time]) VALUES (30, 6, N'排烟风机01', 1, N'机舱', CAST(444.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), CAST(12.21 AS Decimal(18, 2)), CAST(N'2020-06-01 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MonitorDatas] ([id], [machineUnit_id], [machineUnit_Name], [position_id], [position], [value1], [value2], [value3], [value4], [value5], [create_time]) VALUES (31, 6, N'排烟风机01', 1, N'机舱', CAST(555.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), CAST(23.00 AS Decimal(18, 2)), CAST(12.21 AS Decimal(18, 2)), CAST(N'2020-01-01 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MonitorDatas] ([id], [machineUnit_id], [machineUnit_Name], [position_id], [position], [value1], [value2], [value3], [value4], [value5], [create_time]) VALUES (32, 6, N'排烟风机01', 1, N'机舱', CAST(66.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(12.21 AS Decimal(18, 2)), CAST(N'2020-02-01 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MonitorDatas] ([id], [machineUnit_id], [machineUnit_Name], [position_id], [position], [value1], [value2], [value3], [value4], [value5], [create_time]) VALUES (33, 6, N'排烟风机01', 1, N'机舱', CAST(111.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(8.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(12.21 AS Decimal(18, 2)), CAST(N'2020-03-01 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MonitorDatas] ([id], [machineUnit_id], [machineUnit_Name], [position_id], [position], [value1], [value2], [value3], [value4], [value5], [create_time]) VALUES (34, 6, N'排烟风机01', 2, N'塔基', CAST(222.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), CAST(23.00 AS Decimal(18, 2)), CAST(12.21 AS Decimal(18, 2)), CAST(N'2020-04-01 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MonitorDatas] ([id], [machineUnit_id], [machineUnit_Name], [position_id], [position], [value1], [value2], [value3], [value4], [value5], [create_time]) VALUES (35, 6, N'排烟风机01', 2, N'塔基', CAST(555.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(8.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), CAST(12.21 AS Decimal(18, 2)), CAST(N'2020-05-01 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MonitorDatas] ([id], [machineUnit_id], [machineUnit_Name], [position_id], [position], [value1], [value2], [value3], [value4], [value5], [create_time]) VALUES (36, 6, N'排烟风机01', 2, N'塔基', CAST(666.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), CAST(8.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), CAST(12.21 AS Decimal(18, 2)), CAST(N'2020-06-01 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MonitorDatas] ([id], [machineUnit_id], [machineUnit_Name], [position_id], [position], [value1], [value2], [value3], [value4], [value5], [create_time]) VALUES (37, 7, N'排烟风机02', 2, N'塔基', CAST(111.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), CAST(9.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), CAST(12.21 AS Decimal(18, 2)), CAST(N'2020-01-01 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MonitorDatas] ([id], [machineUnit_id], [machineUnit_Name], [position_id], [position], [value1], [value2], [value3], [value4], [value5], [create_time]) VALUES (38, 7, N'排烟风机02', 1, N'机舱', CAST(333.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), CAST(12.21 AS Decimal(18, 2)), CAST(N'2020-02-01 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MonitorDatas] ([id], [machineUnit_id], [machineUnit_Name], [position_id], [position], [value1], [value2], [value3], [value4], [value5], [create_time]) VALUES (39, 7, N'排烟风机02', 1, N'机舱', CAST(555.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), CAST(21.00 AS Decimal(18, 2)), CAST(12.21 AS Decimal(18, 2)), CAST(N'2020-03-01 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MonitorDatas] ([id], [machineUnit_id], [machineUnit_Name], [position_id], [position], [value1], [value2], [value3], [value4], [value5], [create_time]) VALUES (40, 7, N'排烟风机02', 1, N'机舱', CAST(777.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), CAST(13.00 AS Decimal(18, 2)), CAST(12.21 AS Decimal(18, 2)), CAST(N'2020-04-01 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MonitorDatas] ([id], [machineUnit_id], [machineUnit_Name], [position_id], [position], [value1], [value2], [value3], [value4], [value5], [create_time]) VALUES (89, 1, N'轴流风机01', 1, N'机舱', CAST(333.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), CAST(N'2020-03-29 13:28:34.857' AS DateTime))
GO
INSERT [dbo].[MonitorDatas] ([id], [machineUnit_id], [machineUnit_Name], [position_id], [position], [value1], [value2], [value3], [value4], [value5], [create_time]) VALUES (90, 1, N'轴流风机01', 1, N'机舱', CAST(444.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), CAST(N'2020-03-29 13:28:34.900' AS DateTime))
GO
INSERT [dbo].[MonitorDatas] ([id], [machineUnit_id], [machineUnit_Name], [position_id], [position], [value1], [value2], [value3], [value4], [value5], [create_time]) VALUES (91, 1, N'轴流风机01', 1, N'机舱', CAST(555.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), CAST(N'2020-03-29 13:28:34.947' AS DateTime))
GO
INSERT [dbo].[MonitorDatas] ([id], [machineUnit_id], [machineUnit_Name], [position_id], [position], [value1], [value2], [value3], [value4], [value5], [create_time]) VALUES (92, 1, N'轴流风机01', 1, N'机舱', CAST(666.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(N'2020-03-29 13:28:34.987' AS DateTime))
GO
INSERT [dbo].[MonitorDatas] ([id], [machineUnit_id], [machineUnit_Name], [position_id], [position], [value1], [value2], [value3], [value4], [value5], [create_time]) VALUES (93, 1, N'轴流风机01', 1, N'机舱', CAST(777.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(N'2020-03-29 13:28:35.030' AS DateTime))
GO
INSERT [dbo].[MonitorDatas] ([id], [machineUnit_id], [machineUnit_Name], [position_id], [position], [value1], [value2], [value3], [value4], [value5], [create_time]) VALUES (94, 1, N'轴流风机01', 1, N'机舱', CAST(888.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(N'2020-03-29 13:28:35.073' AS DateTime))
GO
INSERT [dbo].[MonitorDatas] ([id], [machineUnit_id], [machineUnit_Name], [position_id], [position], [value1], [value2], [value3], [value4], [value5], [create_time]) VALUES (95, 1, N'轴流风机01', 1, N'机舱', CAST(999.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(N'2020-03-29 13:28:35.117' AS DateTime))
GO
INSERT [dbo].[MonitorDatas] ([id], [machineUnit_id], [machineUnit_Name], [position_id], [position], [value1], [value2], [value3], [value4], [value5], [create_time]) VALUES (96, 1, N'轴流风机01', 1, N'机舱', CAST(1110.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), CAST(N'2020-03-29 13:28:35.163' AS DateTime))
GO
INSERT [dbo].[MonitorDatas] ([id], [machineUnit_id], [machineUnit_Name], [position_id], [position], [value1], [value2], [value3], [value4], [value5], [create_time]) VALUES (97, 1, N'轴流风机01', 1, N'机舱', CAST(1221.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), CAST(N'2020-03-29 13:28:35.207' AS DateTime))
GO
INSERT [dbo].[MonitorDatas] ([id], [machineUnit_id], [machineUnit_Name], [position_id], [position], [value1], [value2], [value3], [value4], [value5], [create_time]) VALUES (98, 1, N'轴流风机01', 1, N'机舱', CAST(1111.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), CAST(N'2020-03-29 13:28:35.250' AS DateTime))
GO
INSERT [dbo].[MonitorDatas] ([id], [machineUnit_id], [machineUnit_Name], [position_id], [position], [value1], [value2], [value3], [value4], [value5], [create_time]) VALUES (99, 1, N'轴流风机01', 1, N'机舱', CAST(1001.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), CAST(N'2020-03-29 13:28:35.293' AS DateTime))
GO
INSERT [dbo].[MonitorDatas] ([id], [machineUnit_id], [machineUnit_Name], [position_id], [position], [value1], [value2], [value3], [value4], [value5], [create_time]) VALUES (100, 1, N'轴流风机01', 2, N'塔基', CAST(891.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), CAST(N'2020-03-29 13:28:35.337' AS DateTime))
GO
INSERT [dbo].[MonitorDatas] ([id], [machineUnit_id], [machineUnit_Name], [position_id], [position], [value1], [value2], [value3], [value4], [value5], [create_time]) VALUES (101, 1, N'轴流风机01', 2, N'塔基', CAST(781.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(N'2020-03-29 13:28:35.380' AS DateTime))
GO
INSERT [dbo].[MonitorDatas] ([id], [machineUnit_id], [machineUnit_Name], [position_id], [position], [value1], [value2], [value3], [value4], [value5], [create_time]) VALUES (102, 1, N'轴流风机01', 2, N'塔基', CAST(671.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(N'2020-03-29 13:28:35.420' AS DateTime))
GO
INSERT [dbo].[MonitorDatas] ([id], [machineUnit_id], [machineUnit_Name], [position_id], [position], [value1], [value2], [value3], [value4], [value5], [create_time]) VALUES (103, 1, N'轴流风机01', 2, N'塔基', CAST(561.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(N'2020-03-29 13:28:35.460' AS DateTime))
GO
INSERT [dbo].[MonitorDatas] ([id], [machineUnit_id], [machineUnit_Name], [position_id], [position], [value1], [value2], [value3], [value4], [value5], [create_time]) VALUES (104, 1, N'轴流风机01', 2, N'塔基', CAST(451.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(N'2020-03-29 13:28:35.507' AS DateTime))
GO
INSERT [dbo].[MonitorDatas] ([id], [machineUnit_id], [machineUnit_Name], [position_id], [position], [value1], [value2], [value3], [value4], [value5], [create_time]) VALUES (105, 1, N'轴流风机01', 2, N'塔基', CAST(341.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), CAST(N'2020-03-29 13:28:35.550' AS DateTime))
GO
INSERT [dbo].[MonitorDatas] ([id], [machineUnit_id], [machineUnit_Name], [position_id], [position], [value1], [value2], [value3], [value4], [value5], [create_time]) VALUES (106, 1, N'轴流风机01', 2, N'塔基', CAST(231.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), CAST(N'2020-03-29 13:28:35.590' AS DateTime))
GO
INSERT [dbo].[MonitorDatas] ([id], [machineUnit_id], [machineUnit_Name], [position_id], [position], [value1], [value2], [value3], [value4], [value5], [create_time]) VALUES (107, 1, N'轴流风机01', 2, N'塔基', CAST(121.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), CAST(N'2020-03-29 13:28:35.637' AS DateTime))
GO
INSERT [dbo].[MonitorDatas] ([id], [machineUnit_id], [machineUnit_Name], [position_id], [position], [value1], [value2], [value3], [value4], [value5], [create_time]) VALUES (108, 1, N'轴流风机01', 2, N'塔基', CAST(11.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(N'2020-03-29 13:28:35.683' AS DateTime))
GO
INSERT [dbo].[MonitorDatas] ([id], [machineUnit_id], [machineUnit_Name], [position_id], [position], [value1], [value2], [value3], [value4], [value5], [create_time]) VALUES (109, 1, N'轴流风机01', 2, N'塔基', CAST(-99.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(N'2020-03-29 13:28:35.727' AS DateTime))
GO
INSERT [dbo].[MonitorDatas] ([id], [machineUnit_id], [machineUnit_Name], [position_id], [position], [value1], [value2], [value3], [value4], [value5], [create_time]) VALUES (110, 1, N'轴流风机01', 2, N'塔基', CAST(-209.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(N'2020-03-29 13:28:35.770' AS DateTime))
GO
INSERT [dbo].[MonitorDatas] ([id], [machineUnit_id], [machineUnit_Name], [position_id], [position], [value1], [value2], [value3], [value4], [value5], [create_time]) VALUES (111, 1, N'轴流风机01', 2, N'塔基', CAST(-319.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(N'2020-03-29 13:28:35.810' AS DateTime))
GO
INSERT [dbo].[MonitorDatas] ([id], [machineUnit_id], [machineUnit_Name], [position_id], [position], [value1], [value2], [value3], [value4], [value5], [create_time]) VALUES (112, 1, N'轴流风机01', 2, N'塔基', CAST(-429.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), CAST(N'2020-03-29 13:28:35.853' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[MonitorDatas] OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Y 启用 N 禁用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MachineUnit', @level2type=N'COLUMN',@level2name=N'enable_flag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'机组名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MonitorDatas', @level2type=N'COLUMN',@level2name=N'machineUnit_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'机舱/塔基' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MonitorDatas', @level2type=N'COLUMN',@level2name=N'position'
GO
USE [master]
GO
ALTER DATABASE [testDb] SET  READ_WRITE 
GO
