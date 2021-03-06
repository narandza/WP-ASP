USE [master]
GO
/****** Object:  Database [eTicekts-app-db]    Script Date: 12.6.2022. 11:56:14 ******/
CREATE DATABASE [eTicekts-app-db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'eTicekts-app-db', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\eTicekts-app-db.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'eTicekts-app-db_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\eTicekts-app-db_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [eTicekts-app-db] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [eTicekts-app-db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [eTicekts-app-db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [eTicekts-app-db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [eTicekts-app-db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [eTicekts-app-db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [eTicekts-app-db] SET ARITHABORT OFF 
GO
ALTER DATABASE [eTicekts-app-db] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [eTicekts-app-db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [eTicekts-app-db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [eTicekts-app-db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [eTicekts-app-db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [eTicekts-app-db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [eTicekts-app-db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [eTicekts-app-db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [eTicekts-app-db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [eTicekts-app-db] SET  ENABLE_BROKER 
GO
ALTER DATABASE [eTicekts-app-db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [eTicekts-app-db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [eTicekts-app-db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [eTicekts-app-db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [eTicekts-app-db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [eTicekts-app-db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [eTicekts-app-db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [eTicekts-app-db] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [eTicekts-app-db] SET  MULTI_USER 
GO
ALTER DATABASE [eTicekts-app-db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [eTicekts-app-db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [eTicekts-app-db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [eTicekts-app-db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [eTicekts-app-db] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [eTicekts-app-db] SET QUERY_STORE = OFF
GO
USE [eTicekts-app-db]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 12.6.2022. 11:56:15 ******/
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
/****** Object:  Table [dbo].[ActorMovies]    Script Date: 12.6.2022. 11:56:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActorMovies](
	[MovieId] [int] NOT NULL,
	[ActorId] [int] NOT NULL,
 CONSTRAINT [PK_ActorMovies] PRIMARY KEY CLUSTERED 
(
	[ActorId] ASC,
	[MovieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Actors]    Script Date: 12.6.2022. 11:56:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProfilePictureUrl] [nvarchar](max) NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Bio] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Actors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Actors] SET (LOCK_ESCALATION = AUTO)
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 12.6.2022. 11:56:15 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 12.6.2022. 11:56:15 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 12.6.2022. 11:56:15 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 12.6.2022. 11:56:15 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 12.6.2022. 11:56:15 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 12.6.2022. 11:56:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[FullName] [nvarchar](max) NULL,
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 12.6.2022. 11:56:15 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cinemas]    Script Date: 12.6.2022. 11:56:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cinemas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Logo] [nvarchar](max) NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Cinemas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movies]    Script Date: 12.6.2022. 11:56:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[EndDate] [datetime2](7) NOT NULL,
	[Price] [float] NOT NULL,
	[ImageUrl] [nvarchar](max) NULL,
	[MovieCategory] [int] NOT NULL,
	[CinemaId] [int] NOT NULL,
	[ProducerId] [int] NOT NULL,
 CONSTRAINT [PK_Movies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 12.6.2022. 11:56:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Amount] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[MovieId] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
 CONSTRAINT [PK_OrderItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 12.6.2022. 11:56:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](max) NULL,
	[UserId] [nvarchar](max) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producers]    Script Date: 12.6.2022. 11:56:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProfilePictureUrl] [nvarchar](max) NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Bio] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Producers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoppingCartItems]    Script Date: 12.6.2022. 11:56:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingCartItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MovieId] [int] NULL,
	[Amount] [int] NOT NULL,
	[ShoppingCartId] [nvarchar](max) NULL,
 CONSTRAINT [PK_ShoppingCartItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220604181102_initial', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220604231443_CinemaUrlFix', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220612000145_order', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220612000615_sci', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220612015245_fix', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220612025733_indentity', N'5.0.17')
GO
INSERT [dbo].[ActorMovies] ([MovieId], [ActorId]) VALUES (13, 17)
INSERT [dbo].[ActorMovies] ([MovieId], [ActorId]) VALUES (13, 18)
INSERT [dbo].[ActorMovies] ([MovieId], [ActorId]) VALUES (13, 19)
INSERT [dbo].[ActorMovies] ([MovieId], [ActorId]) VALUES (14, 20)
INSERT [dbo].[ActorMovies] ([MovieId], [ActorId]) VALUES (14, 21)
INSERT [dbo].[ActorMovies] ([MovieId], [ActorId]) VALUES (15, 22)
INSERT [dbo].[ActorMovies] ([MovieId], [ActorId]) VALUES (15, 23)
INSERT [dbo].[ActorMovies] ([MovieId], [ActorId]) VALUES (16, 21)
INSERT [dbo].[ActorMovies] ([MovieId], [ActorId]) VALUES (16, 24)
INSERT [dbo].[ActorMovies] ([MovieId], [ActorId]) VALUES (16, 25)
INSERT [dbo].[ActorMovies] ([MovieId], [ActorId]) VALUES (17, 26)
INSERT [dbo].[ActorMovies] ([MovieId], [ActorId]) VALUES (17, 27)
INSERT [dbo].[ActorMovies] ([MovieId], [ActorId]) VALUES (18, 19)
INSERT [dbo].[ActorMovies] ([MovieId], [ActorId]) VALUES (18, 28)
GO
SET IDENTITY_INSERT [dbo].[Actors] ON 

INSERT [dbo].[Actors] ([Id], [ProfilePictureUrl], [FullName], [Bio]) VALUES (17, N'img/actor-1223406948.jpg', N'Pavle Vuisic', N'Pavle "Paja" Vuisić was a Yugoslav actor, known as one of the most recognizable faces of former Yugoslav cinema.')
INSERT [dbo].[Actors] ([Id], [ProfilePictureUrl], [FullName], [Bio]) VALUES (18, N'img/actor-2223439852.jpg', N'Dragan Nikolic', N'Драгослав Драган Николић био је југословенски и српски филмски, телевизијски и позоришни глумац. Због стила глуме је од стране обожавалаца окарактерисан као Шмекер са карактером господина.')
INSERT [dbo].[Actors] ([Id], [ProfilePictureUrl], [FullName], [Bio]) VALUES (19, N'img/actor-3223515168.jpg', N'Danilo Bata Stojkovic', N'Данило Бата Стојковић био је један од најпознатијих српских позоришних, телевизијских и филмских глумаца.')
INSERT [dbo].[Actors] ([Id], [ProfilePictureUrl], [FullName], [Bio]) VALUES (20, N'img/actor-5223738614.jpg', N'Dragan Bjelogrlic', N'Драган Бјелогрлић српски је филмски, телевизијски и позоришни глумац, редитељ, сценариста и продуцент.')
INSERT [dbo].[Actors] ([Id], [ProfilePictureUrl], [FullName], [Bio]) VALUES (21, N'img/nikolakojo223826329.jfif', N'Nikola Kojo', N'Никола Којо српски је глумац и редитељ.')
INSERT [dbo].[Actors] ([Id], [ProfilePictureUrl], [FullName], [Bio]) VALUES (22, N'img/natasa224113162.jfif', N'Natasa Ninkovic', N'Наташа Нинковић Шаренац српска је филмска, телевизијска и позоришна глумица. Први велики филм у коме се представила југословенској публици био је филмски класик Три карте за Холивуд из 1993, а прву велику улогу остварила је пет година касније, у ратној драми Спаситељ.')
INSERT [dbo].[Actors] ([Id], [ProfilePictureUrl], [FullName], [Bio]) VALUES (23, N'img/gorica224158924.jfif', N'Gorica Popovic', N'Горица Поповић српска је позоришна, филмска и телевизијска глумица.')
INSERT [dbo].[Actors] ([Id], [ProfilePictureUrl], [FullName], [Bio]) VALUES (24, N'img/srdjan224413043.jfif', N'Srdjan Todorovic', N'Срђан „Жика“ Тодоровић, српски је глумац и рок музичар, син глумца Боре Тодоровића. Млађа сестра Дана Тодоровић је такође глумица. Као бубњар, свирао је у београдским групама Екс Радничка Контрола, Центар, Безобразно зелено, Дисциплина кичме, Екатарина Велика и Казна за уши. Касније се посвећује искључиво глуми.')
INSERT [dbo].[Actors] ([Id], [ProfilePictureUrl], [FullName], [Bio]) VALUES (25, N'img/branka224452549.jfif', N'Branka Katic', N'Бранка Катић српска је филмска и позоришна глумица.')
INSERT [dbo].[Actors] ([Id], [ProfilePictureUrl], [FullName], [Bio]) VALUES (26, N'img/vojin224708213.jfif', N'Vojin Cetkovic', N'Војин Ћетковић српски је филмски и позоришни глумац. Глумачку каријеру започео је у Крушевачком позоришту, професионалну у Народном позоришту у Београду, а након уписивања Факултета драмских уметности у Београду, 1996. постао је члан Југословенског драмског позоришта, које га је стипендирало.')
INSERT [dbo].[Actors] ([Id], [ProfilePictureUrl], [FullName], [Bio]) VALUES (27, N'img/katarina224743148.jfif', N'Katarina Radivojevic', N'Катарина Радивојевић српска је глумица.')
INSERT [dbo].[Actors] ([Id], [ProfilePictureUrl], [FullName], [Bio]) VALUES (28, N'img/bogdan225148313.jfif', N'Bogdan Diklic', N'Богдан Диклић српски је глумац.')
SET IDENTITY_INSERT [dbo].[Actors] OFF
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'31f33029-0240-4b53-a6dd-52547a66927c', N'Admin', N'ADMIN', N'039f27b2-e523-472c-b5b5-1e8683c92a05')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'87afb643-d2d7-464b-aa90-e0b738f442c1', N'User', N'USER', N'a4fbb4ea-b195-47d1-9a36-cc7398e4fe3b')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a214e46b-0111-4ec0-bf88-1fff7eee2883', N'31f33029-0240-4b53-a6dd-52547a66927c')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'2a0725da-e8d2-4d5e-ac8a-e65d6323c31a', N'87afb643-d2d7-464b-aa90-e0b738f442c1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e64bf9ce-0f4f-40c8-9ed2-e65c2ac558ea', N'87afb643-d2d7-464b-aa90-e0b738f442c1')
GO
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'2a0725da-e8d2-4d5e-ac8a-e65d6323c31a', N'Dimitrije Jovanovic', N'dimitrije', N'DIMITRIJE', N'user@etickets.com', N'USER@ETICKETS.COM', 1, N'AQAAAAEAACcQAAAAEKF0bzztMhet4/Tk0GA6UTZ5zkbfrv+wHBG9fTV/01h+kY74YoRXmDIgRgMgVgtbtw==', N'3RABDRHGECPID46JA7WVQQHXJPMKPRAQ', N'3592fedd-6049-4c29-ad2e-45084d1feb2b', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'a214e46b-0111-4ec0-bf88-1fff7eee2883', N'Dimitrije Jovanovic', N'admin', N'ADMIN', N'admin@etickets.com', N'ADMIN@ETICKETS.COM', 1, N'AQAAAAEAACcQAAAAEJEKVdNRgizBUyo5HkwKOqcb79p/ukxTO2sC4IR0qzydmVQOBI/bQqNcmWa8Vm5Fkw==', N'D3GK4IEM4P7QVUK6QFHDWWMQL3KUCLYU', N'6b1d7cce-b91c-4bcf-9a3b-feb0ccc66e2b', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'e64bf9ce-0f4f-40c8-9ed2-e65c2ac558ea', N'test', N'test@mail.com', N'TEST@MAIL.COM', N'test@mail.com', N'TEST@MAIL.COM', 0, N'AQAAAAEAACcQAAAAEOhJWoubPwyz0138g0Y6yUoQLvqdS8qECtZKUq0QRo2UTNk48pxPvyGPtfY8pZdVKg==', N'CVJVQHDWOB5ZVG5HJ6PUM6AJEJ5QWFTJ', N'e53a1448-259a-40a5-91c1-acbb4c2de093', NULL, 0, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Cinemas] ON 

INSERT [dbo].[Cinemas] ([Id], [Logo], [Name], [Description]) VALUES (1, N'img/cinema-1220949564.jpg', N'Ćinepleks Beograd ', N'Posetite nas na adresi : Mulana Putrovica 47')
INSERT [dbo].[Cinemas] ([Id], [Logo], [Name], [Description]) VALUES (2, N'img/cinema-2221026773.jpg', N'Ćinepleks Novi Beograd', N'Posetite nas na adresi : Mulana Putrovica 47')
INSERT [dbo].[Cinemas] ([Id], [Logo], [Name], [Description]) VALUES (3, N'img/cinema-3221111260.jpg', N'Ćinepleks Niš', N'Posetite nas na adresi : Mulana Putrovica 47')
INSERT [dbo].[Cinemas] ([Id], [Logo], [Name], [Description]) VALUES (4, N'img/cinema-4221119730.jpeg', N'Ćinepleks Pirot', N'...')
INSERT [dbo].[Cinemas] ([Id], [Logo], [Name], [Description]) VALUES (5, N'img/cinema-5221129162.jpg', N'Ćinepleks Novi Sad', N'Posetite nas na adresi : Mulana Putrovica 47')
SET IDENTITY_INSERT [dbo].[Cinemas] OFF
GO
SET IDENTITY_INSERT [dbo].[Movies] ON 

INSERT [dbo].[Movies] ([Id], [Name], [Description], [StartDate], [EndDate], [Price], [ImageUrl], [MovieCategory], [CinemaId], [ProducerId]) VALUES (13, N'Ko to tamo peva', N'Ко то тамо пева је српски филм снимљен 1980. године у режији Слободана Шијана, према сценарију Душана Ковачевића. Главне улоге тумаче Павле Вуисић, Драган Николић, Данило Бата Стојковић, Александар Берчек, Неда Арнерић и Миливоје Томић.', CAST(N'2022-02-22T00:00:00.0000000' AS DateTime2), CAST(N'2022-02-24T00:00:00.0000000' AS DateTime2), 100, N'img/movie-1223614257.jpg', 2, 2, 7)
INSERT [dbo].[Movies] ([Id], [Name], [Description], [StartDate], [EndDate], [Price], [ImageUrl], [MovieCategory], [CinemaId], [ProducerId]) VALUES (14, N'Dva Sata Kvalitetnog Programa', N'Два сата квалитетног ТВ програма је српски телевизијски филм из 1994. године који је режирао Срђан Драгојевић. У филму учествују многе звезде из бивше Југославије, те музичка звезда Момчило Бајагић Бајага. Филм приказује деведесете године, највише кроз однос турбо-фолка, дизелаша и рокенрола у друштву', CAST(N'2022-06-08T00:00:00.0000000' AS DateTime2), CAST(N'2022-07-09T00:00:00.0000000' AS DateTime2), 250, N'img/movie-2223944089.jpg', 2, 3, 8)
INSERT [dbo].[Movies] ([Id], [Name], [Description], [StartDate], [EndDate], [Price], [ImageUrl], [MovieCategory], [CinemaId], [ProducerId]) VALUES (15, N'Profesionalac', N'Професионалац је српски филм снимљен 2003. године у режији Душана Ковачевића, који је написао и сценарио по својој истоименој позоришној представи. Главне улоге тумаче Бора Тодоровић и Бранислав Лечић. Филм је био српски кандидат за Оскара, за најбољи филм ван енглеског говорног подручја за 2003. годину.', CAST(N'2022-07-09T00:00:00.0000000' AS DateTime2), CAST(N'2022-07-22T00:00:00.0000000' AS DateTime2), 320, N'img/movie-3224303006.jpg', 3, 2, 9)
INSERT [dbo].[Movies] ([Id], [Name], [Description], [StartDate], [EndDate], [Price], [ImageUrl], [MovieCategory], [CinemaId], [ProducerId]) VALUES (16, N'Mi Nismo Andjeli', N'„Ми нисмо анђели“ је српски филм из 1992. године. Жанр је комедија. По броју продатих биоскопских улазница спада у најуспешније филмове икада снимљене у Србији, ca више од милион продатих улазница, одмах после Зоне Замфирове и сматра се култним филмом.', CAST(N'2022-06-07T00:00:00.0000000' AS DateTime2), CAST(N'2022-06-30T00:00:00.0000000' AS DateTime2), 290, N'img/movie-4224612121.jpg', 1, 1, 9)
INSERT [dbo].[Movies] ([Id], [Name], [Description], [StartDate], [EndDate], [Price], [ImageUrl], [MovieCategory], [CinemaId], [ProducerId]) VALUES (17, N'Zona Zamfirova', N'Ljubavnu pricu izmedu pripadnika razlicitih drustvenih slojeva, kujundzije Maneta i bogataske cerke Zone, smestenu u ambijent Nisa s kraja 19. veka.', CAST(N'2022-02-03T00:00:00.0000000' AS DateTime2), CAST(N'2022-03-03T00:00:00.0000000' AS DateTime2), 290, N'img/movie-5224912994.jpg', 2, 4, 10)
INSERT [dbo].[Movies] ([Id], [Name], [Description], [StartDate], [EndDate], [Price], [ImageUrl], [MovieCategory], [CinemaId], [ProducerId]) VALUES (18, N'Maratonci Trce Pocasni Krug', N'Маратонци трче почасни круг је југословенски филм из 1982. године у режији Слободана Шијана, а сценарио је написао Душан Ковачевић на основу своје истоимене позоришне представе.', CAST(N'2022-09-07T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-21T00:00:00.0000000' AS DateTime2), 290, N'img/movie-6225308948.jpg', 1, 3, 7)
SET IDENTITY_INSERT [dbo].[Movies] OFF
GO
SET IDENTITY_INSERT [dbo].[Producers] ON 

INSERT [dbo].[Producers] ([Id], [ProfilePictureUrl], [FullName], [Bio]) VALUES (7, N'img/producer-1221317391.jpg', N'Slobodan Šijan', N'Слободан Шијан српски је сликар, филмски и ТВ редитељ, сценариста, филмски критичар и дописни члан Српске академије наука и уметности')
INSERT [dbo].[Producers] ([Id], [ProfilePictureUrl], [FullName], [Bio]) VALUES (8, N'img/producer-2221430273.jpg', N'Srdjan Dragojevic', N'Срђан Драгојевић, српски је филмски режисер, сценариста и писац')
INSERT [dbo].[Producers] ([Id], [ProfilePictureUrl], [FullName], [Bio]) VALUES (9, N'img/producer-3221653976.jpg', N'Dusan Kovacevic', N'Душан Ковачевић српски је драмски писац, сценариста, филмски редитељ и академик.')
INSERT [dbo].[Producers] ([Id], [ProfilePictureUrl], [FullName], [Bio]) VALUES (10, N'img/producer-4221805516.jpg', N'Zdravko Sotra', N'Здравко Шотра српски је режисер и сценариста.')
SET IDENTITY_INSERT [dbo].[Producers] OFF
GO
/****** Object:  Index [IX_ActorMovies_MovieId]    Script Date: 12.6.2022. 11:56:15 ******/
CREATE NONCLUSTERED INDEX [IX_ActorMovies_MovieId] ON [dbo].[ActorMovies]
(
	[MovieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 12.6.2022. 11:56:15 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 12.6.2022. 11:56:15 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 12.6.2022. 11:56:15 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 12.6.2022. 11:56:15 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 12.6.2022. 11:56:15 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 12.6.2022. 11:56:15 ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 12.6.2022. 11:56:15 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Movies_CinemaId]    Script Date: 12.6.2022. 11:56:15 ******/
CREATE NONCLUSTERED INDEX [IX_Movies_CinemaId] ON [dbo].[Movies]
(
	[CinemaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Movies_ProducerId]    Script Date: 12.6.2022. 11:56:15 ******/
CREATE NONCLUSTERED INDEX [IX_Movies_ProducerId] ON [dbo].[Movies]
(
	[ProducerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderItems_MovieId]    Script Date: 12.6.2022. 11:56:15 ******/
CREATE NONCLUSTERED INDEX [IX_OrderItems_MovieId] ON [dbo].[OrderItems]
(
	[MovieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderItems_OrderId]    Script Date: 12.6.2022. 11:56:15 ******/
CREATE NONCLUSTERED INDEX [IX_OrderItems_OrderId] ON [dbo].[OrderItems]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ShoppingCartItems_MovieId]    Script Date: 12.6.2022. 11:56:15 ******/
CREATE NONCLUSTERED INDEX [IX_ShoppingCartItems_MovieId] ON [dbo].[ShoppingCartItems]
(
	[MovieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Actors] ADD  DEFAULT (N'') FOR [FullName]
GO
ALTER TABLE [dbo].[Actors] ADD  DEFAULT (N'') FOR [Bio]
GO
ALTER TABLE [dbo].[Cinemas] ADD  DEFAULT (N'') FOR [Name]
GO
ALTER TABLE [dbo].[Cinemas] ADD  DEFAULT (N'') FOR [Description]
GO
ALTER TABLE [dbo].[Producers] ADD  DEFAULT (N'') FOR [FullName]
GO
ALTER TABLE [dbo].[Producers] ADD  DEFAULT (N'') FOR [Bio]
GO
ALTER TABLE [dbo].[ActorMovies]  WITH CHECK ADD  CONSTRAINT [FK_ActorMovies_Actors_ActorId] FOREIGN KEY([ActorId])
REFERENCES [dbo].[Actors] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ActorMovies] CHECK CONSTRAINT [FK_ActorMovies_Actors_ActorId]
GO
ALTER TABLE [dbo].[ActorMovies]  WITH CHECK ADD  CONSTRAINT [FK_ActorMovies_Movies_MovieId] FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movies] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ActorMovies] CHECK CONSTRAINT [FK_ActorMovies_Movies_MovieId]
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
ALTER TABLE [dbo].[Movies]  WITH CHECK ADD  CONSTRAINT [FK_Movies_Cinemas_CinemaId] FOREIGN KEY([CinemaId])
REFERENCES [dbo].[Cinemas] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Movies] CHECK CONSTRAINT [FK_Movies_Cinemas_CinemaId]
GO
ALTER TABLE [dbo].[Movies]  WITH CHECK ADD  CONSTRAINT [FK_Movies_Producers_ProducerId] FOREIGN KEY([ProducerId])
REFERENCES [dbo].[Producers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Movies] CHECK CONSTRAINT [FK_Movies_Producers_ProducerId]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Movies_MovieId] FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movies] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Movies_MovieId]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Orders_OrderId]
GO
ALTER TABLE [dbo].[ShoppingCartItems]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCartItems_Movies_MovieId] FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movies] ([Id])
GO
ALTER TABLE [dbo].[ShoppingCartItems] CHECK CONSTRAINT [FK_ShoppingCartItems_Movies_MovieId]
GO
USE [master]
GO
ALTER DATABASE [eTicekts-app-db] SET  READ_WRITE 
GO
