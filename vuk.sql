USE [master]
GO
/****** Object:  Database [vuk]    Script Date: 11.12.2023 20:10:34 ******/
CREATE DATABASE [vuk]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'vuk', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\vuk.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'vuk_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\vuk_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [vuk] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [vuk].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [vuk] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [vuk] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [vuk] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [vuk] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [vuk] SET ARITHABORT OFF 
GO
ALTER DATABASE [vuk] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [vuk] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [vuk] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [vuk] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [vuk] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [vuk] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [vuk] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [vuk] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [vuk] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [vuk] SET  DISABLE_BROKER 
GO
ALTER DATABASE [vuk] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [vuk] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [vuk] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [vuk] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [vuk] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [vuk] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [vuk] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [vuk] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [vuk] SET  MULTI_USER 
GO
ALTER DATABASE [vuk] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [vuk] SET DB_CHAINING OFF 
GO
ALTER DATABASE [vuk] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [vuk] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [vuk] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [vuk] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'vuk', N'ON'
GO
ALTER DATABASE [vuk] SET QUERY_STORE = OFF
GO
USE [vuk]
GO
/****** Object:  Table [dbo].[LoginHistory]    Script Date: 11.12.2023 20:10:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoginHistory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_users] [int] NULL,
	[LoginDateTime] [datetime] NULL,
	[TypeVxod] [nvarchar](50) NULL,
 CONSTRAINT [PK_LoginHistory] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[merch]    Script Date: 11.12.2023 20:10:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[merch](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[photo] [nvarchar](50) NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [text] NOT NULL,
	[manufacturer] [nvarchar](50) NOT NULL,
	[price] [int] NOT NULL,
	[discount] [int] NULL,
 CONSTRAINT [PK_merch] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 11.12.2023 20:10:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_users] [int] NOT NULL,
	[id_status] [int] NOT NULL,
	[id_point] [int] NOT NULL,
	[order_date] [date] NOT NULL,
	[code] [int] NOT NULL,
	[cost] [int] NOT NULL,
	[discount] [int] NULL,
	[total_cost] [int] NULL,
	[delivery_days] [int] NULL,
 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[point]    Script Date: 11.12.2023 20:10:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[point](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_point] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sostav]    Script Date: 11.12.2023 20:10:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sostav](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_orders] [int] NOT NULL,
	[id_merch] [int] NOT NULL,
	[count] [int] NULL,
	[quantity] [int] NULL,
	[total_cost] [int] NULL,
	[discount] [int] NULL,
 CONSTRAINT [PK_sostav] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[status]    Script Date: 11.12.2023 20:10:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[status](
	[id] [int] NOT NULL,
	[status_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_status] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[type_user]    Script Date: 11.12.2023 20:10:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[type_user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[role] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_type_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 11.12.2023 20:10:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[login] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[photo] [nvarchar](50) NOT NULL,
	[id_type] [int] NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[LoginHistory] ON 

INSERT [dbo].[LoginHistory] ([id], [id_users], [LoginDateTime], [TypeVxod]) VALUES (28, NULL, CAST(N'2023-12-11T19:39:16.187' AS DateTime), N'Не успешно')
INSERT [dbo].[LoginHistory] ([id], [id_users], [LoginDateTime], [TypeVxod]) VALUES (29, 4, CAST(N'2023-12-11T19:39:28.527' AS DateTime), N'Успешно')
INSERT [dbo].[LoginHistory] ([id], [id_users], [LoginDateTime], [TypeVxod]) VALUES (30, 4, CAST(N'2023-12-11T19:40:45.397' AS DateTime), N'Успешно')
INSERT [dbo].[LoginHistory] ([id], [id_users], [LoginDateTime], [TypeVxod]) VALUES (31, 3, CAST(N'2023-12-11T19:41:07.257' AS DateTime), N'Успешно')
INSERT [dbo].[LoginHistory] ([id], [id_users], [LoginDateTime], [TypeVxod]) VALUES (32, 1, CAST(N'2023-12-11T19:41:20.300' AS DateTime), N'Успешно')
INSERT [dbo].[LoginHistory] ([id], [id_users], [LoginDateTime], [TypeVxod]) VALUES (33, 1, CAST(N'2023-12-11T19:43:41.097' AS DateTime), N'Успешно')
INSERT [dbo].[LoginHistory] ([id], [id_users], [LoginDateTime], [TypeVxod]) VALUES (34, 3, CAST(N'2023-12-11T19:43:58.353' AS DateTime), N'Успешно')
INSERT [dbo].[LoginHistory] ([id], [id_users], [LoginDateTime], [TypeVxod]) VALUES (35, 4, CAST(N'2023-12-11T19:44:10.287' AS DateTime), N'Успешно')
INSERT [dbo].[LoginHistory] ([id], [id_users], [LoginDateTime], [TypeVxod]) VALUES (36, 4, CAST(N'2023-12-11T19:45:34.737' AS DateTime), N'Успешно')
INSERT [dbo].[LoginHistory] ([id], [id_users], [LoginDateTime], [TypeVxod]) VALUES (37, 4, CAST(N'2023-12-11T19:49:08.720' AS DateTime), N'Успешно')
INSERT [dbo].[LoginHistory] ([id], [id_users], [LoginDateTime], [TypeVxod]) VALUES (38, 3, CAST(N'2023-12-11T19:49:40.303' AS DateTime), N'Успешно')
INSERT [dbo].[LoginHistory] ([id], [id_users], [LoginDateTime], [TypeVxod]) VALUES (39, 4, CAST(N'2023-12-11T19:50:33.640' AS DateTime), N'Успешно')
INSERT [dbo].[LoginHistory] ([id], [id_users], [LoginDateTime], [TypeVxod]) VALUES (40, 1, CAST(N'2023-12-11T19:52:16.893' AS DateTime), N'Успешно')
INSERT [dbo].[LoginHistory] ([id], [id_users], [LoginDateTime], [TypeVxod]) VALUES (41, 1, CAST(N'2023-12-11T19:53:59.283' AS DateTime), N'Успешно')
INSERT [dbo].[LoginHistory] ([id], [id_users], [LoginDateTime], [TypeVxod]) VALUES (42, 1, CAST(N'2023-12-11T20:05:52.837' AS DateTime), N'Успешно')
INSERT [dbo].[LoginHistory] ([id], [id_users], [LoginDateTime], [TypeVxod]) VALUES (43, NULL, CAST(N'2023-12-11T20:06:11.587' AS DateTime), N'Не успешно')
INSERT [dbo].[LoginHistory] ([id], [id_users], [LoginDateTime], [TypeVxod]) VALUES (44, 4, CAST(N'2023-12-11T20:06:15.893' AS DateTime), N'Успешно')
INSERT [dbo].[LoginHistory] ([id], [id_users], [LoginDateTime], [TypeVxod]) VALUES (45, 1, CAST(N'2023-12-11T20:07:10.087' AS DateTime), N'Успешно')
INSERT [dbo].[LoginHistory] ([id], [id_users], [LoginDateTime], [TypeVxod]) VALUES (46, 3, CAST(N'2023-12-11T20:07:47.893' AS DateTime), N'Успешно')
SET IDENTITY_INSERT [dbo].[LoginHistory] OFF
GO
SET IDENTITY_INSERT [dbo].[merch] ON 

INSERT [dbo].[merch] ([id], [photo], [name], [description], [manufacturer], [price], [discount]) VALUES (2, N'/photo/roll.png', N'Комбо 1', N'Комбо с Цезарь роллом', N'Вкусно и Точка', 308, NULL)
INSERT [dbo].[merch] ([id], [photo], [name], [description], [manufacturer], [price], [discount]) VALUES (3, N'/photo/testy.png', N'Комбо 2', N'Комбо с БигСпеэшл', N'Вкусно и Точка', 538, 2)
INSERT [dbo].[merch] ([id], [photo], [name], [description], [manufacturer], [price], [discount]) VALUES (5, N'/photo/prem.jpg', N'Комбо 3', N'Комбо с ЧикенПремьером', N'Вкусно и Точка', 289, 0)
INSERT [dbo].[merch] ([id], [photo], [name], [description], [manufacturer], [price], [discount]) VALUES (6, N'/photo/grand.png', N'Комбо 4', N'Комбо с Грандом', N'Вкусно и Точка', 333, 35)
INSERT [dbo].[merch] ([id], [photo], [name], [description], [manufacturer], [price], [discount]) VALUES (7, N'/photo/dv.png', N'Комбо 5', N'Комбо с Двойным Чизбургером', N'Вкусно и Точка', 279, 0)
INSERT [dbo].[merch] ([id], [photo], [name], [description], [manufacturer], [price], [discount]) VALUES (8, N'/photo/kapuch.jpg', N'Капучино', N'Молочный напиток с тонким ароматом эспрессо и плотной шапкой молочной пены', N'Вкусно и Точка', 115, NULL)
INSERT [dbo].[merch] ([id], [photo], [name], [description], [manufacturer], [price], [discount]) VALUES (9, N'/photo/amerik.jpg', N'Американо', N'Чёрный кофе на основе порции эспрессо и горячей воды', N'Вкусно и Точка', 95, 0)
INSERT [dbo].[merch] ([id], [photo], [name], [description], [manufacturer], [price], [discount]) VALUES (10, N'/photo/chiken.jpg', N'Чикенбургер', N'Обжаренная куриная котлета из сочного куриного мяса,которая подается на карамелизованной булочке, заправленной свежим салатом и специальным соусом', N'Вкусно и Точка', 63, NULL)
INSERT [dbo].[merch] ([id], [photo], [name], [description], [manufacturer], [price], [discount]) VALUES (11, N'/photo/milk.png', N'Клубничный Коктель', N'Великолепно взбитый коктейль, приготовленный из высококачественной молочной смеси и клубничного сиропа', N'Вкусно и Точка', 129, NULL)
SET IDENTITY_INSERT [dbo].[merch] OFF
GO
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (1, 3, 1, 1, CAST(N'2023-12-08' AS Date), 466, 854, 0, 854, 6)
INSERT [dbo].[orders] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (2, 3, 1, 1, CAST(N'2023-12-11' AS Date), 959, 308, 0, 308, 6)
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
INSERT [dbo].[point] ([id], [name]) VALUES (1, N'Пункт выдачи 1')
INSERT [dbo].[point] ([id], [name]) VALUES (2, N'Пункт выдачи 1')
INSERT [dbo].[point] ([id], [name]) VALUES (3, N'Пункт выдачи 3')
GO
SET IDENTITY_INSERT [dbo].[sostav] ON 

INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (1, 1, 11, 1, 1, 854, 0)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (2, 2, 2, 1, 1, 308, 0)
SET IDENTITY_INSERT [dbo].[sostav] OFF
GO
INSERT [dbo].[status] ([id], [status_name]) VALUES (1, N'Новый')
INSERT [dbo].[status] ([id], [status_name]) VALUES (2, N'В работе')
INSERT [dbo].[status] ([id], [status_name]) VALUES (3, N'Доставляется')
GO
SET IDENTITY_INSERT [dbo].[type_user] ON 

INSERT [dbo].[type_user] ([id], [role]) VALUES (1, N'Администратор')
INSERT [dbo].[type_user] ([id], [role]) VALUES (2, N'Менеджер')
INSERT [dbo].[type_user] ([id], [role]) VALUES (3, N'Клиент')
SET IDENTITY_INSERT [dbo].[type_user] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [login], [password], [name], [photo], [id_type]) VALUES (1, N'admin', N'12345', N'Вадим', N'/res/admin.png', 1)
INSERT [dbo].[users] ([id], [login], [password], [name], [photo], [id_type]) VALUES (3, N'manager', N'12345', N'Евгений', N'/res/manager.png', 2)
INSERT [dbo].[users] ([id], [login], [password], [name], [photo], [id_type]) VALUES (4, N'client', N'12345', N'Имя', N'/res/client.png', 3)
SET IDENTITY_INSERT [dbo].[users] OFF
GO
ALTER TABLE [dbo].[LoginHistory]  WITH CHECK ADD  CONSTRAINT [FK_LoginHistory_users] FOREIGN KEY([id_users])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[LoginHistory] CHECK CONSTRAINT [FK_LoginHistory_users]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_point] FOREIGN KEY([id_point])
REFERENCES [dbo].[point] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_point]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_status] FOREIGN KEY([id_status])
REFERENCES [dbo].[status] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_status]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_users] FOREIGN KEY([id_users])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_users]
GO
ALTER TABLE [dbo].[sostav]  WITH CHECK ADD  CONSTRAINT [FK_sostav_merch] FOREIGN KEY([id_merch])
REFERENCES [dbo].[merch] ([id])
GO
ALTER TABLE [dbo].[sostav] CHECK CONSTRAINT [FK_sostav_merch]
GO
ALTER TABLE [dbo].[sostav]  WITH CHECK ADD  CONSTRAINT [FK_sostav_orders] FOREIGN KEY([id_orders])
REFERENCES [dbo].[orders] ([id])
GO
ALTER TABLE [dbo].[sostav] CHECK CONSTRAINT [FK_sostav_orders]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_users_type_user] FOREIGN KEY([id_type])
REFERENCES [dbo].[type_user] ([id])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_type_user]
GO
USE [master]
GO
ALTER DATABASE [vuk] SET  READ_WRITE 
GO
