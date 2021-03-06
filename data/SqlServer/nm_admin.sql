USE [master]
GO
/****** Object:  Database [Nm_Admin]    Script Date: 2019/6/27 18:08:11 ******/
CREATE DATABASE [Nm_Admin]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Nm_Admin', FILENAME = N'D:\Database\SqlServer\Nm_Admin.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Nm_Admin_log', FILENAME = N'D:\Database\SqlServer\Nm_Admin_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Nm_Admin] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Nm_Admin].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Nm_Admin] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Nm_Admin] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Nm_Admin] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Nm_Admin] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Nm_Admin] SET ARITHABORT OFF 
GO
ALTER DATABASE [Nm_Admin] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Nm_Admin] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Nm_Admin] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Nm_Admin] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Nm_Admin] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Nm_Admin] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Nm_Admin] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Nm_Admin] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Nm_Admin] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Nm_Admin] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Nm_Admin] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Nm_Admin] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Nm_Admin] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Nm_Admin] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Nm_Admin] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Nm_Admin] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Nm_Admin] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Nm_Admin] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Nm_Admin] SET  MULTI_USER 
GO
ALTER DATABASE [Nm_Admin] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Nm_Admin] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Nm_Admin] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Nm_Admin] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Nm_Admin] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Nm_Admin', N'ON'
GO
ALTER DATABASE [Nm_Admin] SET QUERY_STORE = OFF
GO
USE [Nm_Admin]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 2019/6/27 18:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Id] [uniqueidentifier] NOT NULL,
	[Type] [int] NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[LoginTime] [datetime] NOT NULL,
	[LoginIP] [nvarchar](50) NOT NULL,
	[Status] [smallint] NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifiedTime] [datetime] NOT NULL,
	[ModifiedBy] [uniqueidentifier] NOT NULL,
	[ClosedTime] [datetime] NOT NULL,
	[ClosedBy] [uniqueidentifier] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedTime] [datetime] NOT NULL,
	[DeletedBy] [uniqueidentifier] NULL,
 CONSTRAINT [PK__account__3214EC071E3612B8] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Account_Role]    Script Date: 2019/6/27 18:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account_Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccountId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK__account___3214EC073D3C30BD] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Auditinfo]    Script Date: 2019/6/27 18:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Auditinfo](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[AccountId] [uniqueidentifier] NULL,
	[Area] [nvarchar](50) NOT NULL,
	[Controller] [nvarchar](50) NOT NULL,
	[Action] [nvarchar](50) NOT NULL,
	[Parameters] [nvarchar](max) NULL,
	[Result] [nvarchar](max) NULL,
	[ExecutionTime] [datetime] NOT NULL,
	[ExecutionDuration] [bigint] NOT NULL,
	[BrowserInfo] [nvarchar](500) NULL,
	[Platform] [smallint] NOT NULL,
	[IP] [nvarchar](50) NULL,
 CONSTRAINT [PK__auditinf__3214EC07298C1FEC] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Button]    Script Date: 2019/6/27 18:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Button](
	[Id] [uniqueidentifier] NOT NULL,
	[MenuId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Icon] [nvarchar](50) NULL,
	[Code] [nvarchar](100) NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifiedTime] [datetime] NOT NULL,
	[ModifiedBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK__button__3214EC072D40EF87] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Button_Permission]    Script Date: 2019/6/27 18:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Button_Permission](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ButtonId] [uniqueidentifier] NOT NULL,
	[PermissionId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK__button_p__3214EC07808728BE] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Config]    Script Date: 2019/6/27 18:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Config](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](255) NOT NULL,
	[Value] [nvarchar](500) NULL,
	[Remarks] [nvarchar](255) NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifiedTime] [datetime] NOT NULL,
	[ModifiedBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK__config__3214EC07FEE4C807] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 2019/6/27 18:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[Id] [uniqueidentifier] NOT NULL,
	[ModuleCode] [nvarchar](50) NOT NULL,
	[Type] [smallint] NOT NULL,
	[ParentId] [uniqueidentifier] NULL,
	[Name] [nvarchar](50) NOT NULL,
	[RouteName] [nvarchar](100) NOT NULL,
	[RouteParams] [nvarchar](300) NULL,
	[RouteQuery] [nvarchar](300) NULL,
	[Icon] [nvarchar](20) NOT NULL,
	[IconColor] [nvarchar](10) NULL,
	[Url] [nvarchar](255) NOT NULL,
	[Level] [int] NOT NULL,
	[Show] [bit] NOT NULL,
	[Sort] [int] NOT NULL,
	[Target] [smallint] NOT NULL,
	[DialogWidth] [nvarchar](20) NULL,
	[DialogHeight] [nvarchar](20) NULL,
	[DialogFullscreen] [bit] NOT NULL,
	[Remarks] [nvarchar](255) NULL,
	[CreatedTime] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifiedTime] [datetime] NOT NULL,
	[ModifiedBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK__menu__3214EC0779FF22F5] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu_Permission]    Script Date: 2019/6/27 18:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu_Permission](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MenuId] [uniqueidentifier] NOT NULL,
	[PermissionId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK__menu_per__3214EC07AB759BF9] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Moduleinfo]    Script Date: 2019/6/27 18:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Moduleinfo](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Version] [nvarchar](50) NOT NULL,
	[Remarks] [nvarchar](200) NULL,
	[CreatedTime] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifiedTime] [datetime] NOT NULL,
	[ModifiedBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK__modulein__3214EC07EFDFDD04] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permission]    Script Date: 2019/6/27 18:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permission](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[ModuleCode] [nvarchar](50) NOT NULL,
	[Controller] [nvarchar](50) NOT NULL,
	[Action] [nvarchar](50) NOT NULL,
	[HttpMethod] [smallint] NULL,
	[CreatedTime] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifiedTime] [datetime] NOT NULL,
	[ModifiedBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK__permissi__3214EC07495D53C6] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 2019/6/27 18:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Remarks] [nvarchar](255) NULL,
	[CreatedTime] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifiedTime] [datetime] NOT NULL,
	[ModifiedBy] [uniqueidentifier] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedTime] [datetime] NOT NULL,
	[DeletedBy] [uniqueidentifier] NULL,
 CONSTRAINT [PK__role__3214EC07950A42FF] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role_Menu]    Script Date: 2019/6/27 18:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_Menu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[MenuId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK__role_men__3214EC07821D4003] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role_Menu_Button]    Script Date: 2019/6/27 18:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_Menu_Button](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[MenuId] [uniqueidentifier] NOT NULL,
	[ButtonId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK__role_men__3214EC0755A8E868] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([Id], [Type], [UserName], [Password], [Name], [Phone], [Email], [LoginTime], [LoginIP], [Status], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy], [ClosedTime], [ClosedBy], [Deleted], [DeletedTime], [DeletedBy]) VALUES (N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', 0, N'admin', N'E739279CB28CDAFD7373618313803524', N'管理员', N'', N'', CAST(N'2019-06-27T17:17:18.720' AS DateTime), N'0.0.0.1', 1, CAST(N'2019-04-12T11:36:52.000' AS DateTime), N'00000000-0000-0000-0000-000000000000', CAST(N'2019-04-18T17:30:57.000' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-04-12T11:36:52.000' AS DateTime), N'00000000-0000-0000-0000-000000000000', 0, CAST(N'2019-04-12T11:36:52.000' AS DateTime), N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[Account] ([Id], [Type], [UserName], [Password], [Name], [Phone], [Email], [LoginTime], [LoginIP], [Status], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy], [ClosedTime], [ClosedBy], [Deleted], [DeletedTime], [DeletedBy]) VALUES (N'e73a0d88-bfb2-6b6e-93cb-39eea4075745', 0, N'liwj', N'D4B4E0D8F1D5DECD152D51CF57B2B0EF', N'李文举', N'15150552187', N'wenju1991@163.com', CAST(N'2019-06-26T11:35:44.160' AS DateTime), N'', 0, CAST(N'2019-06-26T11:35:44.160' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-26T14:42:59.347' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-26T11:35:44.160' AS DateTime), N'00000000-0000-0000-0000-000000000000', 0, CAST(N'2019-06-26T11:35:44.160' AS DateTime), N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[Account] ([Id], [Type], [UserName], [Password], [Name], [Phone], [Email], [LoginTime], [LoginIP], [Status], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy], [ClosedTime], [ClosedBy], [Deleted], [DeletedTime], [DeletedBy]) VALUES (N'67e399b6-c15c-f57d-ac0d-39eea41adf23', 1, N'liudh', N'12AF84C64718C476D526049FCFBDA552', N'刘德华', N'15150552188', N'', CAST(N'2019-06-26T11:57:04.143' AS DateTime), N'', 0, CAST(N'2019-06-26T11:57:04.143' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-26T14:29:46.657' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-26T11:57:04.143' AS DateTime), N'00000000-0000-0000-0000-000000000000', 0, CAST(N'2019-06-26T11:57:04.143' AS DateTime), N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[Account] ([Id], [Type], [UserName], [Password], [Name], [Phone], [Email], [LoginTime], [LoginIP], [Status], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy], [ClosedTime], [ClosedBy], [Deleted], [DeletedTime], [DeletedBy]) VALUES (N'33610d5b-f641-85c6-264a-39eea46a89e1', 1, N'liwj', N'662F3748F27C6337735AA1DAAC7DFCB2', N'李文举', N'15150552187', N'', CAST(N'2019-06-26T13:24:05.197' AS DateTime), N'', 0, CAST(N'2019-06-26T13:24:05.197' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T15:22:51.090' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-26T13:24:05.197' AS DateTime), N'00000000-0000-0000-0000-000000000000', 0, CAST(N'2019-06-26T13:24:05.197' AS DateTime), N'00000000-0000-0000-0000-000000000000')
SET IDENTITY_INSERT [dbo].[Account_Role] ON 

INSERT [dbo].[Account_Role] ([Id], [AccountId], [RoleId]) VALUES (2, N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d')
INSERT [dbo].[Account_Role] ([Id], [AccountId], [RoleId]) VALUES (3, N'c7ccfe14-5d2c-a2b3-2047-39ee99dffc8e', N'4ac74fcc-664a-d9bb-524e-39ee99df890f')
INSERT [dbo].[Account_Role] ([Id], [AccountId], [RoleId]) VALUES (4, N'e73a0d88-bfb2-6b6e-93cb-39eea4075745', N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d')
INSERT [dbo].[Account_Role] ([Id], [AccountId], [RoleId]) VALUES (5, N'67e399b6-c15c-f57d-ac0d-39eea41adf23', N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d')
INSERT [dbo].[Account_Role] ([Id], [AccountId], [RoleId]) VALUES (6, N'33610d5b-f641-85c6-264a-39eea46a89e1', N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d')
SET IDENTITY_INSERT [dbo].[Account_Role] OFF
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'320e8558-48d8-d781-43fc-39ee9aea35e9', N'4ac9ef98-aff8-7e8e-e149-39ee9ae809eb', N'同步', N'refresh', N'admin_moduleinfo_sync', CAST(N'2019-06-24T17:07:20.133' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-24T17:07:20.133' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'11a35d13-c691-0121-6106-39ee9aea35f3', N'4ac9ef98-aff8-7e8e-e149-39ee9ae809eb', N'删除', NULL, N'admin_moduleinfo_del', CAST(N'2019-06-24T17:07:20.137' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-24T17:07:20.137' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'fb81046d-dfb9-e8e9-0836-39ee9aeb44fb', N'1609bab0-f3e8-6e66-cc3c-39ee9ae860c6', N'同步', N'refresh', N'admin_permission_sync', CAST(N'2019-06-24T17:08:29.550' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-24T17:08:29.550' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'd38df13e-558c-2c61-1923-39ee9aeb44fe', N'1609bab0-f3e8-6e66-cc3c-39ee9ae860c6', N'删除', NULL, N'admin_permission_del', CAST(N'2019-06-24T17:08:29.550' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-24T17:08:29.550' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'9af35d6e-7a7a-950f-14e3-39ee9aebb5e6', N'e61af72d-ab86-386a-a4bb-39ee9ae89a2f', N'添加', NULL, N'admin_role_add', CAST(N'2019-06-24T17:08:58.460' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-24T17:08:58.460' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'055879e0-c7eb-9de0-df07-39ee9aebb5e9', N'e61af72d-ab86-386a-a4bb-39ee9ae89a2f', N'编辑', NULL, N'admin_role_edit', CAST(N'2019-06-24T17:08:58.460' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-24T17:08:58.460' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'efb75748-f298-b185-7c15-39ee9aebb5ee', N'e61af72d-ab86-386a-a4bb-39ee9ae89a2f', N'删除', NULL, N'admin_role_del', CAST(N'2019-06-24T17:08:58.460' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-24T17:08:58.460' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'afab0122-1391-8894-b4ad-39ee9aebb5f4', N'e61af72d-ab86-386a-a4bb-39ee9ae89a2f', N'绑定菜单', NULL, N'admin_role_bind_menu', CAST(N'2019-06-24T17:08:58.460' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-24T17:08:58.460' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'7bc98f3a-ac7c-28ff-77c7-39ee9aed0c45', N'7c354368-9616-d664-f4f0-39ee9ae8cab2', N'添加', N'add', N'admin_account_add', CAST(N'2019-06-24T17:10:26.113' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-24T17:10:26.113' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'6ab1fe93-6e68-02c0-eb26-39ee9aed0c4f', N'7c354368-9616-d664-f4f0-39ee9ae8cab2', N'编辑', NULL, N'admin_account_edit', CAST(N'2019-06-24T17:10:26.113' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-24T17:10:26.113' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'94a638ba-d6a9-4e81-a18b-39ee9aed0c52', N'7c354368-9616-d664-f4f0-39ee9ae8cab2', N'删除', NULL, N'admin_account_del', CAST(N'2019-06-24T17:10:26.113' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-24T17:10:26.113' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'0220b6fc-6966-e62f-e7fe-39ee9aed0c54', N'7c354368-9616-d664-f4f0-39ee9ae8cab2', N'重置密码', NULL, N'admin_account_reset_password', CAST(N'2019-06-24T17:10:26.113' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-24T17:10:26.113' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'7c1feb31-8db9-35c1-50cc-39ee9aeea370', N'817ec04d-d9bc-ba30-ad63-39ee9ae9092f', N'添加', N'', N'admin_menu_add', CAST(N'2019-06-24T17:12:10.340' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-24T17:16:55.303' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'df3c5197-66bb-eb7a-4bbe-39ee9aeea374', N'817ec04d-d9bc-ba30-ad63-39ee9ae9092f', N'编辑', N'', N'admin_menu_edit', CAST(N'2019-06-24T17:12:10.340' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-24T17:16:55.330' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'9ade8617-b64d-373b-3893-39ee9aeea37d', N'817ec04d-d9bc-ba30-ad63-39ee9ae9092f', N'删除', N'', N'admin_menu_del', CAST(N'2019-06-24T17:12:10.340' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-24T17:16:55.337' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'009d8ca1-4f8f-3497-2b9b-39ee9aeea37f', N'817ec04d-d9bc-ba30-ad63-39ee9ae9092f', N'绑定权限', N'', N'admin_menu_bind_permission', CAST(N'2019-06-24T17:12:10.340' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-24T17:16:55.343' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'ddfe7e0a-0322-1c93-4475-39ee9aeea381', N'817ec04d-d9bc-ba30-ad63-39ee9ae9092f', N'绑定按钮', N'', N'admin_menu_bind_button', CAST(N'2019-06-24T17:12:10.340' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-24T17:16:55.353' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'0a00c1ef-057d-40cb-085f-39ee9aeea38a', N'817ec04d-d9bc-ba30-ad63-39ee9ae9092f', N'排序', N'', N'admin_menu_sort', CAST(N'2019-06-24T17:12:10.340' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-24T17:16:55.360' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'b379029b-295d-8792-c9d0-39ee9b1c3045', N'f6265a81-4df2-ca40-aa62-39ee9b057c37', N'添加', NULL, N'admin_config_add', CAST(N'2019-06-24T18:01:55.490' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-24T18:01:55.490' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'79b31dc0-4e49-7ec4-2e7d-39ee9b1c3051', N'f6265a81-4df2-ca40-aa62-39ee9b057c37', N'编辑', NULL, N'admin_config_edit', CAST(N'2019-06-24T18:01:55.490' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-24T18:01:55.490' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'24e36a83-2873-af62-00b7-39ee9b1c3053', N'f6265a81-4df2-ca40-aa62-39ee9b057c37', N'删除', NULL, N'admin_config_del', CAST(N'2019-06-24T18:01:55.490' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-24T18:01:55.490' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'f8ab056d-5052-95dc-eafe-39ee9c6d934a', N'ef5da896-41af-bfbf-77f5-39ee9c6541bf', N'添加', N'add', N'personnelfiles_company_add', CAST(N'2019-06-25T00:10:26.473' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-25T00:10:26.473' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'39823f70-7223-ff0e-a4dc-39ee9c6d9351', N'ef5da896-41af-bfbf-77f5-39ee9c6541bf', N'编辑', N'edit', N'personnelfiles_company_edit', CAST(N'2019-06-25T00:10:26.473' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-25T00:10:26.473' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'0fd94b39-e1d6-413e-50fd-39ee9c6d9354', N'ef5da896-41af-bfbf-77f5-39ee9c6541bf', N'删除', N'delete', N'personnelfiles_company_del', CAST(N'2019-06-25T00:10:26.473' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-25T00:10:26.473' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'8ec88f70-ff73-020c-54f2-39ee9c6e8f81', N'0db3aa56-daca-56c2-0ed3-39ee9c677b88', N'添加', N'add', N'personnelfiles_department_add', CAST(N'2019-06-25T00:11:31.063' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-25T00:11:31.063' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'b526c0a0-a6ed-f0fa-cc5e-39ee9c6e8f83', N'0db3aa56-daca-56c2-0ed3-39ee9c677b88', N'编辑', N'edit', N'personnelfiles_department_edit', CAST(N'2019-06-25T00:11:31.063' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-25T00:11:31.063' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'ec285693-e0ac-6137-5de5-39ee9c6e8f85', N'0db3aa56-daca-56c2-0ed3-39ee9c677b88', N'删除', N'delete', N'personnelfiles_department_del', CAST(N'2019-06-25T00:11:31.063' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-25T00:11:31.063' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'18382e60-26bc-5c36-6abf-39ee9c6e8f87', N'0db3aa56-daca-56c2-0ed3-39ee9c677b88', N'岗位', N'edit', N'personnelfiles_department_position', CAST(N'2019-06-25T00:11:31.063' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-25T00:11:31.063' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'75d73af4-55a8-a2b9-8ded-39ee9c6e8f88', N'0db3aa56-daca-56c2-0ed3-39ee9c677b88', N'岗位添加', N'add', N'personnelfiles_department_position_add', CAST(N'2019-06-25T00:11:31.063' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-25T00:11:31.063' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'e2a7c844-f8ae-b831-20cb-39ee9c6e8f8a', N'0db3aa56-daca-56c2-0ed3-39ee9c677b88', N'岗位编辑', N'edit', N'personnelfiles_department_position_edit', CAST(N'2019-06-25T00:11:31.063' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-25T00:11:31.063' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'2e8821a8-5cb6-f52e-5b6c-39ee9c6e8f8d', N'0db3aa56-daca-56c2-0ed3-39ee9c677b88', N'岗位删除', N'delete', N'personnelfiles_department_position_del', CAST(N'2019-06-25T00:11:31.063' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-25T00:11:31.063' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'a70d98dc-bb2a-722f-efae-39ee9c711c77', N'1e778ffc-d278-bde0-db5f-39ee9c68165a', N'删除', N'delete', N'personnelfiles_position_del', CAST(N'2019-06-25T00:14:18.217' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-25T00:14:18.217' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'cede4e24-8df7-5af8-2de6-39ee9c71aa4d', N'ed573a8c-1409-d600-dd03-39ee9c6b3b51', N'添加', N'add', N'personnelfiles_user_add', CAST(N'2019-06-25T00:14:54.533' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T13:54:25.227' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'327b49a6-f7b2-c1a4-9dea-39ee9c71aa51', N'ed573a8c-1409-d600-dd03-39ee9c6b3b51', N'编辑', N'edit', N'personnelfiles_user_edit', CAST(N'2019-06-25T00:14:54.533' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T13:54:25.233' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'45bf6f61-eec8-21d0-af6c-39ee9c71aa53', N'ed573a8c-1409-d600-dd03-39ee9c6b3b51', N'删除', N'delete', N'personnelfiles_user_del', CAST(N'2019-06-25T00:14:54.533' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T13:54:25.243' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'b5056c65-25ba-47ba-d7f8-39ee9e5da88e', N'36ad6b42-b22d-7c3c-8ca7-39ee9e5cd8c5', N'添加', N'add', N'common_area_add', CAST(N'2019-06-25T09:12:17.760' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-25T09:12:17.760' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'f2c647eb-dfc1-7ec9-2e7d-39ee9e5da89a', N'36ad6b42-b22d-7c3c-8ca7-39ee9e5cd8c5', N'编辑', N'edit', N'common_area_edit', CAST(N'2019-06-25T09:12:17.763' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-25T09:12:17.763' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'05f161f5-d356-95a5-7508-39ee9e5da89c', N'36ad6b42-b22d-7c3c-8ca7-39ee9e5cd8c5', N'删除', N'delete', N'common_area_del', CAST(N'2019-06-25T09:12:17.763' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-25T09:12:17.763' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'2e762d71-e2d5-ecc5-615e-39ee9eebb34d', N'f98ffc20-c2ac-d2be-8035-39ee9eeb706d', N'添加', N'add', N'common_mediatype_add', CAST(N'2019-06-25T11:47:26.623' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-25T11:47:26.623' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'cf5c1197-fd1b-54ea-b02f-39ee9eebb354', N'f98ffc20-c2ac-d2be-8035-39ee9eeb706d', N'编辑', NULL, N'common_mediatype_edit', CAST(N'2019-06-25T11:47:26.623' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-25T11:47:26.623' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'06604dea-4fbb-05bf-e004-39ee9eebb358', N'f98ffc20-c2ac-d2be-8035-39ee9eeb706d', N'删除', NULL, N'common_mediatype_del', CAST(N'2019-06-25T11:47:26.623' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-25T11:47:26.623' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'd11c8173-bbc4-0124-8951-39ee9f4f0f65', N'6fb818b9-c021-62a1-cd39-39ee9e5d1a7c', N'删除', NULL, N'common_attachment_del', CAST(N'2019-06-25T13:35:58.257' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-25T13:35:58.257' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'23dba189-6e67-3f2d-e703-39ee9f4f0f6f', N'6fb818b9-c021-62a1-cd39-39ee9e5d1a7c', N'导出', NULL, N'common_attachment_export', CAST(N'2019-06-25T13:35:58.257' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-25T13:35:58.257' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'f611ab49-bc29-6d99-a7c1-39eea908e900', N'ed573a8c-1409-d600-dd03-39ee9c6b3b51', N'工作经历', N'work', N'personnelfiles_user_work_history', CAST(N'2019-06-27T10:55:33.047' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T13:54:25.247' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'a826055e-8c0d-44bb-88dd-39eea9acab6b', N'ed573a8c-1409-d600-dd03-39ee9c6b3b51', N'教育经历', N'education', N'personnelfiles_user_education_history', CAST(N'2019-06-27T13:54:25.160' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T13:54:25.160' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'c9aaf236-46ce-371c-8fca-39eeaa709a8b', N'6f3fec3b-3dfe-1834-5c31-39eeaa6ea6c1', N'添加', N'add', N'codegenerator_project_add', CAST(N'2019-06-27T17:28:25.927' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:28:25.927' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'd149c3b6-3533-3f69-924c-39eeaa709a94', N'6f3fec3b-3dfe-1834-5c31-39eeaa6ea6c1', N'编辑', NULL, N'codegenerator_project_edit', CAST(N'2019-06-27T17:28:25.927' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:28:25.927' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'8d954d6b-a443-abc5-0317-39eeaa709a98', N'6f3fec3b-3dfe-1834-5c31-39eeaa6ea6c1', N'删除', NULL, N'codegenerator_project_del', CAST(N'2019-06-27T17:28:25.927' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:28:25.927' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'6f5e14f7-4ea7-073a-f0d0-39eeaa709a9b', N'6f3fec3b-3dfe-1834-5c31-39eeaa6ea6c1', N'生成', NULL, N'codegenerator_project_build_code', CAST(N'2019-06-27T17:28:25.927' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:28:25.927' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'1220d4c1-8cbc-201a-4d2b-39eeaa716b20', N'1d774799-6c7d-5e79-442d-39eeaa6edc95', N'添加', N'add', N'codegenerator_enum_add', CAST(N'2019-06-27T17:29:19.367' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:29:19.367' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'22f28b90-b021-cb72-85b4-39eeaa716b2c', N'1d774799-6c7d-5e79-442d-39eeaa6edc95', N'编辑', NULL, N'codegenerator_enum_edit', CAST(N'2019-06-27T17:29:19.367' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:29:19.367' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Button] ([Id], [MenuId], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'129756b0-7190-36df-022a-39eeaa716b2f', N'1d774799-6c7d-5e79-442d-39eeaa6edc95', N'删除', NULL, N'codegenerator_enum_del', CAST(N'2019-06-27T17:29:19.367' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:29:19.367' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
SET IDENTITY_INSERT [dbo].[Button_Permission] ON 

INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (1, N'320e8558-48d8-d781-43fc-39ee9aea35e9', N'7d546c8a-92d8-9434-08b7-39ee9ae61ff0')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (2, N'11a35d13-c691-0121-6106-39ee9aea35f3', N'f6452132-8cf8-f62f-22b3-39ee9ae61ff3')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (3, N'fb81046d-dfb9-e8e9-0836-39ee9aeb44fb', N'f88cc4e9-a603-4992-4483-39ee9ae61fff')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (4, N'd38df13e-558c-2c61-1923-39ee9aeb44fe', N'6a98fd5f-ee43-7442-47ec-39ee9ae62005')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (5, N'9af35d6e-7a7a-950f-14e3-39ee9aebb5e6', N'93e3a2c0-a06b-62a7-4dc1-39ee9ae6200a')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (6, N'055879e0-c7eb-9de0-df07-39ee9aebb5e9', N'c2fe140d-267c-64d5-014b-39ee9ae62012')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (7, N'055879e0-c7eb-9de0-df07-39ee9aebb5e9', N'1c373f6b-426e-bd8c-ad5d-39ee9ae62016')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (8, N'efb75748-f298-b185-7c15-39ee9aebb5ee', N'03f4d737-5b05-20de-b31e-39ee9ae6200f')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (9, N'afab0122-1391-8894-b4ad-39ee9aebb5f4', N'b609b3bb-7210-7475-48df-39ee9ae6201b')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (10, N'afab0122-1391-8894-b4ad-39ee9aebb5f4', N'e77e24f6-f740-38dd-4f4d-39ee9ae6201d')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (11, N'afab0122-1391-8894-b4ad-39ee9aebb5f4', N'791ff974-ede2-5f0a-fdee-39ee9ae62020')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (12, N'afab0122-1391-8894-b4ad-39ee9aebb5f4', N'2fae6567-318f-f997-d5a4-39ee9ae62023')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (14, N'7bc98f3a-ac7c-28ff-77c7-39ee9aed0c45', N'61aa4621-be22-1eba-4862-39ee9ae61f26')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (15, N'7bc98f3a-ac7c-28ff-77c7-39ee9aed0c45', N'7b84b5d2-4cda-072d-421f-39ee9ae62029')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (16, N'6ab1fe93-6e68-02c0-eb26-39ee9aed0c4f', N'7b84b5d2-4cda-072d-421f-39ee9ae62029')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (17, N'6ab1fe93-6e68-02c0-eb26-39ee9aed0c4f', N'18e00604-05b3-5528-7814-39ee9ae61f35')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (18, N'6ab1fe93-6e68-02c0-eb26-39ee9aed0c4f', N'c526d04e-888d-ca3a-7cd7-39ee9ae61f4a')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (19, N'94a638ba-d6a9-4e81-a18b-39ee9aed0c52', N'5cb6fe4d-8ee8-082e-3509-39ee9ae61f59')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (20, N'0220b6fc-6966-e62f-e7fe-39ee9aed0c54', N'6cdada85-5273-535c-5c95-39ee9ae61f66')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (22, N'7c1feb31-8db9-35c1-50cc-39ee9aeea370', N'5f9589de-284a-70e7-b849-39ee9ae61fc6')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (23, N'7c1feb31-8db9-35c1-50cc-39ee9aeea370', N'9af134ed-166f-c5e9-13f0-39ee9ae61ffa')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (24, N'ddfe7e0a-0322-1c93-4475-39ee9aeea381', N'241ffe79-6e03-fff4-36b9-39ee9ae61fb7')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (25, N'ddfe7e0a-0322-1c93-4475-39ee9aeea381', N'56aadc17-4cec-f31c-fcb5-39ee9ae61faf')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (26, N'ddfe7e0a-0322-1c93-4475-39ee9aeea381', N'a0f68fda-66d7-ec76-ead6-39ee9ae61fa7')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (27, N'ddfe7e0a-0322-1c93-4475-39ee9aeea381', N'37920bd8-1da5-72b6-0606-39ee9ae61fa1')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (28, N'ddfe7e0a-0322-1c93-4475-39ee9aeea381', N'71dbd010-4c00-0e7f-0bdd-39ee9ae61f8f')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (29, N'df3c5197-66bb-eb7a-4bbe-39ee9aeea374', N'9af134ed-166f-c5e9-13f0-39ee9ae61ffa')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (30, N'df3c5197-66bb-eb7a-4bbe-39ee9aeea374', N'fffd4cfc-90c6-3f8d-8fff-39ee9ae61fcc')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (31, N'df3c5197-66bb-eb7a-4bbe-39ee9aeea374', N'2c0d4a51-3682-9f33-24bc-39ee9ae61fd0')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (32, N'9ade8617-b64d-373b-3893-39ee9aeea37d', N'0deb82b8-1be9-f094-3f38-39ee9ae61fc9')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (33, N'009d8ca1-4f8f-3497-2b9b-39ee9aeea37f', N'82177e22-46a3-7b56-f227-39ee9ae61fdb')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (34, N'009d8ca1-4f8f-3497-2b9b-39ee9aeea37f', N'01e1e5aa-fe24-080d-7414-39ee9ae61fd9')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (35, N'0a00c1ef-057d-40cb-085f-39ee9aeea38a', N'71440ddc-318b-8b2d-e56f-39ee9ae61fe6')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (36, N'0a00c1ef-057d-40cb-085f-39ee9aeea38a', N'0fa8dc9c-602f-2586-3a64-39ee9ae61fe8')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (37, N'b379029b-295d-8792-c9d0-39ee9b1c3045', N'ddcfa7e6-847c-a64c-e8cb-39ee9b1b9e04')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (38, N'79b31dc0-4e49-7ec4-2e7d-39ee9b1c3051', N'4b277fa6-234e-1712-81ab-39ee9b1b9e0d')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (39, N'79b31dc0-4e49-7ec4-2e7d-39ee9b1c3051', N'd627afb0-4deb-36d9-d3cb-39ee9b1b9e11')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (40, N'24e36a83-2873-af62-00b7-39ee9b1c3053', N'7fe92105-0b44-87ab-1933-39ee9b1b9e07')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (41, N'f8ab056d-5052-95dc-eafe-39ee9c6d934a', N'cf4ff635-b8bf-2a17-b3c4-39ee9c64689a')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (42, N'39823f70-7223-ff0e-a4dc-39ee9c6d9351', N'7e351053-aaef-151c-509c-39ee9c6468a0')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (43, N'39823f70-7223-ff0e-a4dc-39ee9c6d9351', N'72f1a443-039f-84b9-dcda-39ee9c6468a4')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (44, N'0fd94b39-e1d6-413e-50fd-39ee9c6d9354', N'426abe5a-993c-37b9-b84b-39ee9c64689d')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (45, N'8ec88f70-ff73-020c-54f2-39ee9c6e8f81', N'1cbcfce6-18e4-a567-2e20-39ee9c6468b1')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (46, N'b526c0a0-a6ed-f0fa-cc5e-39ee9c6e8f83', N'253fc18b-f1ca-07c3-62e9-39ee9c6468b7')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (47, N'b526c0a0-a6ed-f0fa-cc5e-39ee9c6e8f83', N'f10266ba-3c20-2bea-9ce4-39ee9c6468ba')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (48, N'ec285693-e0ac-6137-5de5-39ee9c6e8f85', N'364a24de-7e01-e45e-1bf7-39ee9c6468b4')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (49, N'18382e60-26bc-5c36-6abf-39ee9c6e8f87', N'69fc6036-7f0a-fb17-c82f-39ee9c6468bd')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (50, N'75d73af4-55a8-a2b9-8ded-39ee9c6e8f88', N'4e08e38f-560d-a3e7-16ff-39ee9c6468bf')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (51, N'e2a7c844-f8ae-b831-20cb-39ee9c6e8f8a', N'5e40862a-2a7d-10d8-19ea-39ee9c6468c5')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (52, N'e2a7c844-f8ae-b831-20cb-39ee9c6e8f8a', N'38d02851-43e5-49ee-66a3-39ee9c6468c8')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (53, N'2e8821a8-5cb6-f52e-5b6c-39ee9c6e8f8d', N'a877daef-8a68-de86-76a9-39ee9c6468c2')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (54, N'a70d98dc-bb2a-722f-efae-39ee9c711c77', N'a877daef-8a68-de86-76a9-39ee9c6468c2')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (56, N'b5056c65-25ba-47ba-d7f8-39ee9e5da88e', N'035535fb-1ab1-0f28-203d-39ee9c646875')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (57, N'f2c647eb-dfc1-7ec9-2e7d-39ee9e5da89a', N'c20a1001-4677-4996-9b7d-39ee9c64687c')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (58, N'f2c647eb-dfc1-7ec9-2e7d-39ee9e5da89a', N'51ad8f78-ef0c-7d39-4c9c-39ee9c64687f')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (59, N'05f161f5-d356-95a5-7508-39ee9e5da89c', N'75194623-ea56-9a70-f315-39ee9c646879')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (60, N'2e762d71-e2d5-ecc5-615e-39ee9eebb34d', N'4e77f7e2-c0d3-24fa-c8c3-39ee9ee7f5c8')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (61, N'cf5c1197-fd1b-54ea-b02f-39ee9eebb354', N'66f283e4-6f96-940d-aaa8-39ee9ee7f5ce')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (62, N'cf5c1197-fd1b-54ea-b02f-39ee9eebb354', N'6bb748e1-1249-c11f-0f5e-39ee9ee7f5d6')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (63, N'06604dea-4fbb-05bf-e004-39ee9eebb358', N'e67df63a-c2a5-3e7a-acad-39ee9ee7f5cc')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (65, N'23dba189-6e67-3f2d-e703-39ee9f4f0f6f', N'53125a49-2e4c-f1c6-9f46-39ee9f4c358b')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (79, N'cede4e24-8df7-5af8-2de6-39ee9c71aa4d', N'763264ae-a1e3-d88f-06c2-39ee9c6468dc')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (80, N'cede4e24-8df7-5af8-2de6-39ee9c71aa4d', N'12a90a6f-303b-62c5-c06c-39eea019c7d6')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (81, N'cede4e24-8df7-5af8-2de6-39ee9c71aa4d', N'3c52373e-6ce0-c72f-88e6-39ee9c6468a7')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (82, N'cede4e24-8df7-5af8-2de6-39ee9c71aa4d', N'3409973d-b44f-973c-8c13-39ee9c6468aa')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (88, N'327b49a6-f7b2-c1a4-9dea-39ee9c71aa51', N'12a90a6f-303b-62c5-c06c-39eea019c7d6')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (89, N'327b49a6-f7b2-c1a4-9dea-39ee9c71aa51', N'e547d1dc-9d08-15e5-2c43-39ee9c6468e1')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (90, N'327b49a6-f7b2-c1a4-9dea-39ee9c71aa51', N'598e7365-c065-5b18-73b5-39ee9c6468e4')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (91, N'327b49a6-f7b2-c1a4-9dea-39ee9c71aa51', N'3409973d-b44f-973c-8c13-39ee9c6468aa')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (92, N'327b49a6-f7b2-c1a4-9dea-39ee9c71aa51', N'3c52373e-6ce0-c72f-88e6-39ee9c6468a7')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (93, N'327b49a6-f7b2-c1a4-9dea-39ee9c71aa51', N'6b51f55c-4976-f67f-79c3-39eea4c10780')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (94, N'327b49a6-f7b2-c1a4-9dea-39ee9c71aa51', N'4358f6f8-5a70-5be3-2f57-39eea4c10786')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (95, N'f611ab49-bc29-6d99-a7c1-39eea908e900', N'b576aa79-0891-3390-6a0a-39ee9c6468f8')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (96, N'f611ab49-bc29-6d99-a7c1-39eea908e900', N'20a85d1b-658b-85d4-928b-39ee9c6468fb')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (97, N'f611ab49-bc29-6d99-a7c1-39eea908e900', N'4087c180-cc5a-28c0-b2ea-39ee9c6468fe')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (98, N'f611ab49-bc29-6d99-a7c1-39eea908e900', N'8a2d55fb-9a34-8b6d-fab1-39ee9c646901')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (99, N'f611ab49-bc29-6d99-a7c1-39eea908e900', N'6e3128b9-a907-9a46-05d2-39ee9c646904')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (100, N'a826055e-8c0d-44bb-88dd-39eea9acab6b', N'3774df6c-e3e3-fbd7-4419-39ee9c6468ea')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (101, N'a826055e-8c0d-44bb-88dd-39eea9acab6b', N'eeea1b88-0139-08aa-31c9-39ee9c6468ed')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (102, N'a826055e-8c0d-44bb-88dd-39eea9acab6b', N'35b996ff-e11b-3b29-0879-39ee9c6468f0')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (103, N'a826055e-8c0d-44bb-88dd-39eea9acab6b', N'643e24fc-c85d-813c-834c-39ee9c6468f3')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (104, N'a826055e-8c0d-44bb-88dd-39eea9acab6b', N'124c2840-ca01-501d-74cf-39ee9c6468f5')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (105, N'c9aaf236-46ce-371c-8fca-39eeaa709a8b', N'9695684f-db58-562f-bde4-39ee9c646835')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (106, N'd149c3b6-3533-3f69-924c-39eeaa709a94', N'f771d046-d15c-253b-d4d4-39ee9c646841')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (107, N'd149c3b6-3533-3f69-924c-39eeaa709a94', N'69c5fe7e-02cd-49f8-84d7-39ee9c64683d')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (108, N'8d954d6b-a443-abc5-0317-39eeaa709a98', N'32f12761-fe00-3a26-96e0-39ee9c64683a')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (109, N'6f5e14f7-4ea7-073a-f0d0-39eeaa709a9b', N'662750d7-3547-32ed-bfa5-39ee9c646846')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (110, N'1220d4c1-8cbc-201a-4d2b-39eeaa716b20', N'9c9b6210-dbc1-9393-4fa2-39ee9c6467df')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (111, N'22f28b90-b021-cb72-85b4-39eeaa716b2c', N'f1879f93-9c61-e7b3-9ce2-39ee9c6467eb')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (112, N'22f28b90-b021-cb72-85b4-39eeaa716b2c', N'388e4e69-efeb-9ed6-a07e-39ee9c6467ee')
INSERT [dbo].[Button_Permission] ([Id], [ButtonId], [PermissionId]) VALUES (113, N'129756b0-7190-36df-022a-39eeaa716b2f', N'647eedf6-e35f-801c-9eea-39ee9c6467e7')
SET IDENTITY_INSERT [dbo].[Button_Permission] OFF
SET IDENTITY_INSERT [dbo].[Config] ON 

INSERT [dbo].[Config] ([Id], [Key], [Value], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (1, N'sys_button_permission', N'True', N'启用按钮权限', CAST(N'2019-04-12T11:36:52.000' AS DateTime), N'00000000-0000-0000-0000-000000000000', CAST(N'2019-06-27T17:48:50.777' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Config] ([Id], [Key], [Value], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (3, N'sys_auditing', N'True', N'启用审计日志', CAST(N'2019-04-12T11:36:52.000' AS DateTime), N'00000000-0000-0000-0000-000000000000', CAST(N'2019-06-27T17:48:50.780' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Config] ([Id], [Key], [Value], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (4, N'sys_toolbar_skin', N'False', N'显示工具栏皮肤按钮', CAST(N'2019-04-12T11:36:52.000' AS DateTime), N'00000000-0000-0000-0000-000000000000', CAST(N'2019-06-27T17:48:50.783' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Config] ([Id], [Key], [Value], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (5, N'sys_title', N'通用权限管理系统', N'系统标题', CAST(N'2019-04-12T11:36:52.000' AS DateTime), N'00000000-0000-0000-0000-000000000000', CAST(N'2019-06-27T17:48:50.763' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Config] ([Id], [Key], [Value], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (6, N'sys_toolbar_fullscreen', N'True', N'显示工具栏全屏按钮', CAST(N'2019-04-12T11:36:52.000' AS DateTime), N'00000000-0000-0000-0000-000000000000', CAST(N'2019-06-27T17:48:50.783' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Config] ([Id], [Key], [Value], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (7, N'sys_home', N'/home', N'系统首页', CAST(N'2019-04-12T11:36:52.000' AS DateTime), N'00000000-0000-0000-0000-000000000000', CAST(N'2019-06-27T17:48:50.767' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Config] ([Id], [Key], [Value], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (8, N'sys_verify_code', N'False', N'启用登录验证码功能', CAST(N'2019-05-06T09:11:35.000' AS DateTime), N'39ed5ab3-0c91-a26c-2f8a-a3b723ef422a', CAST(N'2019-06-27T17:48:50.780' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Config] ([Id], [Key], [Value], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (9, N'sys_toolbar_userinfo', N'True', N'显示工具栏用户信息按钮', CAST(N'2019-05-06T09:35:48.000' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:48:50.797' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Config] ([Id], [Key], [Value], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (10, N'sys_toolbar_logout', N'True', N'显示工具栏退出按钮', CAST(N'2019-05-06T09:35:48.000' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:48:50.793' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Config] ([Id], [Key], [Value], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (11, N'sys_userinfo_page', N'', N'个人信息页', CAST(N'2019-06-14T13:47:55.000' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:48:50.770' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Config] ([Id], [Key], [Value], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (12, N'sys_toolbar_customcss', N'', N'自定义CSS样式', CAST(N'2019-06-20T19:20:08.623' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:48:50.800' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Config] ([Id], [Key], [Value], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (13, N'sys_logo', N'', N'系统Logo', CAST(N'2019-06-27T17:32:34.077' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:48:50.763' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
SET IDENTITY_INSERT [dbo].[Config] OFF
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Icon], [IconColor], [Url], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'2c18c915-225f-ee90-869a-39ee9ae6f7c7', N'', 0, N'00000000-0000-0000-0000-000000000000', N'权限管理', N'', N'', N'', N'verifycode', N'', N'', 0, 1, 2, -1, N'', N'', 1, N'', CAST(N'2019-06-24T17:03:47.647' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:25:36.070' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Icon], [IconColor], [Url], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'ee04c57e-31d0-f28d-28b8-39ee9ae7265c', N'', 0, N'00000000-0000-0000-0000-000000000000', N'系统管理', N'', N'', N'', N'system', N'', N'', 0, 1, 3, -1, N'', N'', 1, N'', CAST(N'2019-06-24T17:03:59.567' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:25:36.080' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Icon], [IconColor], [Url], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'4ac9ef98-aff8-7e8e-e149-39ee9ae809eb', N'Admin', 1, N'2c18c915-225f-ee90-869a-39ee9ae6f7c7', N'模块管理', N'admin_moduleinfo', N'', N'', N'app', N'', N'', 1, 1, 0, 0, N'', N'', 1, N'', CAST(N'2019-06-24T17:04:57.817' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-24T17:04:57.817' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Icon], [IconColor], [Url], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'1609bab0-f3e8-6e66-cc3c-39ee9ae860c6', N'Admin', 1, N'2c18c915-225f-ee90-869a-39ee9ae6f7c7', N'权限管理', N'admin_permission', N'', N'', N'lock', N'', N'', 1, 1, 0, 0, N'', N'', 1, N'', CAST(N'2019-06-24T17:05:20.067' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-24T17:05:20.067' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Icon], [IconColor], [Url], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'e61af72d-ab86-386a-a4bb-39ee9ae89a2f', N'Admin', 1, N'2c18c915-225f-ee90-869a-39ee9ae6f7c7', N'角色管理', N'admin_role', N'', N'', N'role', N'', N'', 1, 1, 0, 0, N'', N'', 1, N'', CAST(N'2019-06-24T17:05:34.760' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-24T17:05:34.760' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Icon], [IconColor], [Url], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'7c354368-9616-d664-f4f0-39ee9ae8cab2', N'Admin', 1, N'2c18c915-225f-ee90-869a-39ee9ae6f7c7', N'账户管理', N'admin_account', N'', N'', N'user', N'', N'', 1, 1, 0, 0, N'', N'', 1, N'', CAST(N'2019-06-24T17:05:47.180' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-24T17:05:47.180' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Icon], [IconColor], [Url], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'817ec04d-d9bc-ba30-ad63-39ee9ae9092f', N'Admin', 1, N'2c18c915-225f-ee90-869a-39ee9ae6f7c7', N'菜单管理', N'admin_menu', N'', N'', N'menu', N'', N'', 1, 1, 0, 0, N'', N'', 1, N'', CAST(N'2019-06-24T17:06:03.180' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-24T17:06:03.180' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Icon], [IconColor], [Url], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'3f08b280-7a45-7fb1-ba39-39ee9ae99473', N'Admin', 1, N'ee04c57e-31d0-f28d-28b8-39ee9ae7265c', N'系统配置', N'admin_system_config', N'', N'', N'system', N'', N'', 1, 1, 0, 0, N'', N'', 1, N'', CAST(N'2019-06-24T17:06:38.833' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-24T18:01:31.583' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Icon], [IconColor], [Url], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'15422ea5-2413-43c5-2a47-39ee9ae9b633', N'Admin', 1, N'ee04c57e-31d0-f28d-28b8-39ee9ae7265c', N'审计日志', N'admin_auditinfo', N'', N'', N'log', N'', N'', 1, 1, 2, 0, N'', N'', 1, N'', CAST(N'2019-06-24T17:06:47.463' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-24T18:01:31.600' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Icon], [IconColor], [Url], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'f6265a81-4df2-ca40-aa62-39ee9b057c37', N'Admin', 1, N'ee04c57e-31d0-f28d-28b8-39ee9ae7265c', N'配置项管理', N'admin_config', N'', N'', N'max', N'', N'', 1, 1, 1, 0, N'', N'', 1, N'', CAST(N'2019-06-24T17:37:07.620' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-24T18:01:31.597' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Icon], [IconColor], [Url], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'053a5a8b-ac94-9d44-aad2-39ee9c64c92c', N'', 0, N'00000000-0000-0000-0000-000000000000', N'人事档案', N'', N'', N'', N'role', N'', N'', 0, 1, 0, -1, N'', N'', 1, N'', CAST(N'2019-06-25T00:00:50.460' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:25:36.047' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Icon], [IconColor], [Url], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'ef5da896-41af-bfbf-77f5-39ee9c6541bf', N'PersonnelFiles', 1, N'053a5a8b-ac94-9d44-aad2-39ee9c64c92c', N'公司单位', N'PersonnelFiles_Company', N'', N'', N'enterprise', N'', N'', 1, 1, 0, 0, N'', N'', 1, N'', CAST(N'2019-06-25T00:01:21.323' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-25T00:04:01.827' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Icon], [IconColor], [Url], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'0db3aa56-daca-56c2-0ed3-39ee9c677b88', N'PersonnelFiles', 1, N'053a5a8b-ac94-9d44-aad2-39ee9c64c92c', N'部门管理', N'PersonnelFiles_Department', N'', N'', N'department', N'', N'', 1, 1, 0, 0, N'', N'', 1, N'', CAST(N'2019-06-25T00:03:47.207' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-25T00:08:06.313' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Icon], [IconColor], [Url], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'1e778ffc-d278-bde0-db5f-39ee9c68165a', N'PersonnelFiles', 1, N'053a5a8b-ac94-9d44-aad2-39ee9c64c92c', N'岗位管理', N'PersonnelFiles_Position', N'', N'', N'post', N'', N'', 1, 1, 2, 0, N'', N'', 1, N'', CAST(N'2019-06-25T00:04:26.840' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-25T00:08:12.637' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Icon], [IconColor], [Url], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'ed573a8c-1409-d600-dd03-39ee9c6b3b51', N'PersonnelFiles', 1, N'053a5a8b-ac94-9d44-aad2-39ee9c64c92c', N'用户管理', N'PersonnelFiles_User', N'', N'', N'user', N'', N'', 1, 1, 3, 0, N'', N'', 1, N'', CAST(N'2019-06-25T00:07:52.903' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-25T00:08:22.557' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Icon], [IconColor], [Url], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'083dcd58-25ee-7411-552d-39ee9e5b64fb', N'', 0, N'00000000-0000-0000-0000-000000000000', N'基础数据', N'', N'', N'', N'database', N'', N'', 0, 1, 1, -1, N'', N'', 1, N'', CAST(N'2019-06-25T09:09:49.403' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:25:36.067' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Icon], [IconColor], [Url], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'36ad6b42-b22d-7c3c-8ca7-39ee9e5cd8c5', N'Common', 1, N'083dcd58-25ee-7411-552d-39ee9e5b64fb', N'区划代码列表', N'Common_Area', N'', N'', N'entity', N'', N'', 1, 1, 0, 0, N'', N'', 1, N'', CAST(N'2019-06-25T09:11:24.587' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-25T09:11:24.587' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Icon], [IconColor], [Url], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'6fb818b9-c021-62a1-cd39-39ee9e5d1a7c', N'Common', 1, N'083dcd58-25ee-7411-552d-39ee9e5b64fb', N'附件管理', N'Common_Attachment', N'', N'', N'attachment', N'', N'', 1, 1, 0, 0, N'', N'', 1, N'', CAST(N'2019-06-25T09:11:41.433' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-25T09:11:41.433' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Icon], [IconColor], [Url], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'f98ffc20-c2ac-d2be-8035-39ee9eeb706d', N'Common', 1, N'083dcd58-25ee-7411-552d-39ee9e5b64fb', N'多媒体管理', N'Common_MediaType', N'', N'', N'media', N'', N'', 1, 1, 2, 0, N'', N'', 1, N'', CAST(N'2019-06-25T11:47:09.523' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-25T11:47:09.523' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Icon], [IconColor], [Url], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'60448ed5-fa3b-eb88-a61a-39eeaa6deb31', N'', 0, N'00000000-0000-0000-0000-000000000000', N'开发工具', N'', N'', N'', N'develop', N'', N'', 0, 1, 4, -1, N'', N'', 1, N'', CAST(N'2019-06-27T17:25:30.020' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:25:36.083' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Icon], [IconColor], [Url], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'da7e7265-6a97-d686-4361-39eeaa6e5629', N'', 0, N'60448ed5-fa3b-eb88-a61a-39eeaa6deb31', N'代码生成器', N'', N'', N'', N'develop', N'', N'', 1, 1, 0, -1, N'', N'', 1, N'', CAST(N'2019-06-27T17:25:57.383' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:25:57.383' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Icon], [IconColor], [Url], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'6f3fec3b-3dfe-1834-5c31-39eeaa6ea6c1', N'CodeGenerator', 1, N'da7e7265-6a97-d686-4361-39eeaa6e5629', N'项目管理', N'codegenerator_project', N'', N'', N'project', N'', N'', 2, 1, 0, 0, N'', N'', 1, N'', CAST(N'2019-06-27T17:26:18.043' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:26:40.183' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Icon], [IconColor], [Url], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'1d774799-6c7d-5e79-442d-39eeaa6edc95', N'CodeGenerator', 1, N'da7e7265-6a97-d686-4361-39eeaa6e5629', N'枚举管理', N'codegenerator_enum', N'', N'', N'tag', N'', N'', 2, 1, 0, 0, N'', N'', 1, N'', CAST(N'2019-06-27T17:26:31.827' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:26:31.827' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
SET IDENTITY_INSERT [dbo].[Menu_Permission] ON 

INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (1, N'4ac9ef98-aff8-7e8e-e149-39ee9ae809eb', N'7a90a996-fd90-2a94-d7f1-39ee9ae61feb')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (3, N'e61af72d-ab86-386a-a4bb-39ee9ae89a2f', N'bc87cea4-757f-abc2-2972-39ee9ae62008')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (4, N'7c354368-9616-d664-f4f0-39ee9ae8cab2', N'7ed7539c-7ce2-7f41-7321-39ee9ae61f10')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (5, N'817ec04d-d9bc-ba30-ad63-39ee9ae9092f', N'cc4a0139-d106-015a-fc4a-39ee9ae61fbc')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (6, N'817ec04d-d9bc-ba30-ad63-39ee9ae9092f', N'9b913123-6538-e81f-c981-39ee9ae61fb9')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (7, N'1609bab0-f3e8-6e66-cc3c-39ee9ae860c6', N'1ba69694-2de6-b313-5819-39ee9ae61ffd')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (8, N'1609bab0-f3e8-6e66-cc3c-39ee9ae860c6', N'e2493747-fefa-eece-85ac-39ee9ae62033')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (9, N'1609bab0-f3e8-6e66-cc3c-39ee9ae860c6', N'097055a0-1d96-9771-3561-39ee9ae62037')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (10, N'15422ea5-2413-43c5-2a47-39ee9ae9b633', N'72ffcd5e-6f05-caf7-0aac-39ee9ae61f72')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (11, N'15422ea5-2413-43c5-2a47-39ee9ae9b633', N'86589cc5-bb54-e755-b59d-39ee9ae61f87')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (14, N'f6265a81-4df2-ca40-aa62-39ee9b057c37', N'85191b13-6e2f-398b-0f66-39ee9b1b9dfe')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (15, N'ef5da896-41af-bfbf-77f5-39ee9c6541bf', N'041f5602-2a92-b7c5-9533-39ee9c646898')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (19, N'1e778ffc-d278-bde0-db5f-39ee9c68165a', N'69fc6036-7f0a-fb17-c82f-39ee9c6468bd')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (20, N'ed573a8c-1409-d600-dd03-39ee9c6b3b51', N'a2e3c4b9-cced-7b64-c5e5-39ee9c6468d9')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (21, N'3f08b280-7a45-7fb1-ba39-39ee9ae99473', N'3dd08e9b-dd39-7d78-7164-39ee9ae6202c')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (22, N'3f08b280-7a45-7fb1-ba39-39ee9ae99473', N'd6cb6e7e-3400-9648-9ee9-39ee9ae6202e')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (23, N'36ad6b42-b22d-7c3c-8ca7-39ee9e5cd8c5', N'4e4f54cd-1e49-a369-0bd1-39ee9c646872')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (24, N'36ad6b42-b22d-7c3c-8ca7-39ee9e5cd8c5', N'10afb897-aa62-e0d4-96b3-39ee9c646882')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (28, N'f98ffc20-c2ac-d2be-8035-39ee9eeb706d', N'2a3a7a14-b67c-07ba-275f-39ee9ee7f5b0')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (29, N'6fb818b9-c021-62a1-cd39-39ee9e5d1a7c', N'54f0ac5b-7b67-fcee-f26f-39ee9c646884')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (30, N'6fb818b9-c021-62a1-cd39-39ee9e5d1a7c', N'51a9968e-69c3-e18e-a77e-39ee9c646887')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (31, N'6fb818b9-c021-62a1-cd39-39ee9e5d1a7c', N'66d3b1aa-6e4c-9c48-da5e-39ee9ee5b4c2')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (32, N'0db3aa56-daca-56c2-0ed3-39ee9c677b88', N'01bbca32-2a14-fb0b-8cc5-39ee9c6468ad')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (33, N'0db3aa56-daca-56c2-0ed3-39ee9c677b88', N'3409973d-b44f-973c-8c13-39ee9c6468aa')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (34, N'0db3aa56-daca-56c2-0ed3-39ee9c677b88', N'3c52373e-6ce0-c72f-88e6-39ee9c6468a7')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (35, N'0db3aa56-daca-56c2-0ed3-39ee9c677b88', N'1663a58e-b91b-189e-6fb4-39eeaa05f917')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (63, N'1d774799-6c7d-5e79-442d-39eeaa6edc95', N'0fee94e2-3592-43e8-731e-39ee9c6467db')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (64, N'1d774799-6c7d-5e79-442d-39eeaa6edc95', N'17412b93-e7ee-a5ab-0d47-39ee9c64680d')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (65, N'1d774799-6c7d-5e79-442d-39eeaa6edc95', N'012acd01-cd93-7298-7b2b-39ee9c64680a')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (66, N'1d774799-6c7d-5e79-442d-39eeaa6edc95', N'ecada3f8-cf88-f8fc-4599-39ee9c646806')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (67, N'1d774799-6c7d-5e79-442d-39eeaa6edc95', N'4a87783a-5f45-aaff-9aad-39ee9c646801')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (68, N'1d774799-6c7d-5e79-442d-39eeaa6edc95', N'6a333b7f-76bc-d096-88e7-39ee9c6467fd')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (69, N'1d774799-6c7d-5e79-442d-39eeaa6edc95', N'c87a7f2a-68eb-a247-4e75-39ee9c6467fa')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (70, N'1d774799-6c7d-5e79-442d-39eeaa6edc95', N'c9b2436d-85da-7ada-3af0-39ee9c6467f6')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (71, N'6f3fec3b-3dfe-1834-5c31-39eeaa6ea6c1', N'ab5eea35-05b3-fae3-5fb0-39ee9c64686d')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (72, N'6f3fec3b-3dfe-1834-5c31-39eeaa6ea6c1', N'f5d9e215-204a-e122-c1f5-39ee9c646868')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (73, N'6f3fec3b-3dfe-1834-5c31-39eeaa6ea6c1', N'd89c232d-9d91-2d54-0eff-39ee9c646864')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (74, N'6f3fec3b-3dfe-1834-5c31-39eeaa6ea6c1', N'13e21cbb-9ed6-1539-d0cf-39ee9c646860')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (75, N'6f3fec3b-3dfe-1834-5c31-39eeaa6ea6c1', N'f1f9d695-257b-92bd-41fc-39ee9c64685e')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (76, N'6f3fec3b-3dfe-1834-5c31-39eeaa6ea6c1', N'a34ae290-6ead-a2c4-52a7-39ee9c64685a')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (77, N'6f3fec3b-3dfe-1834-5c31-39eeaa6ea6c1', N'd8f35ecc-aab9-a871-410c-39ee9c646855')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (78, N'6f3fec3b-3dfe-1834-5c31-39eeaa6ea6c1', N'7580714d-8f0c-a0cb-fe4c-39ee9c646851')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (79, N'6f3fec3b-3dfe-1834-5c31-39eeaa6ea6c1', N'2990fc33-c4a4-1e48-b8b1-39ee9c64684f')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (80, N'6f3fec3b-3dfe-1834-5c31-39eeaa6ea6c1', N'df7b9d19-0cd1-a53e-a3c4-39ee9c64684b')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (81, N'6f3fec3b-3dfe-1834-5c31-39eeaa6ea6c1', N'1edf18c5-401d-5336-99b6-39ee9c646831')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (82, N'6f3fec3b-3dfe-1834-5c31-39eeaa6ea6c1', N'0af255ea-a1fd-8c62-e605-39ee9c64682d')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (83, N'6f3fec3b-3dfe-1834-5c31-39eeaa6ea6c1', N'dd5f373a-c7d5-cec9-0168-39ee9c64682a')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (84, N'6f3fec3b-3dfe-1834-5c31-39eeaa6ea6c1', N'e28936f7-41ea-6dc2-204b-39ee9c646826')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (85, N'6f3fec3b-3dfe-1834-5c31-39eeaa6ea6c1', N'00f79302-24ef-7506-359f-39ee9c646823')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (86, N'6f3fec3b-3dfe-1834-5c31-39eeaa6ea6c1', N'c5caba86-026e-b672-5323-39ee9c64681f')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (87, N'6f3fec3b-3dfe-1834-5c31-39eeaa6ea6c1', N'cbea055b-d0d9-f13b-1e4f-39ee9c64681d')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (88, N'6f3fec3b-3dfe-1834-5c31-39eeaa6ea6c1', N'46767e27-c85e-f92a-d813-39ee9c64681a')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (89, N'6f3fec3b-3dfe-1834-5c31-39eeaa6ea6c1', N'5ebb88e3-75d0-d660-ab87-39ee9c646817')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (90, N'6f3fec3b-3dfe-1834-5c31-39eeaa6ea6c1', N'953d637f-2a80-438e-dfa9-39ee9c646813')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (91, N'6f3fec3b-3dfe-1834-5c31-39eeaa6ea6c1', N'1402747a-3f99-8025-175c-39ee9c646810')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (92, N'6f3fec3b-3dfe-1834-5c31-39eeaa6ea6c1', N'ac918d69-3f2e-587c-1417-39ee9c6467c2')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (93, N'6f3fec3b-3dfe-1834-5c31-39eeaa6ea6c1', N'10e0264a-12a0-b491-700f-39ee9c6467ca')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (94, N'6f3fec3b-3dfe-1834-5c31-39eeaa6ea6c1', N'736b775c-5522-3272-a023-39ee9c6467ce')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (95, N'6f3fec3b-3dfe-1834-5c31-39eeaa6ea6c1', N'1eeead90-122f-3ed5-f79f-39ee9c6467d3')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (96, N'6f3fec3b-3dfe-1834-5c31-39eeaa6ea6c1', N'047fde4c-e7b6-60c2-410b-39ee9c6467d7')
INSERT [dbo].[Menu_Permission] ([Id], [MenuId], [PermissionId]) VALUES (97, N'6f3fec3b-3dfe-1834-5c31-39eeaa6ea6c1', N'2a9c1729-fcf8-2ff9-275b-39ee9c6467f3')
SET IDENTITY_INSERT [dbo].[Menu_Permission] OFF
INSERT [dbo].[Moduleinfo] ([Id], [Name], [Code], [Version], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'3b9b53e7-0cc5-0783-eabe-39ee9ae60df4', N'权限管理', N'Admin', N'1.0.5', N'', CAST(N'2019-06-24T17:02:47.763' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:44.587' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Moduleinfo] ([Id], [Name], [Code], [Version], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'5d2e02fb-f8af-6013-58b5-39ee9c63db58', N'代码生成', N'CodeGenerator', N'1.0.2', N'', CAST(N'2019-06-24T23:59:49.583' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:44.613' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Moduleinfo] ([Id], [Name], [Code], [Version], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'9f83548c-9b25-4365-1b15-39ee9c63db5e', N'通用模块', N'Common', N'1.0.1', N'', CAST(N'2019-06-24T23:59:49.597' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:44.623' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Moduleinfo] ([Id], [Name], [Code], [Version], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'5038a392-1a28-3194-e808-39ee9c63db60', N'人事档案', N'PersonnelFiles', N'1.0.1', N'', CAST(N'2019-06-24T23:59:49.600' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:44.633' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'46f2b33f-1ed2-6f93-9ae8-39ee9ae61f00', N'账户管理_绑定角色', N'Admin', N'Account', N'BindRole', 3, CAST(N'2019-06-24T17:02:52.133' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:55.627' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'7ed7539c-7ce2-7f41-7321-39ee9ae61f10', N'账户管理_查询', N'Admin', N'Account', N'Query', 1, CAST(N'2019-06-24T17:02:52.137' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:55.643' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'61aa4621-be22-1eba-4862-39ee9ae61f26', N'账户管理_添加', N'Admin', N'Account', N'Add', 3, CAST(N'2019-06-24T17:02:52.137' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:55.647' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'18e00604-05b3-5528-7814-39ee9ae61f35', N'账户管理_编辑', N'Admin', N'Account', N'Edit', 1, CAST(N'2019-06-24T17:02:52.137' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:55.660' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'c526d04e-888d-ca3a-7cd7-39ee9ae61f4a', N'账户管理_更新', N'Admin', N'Account', N'Update', 3, CAST(N'2019-06-24T17:02:52.137' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:55.670' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'5cb6fe4d-8ee8-082e-3509-39ee9ae61f59', N'账户管理_删除', N'Admin', N'Account', N'Delete', 4, CAST(N'2019-06-24T17:02:52.137' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:55.687' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'6cdada85-5273-535c-5c95-39ee9ae61f66', N'账户管理_重置密码', N'Admin', N'Account', N'ResetPassword', 3, CAST(N'2019-06-24T17:02:52.137' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:55.707' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'72ffcd5e-6f05-caf7-0aac-39ee9ae61f72', N'审计信息_查询', N'Admin', N'AuditInfo', N'Query', 1, CAST(N'2019-06-24T17:02:52.137' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:55.717' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'86589cc5-bb54-e755-b59d-39ee9ae61f87', N'审计信息_详情', N'Admin', N'AuditInfo', N'Details', 1, CAST(N'2019-06-24T17:02:52.137' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:55.733' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'71dbd010-4c00-0e7f-0bdd-39ee9ae61f8f', N'按钮管理_查询', N'Admin', N'Button', N'Query', 1, CAST(N'2019-06-24T17:02:52.137' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:55.743' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'37920bd8-1da5-72b6-0606-39ee9ae61fa1', N'按钮管理_同步', N'Admin', N'Button', N'Sync', 3, CAST(N'2019-06-24T17:02:52.137' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:55.760' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'a0f68fda-66d7-ec76-ead6-39ee9ae61fa7', N'按钮管理_删除', N'Admin', N'Button', N'Delete', 4, CAST(N'2019-06-24T17:02:52.137' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:55.773' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'56aadc17-4cec-f31c-fcb5-39ee9ae61faf', N'按钮管理_获取按钮绑定的权限列表', N'Admin', N'Button', N'PermissionList', 1, CAST(N'2019-06-24T17:02:52.137' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:55.787' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'241ffe79-6e03-fff4-36b9-39ee9ae61fb7', N'按钮管理_绑定权限', N'Admin', N'Button', N'BindPermission', 3, CAST(N'2019-06-24T17:02:52.137' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:55.807' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'9b913123-6538-e81f-c981-39ee9ae61fb9', N'菜单管理_菜单树', N'Admin', N'Menu', N'Tree', 1, CAST(N'2019-06-24T17:02:52.137' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:55.913' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'cc4a0139-d106-015a-fc4a-39ee9ae61fbc', N'菜单管理_查询菜单列表', N'Admin', N'Menu', N'Query', 1, CAST(N'2019-06-24T17:02:52.137' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:55.917' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'5f9589de-284a-70e7-b849-39ee9ae61fc6', N'菜单管理_添加', N'Admin', N'Menu', N'Add', 3, CAST(N'2019-06-24T17:02:52.137' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:55.937' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'0deb82b8-1be9-f094-3f38-39ee9ae61fc9', N'菜单管理_删除', N'Admin', N'Menu', N'Delete', 4, CAST(N'2019-06-24T17:02:52.137' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:55.947' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'fffd4cfc-90c6-3f8d-8fff-39ee9ae61fcc', N'菜单管理_编辑', N'Admin', N'Menu', N'Edit', 1, CAST(N'2019-06-24T17:02:52.137' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:55.960' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'2c0d4a51-3682-9f33-24bc-39ee9ae61fd0', N'菜单管理_更新', N'Admin', N'Menu', N'Update', 3, CAST(N'2019-06-24T17:02:52.137' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:55.967' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'01e1e5aa-fe24-080d-7414-39ee9ae61fd9', N'菜单管理_获取菜单的权限列表', N'Admin', N'Menu', N'PermissionList', 1, CAST(N'2019-06-24T17:02:52.137' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:55.977' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'82177e22-46a3-7b56-f227-39ee9ae61fdb', N'菜单管理_绑定权限', N'Admin', N'Menu', N'BindPermission', 3, CAST(N'2019-06-24T17:02:52.137' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:55.987' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'396871e3-a96d-3914-6f10-39ee9ae61fde', N'菜单管理_获取菜单的按钮列表', N'Admin', N'Menu', N'ButtonList', 1, CAST(N'2019-06-24T17:02:52.137' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:55.997' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'71440ddc-318b-8b2d-e56f-39ee9ae61fe6', N'菜单管理_更新排序信息', N'Admin', N'Menu', N'Sort', 1, CAST(N'2019-06-24T17:02:52.137' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.007' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'0fa8dc9c-602f-2586-3a64-39ee9ae61fe8', N'菜单管理_更新排序信息', N'Admin', N'Menu', N'Sort', 3, CAST(N'2019-06-24T17:02:52.137' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.007' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'7a90a996-fd90-2a94-d7f1-39ee9ae61feb', N'模块信息_查询', N'Admin', N'ModuleInfo', N'Query', 1, CAST(N'2019-06-24T17:02:52.137' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.010' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'7d546c8a-92d8-9434-08b7-39ee9ae61ff0', N'模块信息_同步模块数据', N'Admin', N'ModuleInfo', N'Sync', 3, CAST(N'2019-06-24T17:02:52.140' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.013' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'f6452132-8cf8-f62f-22b3-39ee9ae61ff3', N'模块信息_删除', N'Admin', N'ModuleInfo', N'Delete', 4, CAST(N'2019-06-24T17:02:52.140' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.023' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'9af134ed-166f-c5e9-13f0-39ee9ae61ffa', N'模块信息_下拉列表数据', N'Admin', N'ModuleInfo', N'Select', 1, CAST(N'2019-06-24T17:02:52.140' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.030' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'1ba69694-2de6-b313-5819-39ee9ae61ffd', N'权限接口_查询', N'Admin', N'Permission', N'Query', 1, CAST(N'2019-06-24T17:02:52.140' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.033' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'f88cc4e9-a603-4992-4483-39ee9ae61fff', N'权限接口_同步', N'Admin', N'Permission', N'Sync', 3, CAST(N'2019-06-24T17:02:52.140' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.040' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'6a98fd5f-ee43-7442-47ec-39ee9ae62005', N'权限接口_删除', N'Admin', N'Permission', N'Delete', 4, CAST(N'2019-06-24T17:02:52.140' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.047' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'bc87cea4-757f-abc2-2972-39ee9ae62008', N'角色管理_查询', N'Admin', N'Role', N'Query', 1, CAST(N'2019-06-24T17:02:52.140' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.053' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'93e3a2c0-a06b-62a7-4dc1-39ee9ae6200a', N'角色管理_添加', N'Admin', N'Role', N'Add', 3, CAST(N'2019-06-24T17:02:52.140' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.060' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'03f4d737-5b05-20de-b31e-39ee9ae6200f', N'角色管理_删除', N'Admin', N'Role', N'Delete', 4, CAST(N'2019-06-24T17:02:52.140' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.063' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'c2fe140d-267c-64d5-014b-39ee9ae62012', N'角色管理_编辑', N'Admin', N'Role', N'Edit', 1, CAST(N'2019-06-24T17:02:52.140' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.073' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'1c373f6b-426e-bd8c-ad5d-39ee9ae62016', N'角色管理_修改', N'Admin', N'Role', N'Update', 3, CAST(N'2019-06-24T17:02:52.140' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.077' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'b609b3bb-7210-7475-48df-39ee9ae6201b', N'角色管理_获取角色的关联菜单列表', N'Admin', N'Role', N'MenuList', 1, CAST(N'2019-06-24T17:02:52.140' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.083' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'e77e24f6-f740-38dd-4f4d-39ee9ae6201d', N'角色管理_绑定菜单', N'Admin', N'Role', N'BindMenu', 3, CAST(N'2019-06-24T17:02:52.140' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.093' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'791ff974-ede2-5f0a-fdee-39ee9ae62020', N'角色管理_获取角色关联的菜单按钮列表', N'Admin', N'Role', N'MenuButtonList', 1, CAST(N'2019-06-24T17:02:52.140' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.097' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'2fae6567-318f-f997-d5a4-39ee9ae62023', N'角色管理_绑定菜单按钮', N'Admin', N'Role', N'BindMenuButton', 3, CAST(N'2019-06-24T17:02:52.140' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.100' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'7b84b5d2-4cda-072d-421f-39ee9ae62029', N'角色管理_下拉列表数据', N'Admin', N'Role', N'Select', 1, CAST(N'2019-06-24T17:02:52.140' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.107' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'3dd08e9b-dd39-7d78-7164-39ee9ae6202c', N'系统_修改系统配置', N'Admin', N'System', N'Config', 3, CAST(N'2019-06-24T17:02:52.140' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.113' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'd6cb6e7e-3400-9648-9ee9-39ee9ae6202e', N'系统_上传Logo', N'Admin', N'System', N'UploadLogo', 3, CAST(N'2019-06-24T17:02:52.140' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'e2493747-fefa-eece-85ac-39ee9ae62033', N'系统_获取指定模块的Controller下拉列表', N'Admin', N'System', N'AllController', 1, CAST(N'2019-06-24T17:02:52.140' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.130' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'097055a0-1d96-9771-3561-39ee9ae62037', N'系统_获取指定模块和Controller的Action下拉列表', N'Admin', N'System', N'AllAction', 1, CAST(N'2019-06-24T17:02:52.140' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.133' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'85191b13-6e2f-398b-0f66-39ee9b1b9dfe', N'配置项管理_查询', N'Admin', N'Config', N'Query', 1, CAST(N'2019-06-24T18:01:17.743' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:55.827' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'ddcfa7e6-847c-a64c-e8cb-39ee9b1b9e04', N'配置项管理_添加', N'Admin', N'Config', N'Add', 3, CAST(N'2019-06-24T18:01:17.743' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:55.850' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'7fe92105-0b44-87ab-1933-39ee9b1b9e07', N'配置项管理_删除', N'Admin', N'Config', N'Delete', 4, CAST(N'2019-06-24T18:01:17.743' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:55.863' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'4b277fa6-234e-1712-81ab-39ee9b1b9e0d', N'配置项管理_编辑', N'Admin', N'Config', N'Edit', 1, CAST(N'2019-06-24T18:01:17.743' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:55.873' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'd627afb0-4deb-36d9-d3cb-39ee9b1b9e11', N'配置项管理_修改', N'Admin', N'Config', N'Update', 3, CAST(N'2019-06-24T18:01:17.743' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:55.887' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'ac918d69-3f2e-587c-1417-39ee9c6467c2', N'实体管理_查询', N'codegenerator', N'Class', N'Query', 1, CAST(N'2019-06-25T00:00:25.117' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.163' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'10e0264a-12a0-b491-700f-39ee9c6467ca', N'实体管理_添加', N'codegenerator', N'Class', N'Add', 3, CAST(N'2019-06-25T00:00:25.117' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.177' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'736b775c-5522-3272-a023-39ee9c6467ce', N'实体管理_删除', N'codegenerator', N'Class', N'Delete', 4, CAST(N'2019-06-25T00:00:25.117' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.180' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'1eeead90-122f-3ed5-f79f-39ee9c6467d3', N'实体管理_编辑', N'codegenerator', N'Class', N'Edit', 1, CAST(N'2019-06-25T00:00:25.117' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.187' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'047fde4c-e7b6-60c2-410b-39ee9c6467d7', N'实体管理_修改', N'codegenerator', N'Class', N'Update', 3, CAST(N'2019-06-25T00:00:25.117' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.193' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'0fee94e2-3592-43e8-731e-39ee9c6467db', N'枚举管理_查询', N'codegenerator', N'Enum', N'Query', 1, CAST(N'2019-06-25T00:00:25.117' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.197' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'9c9b6210-dbc1-9393-4fa2-39ee9c6467df', N'枚举管理_添加', N'codegenerator', N'Enum', N'Add', 3, CAST(N'2019-06-25T00:00:25.117' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.207' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'647eedf6-e35f-801c-9eea-39ee9c6467e7', N'枚举管理_删除', N'codegenerator', N'Enum', N'Delete', 4, CAST(N'2019-06-25T00:00:25.117' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.210' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'f1879f93-9c61-e7b3-9ce2-39ee9c6467eb', N'枚举管理_编辑', N'codegenerator', N'Enum', N'Edit', 1, CAST(N'2019-06-25T00:00:25.117' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.213' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'388e4e69-efeb-9ed6-a07e-39ee9c6467ee', N'枚举管理_修改', N'codegenerator', N'Enum', N'Update', 3, CAST(N'2019-06-25T00:00:25.117' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.217' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'2a9c1729-fcf8-2ff9-275b-39ee9c6467f3', N'枚举管理_下拉列表', N'codegenerator', N'Enum', N'Select', 1, CAST(N'2019-06-25T00:00:25.117' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.223' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'c9b2436d-85da-7ada-3af0-39ee9c6467f6', N'枚举项管理_查询', N'codegenerator', N'EnumItem', N'Query', 1, CAST(N'2019-06-25T00:00:25.117' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.227' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'c87a7f2a-68eb-a247-4e75-39ee9c6467fa', N'枚举项管理_添加', N'codegenerator', N'EnumItem', N'Add', 3, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.230' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'6a333b7f-76bc-d096-88e7-39ee9c6467fd', N'枚举项管理_删除', N'codegenerator', N'EnumItem', N'Delete', 4, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.233' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'4a87783a-5f45-aaff-9aad-39ee9c646801', N'枚举项管理_编辑', N'codegenerator', N'EnumItem', N'Edit', 1, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.243' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'ecada3f8-cf88-f8fc-4599-39ee9c646806', N'枚举项管理_修改', N'codegenerator', N'EnumItem', N'Update', 3, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.247' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'012acd01-cd93-7298-7b2b-39ee9c64680a', N'枚举项管理_更新排序信息', N'codegenerator', N'EnumItem', N'Sort', 1, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.260' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'17412b93-e7ee-a5ab-0d47-39ee9c64680d', N'枚举项管理_更新排序信息', N'codegenerator', N'EnumItem', N'Sort', 3, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.260' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'1402747a-3f99-8025-175c-39ee9c646810', N'模型属性管理_查询', N'codegenerator', N'ModelProperty', N'Query', 1, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.263' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'953d637f-2a80-438e-dfa9-39ee9c646813', N'模型属性管理_添加', N'codegenerator', N'ModelProperty', N'Add', 3, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.270' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'5ebb88e3-75d0-d660-ab87-39ee9c646817', N'模型属性管理_删除', N'codegenerator', N'ModelProperty', N'Delete', 4, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.273' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'46767e27-c85e-f92a-d813-39ee9c64681a', N'模型属性管理_编辑', N'codegenerator', N'ModelProperty', N'Edit', 1, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.280' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'cbea055b-d0d9-f13b-1e4f-39ee9c64681d', N'模型属性管理_修改', N'codegenerator', N'ModelProperty', N'Update', 3, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.283' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'c5caba86-026e-b672-5323-39ee9c64681f', N'模型属性管理_更新排序信息', N'codegenerator', N'ModelProperty', N'Sort', 1, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.293' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'00f79302-24ef-7506-359f-39ee9c646823', N'模型属性管理_更新排序信息', N'codegenerator', N'ModelProperty', N'Sort', 3, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.293' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'e28936f7-41ea-6dc2-204b-39ee9c646826', N'模型属性管理_修改可空状态', N'codegenerator', N'ModelProperty', N'UpdateNullable', 3, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.297' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'dd5f373a-c7d5-cec9-0168-39ee9c64682a', N'模型属性管理_获取下拉列表', N'codegenerator', N'ModelProperty', N'Select', 1, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.307' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'0af255ea-a1fd-8c62-e605-39ee9c64682d', N'模型属性管理_从实体中导入属性', N'codegenerator', N'ModelProperty', N'ImportFromEntity', 3, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.310' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'1edf18c5-401d-5336-99b6-39ee9c646831', N'项目管理_查询', N'codegenerator', N'Project', N'Query', 1, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.317' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'9695684f-db58-562f-bde4-39ee9c646835', N'项目管理_添加', N'codegenerator', N'Project', N'Add', 3, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.320' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'32f12761-fe00-3a26-96e0-39ee9c64683a', N'项目管理_删除', N'codegenerator', N'Project', N'Delete', 4, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.327' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'69c5fe7e-02cd-49f8-84d7-39ee9c64683d', N'项目管理_编辑', N'codegenerator', N'Project', N'Edit', 1, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.330' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'f771d046-d15c-253b-d4d4-39ee9c646841', N'项目管理_修改', N'codegenerator', N'Project', N'Update', 3, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.333' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'662750d7-3547-32ed-bfa5-39ee9c646846', N'项目管理_生成代码', N'codegenerator', N'Project', N'BuildCode', 3, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.340' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'df7b9d19-0cd1-a53e-a3c4-39ee9c64684b', N'实体属性管理_查询', N'codegenerator', N'Property', N'Query', 1, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.343' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'2990fc33-c4a4-1e48-b8b1-39ee9c64684f', N'实体属性管理_添加', N'codegenerator', N'Property', N'Add', 3, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.350' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'7580714d-8f0c-a0cb-fe4c-39ee9c646851', N'实体属性管理_删除', N'codegenerator', N'Property', N'Delete', 4, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.360' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'd8f35ecc-aab9-a871-410c-39ee9c646855', N'实体属性管理_编辑', N'codegenerator', N'Property', N'Edit', 1, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.363' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'a34ae290-6ead-a2c4-52a7-39ee9c64685a', N'实体属性管理_修改', N'codegenerator', N'Property', N'Update', 3, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.367' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'f1f9d695-257b-92bd-41fc-39ee9c64685e', N'实体属性管理_更新排序信息', N'codegenerator', N'Property', N'Sort', 1, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.380' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'13e21cbb-9ed6-1539-d0cf-39ee9c646860', N'实体属性管理_更新排序信息', N'codegenerator', N'Property', N'Sort', 3, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.380' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'd89c232d-9d91-2d54-0eff-39ee9c646864', N'实体属性管理_修改可空状态', N'codegenerator', N'Property', N'UpdateNullable', 3, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.383' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'f5d9e215-204a-e122-c1f5-39ee9c646868', N'实体属性管理_修改列表显示状态', N'codegenerator', N'Property', N'UpdateShowInList', 3, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.393' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'ab5eea35-05b3-fae3-5fb0-39ee9c64686d', N'实体属性管理_获取下拉列表', N'codegenerator', N'Property', N'Select', 1, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.400' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'4e4f54cd-1e49-a369-0bd1-39ee9c646872', N'区划代码管理_查询', N'common', N'Area', N'Query', 1, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.407' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'035535fb-1ab1-0f28-203d-39ee9c646875', N'区划代码管理_添加', N'common', N'Area', N'Add', 3, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.410' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'75194623-ea56-9a70-f315-39ee9c646879', N'区划代码管理_删除', N'common', N'Area', N'Delete', 4, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.413' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'c20a1001-4677-4996-9b7d-39ee9c64687c', N'区划代码管理_编辑', N'common', N'Area', N'Edit', 1, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.423' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'51ad8f78-ef0c-7d39-4c9c-39ee9c64687f', N'区划代码管理_修改', N'common', N'Area', N'Update', 3, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.430' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
GO
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'10afb897-aa62-e0d4-96b3-39ee9c646882', N'区划代码管理_查询子节点', N'common', N'Area', N'QueryChildren', 1, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.433' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'54f0ac5b-7b67-fcee-f26f-39ee9c646884', N'附件表管理_查询', N'common', N'Attachment', N'Query', 1, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.443' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'51a9968e-69c3-e18e-a77e-39ee9c646887', N'附件表管理_上传', N'common', N'Attachment', N'Upload', 3, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.447' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'9f047cf9-d724-c53c-4c7a-39ee9c64688a', N'字典管理_查询', N'common', N'Dict', N'Query', 1, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.463' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'1ebb4aa8-97b9-d67e-eb01-39ee9c64688d', N'字典管理_添加', N'common', N'Dict', N'Add', 3, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.473' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'86bd5941-2436-a138-81b4-39ee9c64688f', N'字典管理_删除', N'common', N'Dict', N'Delete', 4, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.477' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'4cddfd97-7eb3-61ba-8518-39ee9c646892', N'字典管理_编辑', N'common', N'Dict', N'Edit', 1, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.480' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'0f1f50be-53b4-b723-f881-39ee9c646895', N'字典管理_修改', N'common', N'Dict', N'Update', 3, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.490' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'041f5602-2a92-b7c5-9533-39ee9c646898', N'公司单位管理_查询', N'PersonnelFiles', N'Company', N'Query', 1, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.523' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'cf4ff635-b8bf-2a17-b3c4-39ee9c64689a', N'公司单位管理_添加', N'PersonnelFiles', N'Company', N'Add', 3, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.527' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'426abe5a-993c-37b9-b84b-39ee9c64689d', N'公司单位管理_删除', N'PersonnelFiles', N'Company', N'Delete', 4, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.530' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'7e351053-aaef-151c-509c-39ee9c6468a0', N'公司单位管理_编辑', N'PersonnelFiles', N'Company', N'Edit', 1, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.540' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'72f1a443-039f-84b9-dcda-39ee9c6468a4', N'公司单位管理_修改', N'PersonnelFiles', N'Company', N'Update', 3, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.547' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'3c52373e-6ce0-c72f-88e6-39ee9c6468a7', N'公司单位管理_下拉列表', N'PersonnelFiles', N'Company', N'Select', 1, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.550' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'3409973d-b44f-973c-8c13-39ee9c6468aa', N'部门管理_部门树', N'PersonnelFiles', N'Department', N'Tree', 1, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.560' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'01bbca32-2a14-fb0b-8cc5-39ee9c6468ad', N'部门管理_查询', N'PersonnelFiles', N'Department', N'Query', 1, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.563' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'1cbcfce6-18e4-a567-2e20-39ee9c6468b1', N'部门管理_添加', N'PersonnelFiles', N'Department', N'Add', 3, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.577' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'364a24de-7e01-e45e-1bf7-39ee9c6468b4', N'部门管理_删除', N'PersonnelFiles', N'Department', N'Delete', 4, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.583' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'253fc18b-f1ca-07c3-62e9-39ee9c6468b7', N'部门管理_编辑', N'PersonnelFiles', N'Department', N'Edit', 1, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.590' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'f10266ba-3c20-2bea-9ce4-39ee9c6468ba', N'部门管理_修改', N'PersonnelFiles', N'Department', N'Update', 3, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.597' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'69fc6036-7f0a-fb17-c82f-39ee9c6468bd', N'岗位管理_查询', N'PersonnelFiles', N'Position', N'Query', 1, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.600' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'4e08e38f-560d-a3e7-16ff-39ee9c6468bf', N'岗位管理_添加', N'PersonnelFiles', N'Position', N'Add', 3, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.610' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'a877daef-8a68-de86-76a9-39ee9c6468c2', N'岗位管理_删除', N'PersonnelFiles', N'Position', N'Delete', 4, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.617' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'5e40862a-2a7d-10d8-19ea-39ee9c6468c5', N'岗位管理_编辑', N'PersonnelFiles', N'Position', N'Edit', 1, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.623' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'38d02851-43e5-49ee-66a3-39ee9c6468c8', N'岗位管理_修改', N'PersonnelFiles', N'Position', N'Update', 3, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.627' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'6d1af0ef-9348-4995-3f48-39ee9c6468cb', N'用户联系信息管理_查询', N'PersonnelFiles', N'UserContact', N'Query', 1, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-25T17:17:23.807' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'86bcfc82-24ae-9df5-db9f-39ee9c6468cd', N'用户联系信息管理_添加', N'PersonnelFiles', N'UserContact', N'Add', 3, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-25T17:17:23.813' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'8a5ae5b5-86da-b277-cbfd-39ee9c6468d0', N'用户联系信息管理_删除', N'PersonnelFiles', N'UserContact', N'Delete', 4, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-25T17:17:23.817' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'd5b76be6-3b22-a1b0-7a13-39ee9c6468d3', N'用户联系信息管理_编辑', N'PersonnelFiles', N'UserContact', N'Edit', 1, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-25T17:17:23.823' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'f699a34b-d617-46c6-cf1e-39ee9c6468d6', N'用户联系信息管理_修改', N'PersonnelFiles', N'UserContact', N'Update', 3, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-25T17:17:23.827' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'a2e3c4b9-cced-7b64-c5e5-39ee9c6468d9', N'用户信息管理_查询', N'PersonnelFiles', N'User', N'Query', 1, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.643' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'763264ae-a1e3-d88f-06c2-39ee9c6468dc', N'用户信息管理_添加', N'PersonnelFiles', N'User', N'Add', 3, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.650' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'cfab3aef-81ea-f78f-f032-39ee9c6468df', N'用户信息管理_删除', N'PersonnelFiles', N'User', N'Delete', 4, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.657' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'e547d1dc-9d08-15e5-2c43-39ee9c6468e1', N'用户信息管理_编辑', N'PersonnelFiles', N'User', N'Edit', 1, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.660' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'598e7365-c065-5b18-73b5-39ee9c6468e4', N'用户信息管理_修改', N'PersonnelFiles', N'User', N'Update', 3, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.667' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'63435627-cf7a-370c-ccde-39ee9c6468e7', N'用户信息管理_上传照片', N'PersonnelFiles', N'User', N'UploadPicture', 3, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.677' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'3774df6c-e3e3-fbd7-4419-39ee9c6468ea', N'用户教育经历管理_查询', N'PersonnelFiles', N'UserEducationHistory', N'Query', 1, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.697' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'eeea1b88-0139-08aa-31c9-39ee9c6468ed', N'用户教育经历管理_添加', N'PersonnelFiles', N'UserEducationHistory', N'Add', 3, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.707' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'35b996ff-e11b-3b29-0879-39ee9c6468f0', N'用户教育经历管理_删除', N'PersonnelFiles', N'UserEducationHistory', N'Delete', 4, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.710' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'643e24fc-c85d-813c-834c-39ee9c6468f3', N'用户教育经历管理_编辑', N'PersonnelFiles', N'UserEducationHistory', N'Edit', 1, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.713' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'124c2840-ca01-501d-74cf-39ee9c6468f5', N'用户教育经历管理_修改', N'PersonnelFiles', N'UserEducationHistory', N'Update', 3, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.723' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'b576aa79-0891-3390-6a0a-39ee9c6468f8', N'用户工作经历管理_查询', N'PersonnelFiles', N'UserWorkHistory', N'Query', 1, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.730' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'20a85d1b-658b-85d4-928b-39ee9c6468fb', N'用户工作经历管理_添加', N'PersonnelFiles', N'UserWorkHistory', N'Add', 3, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.740' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'4087c180-cc5a-28c0-b2ea-39ee9c6468fe', N'用户工作经历管理_删除', N'PersonnelFiles', N'UserWorkHistory', N'Delete', 4, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.743' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'8a2d55fb-9a34-8b6d-fab1-39ee9c646901', N'用户工作经历管理_编辑', N'PersonnelFiles', N'UserWorkHistory', N'Edit', 1, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.747' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'6e3128b9-a907-9a46-05d2-39ee9c646904', N'用户工作经历管理_修改', N'PersonnelFiles', N'UserWorkHistory', N'Update', 3, CAST(N'2019-06-25T00:00:25.120' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.760' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'66d3b1aa-6e4c-9c48-da5e-39ee9ee5b4c2', N'附件表管理_下载', N'Common', N'Attachment', N'Download', 1, CAST(N'2019-06-25T11:40:53.237' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.453' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'2a3a7a14-b67c-07ba-275f-39ee9ee7f5b0', N'多媒体管理_查询', N'Common', N'MediaType', N'Query', 1, CAST(N'2019-06-25T11:43:20.983' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.493' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'4e77f7e2-c0d3-24fa-c8c3-39ee9ee7f5c8', N'多媒体管理_添加', N'Common', N'MediaType', N'Add', 3, CAST(N'2019-06-25T11:43:20.983' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.497' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'e67df63a-c2a5-3e7a-acad-39ee9ee7f5cc', N'多媒体管理_删除', N'Common', N'MediaType', N'Delete', 4, CAST(N'2019-06-25T11:43:20.983' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.507' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'66f283e4-6f96-940d-aaa8-39ee9ee7f5ce', N'多媒体管理_编辑', N'Common', N'MediaType', N'Edit', 1, CAST(N'2019-06-25T11:43:20.983' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.510' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'6bb748e1-1249-c11f-0f5e-39ee9ee7f5d6', N'多媒体管理_修改', N'Common', N'MediaType', N'Update', 3, CAST(N'2019-06-25T11:43:20.983' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.513' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'53125a49-2e4c-f1c6-9f46-39ee9f4c358b', N'附件表管理_导出', N'Common', N'Attachment', N'Export', 1, CAST(N'2019-06-25T13:32:50.663' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.460' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'12a90a6f-303b-62c5-c06c-39eea019c7d6', N'岗位管理_下拉列表', N'PersonnelFiles', N'Position', N'Select', 1, CAST(N'2019-06-25T17:17:22.723' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.637' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'6b51f55c-4976-f67f-79c3-39eea4c10780', N'用户信息管理_编辑联系信息', N'PersonnelFiles', N'User', N'EditContact', 1, CAST(N'2019-06-26T14:58:32.483' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.680' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'4358f6f8-5a70-5be3-2f57-39eea4c10786', N'用户信息管理_修改联系信息', N'PersonnelFiles', N'User', N'UpdateContact', 3, CAST(N'2019-06-26T14:58:32.483' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.690' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'1663a58e-b91b-189e-6fb4-39eeaa05f917', N'用户信息管理_联系信息详情', N'PersonnelFiles', N'User', N'ContactDetails', 1, CAST(N'2019-06-27T15:31:56.713' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', CAST(N'2019-06-27T17:24:56.693' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a')
INSERT [dbo].[Role] ([Id], [Name], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy], [Deleted], [DeletedTime], [DeletedBy]) VALUES (N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'系统管理员', N'超级管理员', CAST(N'2019-04-12T11:36:52.000' AS DateTime), N'00000000-0000-0000-0000-000000000000', CAST(N'2019-06-24T18:17:04.170' AS DateTime), N'2e23d1d9-4a72-acc2-f6ff-39ed21cb6a4a', 0, CAST(N'2019-04-12T11:36:52.000' AS DateTime), N'00000000-0000-0000-0000-000000000000')
SET IDENTITY_INSERT [dbo].[Role_Menu] ON 

INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (72, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'053a5a8b-ac94-9d44-aad2-39ee9c64c92c')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (73, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'ef5da896-41af-bfbf-77f5-39ee9c6541bf')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (74, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'0db3aa56-daca-56c2-0ed3-39ee9c677b88')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (75, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'1e778ffc-d278-bde0-db5f-39ee9c68165a')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (76, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'ed573a8c-1409-d600-dd03-39ee9c6b3b51')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (77, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'083dcd58-25ee-7411-552d-39ee9e5b64fb')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (78, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'36ad6b42-b22d-7c3c-8ca7-39ee9e5cd8c5')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (79, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'6fb818b9-c021-62a1-cd39-39ee9e5d1a7c')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (80, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'f98ffc20-c2ac-d2be-8035-39ee9eeb706d')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (81, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'2c18c915-225f-ee90-869a-39ee9ae6f7c7')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (82, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'4ac9ef98-aff8-7e8e-e149-39ee9ae809eb')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (83, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'1609bab0-f3e8-6e66-cc3c-39ee9ae860c6')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (84, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'e61af72d-ab86-386a-a4bb-39ee9ae89a2f')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (85, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'7c354368-9616-d664-f4f0-39ee9ae8cab2')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (86, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'817ec04d-d9bc-ba30-ad63-39ee9ae9092f')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (87, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'ee04c57e-31d0-f28d-28b8-39ee9ae7265c')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (88, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'3f08b280-7a45-7fb1-ba39-39ee9ae99473')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (89, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'f6265a81-4df2-ca40-aa62-39ee9b057c37')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (90, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'15422ea5-2413-43c5-2a47-39ee9ae9b633')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (91, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'60448ed5-fa3b-eb88-a61a-39eeaa6deb31')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (92, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'da7e7265-6a97-d686-4361-39eeaa6e5629')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (93, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'6f3fec3b-3dfe-1834-5c31-39eeaa6ea6c1')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (94, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'1d774799-6c7d-5e79-442d-39eeaa6edc95')
SET IDENTITY_INSERT [dbo].[Role_Menu] OFF
SET IDENTITY_INSERT [dbo].[Role_Menu_Button] ON 

INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (1, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'4ac9ef98-aff8-7e8e-e149-39ee9ae809eb', N'320e8558-48d8-d781-43fc-39ee9aea35e9')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (2, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'4ac9ef98-aff8-7e8e-e149-39ee9ae809eb', N'11a35d13-c691-0121-6106-39ee9aea35f3')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (3, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'1609bab0-f3e8-6e66-cc3c-39ee9ae860c6', N'fb81046d-dfb9-e8e9-0836-39ee9aeb44fb')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (4, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'1609bab0-f3e8-6e66-cc3c-39ee9ae860c6', N'd38df13e-558c-2c61-1923-39ee9aeb44fe')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (5, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'e61af72d-ab86-386a-a4bb-39ee9ae89a2f', N'9af35d6e-7a7a-950f-14e3-39ee9aebb5e6')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (6, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'e61af72d-ab86-386a-a4bb-39ee9ae89a2f', N'055879e0-c7eb-9de0-df07-39ee9aebb5e9')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (7, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'e61af72d-ab86-386a-a4bb-39ee9ae89a2f', N'efb75748-f298-b185-7c15-39ee9aebb5ee')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (8, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'e61af72d-ab86-386a-a4bb-39ee9ae89a2f', N'afab0122-1391-8894-b4ad-39ee9aebb5f4')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (9, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'7c354368-9616-d664-f4f0-39ee9ae8cab2', N'7bc98f3a-ac7c-28ff-77c7-39ee9aed0c45')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (10, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'7c354368-9616-d664-f4f0-39ee9ae8cab2', N'6ab1fe93-6e68-02c0-eb26-39ee9aed0c4f')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (11, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'7c354368-9616-d664-f4f0-39ee9ae8cab2', N'94a638ba-d6a9-4e81-a18b-39ee9aed0c52')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (12, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'7c354368-9616-d664-f4f0-39ee9ae8cab2', N'0220b6fc-6966-e62f-e7fe-39ee9aed0c54')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (13, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'817ec04d-d9bc-ba30-ad63-39ee9ae9092f', N'7c1feb31-8db9-35c1-50cc-39ee9aeea370')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (14, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'817ec04d-d9bc-ba30-ad63-39ee9ae9092f', N'df3c5197-66bb-eb7a-4bbe-39ee9aeea374')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (15, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'817ec04d-d9bc-ba30-ad63-39ee9ae9092f', N'9ade8617-b64d-373b-3893-39ee9aeea37d')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (16, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'817ec04d-d9bc-ba30-ad63-39ee9ae9092f', N'009d8ca1-4f8f-3497-2b9b-39ee9aeea37f')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (17, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'817ec04d-d9bc-ba30-ad63-39ee9ae9092f', N'ddfe7e0a-0322-1c93-4475-39ee9aeea381')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (18, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'817ec04d-d9bc-ba30-ad63-39ee9ae9092f', N'0a00c1ef-057d-40cb-085f-39ee9aeea38a')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (19, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'f6265a81-4df2-ca40-aa62-39ee9b057c37', N'b379029b-295d-8792-c9d0-39ee9b1c3045')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (20, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'f6265a81-4df2-ca40-aa62-39ee9b057c37', N'79b31dc0-4e49-7ec4-2e7d-39ee9b1c3051')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (21, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'f6265a81-4df2-ca40-aa62-39ee9b057c37', N'24e36a83-2873-af62-00b7-39ee9b1c3053')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (22, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'ef5da896-41af-bfbf-77f5-39ee9c6541bf', N'f8ab056d-5052-95dc-eafe-39ee9c6d934a')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (23, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'ef5da896-41af-bfbf-77f5-39ee9c6541bf', N'39823f70-7223-ff0e-a4dc-39ee9c6d9351')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (24, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'ef5da896-41af-bfbf-77f5-39ee9c6541bf', N'0fd94b39-e1d6-413e-50fd-39ee9c6d9354')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (25, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'0db3aa56-daca-56c2-0ed3-39ee9c677b88', N'8ec88f70-ff73-020c-54f2-39ee9c6e8f81')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (26, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'0db3aa56-daca-56c2-0ed3-39ee9c677b88', N'b526c0a0-a6ed-f0fa-cc5e-39ee9c6e8f83')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (27, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'0db3aa56-daca-56c2-0ed3-39ee9c677b88', N'ec285693-e0ac-6137-5de5-39ee9c6e8f85')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (28, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'0db3aa56-daca-56c2-0ed3-39ee9c677b88', N'18382e60-26bc-5c36-6abf-39ee9c6e8f87')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (29, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'0db3aa56-daca-56c2-0ed3-39ee9c677b88', N'75d73af4-55a8-a2b9-8ded-39ee9c6e8f88')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (30, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'0db3aa56-daca-56c2-0ed3-39ee9c677b88', N'e2a7c844-f8ae-b831-20cb-39ee9c6e8f8a')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (31, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'0db3aa56-daca-56c2-0ed3-39ee9c677b88', N'2e8821a8-5cb6-f52e-5b6c-39ee9c6e8f8d')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (32, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'1e778ffc-d278-bde0-db5f-39ee9c68165a', N'a70d98dc-bb2a-722f-efae-39ee9c711c77')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (33, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'ed573a8c-1409-d600-dd03-39ee9c6b3b51', N'cede4e24-8df7-5af8-2de6-39ee9c71aa4d')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (34, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'ed573a8c-1409-d600-dd03-39ee9c6b3b51', N'327b49a6-f7b2-c1a4-9dea-39ee9c71aa51')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (35, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'ed573a8c-1409-d600-dd03-39ee9c6b3b51', N'45bf6f61-eec8-21d0-af6c-39ee9c71aa53')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (36, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'36ad6b42-b22d-7c3c-8ca7-39ee9e5cd8c5', N'b5056c65-25ba-47ba-d7f8-39ee9e5da88e')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (37, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'36ad6b42-b22d-7c3c-8ca7-39ee9e5cd8c5', N'f2c647eb-dfc1-7ec9-2e7d-39ee9e5da89a')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (38, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'36ad6b42-b22d-7c3c-8ca7-39ee9e5cd8c5', N'05f161f5-d356-95a5-7508-39ee9e5da89c')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (39, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'f98ffc20-c2ac-d2be-8035-39ee9eeb706d', N'2e762d71-e2d5-ecc5-615e-39ee9eebb34d')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (40, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'f98ffc20-c2ac-d2be-8035-39ee9eeb706d', N'cf5c1197-fd1b-54ea-b02f-39ee9eebb354')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (41, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'f98ffc20-c2ac-d2be-8035-39ee9eeb706d', N'06604dea-4fbb-05bf-e004-39ee9eebb358')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (42, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'6fb818b9-c021-62a1-cd39-39ee9e5d1a7c', N'd11c8173-bbc4-0124-8951-39ee9f4f0f65')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (43, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'6fb818b9-c021-62a1-cd39-39ee9e5d1a7c', N'23dba189-6e67-3f2d-e703-39ee9f4f0f6f')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (44, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'ed573a8c-1409-d600-dd03-39ee9c6b3b51', N'f611ab49-bc29-6d99-a7c1-39eea908e900')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (45, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'ed573a8c-1409-d600-dd03-39ee9c6b3b51', N'a826055e-8c0d-44bb-88dd-39eea9acab6b')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (46, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'6f3fec3b-3dfe-1834-5c31-39eeaa6ea6c1', N'c9aaf236-46ce-371c-8fca-39eeaa709a8b')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (47, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'6f3fec3b-3dfe-1834-5c31-39eeaa6ea6c1', N'd149c3b6-3533-3f69-924c-39eeaa709a94')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (48, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'6f3fec3b-3dfe-1834-5c31-39eeaa6ea6c1', N'8d954d6b-a443-abc5-0317-39eeaa709a98')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (49, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'6f3fec3b-3dfe-1834-5c31-39eeaa6ea6c1', N'6f5e14f7-4ea7-073a-f0d0-39eeaa709a9b')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (50, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'1d774799-6c7d-5e79-442d-39eeaa6edc95', N'1220d4c1-8cbc-201a-4d2b-39eeaa716b20')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (51, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'1d774799-6c7d-5e79-442d-39eeaa6edc95', N'22f28b90-b021-cb72-85b4-39eeaa716b2c')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (52, N'1cb0d69c-6373-3b46-51b8-39ed21cb6a2d', N'1d774799-6c7d-5e79-442d-39eeaa6edc95', N'129756b0-7190-36df-022a-39eeaa716b2f')
SET IDENTITY_INSERT [dbo].[Role_Menu_Button] OFF
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_Account_LoginTime]  DEFAULT (getdate()) FOR [LoginTime]
GO
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_Account_CreatedTime]  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_Account_ModifiedTime]  DEFAULT (getdate()) FOR [ModifiedTime]
GO
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_Account_ClosedTime]  DEFAULT (getdate()) FOR [ClosedTime]
GO
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_Account_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_Account_DeletedTime]  DEFAULT (getdate()) FOR [DeletedTime]
GO
ALTER TABLE [dbo].[Auditinfo] ADD  CONSTRAINT [DF_Auditinfo_ExecutionTime]  DEFAULT (getdate()) FOR [ExecutionTime]
GO
ALTER TABLE [dbo].[Button] ADD  CONSTRAINT [DF_Button_CreatedTime]  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[Button] ADD  CONSTRAINT [DF_Button_ModifiedTime]  DEFAULT (getdate()) FOR [ModifiedTime]
GO
ALTER TABLE [dbo].[Config] ADD  CONSTRAINT [DF_Config_CreatedTime]  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[Config] ADD  CONSTRAINT [DF_Config_ModifiedTime]  DEFAULT (getdate()) FOR [ModifiedTime]
GO
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF_Menu_Show]  DEFAULT ((1)) FOR [Show]
GO
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF_Menu_DialogFullscreen]  DEFAULT ((1)) FOR [DialogFullscreen]
GO
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF_Menu_CreatedTime]  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF_Menu_ModifiedTime]  DEFAULT (getdate()) FOR [ModifiedTime]
GO
ALTER TABLE [dbo].[Moduleinfo] ADD  CONSTRAINT [DF_Moduleinfo_CreatedTime]  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[Moduleinfo] ADD  CONSTRAINT [DF_Moduleinfo_ModifiedTime]  DEFAULT (getdate()) FOR [ModifiedTime]
GO
ALTER TABLE [dbo].[Permission] ADD  CONSTRAINT [DF_Permission_CreatedTime]  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[Permission] ADD  CONSTRAINT [DF_Permission_ModifiedTime]  DEFAULT (getdate()) FOR [ModifiedTime]
GO
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [DF_Role_CreatedTime]  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [DF_Role_ModifiedTime]  DEFAULT (getdate()) FOR [ModifiedTime]
GO
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [DF_Role_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [DF_Role_DeletedTime]  DEFAULT (getdate()) FOR [DeletedTime]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'Password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手机号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'邮箱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后登录时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'LoginTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后登录IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'LoginIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态：0、未激活 1、正常 2、禁用 3、注销' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'CreatedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'CreatedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'ModifiedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后修改人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'ModifiedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'注销时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'ClosedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'注销人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'ClosedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'已删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'Deleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'删除时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'DeletedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'删除人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account', @level2type=N'COLUMN',@level2name=N'DeletedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'账户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account_Role', @level2type=N'COLUMN',@level2name=N'AccountId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Account_Role', @level2type=N'COLUMN',@level2name=N'RoleId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'账户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auditinfo', @level2type=N'COLUMN',@level2name=N'AccountId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'区域' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auditinfo', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'控制器' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auditinfo', @level2type=N'COLUMN',@level2name=N'Controller'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auditinfo', @level2type=N'COLUMN',@level2name=N'Action'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'参数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auditinfo', @level2type=N'COLUMN',@level2name=N'Parameters'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'返回数据' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auditinfo', @level2type=N'COLUMN',@level2name=N'Result'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'方法开始执行时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auditinfo', @level2type=N'COLUMN',@level2name=N'ExecutionTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'方法执行总用时(ms)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auditinfo', @level2type=N'COLUMN',@level2name=N'ExecutionDuration'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'浏览器信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auditinfo', @level2type=N'COLUMN',@level2name=N'BrowserInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'平台' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auditinfo', @level2type=N'COLUMN',@level2name=N'Platform'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Button', @level2type=N'COLUMN',@level2name=N'MenuId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Button', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图标' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Button', @level2type=N'COLUMN',@level2name=N'Icon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'按钮编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Button', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Button', @level2type=N'COLUMN',@level2name=N'CreatedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Button', @level2type=N'COLUMN',@level2name=N'CreatedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Button', @level2type=N'COLUMN',@level2name=N'ModifiedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Button', @level2type=N'COLUMN',@level2name=N'ModifiedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'按钮编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Button_Permission', @level2type=N'COLUMN',@level2name=N'ButtonId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'权限编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Button_Permission', @level2type=N'COLUMN',@level2name=N'PermissionId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Config', @level2type=N'COLUMN',@level2name=N'Key'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Config', @level2type=N'COLUMN',@level2name=N'Value'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Config', @level2type=N'COLUMN',@level2name=N'Remarks'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Config', @level2type=N'COLUMN',@level2name=N'CreatedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Config', @level2type=N'COLUMN',@level2name=N'CreatedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Config', @level2type=N'COLUMN',@level2name=N'ModifiedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Config', @level2type=N'COLUMN',@level2name=N'ModifiedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所属模块' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'ModuleCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型，0、节点 1、链接' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父菜单' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'ParentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'路由名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'RouteName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'路由参数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'RouteParams'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'路由参数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'RouteQuery'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图标' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'Icon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图标颜色' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'IconColor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'链接' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'Url'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'等级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'Level'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否显示' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'Show'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'Sort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'打开方式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'Target'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'对话框宽度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'DialogWidth'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'对话框高度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'DialogHeight'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'对话框可全屏' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'DialogFullscreen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'Remarks'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'CreatedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'CreatedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'ModifiedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'ModifiedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu_Permission', @level2type=N'COLUMN',@level2name=N'MenuId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'权限编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu_Permission', @level2type=N'COLUMN',@level2name=N'PermissionId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Moduleinfo', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Moduleinfo', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'版本号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Moduleinfo', @level2type=N'COLUMN',@level2name=N'Version'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Moduleinfo', @level2type=N'COLUMN',@level2name=N'Remarks'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Moduleinfo', @level2type=N'COLUMN',@level2name=N'CreatedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Moduleinfo', @level2type=N'COLUMN',@level2name=N'CreatedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Moduleinfo', @level2type=N'COLUMN',@level2name=N'ModifiedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Moduleinfo', @level2type=N'COLUMN',@level2name=N'ModifiedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Permission', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模块编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Permission', @level2type=N'COLUMN',@level2name=N'ModuleCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'控制器' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Permission', @level2type=N'COLUMN',@level2name=N'Controller'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'动作' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Permission', @level2type=N'COLUMN',@level2name=N'Action'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'请求方法' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Permission', @level2type=N'COLUMN',@level2name=N'HttpMethod'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Permission', @level2type=N'COLUMN',@level2name=N'CreatedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Permission', @level2type=N'COLUMN',@level2name=N'CreatedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Permission', @level2type=N'COLUMN',@level2name=N'ModifiedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Permission', @level2type=N'COLUMN',@level2name=N'ModifiedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'Remarks'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'CreatedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'CreatedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'ModifiedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'ModifiedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'已删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'Deleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'删除时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'DeletedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'删除人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'DeletedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role_Menu', @level2type=N'COLUMN',@level2name=N'RoleId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role_Menu', @level2type=N'COLUMN',@level2name=N'MenuId'
GO
USE [master]
GO
ALTER DATABASE [Nm_Admin] SET  READ_WRITE 
GO
