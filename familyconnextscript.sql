USE [master]
GO
/****** Object:  Database [FamilyConnext]    Script Date: 6/5/2017 3:08:30 PM ******/
CREATE DATABASE [FamilyConnext]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FamilyConnext', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\FamilyConnext.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FamilyConnext_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\FamilyConnext_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [FamilyConnext] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FamilyConnext].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FamilyConnext] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FamilyConnext] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FamilyConnext] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FamilyConnext] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FamilyConnext] SET ARITHABORT OFF 
GO
ALTER DATABASE [FamilyConnext] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FamilyConnext] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FamilyConnext] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FamilyConnext] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FamilyConnext] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FamilyConnext] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FamilyConnext] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FamilyConnext] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FamilyConnext] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FamilyConnext] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FamilyConnext] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FamilyConnext] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FamilyConnext] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FamilyConnext] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FamilyConnext] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FamilyConnext] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FamilyConnext] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FamilyConnext] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FamilyConnext] SET  MULTI_USER 
GO
ALTER DATABASE [FamilyConnext] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FamilyConnext] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FamilyConnext] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FamilyConnext] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [FamilyConnext] SET DELAYED_DURABILITY = DISABLED 
GO
USE [FamilyConnext]
GO
/****** Object:  Table [dbo].[Connections]    Script Date: 6/5/2017 3:08:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Connections](
	[ConnectionID] [int] IDENTITY(1,1) NOT NULL,
	[MemberID] [int] NOT NULL,
	[ConnectionDescription] [nvarchar](150) NULL,
	[PointsAwarded] [int] NOT NULL,
	[FamilyID] [nvarchar](150) NULL,
 CONSTRAINT [PK_Connections] PRIMARY KEY CLUSTERED 
(
	[ConnectionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Members]    Script Date: 6/5/2017 3:08:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Members](
	[MemberID] [int] IDENTITY(1,1) NOT NULL,
	[MemberName] [nvarchar](50) NOT NULL,
	[FamilyID] [nvarchar](150) NULL,
 CONSTRAINT [PK_Members] PRIMARY KEY CLUSTERED 
(
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Milestones]    Script Date: 6/5/2017 3:08:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Milestones](
	[MilestoneID] [int] IDENTITY(1,1) NOT NULL,
	[MilestoneName] [nvarchar](50) NOT NULL,
	[PointsNeeded] [int] NOT NULL,
	[FamilyID] [nvarchar](150) NULL,
 CONSTRAINT [PK_Milestones] PRIMARY KEY CLUSTERED 
(
	[MilestoneID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Connections] ON 

INSERT [dbo].[Connections] ([ConnectionID], [MemberID], [ConnectionDescription], [PointsAwarded], [FamilyID]) VALUES (2, 4, N'Hugged his brother.', 1, N'8bfce702-b2cb-4e70-a72e-cc7b9a530936')
INSERT [dbo].[Connections] ([ConnectionID], [MemberID], [ConnectionDescription], [PointsAwarded], [FamilyID]) VALUES (3, 5, N'Helped people.', 1, N'2ac83eb4-8ea9-4d51-9d3a-7f40f7e13e5d')
INSERT [dbo].[Connections] ([ConnectionID], [MemberID], [ConnectionDescription], [PointsAwarded], [FamilyID]) VALUES (4, 6, N'Did great stuff!', 5, N'94e05862-abf8-41d5-aec9-20948d63aa3a')
INSERT [dbo].[Connections] ([ConnectionID], [MemberID], [ConnectionDescription], [PointsAwarded], [FamilyID]) VALUES (5, 6, N'More stuff!', 3, N'94e05862-abf8-41d5-aec9-20948d63aa3a')
INSERT [dbo].[Connections] ([ConnectionID], [MemberID], [ConnectionDescription], [PointsAwarded], [FamilyID]) VALUES (6, 4, N'Stuff', 4, N'8bfce702-b2cb-4e70-a72e-cc7b9a530936')
SET IDENTITY_INSERT [dbo].[Connections] OFF
SET IDENTITY_INSERT [dbo].[Members] ON 

INSERT [dbo].[Members] ([MemberID], [MemberName], [FamilyID]) VALUES (4, N'Jarryd', N'8bfce702-b2cb-4e70-a72e-cc7b9a530936')
INSERT [dbo].[Members] ([MemberID], [MemberName], [FamilyID]) VALUES (5, N'Russ', N'2ac83eb4-8ea9-4d51-9d3a-7f40f7e13e5d')
INSERT [dbo].[Members] ([MemberID], [MemberName], [FamilyID]) VALUES (6, N'Dorrian', N'94e05862-abf8-41d5-aec9-20948d63aa3a')
SET IDENTITY_INSERT [dbo].[Members] OFF
SET IDENTITY_INSERT [dbo].[Milestones] ON 

INSERT [dbo].[Milestones] ([MilestoneID], [MilestoneName], [PointsNeeded], [FamilyID]) VALUES (1, N'Cedar Point', 50, N'8bfce702-b2cb-4e70-a72e-cc7b9a530936')
INSERT [dbo].[Milestones] ([MilestoneID], [MilestoneName], [PointsNeeded], [FamilyID]) VALUES (2, N'Wonder Woman Movie', 15, N'2ac83eb4-8ea9-4d51-9d3a-7f40f7e13e5d')
SET IDENTITY_INSERT [dbo].[Milestones] OFF
ALTER TABLE [dbo].[Connections]  WITH CHECK ADD  CONSTRAINT [FK_Connections_Members] FOREIGN KEY([MemberID])
REFERENCES [dbo].[Members] ([MemberID])
GO
ALTER TABLE [dbo].[Connections] CHECK CONSTRAINT [FK_Connections_Members]
GO
USE [master]
GO
ALTER DATABASE [FamilyConnext] SET  READ_WRITE 
GO
