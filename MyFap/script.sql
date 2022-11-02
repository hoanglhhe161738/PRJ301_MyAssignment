USE [master]
GO
/****** Object:  Database [SE1643_PRJ301]    Script Date: 11/3/2022 2:49:40 AM ******/
CREATE DATABASE [SE1643_PRJ301]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SE1643_PRJ301', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SE1643_PRJ301.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SE1643_PRJ301_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SE1643_PRJ301_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SE1643_PRJ301] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SE1643_PRJ301].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SE1643_PRJ301] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SE1643_PRJ301] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SE1643_PRJ301] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SE1643_PRJ301] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SE1643_PRJ301] SET ARITHABORT OFF 
GO
ALTER DATABASE [SE1643_PRJ301] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SE1643_PRJ301] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SE1643_PRJ301] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SE1643_PRJ301] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SE1643_PRJ301] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SE1643_PRJ301] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SE1643_PRJ301] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SE1643_PRJ301] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SE1643_PRJ301] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SE1643_PRJ301] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SE1643_PRJ301] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SE1643_PRJ301] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SE1643_PRJ301] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SE1643_PRJ301] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SE1643_PRJ301] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SE1643_PRJ301] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SE1643_PRJ301] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SE1643_PRJ301] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SE1643_PRJ301] SET  MULTI_USER 
GO
ALTER DATABASE [SE1643_PRJ301] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SE1643_PRJ301] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SE1643_PRJ301] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SE1643_PRJ301] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SE1643_PRJ301] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SE1643_PRJ301] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SE1643_PRJ301] SET QUERY_STORE = OFF
GO
USE [SE1643_PRJ301]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 11/3/2022 2:49:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[accid] [int] NOT NULL,
	[username] [varchar](150) NOT NULL,
	[password] [varchar](150) NOT NULL,
	[displayname] [nchar](10) NULL,
 CONSTRAINT [PK_Account_1] PRIMARY KEY CLUSTERED 
(
	[accid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Attendent]    Script Date: 11/3/2022 2:49:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendent](
	[sesid] [int] NOT NULL,
	[stid] [int] NOT NULL,
	[attandance] [bit] NOT NULL,
	[description] [varchar](150) NULL,
	[recordtime] [datetime] NULL,
 CONSTRAINT [PK_Attendent_1] PRIMARY KEY CLUSTERED 
(
	[sesid] ASC,
	[stid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feature]    Script Date: 11/3/2022 2:49:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feature](
	[fid] [int] NOT NULL,
	[fname] [varchar](150) NOT NULL,
	[url] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Feature] PRIMARY KEY CLUSTERED 
(
	[fid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group]    Script Date: 11/3/2022 2:49:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[Group_ID] [int] NOT NULL,
	[Group] [varchar](150) NOT NULL,
	[Subject_ID] [int] NOT NULL,
	[Lecturer_ID] [int] NOT NULL,
	[sem] [varchar](150) NOT NULL,
	[year] [int] NOT NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[Group_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lecturer]    Script Date: 11/3/2022 2:49:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lecturer](
	[Lecturer_ID] [int] NOT NULL,
	[Lecturer] [varchar](150) NOT NULL,
	[Gender] [bit] NOT NULL,
	[Date of birth] [date] NOT NULL,
	[Email] [varchar](150) NULL,
	[Phone] [numeric](18, 0) NULL,
	[accid] [int] NOT NULL,
 CONSTRAINT [PK_Lecturer] PRIMARY KEY CLUSTERED 
(
	[Lecturer_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 11/3/2022 2:49:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[rid] [int] NOT NULL,
	[rname] [varchar](150) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[rid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role_Account]    Script Date: 11/3/2022 2:49:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_Account](
	[rid] [int] NOT NULL,
	[accid] [int] NOT NULL,
 CONSTRAINT [PK_Role_Account] PRIMARY KEY CLUSTERED 
(
	[rid] ASC,
	[accid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role_Feature]    Script Date: 11/3/2022 2:49:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_Feature](
	[rid] [int] NOT NULL,
	[fid] [int] NOT NULL,
 CONSTRAINT [PK_Role_Feature] PRIMARY KEY CLUSTERED 
(
	[rid] ASC,
	[fid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rom]    Script Date: 11/3/2022 2:49:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rom](
	[Room_ID] [int] NOT NULL,
	[Room] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Rom] PRIMARY KEY CLUSTERED 
(
	[Room_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Session]    Script Date: 11/3/2022 2:49:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Session](
	[Session_ID] [int] NOT NULL,
	[GroupID] [int] NOT NULL,
	[Room_ID] [int] NOT NULL,
	[Lid] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Slot_ID] [int] NOT NULL,
 CONSTRAINT [PK_Session] PRIMARY KEY CLUSTERED 
(
	[Session_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Skill]    Script Date: 11/3/2022 2:49:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skill](
	[Skill_ID] [int] NOT NULL,
	[Skill] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Skill] PRIMARY KEY CLUSTERED 
(
	[Skill_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slot]    Script Date: 11/3/2022 2:49:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slot](
	[Slot_ID] [int] NOT NULL,
	[Slot] [varchar](150) NOT NULL,
	[Start] [varchar](150) NOT NULL,
	[End] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Slot] PRIMARY KEY CLUSTERED 
(
	[Slot_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 11/3/2022 2:49:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Student_ID] [int] NOT NULL,
	[Name] [varchar](150) NOT NULL,
	[Gender] [bit] NOT NULL,
	[Date of birth] [date] NOT NULL,
	[Email] [varchar](150) NULL,
	[Phone] [numeric](18, 0) NULL,
	[Skill_ID] [int] NOT NULL,
	[accid] [int] NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Student_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student_Group]    Script Date: 11/3/2022 2:49:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_Group](
	[Student_ID] [int] NOT NULL,
	[Group_ID] [int] NOT NULL,
 CONSTRAINT [PK_Student_Group] PRIMARY KEY CLUSTERED 
(
	[Student_ID] ASC,
	[Group_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 11/3/2022 2:49:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[Subject_ID] [int] NOT NULL,
	[Subject] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[Subject_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Attendent]  WITH CHECK ADD  CONSTRAINT [FK_Attendent_Session1] FOREIGN KEY([sesid])
REFERENCES [dbo].[Session] ([Session_ID])
GO
ALTER TABLE [dbo].[Attendent] CHECK CONSTRAINT [FK_Attendent_Session1]
GO
ALTER TABLE [dbo].[Attendent]  WITH CHECK ADD  CONSTRAINT [FK_Attendent_Student1] FOREIGN KEY([stid])
REFERENCES [dbo].[Student] ([Student_ID])
GO
ALTER TABLE [dbo].[Attendent] CHECK CONSTRAINT [FK_Attendent_Student1]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_Lecturer] FOREIGN KEY([Lecturer_ID])
REFERENCES [dbo].[Lecturer] ([Lecturer_ID])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_Lecturer]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_Subject] FOREIGN KEY([Subject_ID])
REFERENCES [dbo].[Subject] ([Subject_ID])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_Subject]
GO
ALTER TABLE [dbo].[Role_Account]  WITH CHECK ADD  CONSTRAINT [FK_Role_Account_Account] FOREIGN KEY([accid])
REFERENCES [dbo].[Account] ([accid])
GO
ALTER TABLE [dbo].[Role_Account] CHECK CONSTRAINT [FK_Role_Account_Account]
GO
ALTER TABLE [dbo].[Role_Account]  WITH CHECK ADD  CONSTRAINT [FK_Role_Account_Role] FOREIGN KEY([rid])
REFERENCES [dbo].[Role] ([rid])
GO
ALTER TABLE [dbo].[Role_Account] CHECK CONSTRAINT [FK_Role_Account_Role]
GO
ALTER TABLE [dbo].[Role_Feature]  WITH CHECK ADD  CONSTRAINT [FK_Role_Feature_Feature] FOREIGN KEY([fid])
REFERENCES [dbo].[Feature] ([fid])
GO
ALTER TABLE [dbo].[Role_Feature] CHECK CONSTRAINT [FK_Role_Feature_Feature]
GO
ALTER TABLE [dbo].[Role_Feature]  WITH CHECK ADD  CONSTRAINT [FK_Role_Feature_Role] FOREIGN KEY([rid])
REFERENCES [dbo].[Role] ([rid])
GO
ALTER TABLE [dbo].[Role_Feature] CHECK CONSTRAINT [FK_Role_Feature_Role]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Skill] FOREIGN KEY([Skill_ID])
REFERENCES [dbo].[Skill] ([Skill_ID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Skill]
GO
ALTER TABLE [dbo].[Student_Group]  WITH CHECK ADD  CONSTRAINT [FK_Student_Group_Group] FOREIGN KEY([Group_ID])
REFERENCES [dbo].[Group] ([Group_ID])
GO
ALTER TABLE [dbo].[Student_Group] CHECK CONSTRAINT [FK_Student_Group_Group]
GO
ALTER TABLE [dbo].[Student_Group]  WITH CHECK ADD  CONSTRAINT [FK_Student_Group_Student] FOREIGN KEY([Student_ID])
REFERENCES [dbo].[Student] ([Student_ID])
GO
ALTER TABLE [dbo].[Student_Group] CHECK CONSTRAINT [FK_Student_Group_Student]
GO
USE [master]
GO
ALTER DATABASE [SE1643_PRJ301] SET  READ_WRITE 
GO
