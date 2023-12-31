USE [master]
GO
/****** Object:  Database [FinalProjectCodeDb]    Script Date: 10.08.2023 23:22:30 ******/
CREATE DATABASE [FinalProjectCodeDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FinalProjectCodeDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\FinalProjectCodeDb.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FinalProjectCodeDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\FinalProjectCodeDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [FinalProjectCodeDb] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FinalProjectCodeDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FinalProjectCodeDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FinalProjectCodeDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FinalProjectCodeDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FinalProjectCodeDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FinalProjectCodeDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [FinalProjectCodeDb] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [FinalProjectCodeDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FinalProjectCodeDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FinalProjectCodeDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FinalProjectCodeDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FinalProjectCodeDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FinalProjectCodeDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FinalProjectCodeDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FinalProjectCodeDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FinalProjectCodeDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FinalProjectCodeDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FinalProjectCodeDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FinalProjectCodeDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FinalProjectCodeDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FinalProjectCodeDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FinalProjectCodeDb] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [FinalProjectCodeDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FinalProjectCodeDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FinalProjectCodeDb] SET  MULTI_USER 
GO
ALTER DATABASE [FinalProjectCodeDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FinalProjectCodeDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FinalProjectCodeDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FinalProjectCodeDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FinalProjectCodeDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FinalProjectCodeDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [FinalProjectCodeDb] SET QUERY_STORE = ON
GO
ALTER DATABASE [FinalProjectCodeDb] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [FinalProjectCodeDb]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 10.08.2023 23:22:30 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 10.08.2023 23:22:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 10.08.2023 23:22:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 10.08.2023 23:22:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 10.08.2023 23:22:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 10.08.2023 23:22:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 10.08.2023 23:22:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 10.08.2023 23:22:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Authors]    Script Date: 10.08.2023 23:22:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Text] [nvarchar](1000) NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreateBy] [nvarchar](255) NULL,
	[CreateAt] [datetime2](7) NOT NULL,
	[UpdateBy] [nvarchar](255) NULL,
	[UpdateAt] [datetime2](7) NULL,
	[DeletedBy] [nvarchar](255) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[Job] [nvarchar](255) NULL,
 CONSTRAINT [PK_Authors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Baskets]    Script Date: 10.08.2023 23:22:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Baskets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Count] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[UserId] [nvarchar](450) NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreateBy] [nvarchar](255) NULL,
	[CreateAt] [datetime2](7) NOT NULL,
	[UpdateBy] [nvarchar](255) NULL,
	[UpdateAt] [datetime2](7) NULL,
	[DeletedBy] [nvarchar](255) NULL,
	[DeletedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_Baskets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BlogCategies]    Script Date: 10.08.2023 23:22:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlogCategies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[IsMain] [bit] NOT NULL,
	[ParentId] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreateBy] [nvarchar](255) NULL,
	[CreateAt] [datetime2](7) NOT NULL,
	[UpdateBy] [nvarchar](255) NULL,
	[UpdateAt] [datetime2](7) NULL,
	[DeletedBy] [nvarchar](255) NULL,
	[DeletedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_BlogCategies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 10.08.2023 23:22:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreateBy] [nvarchar](255) NULL,
	[CreateAt] [datetime2](7) NOT NULL,
	[UpdateBy] [nvarchar](255) NULL,
	[UpdateAt] [datetime2](7) NULL,
	[DeletedBy] [nvarchar](255) NULL,
	[DeletedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_Brands] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 10.08.2023 23:22:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[IsMain] [bit] NOT NULL,
	[ParentId] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreateBy] [nvarchar](255) NULL,
	[CreateAt] [datetime2](7) NOT NULL,
	[UpdateBy] [nvarchar](255) NULL,
	[UpdateAt] [datetime2](7) NULL,
	[DeletedBy] [nvarchar](255) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[BlogCategoryId] [int] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImages]    Script Date: 10.08.2023 23:22:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](max) NULL,
	[ProductId] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreateBy] [nvarchar](255) NULL,
	[CreateAt] [datetime2](7) NOT NULL,
	[UpdateBy] [nvarchar](255) NULL,
	[UpdateAt] [datetime2](7) NULL,
	[DeletedBy] [nvarchar](255) NULL,
	[DeletedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_ProductImages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 10.08.2023 23:22:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NULL,
	[Description] [nvarchar](1000) NULL,
	[Price] [money] NOT NULL,
	[DiscountedPrice] [money] NULL,
	[Count] [int] NOT NULL,
	[HoverImage] [nvarchar](255) NULL,
	[MainImage] [nvarchar](255) NULL,
	[BrandId] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreateBy] [nvarchar](255) NULL,
	[CreateAt] [datetime2](7) NOT NULL,
	[UpdateBy] [nvarchar](255) NULL,
	[UpdateAt] [datetime2](7) NULL,
	[DeletedBy] [nvarchar](255) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[Info] [nvarchar](1000) NULL,
	[Sold] [int] NOT NULL,
	[View] [int] NOT NULL,
	[CategoryId] [int] NULL,
	[Raiting] [int] NOT NULL,
	[InStock] [bit] NOT NULL,
	[BlogCategoryId] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductTags]    Script Date: 10.08.2023 23:22:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTags](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[TagId] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreateBy] [nvarchar](255) NULL,
	[CreateAt] [datetime2](7) NOT NULL,
	[UpdateBy] [nvarchar](255) NULL,
	[UpdateAt] [datetime2](7) NULL,
	[DeletedBy] [nvarchar](255) NULL,
	[DeletedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_ProductTags] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 10.08.2023 23:22:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[UserId] [nvarchar](450) NULL,
	[Raiting] [int] NOT NULL,
	[Tittle] [nvarchar](max) NULL,
	[Describtion] [nvarchar](max) NULL,
	[Username] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreateBy] [nvarchar](255) NULL,
	[CreateAt] [datetime2](7) NOT NULL,
	[UpdateBy] [nvarchar](255) NULL,
	[UpdateAt] [datetime2](7) NULL,
	[DeletedBy] [nvarchar](255) NULL,
	[DeletedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_Reviews] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Settings]    Script Date: 10.08.2023 23:22:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Settings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](255) NULL,
	[Value] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Settings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sliders]    Script Date: 10.08.2023 23:22:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sliders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NULL,
	[TitleTwo] [nvarchar](255) NULL,
	[Image] [nvarchar](255) NULL,
	[Link] [nvarchar](255) NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreateBy] [nvarchar](255) NULL,
	[CreateAt] [datetime2](7) NOT NULL,
	[UpdateBy] [nvarchar](255) NULL,
	[UpdateAt] [datetime2](7) NULL,
	[DeletedBy] [nvarchar](255) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[SubTitle] [nvarchar](255) NULL,
 CONSTRAINT [PK_Sliders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 10.08.2023 23:22:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreateBy] [nvarchar](255) NULL,
	[CreateAt] [datetime2](7) NOT NULL,
	[UpdateBy] [nvarchar](255) NULL,
	[UpdateAt] [datetime2](7) NULL,
	[DeletedBy] [nvarchar](255) NULL,
	[DeletedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wishlists]    Script Date: 10.08.2023 23:22:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wishlists](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[UserId] [nvarchar](450) NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreateBy] [nvarchar](255) NULL,
	[CreateAt] [datetime2](7) NOT NULL,
	[UpdateBy] [nvarchar](255) NULL,
	[UpdateAt] [datetime2](7) NULL,
	[DeletedBy] [nvarchar](255) NULL,
	[DeletedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_Wishlists] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230722204716_InitialCreate', N'6.0.20')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230722205155_AddedSettingsTable', N'6.0.20')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230722210508_AddedBrandsTable', N'6.0.20')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230722210640_AddedTagsTables', N'6.0.20')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230722210856_AddedSlidersTables', N'6.0.20')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230722211135_AddedProductsTables', N'6.0.20')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230722211456_UpdatedProductsTableRelatedBrandsTable', N'6.0.20')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230722212106_AddedProductsTable', N'6.0.20')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230722212128_AddedProductTagsTable', N'6.0.20')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230722212335_AddedProductImagesTable', N'6.0.20')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230722212547_UpdatedBrandsTableRelatedProductsTable', N'6.0.20')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230722215440_AddedSlidersTable1', N'6.0.20')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230722222826_AddedProductsTable2', N'6.0.20')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230722224701_AddedProductsTable1', N'6.0.20')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230723215256_AddedCategoryTable', N'6.0.20')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230723220221_AddedAuthorsTable', N'6.0.20')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230723220256_AddedCategoryTable', N'6.0.20')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230723220436_AddedProductsTable4', N'6.0.20')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230723220707_AddedAuthorsTable1', N'6.0.20')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230723222337_AddedCategorysTable', N'6.0.20')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230802083001_AddToProductTable', N'6.0.20')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230803124106_AddedProductsTable12', N'6.0.20')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230803130946_AddedProductsTable13', N'6.0.20')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230803132518_AddedProductsTable15', N'6.0.20')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230803170636_AddedProductsTable16', N'6.0.20')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230803192921_AddUserTable', N'6.0.20')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230806105108_CreateBasketAndWishlistTable', N'6.0.20')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230806111222_UpdateWishlistTable', N'6.0.20')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230808101516_CreateReviewTable', N'6.0.20')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230809225313_AddedBlogsTable', N'6.0.20')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230809225553_AddedBlogsTable1', N'6.0.20')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230809225639_AddedReviewsTable1', N'6.0.20')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230809225659_AddedReviewsTable2', N'6.0.20')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230809225753_AddedBlogCategoriesTable', N'6.0.20')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230809225838_AddedBlogTagsTable', N'6.0.20')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230810102753_AddedBlogsTable3', N'6.0.20')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230810103725_AddedBlogsTable4', N'6.0.20')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230810105959_AddedBlogsTable5', N'6.0.20')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230810110312_AddedBlogsTable6', N'6.0.20')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230810130957_AddedBlogsTable', N'6.0.20')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'6e4489ff-0f1e-4e52-8065-3f1ee3668650', N'Member', N'MEMBER', N'7fb8e353-0aa2-4da6-b229-1516e0be0d22')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'75d0f9b2-7947-4608-b2fe-12b85cc91a4d', N'SuperAdmin', N'SUPERADMIN', N'a87bc540-4acf-4500-8065-e2a8e10a2862')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'8b114acb-ac85-480e-9e0d-4eb9f9dfb80f', N'Admin', N'ADMIN', N'9fba29a2-9899-4cbe-8a92-d019539c45ea')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'017cbb68-1469-4a6f-9499-e2aacde99720', N'6e4489ff-0f1e-4e52-8065-3f1ee3668650')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'729e652c-f3a6-404c-bb60-9c3762a12a40', N'6e4489ff-0f1e-4e52-8065-3f1ee3668650')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'8856b74e-4908-4bce-90f7-e654bdbd24ba', N'6e4489ff-0f1e-4e52-8065-3f1ee3668650')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'8d8e0bf4-6dcf-46bc-b612-273928d0c215', N'6e4489ff-0f1e-4e52-8065-3f1ee3668650')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'd09d0b01-fffd-44c8-9010-c4b4b2c77edf', N'6e4489ff-0f1e-4e52-8065-3f1ee3668650')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ee196f08-4989-4683-b926-4bc31655d8c1', N'6e4489ff-0f1e-4e52-8065-3f1ee3668650')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'6d945b55-8da0-406f-974f-78e488bb0ea7', N'75d0f9b2-7947-4608-b2fe-12b85cc91a4d')
GO
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'017cbb68-1469-4a6f-9499-e2aacde99720', N'Shams', N'Shirali', N'Shams123', N'SHAMS123', N'viyed19284@weizixu.com', N'VIYED19284@WEIZIXU.COM', 1, N'AQAAAAEAACcQAAAAENdciak9apnZ0SBHINg479LsfjSikJ61qfcNpwMDdJ6Ityr8zkhezkzDQnsYlUWgCQ==', N'XBCAOUZOETT72XQL6MRQRQPEIPB6F6OK', N'4a13a156-6fe7-4a0b-aa23-ce5198681fd3', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'6d945b55-8da0-406f-974f-78e488bb0ea7', N'Shams', N'Shirali', N'ShamsAdmin', N'SHAMSADMIN', N'mevohi6215@vreaa.com', N'MEVOHI6215@VREAA.COM', 1, N'AQAAAAEAACcQAAAAEIVwE5CQBT62Loju9rLPR3vwV3+r4U2QCJPWVIb9m1dSlYngVWwbFukhH/2RkiIJwA==', N'25SQECGKJEVX2AADULDVT7SEANWD2UFU', N'd761a162-eece-4841-bb22-4a7aa0ac8273', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'729e652c-f3a6-404c-bb60-9c3762a12a40', N'Mubariz', N'Agayev', N'Agyvmubo1', N'AGYVMUBO1', N'hocero5876@v1zw.com', N'HOCERO5876@V1ZW.COM', 1, N'AQAAAAEAACcQAAAAELR8I4Pc/VS5BF2Y5cvr0Ik60/W375pOMah0bDQBOMg/ECrRCkmuA5MGqvIJ+VvTNQ==', N'NFDBVN3PHEN6FOLNHSRRV5S3SAVUN7ZZ', N'da32692a-87e9-4ef5-b6bf-3f39469e4b1a', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'8856b74e-4908-4bce-90f7-e654bdbd24ba', N'Shams', N'Shirali', N'sh.msali3', N'SH.MSALI3', N'hofoxi7792@v1zw.com', N'HOFOXI7792@V1ZW.COM', 1, N'AQAAAAEAACcQAAAAEJaZ33wXUG4soiH5HSh+/LE0I6hLXky0kdOkIteq4NBMnQIqYObQjKn8BfRh9DDOpA==', N'BBPJRVXYB46Z23GWPZXDY5XSQQ4FJKCV', N'07adf839-fe3f-4688-8e7b-b0f31e0a9c52', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'8d8e0bf4-6dcf-46bc-b612-273928d0c215', N'Mubariz', N'Agayev', N'Agyvmubo2', N'AGYVMUBO2', N'narak98899@vreaa.com', N'NARAK98899@VREAA.COM', 0, N'AQAAAAEAACcQAAAAEJhOrnR61SwbKVxIPvOXQxW6unDZQmZcQP2PfKNT8WP0OYmgCe/sGB6HtsVo49KAOA==', N'VYGDNTXVEONC3YPJUE7NXWIRC6Q45XE7', N'7eedbab0-b70e-4940-92c8-309b2ecc7e14', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'd09d0b01-fffd-44c8-9010-c4b4b2c77edf', N'Mubariz', N'Agayev', N'agyvmubo', N'AGYVMUBO', N'nafinov115@viperace.com', N'NAFINOV115@VIPERACE.COM', 0, N'AQAAAAEAACcQAAAAEFTufV+aMX5cfgzX3MAAECzujqFD+M85a2QjqAeadH/M9fqf2C8sgFxsEin1VYze7A==', N'CNH7QFYA7ETN6HADMYOMF5VYMPXB3R5Y', N'6dcc6121-5949-4898-a1a8-249d8aa6f412', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'ee196f08-4989-4683-b926-4bc31655d8c1', N'Mubariz', N'Agayev', N'Agyvmubo4', N'AGYVMUBO4', N'nirer11335@weishu8.com', N'NIRER11335@WEISHU8.COM', 1, N'AQAAAAEAACcQAAAAEOMKBpN/FhgwfpLqH09xYb4k04DCsLU18DqPW+Qn+M+x486KUJBr9OyjdBb2Can9WQ==', N'IFASYA4XXQEWCN5L4W2YEM5AEDRJ5LTH', N'78a02368-bb60-4a59-ad92-7df773fb2223', NULL, 0, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Authors] ON 

INSERT [dbo].[Authors] ([Id], [Name], [Text], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt], [Job]) VALUES (1, N'EDISON', N'“Variety of good wines across a number of countries. Fast delivery of products in
                        stock as well as en premiere. Free delivery over £75 well"', 0, N'System', CAST(N'2023-07-23T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, N'Designer')
INSERT [dbo].[Authors] ([Id], [Name], [Text], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt], [Job]) VALUES (2, N'ANN SMITH', N'“Great advice, friendly service, fun team and top wines!! Always a great choice
                        of good quality wines from a wide price range from a wide.”', 0, N'System', CAST(N'2023-07-23T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, N'CEO & Founder')
INSERT [dbo].[Authors] ([Id], [Name], [Text], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt], [Job]) VALUES (3, N'JOHN DOE', N'“It’s so good! And I had really been missing wine. Now it’s my go to gift for all
                        my friends and sometimes I drink it still just because I love the taste.”', 0, N'System', CAST(N'2023-07-23T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, N'Photographer')
SET IDENTITY_INSERT [dbo].[Authors] OFF
GO
SET IDENTITY_INSERT [dbo].[Baskets] ON 

INSERT [dbo].[Baskets] ([Id], [Count], [ProductId], [UserId], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt]) VALUES (1, 10, 143, N'017cbb68-1469-4a6f-9499-e2aacde99720', 0, N'System', CAST(N'2023-08-09T15:05:59.5198507' AS DateTime2), NULL, NULL, NULL, NULL)
INSERT [dbo].[Baskets] ([Id], [Count], [ProductId], [UserId], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt]) VALUES (4, 5, 145, N'017cbb68-1469-4a6f-9499-e2aacde99720', 0, N'System', CAST(N'2023-08-10T01:39:02.4879538' AS DateTime2), NULL, NULL, NULL, NULL)
INSERT [dbo].[Baskets] ([Id], [Count], [ProductId], [UserId], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt]) VALUES (5, 1, 136, N'017cbb68-1469-4a6f-9499-e2aacde99720', 0, N'System', CAST(N'2023-08-10T01:39:05.9703171' AS DateTime2), NULL, NULL, NULL, NULL)
INSERT [dbo].[Baskets] ([Id], [Count], [ProductId], [UserId], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt]) VALUES (6, 7, 132, N'017cbb68-1469-4a6f-9499-e2aacde99720', 0, N'System', CAST(N'2023-08-10T01:39:07.4594639' AS DateTime2), NULL, NULL, NULL, NULL)
INSERT [dbo].[Baskets] ([Id], [Count], [ProductId], [UserId], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt]) VALUES (7, 3, 143, N'6d945b55-8da0-406f-974f-78e488bb0ea7', 0, N'System', CAST(N'2023-08-10T22:11:09.8531989' AS DateTime2), NULL, NULL, NULL, NULL)
INSERT [dbo].[Baskets] ([Id], [Count], [ProductId], [UserId], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt]) VALUES (8, 2, 145, N'6d945b55-8da0-406f-974f-78e488bb0ea7', 0, N'System', CAST(N'2023-08-10T22:11:22.0108191' AS DateTime2), NULL, NULL, NULL, NULL)
INSERT [dbo].[Baskets] ([Id], [Count], [ProductId], [UserId], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt]) VALUES (9, 2, 132, N'6d945b55-8da0-406f-974f-78e488bb0ea7', 0, N'System', CAST(N'2023-08-10T22:15:06.1742323' AS DateTime2), NULL, NULL, NULL, NULL)
INSERT [dbo].[Baskets] ([Id], [Count], [ProductId], [UserId], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt]) VALUES (10, 2, 136, N'6d945b55-8da0-406f-974f-78e488bb0ea7', 0, N'System', CAST(N'2023-08-10T22:15:08.7727587' AS DateTime2), NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Baskets] OFF
GO
SET IDENTITY_INSERT [dbo].[BlogCategies] ON 

INSERT [dbo].[BlogCategies] ([Id], [Name], [IsMain], [ParentId], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt]) VALUES (1, N'News', 1, 1, 1, N'System', CAST(N'2023-08-10T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL)
INSERT [dbo].[BlogCategies] ([Id], [Name], [IsMain], [ParentId], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt]) VALUES (2, N'VineYard', 1, 1, 1, N'System', CAST(N'2023-08-10T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL)
INSERT [dbo].[BlogCategies] ([Id], [Name], [IsMain], [ParentId], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt]) VALUES (3, N'Wine For Women', 1, 1, 1, N'System', CAST(N'2023-08-10T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL)
INSERT [dbo].[BlogCategies] ([Id], [Name], [IsMain], [ParentId], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt]) VALUES (4, N'Wine Regions', 1, 1, 1, N'System', CAST(N'2023-08-10T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL)
INSERT [dbo].[BlogCategies] ([Id], [Name], [IsMain], [ParentId], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt]) VALUES (5, N'Wine Travel', 1, 1, 1, N'System', CAST(N'2023-08-10T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL)
INSERT [dbo].[BlogCategies] ([Id], [Name], [IsMain], [ParentId], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt]) VALUES (6, N'Wineries', 1, 1, 1, N'System', CAST(N'2023-08-10T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[BlogCategies] OFF
GO
SET IDENTITY_INSERT [dbo].[Brands] ON 

INSERT [dbo].[Brands] ([Id], [Name], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt]) VALUES (1, N'Girl Store', 0, N'System', CAST(N'2023-07-23T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL)
INSERT [dbo].[Brands] ([Id], [Name], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt]) VALUES (2, N'
Mens Store', 0, N'System', CAST(N'2023-07-23T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL)
INSERT [dbo].[Brands] ([Id], [Name], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt]) VALUES (3, N'Sakura Store', 0, N'System', CAST(N'2023-07-23T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL)
INSERT [dbo].[Brands] ([Id], [Name], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt]) VALUES (4, N'Wine Store', 0, N'System', CAST(N'2023-07-23T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL)
INSERT [dbo].[Brands] ([Id], [Name], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt]) VALUES (5, N'Wpbingo', 0, N'System', CAST(N'2023-07-23T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Brands] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [IsMain], [ParentId], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt], [BlogCategoryId]) VALUES (1, N'Family wine', 1, NULL, 0, N'System', CAST(N'2023-07-23T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Categories] ([Id], [Name], [IsMain], [ParentId], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt], [BlogCategoryId]) VALUES (2, N'Luxury wine', 1, NULL, 0, N'System', CAST(N'2023-07-23T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Categories] ([Id], [Name], [IsMain], [ParentId], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt], [BlogCategoryId]) VALUES (3, N'Party wine', 1, NULL, 0, N'System', CAST(N'2023-07-23T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Categories] ([Id], [Name], [IsMain], [ParentId], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt], [BlogCategoryId]) VALUES (4, N'Red wine', 1, NULL, 0, N'System', CAST(N'2023-07-23T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Categories] ([Id], [Name], [IsMain], [ParentId], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt], [BlogCategoryId]) VALUES (5, N'Rose wine', 1, NULL, 0, N'System', CAST(N'2023-07-23T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductImages] ON 

INSERT [dbo].[ProductImages] ([Id], [Image], [ProductId], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt]) VALUES (1, N'DEC22-6107.jpg', 152, 0, N'System', CAST(N'2023-08-03T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL)
INSERT [dbo].[ProductImages] ([Id], [Image], [ProductId], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt]) VALUES (2, N'Image-16_360x.webp', 152, 0, N'System', CAST(N'2023-08-03T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL)
INSERT [dbo].[ProductImages] ([Id], [Image], [ProductId], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt]) VALUES (3, N'5_malt_stouted_mash_woodford_reserve.jpg', 152, 0, N'System', CAST(N'2023-08-03T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL)
INSERT [dbo].[ProductImages] ([Id], [Image], [ProductId], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt]) VALUES (4, N'Woodford-Reserve-Old-Fashioned-Recipe.jpg', 152, 0, N'System', CAST(N'2023-08-03T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL)
INSERT [dbo].[ProductImages] ([Id], [Image], [ProductId], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt]) VALUES (5, N'il-cellese-albino-bianco-da-sangiovese-2016.jpg', 132, 0, N'System', CAST(N'2023-08-03T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL)
INSERT [dbo].[ProductImages] ([Id], [Image], [ProductId], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt]) VALUES (6, N'Image-21_360x.webp', 132, 0, N'System', CAST(N'2023-08-03T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL)
INSERT [dbo].[ProductImages] ([Id], [Image], [ProductId], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt]) VALUES (7, N'albino_full.jpeg', 132, 0, N'System', CAST(N'2023-08-03T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL)
INSERT [dbo].[ProductImages] ([Id], [Image], [ProductId], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt]) VALUES (8, N'dWUw1CQ5SHCp7Cxj3Rtwtw.jpg', 132, 0, N'System', CAST(N'2023-08-03T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL)
INSERT [dbo].[ProductImages] ([Id], [Image], [ProductId], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt]) VALUES (9, N'Miljöbild-Eiktyrne-Quadruple-Batch-II-2.png', 136, 0, N'System', CAST(N'2023-08-03T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL)
INSERT [dbo].[ProductImages] ([Id], [Image], [ProductId], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt]) VALUES (10, N'Image-11_360x.webp', 136, 0, N'System', CAST(N'2023-08-03T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL)
INSERT [dbo].[ProductImages] ([Id], [Image], [ProductId], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt]) VALUES (11, N'6099395148b21231293010.jpg', 136, 0, N'System', CAST(N'2023-08-03T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL)
INSERT [dbo].[ProductImages] ([Id], [Image], [ProductId], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt]) VALUES (12, N'images.jpg', 136, 0, N'System', CAST(N'2023-08-03T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL)
INSERT [dbo].[ProductImages] ([Id], [Image], [ProductId], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt]) VALUES (13, N'1656512800-1-1-moxxe-masi-pinotgrigio-verduzzo-brut-jpeg.avif', 143, 0, N'System', CAST(N'2023-08-03T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL)
INSERT [dbo].[ProductImages] ([Id], [Image], [ProductId], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt]) VALUES (14, N'Image-6_360x.webp', 143, 0, N'System', CAST(N'2023-08-03T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL)
INSERT [dbo].[ProductImages] ([Id], [Image], [ProductId], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt]) VALUES (15, N'0010_Moxxe-MASI-3.webp', 143, 0, N'System', CAST(N'2023-08-03T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL)
INSERT [dbo].[ProductImages] ([Id], [Image], [ProductId], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt]) VALUES (16, N'images (1).jpg', 143, 0, N'System', CAST(N'2023-08-03T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL)
INSERT [dbo].[ProductImages] ([Id], [Image], [ProductId], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt]) VALUES (17, N'images (2).jpg', 145, 0, N'System', CAST(N'2023-08-03T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL)
INSERT [dbo].[ProductImages] ([Id], [Image], [ProductId], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt]) VALUES (18, N'Image-7_360x.webp', 145, 0, N'System', CAST(N'2023-08-03T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL)
INSERT [dbo].[ProductImages] ([Id], [Image], [ProductId], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt]) VALUES (19, N'AGRITURISMO-IL-CELLESE-1-705x500.jpg', 145, 0, N'System', CAST(N'2023-08-03T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL)
INSERT [dbo].[ProductImages] ([Id], [Image], [ProductId], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt]) VALUES (20, N'caption.jpg', 145, 0, N'System', CAST(N'2023-08-03T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL)
INSERT [dbo].[ProductImages] ([Id], [Image], [ProductId], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt]) VALUES (21, N'vino-buteljke-lepa-vida_c_prw.jpg', 146, 0, N'System', CAST(N'2023-08-03T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL)
INSERT [dbo].[ProductImages] ([Id], [Image], [ProductId], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt]) VALUES (22, N'Image-12_360x.webp', 146, 0, N'System', CAST(N'2023-08-03T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL)
INSERT [dbo].[ProductImages] ([Id], [Image], [ProductId], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt]) VALUES (23, N'oOoOutofOffice2018LepaVida_1024x1024@2x.webp', 146, 0, N'System', CAST(N'2023-08-03T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL)
INSERT [dbo].[ProductImages] ([Id], [Image], [ProductId], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt]) VALUES (24, N'Lepa-Vida-Winery.jpg', 146, 0, N'System', CAST(N'2023-08-03T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL)
INSERT [dbo].[ProductImages] ([Id], [Image], [ProductId], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt]) VALUES (25, N'PXL_20220822_165903324.PORTRAIT_2.webp', 149, 0, N'System', CAST(N'2023-08-03T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL)
INSERT [dbo].[ProductImages] ([Id], [Image], [ProductId], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt]) VALUES (26, N'Image-1_360x.webp', 149, 0, N'System', CAST(N'2023-08-03T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL)
INSERT [dbo].[ProductImages] ([Id], [Image], [ProductId], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt]) VALUES (27, N'94bdede214903be731b3395562582943.jpg', 149, 0, N'System', CAST(N'2023-08-03T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL)
INSERT [dbo].[ProductImages] ([Id], [Image], [ProductId], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt]) VALUES (28, N'Chateau-des-Ferrages-Mon-Plaisir-Sainte-Victoire-Rose-2020-AC-Cotes-de-Provence-France_06229.JPG', 149, 0, N'System', CAST(N'2023-08-03T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ProductImages] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Title], [Description], [Price], [DiscountedPrice], [Count], [HoverImage], [MainImage], [BrandId], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt], [Info], [Sold], [View], [CategoryId], [Raiting], [InStock], [BlogCategoryId]) VALUES (132, N'WHITE WINE', N'Get a fresh ''fit for spring with the Free People Love Letter Ivory Floral Jacquard Cropped Cami Top! Stretchy jacquard fabric, with a textured floral design throughout, shapes this cami top that has wide straps, a high square neckline, and a fitted bodice that ends at a cropped hem with lettuce-edge trim.', 120.0000, 150.0000, 10, N'Image-21_360x.webp', N'Image-21_360x.webp', 1, 0, N'System', CAST(N'2023-08-03T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, N'Curabitur egestas malesuada volutpat. Nunc vel vestibulum odio, ac pellentesque lacus. Pellentesque dapibus nunc nec est imperdiet, a malesuada sem rutrum', 10, 40, 1, 5, 1, NULL)
INSERT [dbo].[Products] ([Id], [Title], [Description], [Price], [DiscountedPrice], [Count], [HoverImage], [MainImage], [BrandId], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt], [Info], [Sold], [View], [CategoryId], [Raiting], [InStock], [BlogCategoryId]) VALUES (136, N'PROSECCO SPUMANTE', N'Get a fresh ''fit for spring with the Free People Love Letter Ivory Floral Jacquard Cropped Cami Top! Stretchy jacquard fabric, with a textured floral design throughout, shapes this cami top that has wide straps, a high square neckline, and a fitted bodice that ends at a cropped hem with lettuce-edge trim.', 200.0000, NULL, 5, N'Image-11_360x.webp', N'Image-11_360x.webp', 2, 0, N'System', CAST(N'2023-08-04T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, N'Curabitur egestas malesuada volutpat. Nunc vel vestibulum odio, ac pellentesque lacus. Pellentesque dapibus nunc nec est imperdiet, a malesuada sem rutrum

', 15, 20, 3, 0, 1, NULL)
INSERT [dbo].[Products] ([Id], [Title], [Description], [Price], [DiscountedPrice], [Count], [HoverImage], [MainImage], [BrandId], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt], [Info], [Sold], [View], [CategoryId], [Raiting], [InStock], [BlogCategoryId]) VALUES (143, N'CHARDONNAY', N'Get a fresh ''fit for spring with the Free People Love Letter Ivory Floral Jacquard Cropped Cami Top! Stretchy jacquard fabric, with a textured floral design throughout, shapes this cami top that has wide straps, a high square neckline, and a fitted bodice that ends at a cropped hem with lettuce-edge trim.', 150.0000, 250.0000, 10, N'Image-6_360x.webp', N'Image-6_360x.webp', 3, 0, N'System', CAST(N'2023-08-02T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, N'Curabitur egestas malesuada volutpat. Nunc vel vestibulum odio, ac pellentesque lacus. Pellentesque dapibus nunc nec est imperdiet, a malesuada sem rutrum

', 25, 50, 2, 0, 1, NULL)
INSERT [dbo].[Products] ([Id], [Title], [Description], [Price], [DiscountedPrice], [Count], [HoverImage], [MainImage], [BrandId], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt], [Info], [Sold], [View], [CategoryId], [Raiting], [InStock], [BlogCategoryId]) VALUES (145, N'SUSPENDISSE URNA', N'Get a fresh ''fit for spring with the Free People Love Letter Ivory Floral Jacquard Cropped Cami Top! Stretchy jacquard fabric, with a textured floral design throughout, shapes this cami top that has wide straps, a high square neckline, and a fitted bodice that ends at a cropped hem with lettuce-edge trim.', 230.0000, NULL, 3, N'Image-7_360x.webp', N'Image-7_360x.webp', 4, 0, N'System', CAST(N'2023-07-03T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, N'Curabitur egestas malesuada volutpat. Nunc vel vestibulum odio, ac pellentesque lacus. Pellentesque dapibus nunc nec est imperdiet, a malesuada sem rutrum

', 3, 10, 4, 0, 1, NULL)
INSERT [dbo].[Products] ([Id], [Title], [Description], [Price], [DiscountedPrice], [Count], [HoverImage], [MainImage], [BrandId], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt], [Info], [Sold], [View], [CategoryId], [Raiting], [InStock], [BlogCategoryId]) VALUES (146, N'CHARDONNAY', N'Get a fresh ''fit for spring with the Free People Love Letter Ivory Floral Jacquard Cropped Cami Top! Stretchy jacquard fabric, with a textured floral design throughout, shapes this cami top that has wide straps, a high square neckline, and a fitted bodice that ends at a cropped hem with lettuce-edge trim.', 150.0000, 250.0000, 10, N'Image-12_360x.webp', N'Image-12_360x.webp', 5, 0, N'System', CAST(N'2023-07-28T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, N'Curabitur egestas malesuada volutpat. Nunc vel vestibulum odio, ac pellentesque lacus. Pellentesque dapibus nunc nec est imperdiet, a malesuada sem rutrum

', 12, 30, 5, 0, 1, NULL)
INSERT [dbo].[Products] ([Id], [Title], [Description], [Price], [DiscountedPrice], [Count], [HoverImage], [MainImage], [BrandId], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt], [Info], [Sold], [View], [CategoryId], [Raiting], [InStock], [BlogCategoryId]) VALUES (149, N'CABERNET SAUVIGNON', N'Get a fresh ''fit for spring with the Free People Love Letter Ivory Floral Jacquard Cropped Cami Top! Stretchy jacquard fabric, with a textured floral design throughout, shapes this cami top that has wide straps, a high square neckline, and a fitted bodice that ends at a cropped hem with lettuce-edge trim.', 250.0000, 300.0000, 5, N'Image-1_360x.webp', N'Image-1_360x.webp', 3, 0, N'System', CAST(N'2023-07-30T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, N'Curabitur egestas malesuada volutpat. Nunc vel vestibulum odio, ac pellentesque lacus. Pellentesque dapibus nunc nec est imperdiet, a malesuada sem rutrum

', 13, 20, 1, 0, 1, NULL)
INSERT [dbo].[Products] ([Id], [Title], [Description], [Price], [DiscountedPrice], [Count], [HoverImage], [MainImage], [BrandId], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt], [Info], [Sold], [View], [CategoryId], [Raiting], [InStock], [BlogCategoryId]) VALUES (152, N'FAMILY SELECTION', N'Get a fresh ''fit for spring with the Free People Love Letter Ivory Floral Jacquard Cropped Cami Top! Stretchy jacquard fabric, with a textured floral design throughout, shapes this cami top that has wide straps, a high square neckline, and a fitted bodice that ends at a cropped hem with lettuce-edge trim.', 250.0000, 280.0000, 11, N'Image-16_360x.webp', N'Image-16_360x.webp', 2, 0, N'System', CAST(N'2023-08-03T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, N'Curabitur egestas malesuada volutpat. Nunc vel vestibulum odio, ac pellentesque lacus. Pellentesque dapibus nunc nec est imperdiet, a malesuada sem rutrum

', 7, 20, 2, 0, 1, NULL)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Reviews] ON 

INSERT [dbo].[Reviews] ([Id], [ProductId], [UserId], [Raiting], [Tittle], [Describtion], [Username], [Email], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt]) VALUES (1, 132, N'017cbb68-1469-4a6f-9499-e2aacde99720', 5, N'Icki', N'Eladir dadi,bir sozle mohtesemdir', N'Shams123', N'viyed19284@weizixu.com', 0, N'System', CAST(N'2023-08-10T02:05:18.3234128' AS DateTime2), NULL, NULL, NULL, NULL)
INSERT [dbo].[Reviews] ([Id], [ProductId], [UserId], [Raiting], [Tittle], [Describtion], [Username], [Email], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt]) VALUES (2, 132, N'017cbb68-1469-4a6f-9499-e2aacde99720', 5, N'Tovsiyye', N'Calisin cox icin', N'Shams123', N'viyed19284@weizixu.com', 0, N'System', CAST(N'2023-08-10T02:08:07.5520795' AS DateTime2), NULL, NULL, NULL, NULL)
INSERT [dbo].[Reviews] ([Id], [ProductId], [UserId], [Raiting], [Tittle], [Describtion], [Username], [Email], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt]) VALUES (3, 136, N'6d945b55-8da0-406f-974f-78e488bb0ea7', 0, N'Icki', N'Loveee', N'ShamsAdmin', N'mevohi6215@vreaa.com', 0, N'System', CAST(N'2023-08-10T22:10:47.8014667' AS DateTime2), NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Reviews] OFF
GO
SET IDENTITY_INSERT [dbo].[Settings] ON 

INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (1, N'Slogan', N'FREE SHIPPING ON 3+ BOTTLES')
INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (3, N'Logo', N'logo-black.png')
INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (4, N'Address', N'VIA SAN MICHELETTO, 337022 FUMANE VERONA, ITALY')
INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (5, N'Phone', N'+19 045 3234498 +419 323 48868')
INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (6, N'Email', N'RUM.MEN@EXAMPLE.COM')
INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (7, N'WorkDate', N'MONDAY – SATURDAY: 8:00 AM – 4:00PM')
INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (8, N'Close', N'SUNDAY')
INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (9, N'AboutStarted', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur sit amet elit leo. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vulputate nibh et nulla hendrerit, ut condimentum odio porttitor. Nulla consectetur nibh massa, eget scelerisque nisl volutpat et. Integer pharetra efficitur tempor. Quisque finibus suscipit nisi, quis scelerisque nunc efficitur vitae. Duis interdum aliquam mauris, ut fermentum enim suscipit.')
INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (10, N'AboutPassion', N'Suspendisse commodo ex eget lorem iaculis, vel ultrices neque sodales. Sed bibendum egestas felis, commodo mattis ligula. Mauris aliquam lacus id hendrerit venenatis. Quisque dignissim mi ut dictum gravida.')
INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (11, N'AboutCraft', N'Duis sit amet ex sit amet tortor posuere posuere. Mauris sodales rutrum tincidunt. Donec non massa ullamcorper, volutpat ex ac, volutpat libero. Morbi vel metus fermentum augue lacinia maximus sit amet ut dolor.')
INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (12, N'AboutImage', N'homepage-about-us.jpg')
INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (13, N'AboutAddress', N'VIA SAN MICHELETTO, 337022 FUMANE VERONA, ITALY')
INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (14, N'AboutPhone', N'+19 045 3234498')
SET IDENTITY_INSERT [dbo].[Settings] OFF
GO
SET IDENTITY_INSERT [dbo].[Sliders] ON 

INSERT [dbo].[Sliders] ([Id], [Title], [TitleTwo], [Image], [Link], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt], [SubTitle]) VALUES (3, N'ENHANCE YOUR EXPERIENCE', N'WITH EASE', N'slider-1.webp', N'amazon.com', 0, N'System', CAST(N'2023-07-23T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, N'AS A MEMBER OF THE EXPERIENCE')
INSERT [dbo].[Sliders] ([Id], [Title], [TitleTwo], [Image], [Link], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt], [SubTitle]) VALUES (4, N'CHOOSE THE PERFECT', N'GLASS FOR YOU', N'slider-2.webp', N'amazon.com', 0, N'System', CAST(N'2023-07-23T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, N'UNIQUE WINE FLAVORS')
INSERT [dbo].[Sliders] ([Id], [Title], [TitleTwo], [Image], [Link], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt], [SubTitle]) VALUES (5, N'PERFECT FAMILY', N'PARTY', N'slider-3.webp', N'amazon.com', 0, N'System', CAST(N'2023-07-23T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, N'OFFER WHITE WINE')
SET IDENTITY_INSERT [dbo].[Sliders] OFF
GO
SET IDENTITY_INSERT [dbo].[Tags] ON 

INSERT [dbo].[Tags] ([Id], [Name], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt]) VALUES (1, N'Hot', 1, N'System', CAST(N'2023-08-10T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL)
INSERT [dbo].[Tags] ([Id], [Name], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt]) VALUES (2, N'New', 1, N'System', CAST(N'2023-08-10T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Tags] OFF
GO
SET IDENTITY_INSERT [dbo].[Wishlists] ON 

INSERT [dbo].[Wishlists] ([Id], [ProductId], [UserId], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt]) VALUES (3, 143, N'017cbb68-1469-4a6f-9499-e2aacde99720', 0, N'System', CAST(N'2023-08-09T15:06:18.2902887' AS DateTime2), NULL, NULL, NULL, NULL)
INSERT [dbo].[Wishlists] ([Id], [ProductId], [UserId], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt]) VALUES (7, 149, N'017cbb68-1469-4a6f-9499-e2aacde99720', 0, N'System', CAST(N'2023-08-09T17:01:59.5587792' AS DateTime2), NULL, NULL, NULL, NULL)
INSERT [dbo].[Wishlists] ([Id], [ProductId], [UserId], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt]) VALUES (9, 146, N'017cbb68-1469-4a6f-9499-e2aacde99720', 0, N'System', CAST(N'2023-08-09T17:02:04.6470746' AS DateTime2), NULL, NULL, NULL, NULL)
INSERT [dbo].[Wishlists] ([Id], [ProductId], [UserId], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt]) VALUES (10, 145, N'017cbb68-1469-4a6f-9499-e2aacde99720', 0, N'System', CAST(N'2023-08-09T17:02:10.2755665' AS DateTime2), NULL, NULL, NULL, NULL)
INSERT [dbo].[Wishlists] ([Id], [ProductId], [UserId], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt]) VALUES (37, 145, N'6d945b55-8da0-406f-974f-78e488bb0ea7', 0, N'System', CAST(N'2023-08-10T21:39:49.9233060' AS DateTime2), NULL, NULL, NULL, NULL)
INSERT [dbo].[Wishlists] ([Id], [ProductId], [UserId], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt]) VALUES (39, 143, N'6d945b55-8da0-406f-974f-78e488bb0ea7', 0, N'System', CAST(N'2023-08-10T21:41:09.6802184' AS DateTime2), NULL, NULL, NULL, NULL)
INSERT [dbo].[Wishlists] ([Id], [ProductId], [UserId], [IsDeleted], [CreateBy], [CreateAt], [UpdateBy], [UpdateAt], [DeletedBy], [DeletedAt]) VALUES (40, 136, N'6d945b55-8da0-406f-974f-78e488bb0ea7', 0, N'System', CAST(N'2023-08-10T22:15:11.0510662' AS DateTime2), NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Wishlists] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 10.08.2023 23:22:30 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 10.08.2023 23:22:30 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 10.08.2023 23:22:30 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 10.08.2023 23:22:30 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 10.08.2023 23:22:30 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 10.08.2023 23:22:30 ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 10.08.2023 23:22:30 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Baskets_ProductId]    Script Date: 10.08.2023 23:22:30 ******/
CREATE NONCLUSTERED INDEX [IX_Baskets_ProductId] ON [dbo].[Baskets]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Baskets_UserId]    Script Date: 10.08.2023 23:22:30 ******/
CREATE NONCLUSTERED INDEX [IX_Baskets_UserId] ON [dbo].[Baskets]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BlogCategies_ParentId]    Script Date: 10.08.2023 23:22:30 ******/
CREATE NONCLUSTERED INDEX [IX_BlogCategies_ParentId] ON [dbo].[BlogCategies]
(
	[ParentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Categories_BlogCategoryId]    Script Date: 10.08.2023 23:22:30 ******/
CREATE NONCLUSTERED INDEX [IX_Categories_BlogCategoryId] ON [dbo].[Categories]
(
	[BlogCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Categories_ParentId]    Script Date: 10.08.2023 23:22:30 ******/
CREATE NONCLUSTERED INDEX [IX_Categories_ParentId] ON [dbo].[Categories]
(
	[ParentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductImages_ProductId]    Script Date: 10.08.2023 23:22:30 ******/
CREATE NONCLUSTERED INDEX [IX_ProductImages_ProductId] ON [dbo].[ProductImages]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_BlogCategoryId]    Script Date: 10.08.2023 23:22:30 ******/
CREATE NONCLUSTERED INDEX [IX_Products_BlogCategoryId] ON [dbo].[Products]
(
	[BlogCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_BrandId]    Script Date: 10.08.2023 23:22:30 ******/
CREATE NONCLUSTERED INDEX [IX_Products_BrandId] ON [dbo].[Products]
(
	[BrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_CategoryId]    Script Date: 10.08.2023 23:22:30 ******/
CREATE NONCLUSTERED INDEX [IX_Products_CategoryId] ON [dbo].[Products]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductTags_ProductId]    Script Date: 10.08.2023 23:22:30 ******/
CREATE NONCLUSTERED INDEX [IX_ProductTags_ProductId] ON [dbo].[ProductTags]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductTags_TagId]    Script Date: 10.08.2023 23:22:30 ******/
CREATE NONCLUSTERED INDEX [IX_ProductTags_TagId] ON [dbo].[ProductTags]
(
	[TagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Reviews_ProductId]    Script Date: 10.08.2023 23:22:30 ******/
CREATE NONCLUSTERED INDEX [IX_Reviews_ProductId] ON [dbo].[Reviews]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Reviews_UserId]    Script Date: 10.08.2023 23:22:30 ******/
CREATE NONCLUSTERED INDEX [IX_Reviews_UserId] ON [dbo].[Reviews]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Wishlists_ProductId]    Script Date: 10.08.2023 23:22:30 ******/
CREATE NONCLUSTERED INDEX [IX_Wishlists_ProductId] ON [dbo].[Wishlists]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Wishlists_UserId]    Script Date: 10.08.2023 23:22:30 ******/
CREATE NONCLUSTERED INDEX [IX_Wishlists_UserId] ON [dbo].[Wishlists]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [Sold]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [View]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [Raiting]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (CONVERT([bit],(0))) FOR [InStock]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Baskets]  WITH CHECK ADD  CONSTRAINT [FK_Baskets_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Baskets] CHECK CONSTRAINT [FK_Baskets_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Baskets]  WITH CHECK ADD  CONSTRAINT [FK_Baskets_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Baskets] CHECK CONSTRAINT [FK_Baskets_Products_ProductId]
GO
ALTER TABLE [dbo].[BlogCategies]  WITH CHECK ADD  CONSTRAINT [FK_BlogCategies_Categories_ParentId] FOREIGN KEY([ParentId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[BlogCategies] CHECK CONSTRAINT [FK_BlogCategies_Categories_ParentId]
GO
ALTER TABLE [dbo].[Categories]  WITH CHECK ADD  CONSTRAINT [FK_Categories_BlogCategies_BlogCategoryId] FOREIGN KEY([BlogCategoryId])
REFERENCES [dbo].[BlogCategies] ([Id])
GO
ALTER TABLE [dbo].[Categories] CHECK CONSTRAINT [FK_Categories_BlogCategies_BlogCategoryId]
GO
ALTER TABLE [dbo].[Categories]  WITH CHECK ADD  CONSTRAINT [FK_Categories_Categories_ParentId] FOREIGN KEY([ParentId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Categories] CHECK CONSTRAINT [FK_Categories_Categories_ParentId]
GO
ALTER TABLE [dbo].[ProductImages]  WITH CHECK ADD  CONSTRAINT [FK_ProductImages_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[ProductImages] CHECK CONSTRAINT [FK_ProductImages_Products_ProductId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_BlogCategies_BlogCategoryId] FOREIGN KEY([BlogCategoryId])
REFERENCES [dbo].[BlogCategies] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_BlogCategies_BlogCategoryId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Brands_BrandId] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brands] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Brands_BrandId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories_CategoryId]
GO
ALTER TABLE [dbo].[ProductTags]  WITH CHECK ADD  CONSTRAINT [FK_ProductTags_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[ProductTags] CHECK CONSTRAINT [FK_ProductTags_Products_ProductId]
GO
ALTER TABLE [dbo].[ProductTags]  WITH CHECK ADD  CONSTRAINT [FK_ProductTags_Tags_TagId] FOREIGN KEY([TagId])
REFERENCES [dbo].[Tags] ([Id])
GO
ALTER TABLE [dbo].[ProductTags] CHECK CONSTRAINT [FK_ProductTags_Tags_TagId]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Products_ProductId]
GO
ALTER TABLE [dbo].[Wishlists]  WITH CHECK ADD  CONSTRAINT [FK_Wishlists_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Wishlists] CHECK CONSTRAINT [FK_Wishlists_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Wishlists]  WITH CHECK ADD  CONSTRAINT [FK_Wishlists_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Wishlists] CHECK CONSTRAINT [FK_Wishlists_Products_ProductId]
GO
USE [master]
GO
ALTER DATABASE [FinalProjectCodeDb] SET  READ_WRITE 
GO
