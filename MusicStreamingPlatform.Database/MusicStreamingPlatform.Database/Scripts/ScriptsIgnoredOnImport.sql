
USE [master]
GO

/****** Object:  Database [MusicStreamingPlatform]    Script Date: 02/07/2025 18:46:42 ******/
CREATE DATABASE [MusicStreamingPlatform]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MusicStreamingPlatform', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MusicStreamingPlatform.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MusicStreamingPlatform_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MusicStreamingPlatform_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

ALTER DATABASE [MusicStreamingPlatform] SET COMPATIBILITY_LEVEL = 150
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MusicStreamingPlatform].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [MusicStreamingPlatform] SET ANSI_NULL_DEFAULT OFF
GO

ALTER DATABASE [MusicStreamingPlatform] SET ANSI_NULLS OFF
GO

ALTER DATABASE [MusicStreamingPlatform] SET ANSI_PADDING OFF
GO

ALTER DATABASE [MusicStreamingPlatform] SET ANSI_WARNINGS OFF
GO

ALTER DATABASE [MusicStreamingPlatform] SET ARITHABORT OFF
GO

ALTER DATABASE [MusicStreamingPlatform] SET AUTO_CLOSE OFF
GO

ALTER DATABASE [MusicStreamingPlatform] SET AUTO_SHRINK OFF
GO

ALTER DATABASE [MusicStreamingPlatform] SET AUTO_UPDATE_STATISTICS ON
GO

ALTER DATABASE [MusicStreamingPlatform] SET CURSOR_CLOSE_ON_COMMIT OFF
GO

ALTER DATABASE [MusicStreamingPlatform] SET CURSOR_DEFAULT  GLOBAL
GO

ALTER DATABASE [MusicStreamingPlatform] SET CONCAT_NULL_YIELDS_NULL OFF
GO

ALTER DATABASE [MusicStreamingPlatform] SET NUMERIC_ROUNDABORT OFF
GO

ALTER DATABASE [MusicStreamingPlatform] SET QUOTED_IDENTIFIER OFF
GO

ALTER DATABASE [MusicStreamingPlatform] SET RECURSIVE_TRIGGERS OFF
GO

ALTER DATABASE [MusicStreamingPlatform] SET  DISABLE_BROKER
GO

ALTER DATABASE [MusicStreamingPlatform] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO

ALTER DATABASE [MusicStreamingPlatform] SET DATE_CORRELATION_OPTIMIZATION OFF
GO

ALTER DATABASE [MusicStreamingPlatform] SET TRUSTWORTHY OFF
GO

ALTER DATABASE [MusicStreamingPlatform] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO

ALTER DATABASE [MusicStreamingPlatform] SET PARAMETERIZATION SIMPLE
GO

ALTER DATABASE [MusicStreamingPlatform] SET READ_COMMITTED_SNAPSHOT OFF
GO

ALTER DATABASE [MusicStreamingPlatform] SET HONOR_BROKER_PRIORITY OFF
GO

ALTER DATABASE [MusicStreamingPlatform] SET RECOVERY FULL
GO

ALTER DATABASE [MusicStreamingPlatform] SET  MULTI_USER
GO

ALTER DATABASE [MusicStreamingPlatform] SET PAGE_VERIFY CHECKSUM
GO

ALTER DATABASE [MusicStreamingPlatform] SET DB_CHAINING OFF
GO

ALTER DATABASE [MusicStreamingPlatform] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF )
GO

ALTER DATABASE [MusicStreamingPlatform] SET TARGET_RECOVERY_TIME = 60 SECONDS
GO

ALTER DATABASE [MusicStreamingPlatform] SET DELAYED_DURABILITY = DISABLED
GO

ALTER DATABASE [MusicStreamingPlatform] SET ACCELERATED_DATABASE_RECOVERY = OFF
GO

EXEC sys.sp_db_vardecimal_storage_format N'MusicStreamingPlatform', N'ON'
GO

ALTER DATABASE [MusicStreamingPlatform] SET QUERY_STORE = OFF
GO

USE [MusicStreamingPlatform]
GO

/****** Object:  Table [dbo].[Songs]    Script Date: 02/07/2025 18:46:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[Subscriptions]    Script Date: 02/07/2025 18:46:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[TokenTransactions]    Script Date: 02/07/2025 18:46:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[UserPurchasedSongs]    Script Date: 02/07/2025 18:46:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[Users]    Script Date: 02/07/2025 18:46:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[Wallets]    Script Date: 02/07/2025 18:46:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

INSERT [dbo].[Songs] ([Id], [Title], [Artist], [PriceInTokens]) VALUES (N'9a4dcc7c-2658-4314-b841-0d842312e75d', N'Shape of You', N'Ed Sheeran', CAST(40.00 AS Decimal(18, 2)))
GO

INSERT [dbo].[Songs] ([Id], [Title], [Artist], [PriceInTokens]) VALUES (N'73f4d0e1-1ec4-4ba0-bd5e-d808d5d41109', N'Bohemian Rhapsody', N'Queen', CAST(50.00 AS Decimal(18, 2)))
GO

INSERT [dbo].[Songs] ([Id], [Title], [Artist], [PriceInTokens]) VALUES (N'b64f5bc4-bb27-40a8-9f03-e0cd82a09090', N'Imagine', N'John Lennon', CAST(30.00 AS Decimal(18, 2)))
GO

INSERT [dbo].[Subscriptions] ([Id], [Plan], [MonthlyPrice], [MonthlyTokens], [StartDate], [UserId]) VALUES (N'db6b52d4-a1d3-45ba-86e6-04cfe9d06cb1', 1, CAST(0.00 AS Decimal(18, 2)), 0, CAST(N'2025-06-26T21:23:49.8238383' AS DateTime2), N'b18a3fb5-e2ae-4938-b7a5-668f0b962f7e')
GO

INSERT [dbo].[Subscriptions] ([Id], [Plan], [MonthlyPrice], [MonthlyTokens], [StartDate], [UserId]) VALUES (N'8d9fca42-2213-4917-86a8-1074ba91838e', 1, CAST(0.00 AS Decimal(18, 2)), 0, CAST(N'2025-06-27T12:36:39.0634006' AS DateTime2), N'fd23789a-3f0a-4a79-a639-5919a97b26e3')
GO

INSERT [dbo].[Subscriptions] ([Id], [Plan], [MonthlyPrice], [MonthlyTokens], [StartDate], [UserId]) VALUES (N'6b27da70-d633-4d82-aafa-31041419c1d5', 0, CAST(0.00 AS Decimal(18, 2)), 0, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'd42c4fcb-a4ba-4d04-b57d-58c41f822b63')
GO

INSERT [dbo].[Subscriptions] ([Id], [Plan], [MonthlyPrice], [MonthlyTokens], [StartDate], [UserId]) VALUES (N'c2234109-dc0a-4786-9ecc-421e7594d861', 1, CAST(0.00 AS Decimal(18, 2)), 0, CAST(N'2025-06-27T12:42:43.6424392' AS DateTime2), N'cd8faf23-71ee-4e7f-b559-a6b01d0ed0a7')
GO

INSERT [dbo].[Subscriptions] ([Id], [Plan], [MonthlyPrice], [MonthlyTokens], [StartDate], [UserId]) VALUES (N'1f4a9976-ebb7-48dd-9158-48778fc2fca3', 1, CAST(0.00 AS Decimal(18, 2)), 0, CAST(N'2025-06-26T21:23:58.1813923' AS DateTime2), N'04b6d3fc-3ba2-4a76-bfe0-db32ff4fb0a5')
GO

INSERT [dbo].[Subscriptions] ([Id], [Plan], [MonthlyPrice], [MonthlyTokens], [StartDate], [UserId]) VALUES (N'96733f3d-75c3-4ca4-b843-585d85dfa46b', 0, CAST(0.00 AS Decimal(18, 2)), 0, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'9fc26e64-e1f4-484f-ae2f-b2cffb5e7645')
GO

INSERT [dbo].[Subscriptions] ([Id], [Plan], [MonthlyPrice], [MonthlyTokens], [StartDate], [UserId]) VALUES (N'f3924c9e-93e7-4806-8d03-63cdbd124f68', 1, CAST(0.00 AS Decimal(18, 2)), 0, CAST(N'2025-06-30T21:17:44.2763246' AS DateTime2), N'd27c92ae-2d1c-4426-b007-eb468a8a91bd')
GO

INSERT [dbo].[Subscriptions] ([Id], [Plan], [MonthlyPrice], [MonthlyTokens], [StartDate], [UserId]) VALUES (N'ac05e3c5-2f51-4745-b3db-75e874258e09', 1, CAST(0.00 AS Decimal(18, 2)), 0, CAST(N'2025-06-24T22:13:12.4572159' AS DateTime2), N'3111ab22-d6d8-4dac-81cd-d94ce632a41c')
GO

INSERT [dbo].[Subscriptions] ([Id], [Plan], [MonthlyPrice], [MonthlyTokens], [StartDate], [UserId]) VALUES (N'e8228713-04e2-422a-9b20-79529e591140', 0, CAST(0.00 AS Decimal(18, 2)), 0, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'8b5f93dd-63d0-4a88-af8a-3762e4a4e12f')
GO

INSERT [dbo].[Subscriptions] ([Id], [Plan], [MonthlyPrice], [MonthlyTokens], [StartDate], [UserId]) VALUES (N'1010b43b-299d-45ae-8346-811287418349', 1, CAST(0.00 AS Decimal(18, 2)), 0, CAST(N'2025-06-27T12:40:09.8715271' AS DateTime2), N'80595119-8969-47db-8b25-b6986620f168')
GO

INSERT [dbo].[Subscriptions] ([Id], [Plan], [MonthlyPrice], [MonthlyTokens], [StartDate], [UserId]) VALUES (N'73a6907a-4178-412d-afa1-83380b691fb2', 1, CAST(0.00 AS Decimal(18, 2)), 0, CAST(N'2025-06-27T12:47:56.4952501' AS DateTime2), N'db75b733-93ad-40a1-8b61-31768f29f349')
GO

INSERT [dbo].[Subscriptions] ([Id], [Plan], [MonthlyPrice], [MonthlyTokens], [StartDate], [UserId]) VALUES (N'c678de68-3b7b-4eb7-8b58-89d8da42d0c5', 1, CAST(0.00 AS Decimal(18, 2)), 0, CAST(N'2025-06-26T21:22:29.7018179' AS DateTime2), N'38c944fe-d173-4572-9d28-baf73b47810f')
GO

INSERT [dbo].[Subscriptions] ([Id], [Plan], [MonthlyPrice], [MonthlyTokens], [StartDate], [UserId]) VALUES (N'3b5a4adb-6126-4f72-a54f-940db66ee5c1', 1, CAST(0.00 AS Decimal(18, 2)), 0, CAST(N'2025-06-26T20:58:57.9647086' AS DateTime2), N'ec69c2a9-9bd6-4964-9b01-5bee8720fdc2')
GO

INSERT [dbo].[Subscriptions] ([Id], [Plan], [MonthlyPrice], [MonthlyTokens], [StartDate], [UserId]) VALUES (N'd3dbd68c-bbd2-4ae6-940e-a14f48b8712b', 1, CAST(0.00 AS Decimal(18, 2)), 0, CAST(N'2025-07-02T14:40:15.3957387' AS DateTime2), N'a29bf1b9-b582-41ca-9371-1d6011847e52')
GO

INSERT [dbo].[Subscriptions] ([Id], [Plan], [MonthlyPrice], [MonthlyTokens], [StartDate], [UserId]) VALUES (N'6b4679ee-7138-4a6a-9660-a9ece1ca92b7', 1, CAST(0.00 AS Decimal(18, 2)), 0, CAST(N'2025-06-27T12:44:53.2106074' AS DateTime2), N'14d76cbd-3a22-4880-ac0c-a40d02abbb27')
GO

INSERT [dbo].[Subscriptions] ([Id], [Plan], [MonthlyPrice], [MonthlyTokens], [StartDate], [UserId]) VALUES (N'd48608e1-7f01-4f23-9c89-aa58848d0ed8', 1, CAST(0.00 AS Decimal(18, 2)), 0, CAST(N'2025-06-26T21:23:02.4271806' AS DateTime2), N'6c4aff19-3600-432b-b969-45214e4df5ff')
GO

INSERT [dbo].[Subscriptions] ([Id], [Plan], [MonthlyPrice], [MonthlyTokens], [StartDate], [UserId]) VALUES (N'd616a13a-cb25-465f-9107-c95820cb48a7', 1, CAST(0.00 AS Decimal(18, 2)), 0, CAST(N'2025-06-24T20:13:32.9466215' AS DateTime2), N'0ad19552-c4fb-4431-b179-8c8b426ae500')
GO

INSERT [dbo].[Subscriptions] ([Id], [Plan], [MonthlyPrice], [MonthlyTokens], [StartDate], [UserId]) VALUES (N'399ea597-5e9b-4b62-93c9-c9d4e6b95e2b', 1, CAST(0.00 AS Decimal(18, 2)), 0, CAST(N'2025-06-27T12:42:52.0962280' AS DateTime2), N'af4b8b98-6f95-4561-9a1e-50d897821b11')
GO

INSERT [dbo].[Subscriptions] ([Id], [Plan], [MonthlyPrice], [MonthlyTokens], [StartDate], [UserId]) VALUES (N'494b33e1-d469-4f40-bda4-d0261ab5f16f', 1, CAST(0.00 AS Decimal(18, 2)), 0, CAST(N'2025-06-24T22:12:26.6754870' AS DateTime2), N'57ddfa5d-d33c-4645-8d3c-a10ae2e44317')
GO

INSERT [dbo].[Subscriptions] ([Id], [Plan], [MonthlyPrice], [MonthlyTokens], [StartDate], [UserId]) VALUES (N'b481163d-0669-45d3-ae3c-f60f91ea874d', 1, CAST(0.00 AS Decimal(18, 2)), 0, CAST(N'2025-06-27T12:42:31.9228551' AS DateTime2), N'e0205863-ff0c-4504-be06-9025f4afcf25')
GO

INSERT [dbo].[TokenTransactions] ([Id], [WalletId], [Amount], [Description], [Date]) VALUES (N'1b74061d-f3f8-4d6c-64e4-08ddb35b97f8', N'efa09136-f53a-4ce2-9ba1-8759ed343dca', CAST(100.00 AS Decimal(18, 2)), N'Monthly Basic subscription tokens', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
GO

INSERT [dbo].[TokenTransactions] ([Id], [WalletId], [Amount], [Description], [Date]) VALUES (N'3a96674b-5de9-42a0-64e5-08ddb35b97f8', N'efa09136-f53a-4ce2-9ba1-8759ed343dca', CAST(-40.00 AS Decimal(18, 2)), N'Purchased song: Shape of You', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
GO

INSERT [dbo].[TokenTransactions] ([Id], [WalletId], [Amount], [Description], [Date]) VALUES (N'590caac0-c8e3-4b55-fdf2-08ddb36c3400', N'e2bee17c-a2ee-4a04-94da-999021cac118', CAST(100.00 AS Decimal(18, 2)), N'Monthly Basic subscription tokens', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
GO

INSERT [dbo].[TokenTransactions] ([Id], [WalletId], [Amount], [Description], [Date]) VALUES (N'79d57706-b32b-41c8-fdf3-08ddb36c3400', N'e2bee17c-a2ee-4a04-94da-999021cac118', CAST(-40.00 AS Decimal(18, 2)), N'Purchased song: Shape of You', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
GO

INSERT [dbo].[TokenTransactions] ([Id], [WalletId], [Amount], [Description], [Date]) VALUES (N'3cb7fd61-f8e9-40a1-be5c-08ddb36c4f4a', N'e87cfe90-74a8-427e-8e4d-07434ce77eb7', CAST(100.00 AS Decimal(18, 2)), N'Monthly Basic subscription tokens', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
GO

INSERT [dbo].[TokenTransactions] ([Id], [WalletId], [Amount], [Description], [Date]) VALUES (N'cf4576c0-5fc4-46d4-be5d-08ddb36c4f4a', N'e87cfe90-74a8-427e-8e4d-07434ce77eb7', CAST(-40.00 AS Decimal(18, 2)), N'Purchased song: Shape of You', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
GO

INSERT [dbo].[TokenTransactions] ([Id], [WalletId], [Amount], [Description], [Date]) VALUES (N'c275a209-ebe0-4d1f-ab6e-08ddb4f44508', N'25d7f92f-20b3-4cc8-b1bc-a8ea3f4b663b', CAST(100.00 AS Decimal(18, 2)), N'Monthly Basic subscription tokens', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
GO

INSERT [dbo].[TokenTransactions] ([Id], [WalletId], [Amount], [Description], [Date]) VALUES (N'7e5ff570-600c-4443-ab6f-08ddb4f44508', N'25d7f92f-20b3-4cc8-b1bc-a8ea3f4b663b', CAST(-40.00 AS Decimal(18, 2)), N'Purchased song: Shape of You', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
GO

INSERT [dbo].[TokenTransactions] ([Id], [WalletId], [Amount], [Description], [Date]) VALUES (N'690411ca-29a7-4f39-c792-08ddb4f78e7e', N'a65a672e-7d48-4cf0-9768-432494b881d6', CAST(100.00 AS Decimal(18, 2)), N'Monthly Basic subscription tokens', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
GO

INSERT [dbo].[TokenTransactions] ([Id], [WalletId], [Amount], [Description], [Date]) VALUES (N'95f66604-a23c-483f-c793-08ddb4f78e7e', N'a65a672e-7d48-4cf0-9768-432494b881d6', CAST(-40.00 AS Decimal(18, 2)), N'Purchased song: Shape of You', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
GO

INSERT [dbo].[TokenTransactions] ([Id], [WalletId], [Amount], [Description], [Date]) VALUES (N'af778196-c24f-44ab-28a3-08ddb4f7a200', N'ce8ce813-3485-42da-8605-6facf57a8848', CAST(100.00 AS Decimal(18, 2)), N'Monthly Basic subscription tokens', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
GO

INSERT [dbo].[TokenTransactions] ([Id], [WalletId], [Amount], [Description], [Date]) VALUES (N'b46b841f-82e4-4657-28a4-08ddb4f7a200', N'ce8ce813-3485-42da-8605-6facf57a8848', CAST(-40.00 AS Decimal(18, 2)), N'Purchased song: Shape of You', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
GO

INSERT [dbo].[TokenTransactions] ([Id], [WalletId], [Amount], [Description], [Date]) VALUES (N'2891e9c2-a101-48f6-4e50-08ddb4f7be40', N'98850df4-b36b-47f3-b64b-1cb1098f634d', CAST(100.00 AS Decimal(18, 2)), N'Monthly Basic subscription tokens', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
GO

INSERT [dbo].[TokenTransactions] ([Id], [WalletId], [Amount], [Description], [Date]) VALUES (N'81ad7fdf-aa0c-493e-4e51-08ddb4f7be40', N'98850df4-b36b-47f3-b64b-1cb1098f634d', CAST(-40.00 AS Decimal(18, 2)), N'Purchased song: Shape of You', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
GO

INSERT [dbo].[TokenTransactions] ([Id], [WalletId], [Amount], [Description], [Date]) VALUES (N'0e589ca7-7329-4b28-83d4-08ddb4f7c33b', N'c32d8308-d5b6-4aa1-9a90-33fd2ae1abf1', CAST(100.00 AS Decimal(18, 2)), N'Monthly Basic subscription tokens', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
GO

INSERT [dbo].[TokenTransactions] ([Id], [WalletId], [Amount], [Description], [Date]) VALUES (N'40d06a9e-53e2-472e-83d5-08ddb4f7c33b', N'c32d8308-d5b6-4aa1-9a90-33fd2ae1abf1', CAST(-40.00 AS Decimal(18, 2)), N'Purchased song: Shape of You', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
GO

INSERT [dbo].[TokenTransactions] ([Id], [WalletId], [Amount], [Description], [Date]) VALUES (N'e4018137-9735-4c2d-0f11-08ddb5774343', N'648416ce-dfc4-49a0-bde9-26b284fa6511', CAST(100.00 AS Decimal(18, 2)), N'Monthly Basic subscription tokens', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
GO

INSERT [dbo].[TokenTransactions] ([Id], [WalletId], [Amount], [Description], [Date]) VALUES (N'b8f2701f-af24-4421-0f12-08ddb5774343', N'648416ce-dfc4-49a0-bde9-26b284fa6511', CAST(-40.00 AS Decimal(18, 2)), N'Purchased song: Shape of You', CAST(N'2025-06-27T12:36:39.1262163' AS DateTime2))
GO

INSERT [dbo].[TokenTransactions] ([Id], [WalletId], [Amount], [Description], [Date]) VALUES (N'31beb874-d15b-4ace-c811-08ddb577c0e9', N'94ba97f9-6267-48d9-9460-8bc197902616', CAST(100.00 AS Decimal(18, 2)), N'Monthly Basic subscription tokens', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
GO

INSERT [dbo].[TokenTransactions] ([Id], [WalletId], [Amount], [Description], [Date]) VALUES (N'10ab23ff-7914-4779-c812-08ddb577c0e9', N'94ba97f9-6267-48d9-9460-8bc197902616', CAST(-40.00 AS Decimal(18, 2)), N'Purchased song: Shape of You', CAST(N'2025-06-27T12:40:09.9292217' AS DateTime2))
GO

INSERT [dbo].[TokenTransactions] ([Id], [WalletId], [Amount], [Description], [Date]) VALUES (N'5bd36cb7-9c54-4e29-20a8-08ddb5781595', N'6cf15283-e8af-4214-bd2b-8ff0763602a3', CAST(100.00 AS Decimal(18, 2)), N'Monthly Basic subscription tokens', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
GO

INSERT [dbo].[TokenTransactions] ([Id], [WalletId], [Amount], [Description], [Date]) VALUES (N'be763836-7d0a-48ef-20a9-08ddb5781595', N'6cf15283-e8af-4214-bd2b-8ff0763602a3', CAST(-40.00 AS Decimal(18, 2)), N'Purchased song: Shape of You', CAST(N'2025-06-27T12:42:31.9801358' AS DateTime2))
GO

INSERT [dbo].[TokenTransactions] ([Id], [WalletId], [Amount], [Description], [Date]) VALUES (N'e1fa4349-cca1-4695-642c-08ddb5781c91', N'7515ad25-2522-4a6f-8711-a6122757c3b8', CAST(100.00 AS Decimal(18, 2)), N'Monthly Basic subscription tokens', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
GO

INSERT [dbo].[TokenTransactions] ([Id], [WalletId], [Amount], [Description], [Date]) VALUES (N'5507ad29-dbba-4d79-642d-08ddb5781c91', N'7515ad25-2522-4a6f-8711-a6122757c3b8', CAST(-40.00 AS Decimal(18, 2)), N'Purchased song: Shape of You', CAST(N'2025-06-27T12:42:43.6979709' AS DateTime2))
GO

INSERT [dbo].[TokenTransactions] ([Id], [WalletId], [Amount], [Description], [Date]) VALUES (N'92b6f84d-84c1-47aa-4fca-08ddb578219b', N'a0bfbd52-743b-4531-90ba-3de7483f44e5', CAST(100.00 AS Decimal(18, 2)), N'Monthly Basic subscription tokens', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
GO

INSERT [dbo].[TokenTransactions] ([Id], [WalletId], [Amount], [Description], [Date]) VALUES (N'f01e9f1b-06e7-4e65-4fcb-08ddb578219b', N'a0bfbd52-743b-4531-90ba-3de7483f44e5', CAST(-40.00 AS Decimal(18, 2)), N'Purchased song: Shape of You', CAST(N'2025-06-27T12:42:52.1540175' AS DateTime2))
GO

INSERT [dbo].[TokenTransactions] ([Id], [WalletId], [Amount], [Description], [Date]) VALUES (N'5b938b67-e05f-4702-f3c0-08ddb57869cb', N'f2b99dc6-9f67-461a-a583-6cf1c03eaf64', CAST(100.00 AS Decimal(18, 2)), N'Monthly Basic subscription tokens', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
GO

INSERT [dbo].[TokenTransactions] ([Id], [WalletId], [Amount], [Description], [Date]) VALUES (N'8c30272c-5a62-4a0d-f3c1-08ddb57869cb', N'f2b99dc6-9f67-461a-a583-6cf1c03eaf64', CAST(-40.00 AS Decimal(18, 2)), N'Purchased song: Shape of You', CAST(N'2025-06-27T12:44:53.2690637' AS DateTime2))
GO

INSERT [dbo].[TokenTransactions] ([Id], [WalletId], [Amount], [Description], [Date]) VALUES (N'c0c9f116-f0fe-44b0-edf8-08ddb578d70a', N'60b00d09-1064-4273-a9f4-b0586174c7c4', CAST(100.00 AS Decimal(18, 2)), N'Monthly Basic subscription tokens', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
GO

INSERT [dbo].[TokenTransactions] ([Id], [WalletId], [Amount], [Description], [Date]) VALUES (N'560d4305-204d-4d3c-edf9-08ddb578d70a', N'60b00d09-1064-4273-a9f4-b0586174c7c4', CAST(-40.00 AS Decimal(18, 2)), N'Purchased song: Shape of You', CAST(N'2025-06-27T12:47:56.5513387' AS DateTime2))
GO

INSERT [dbo].[TokenTransactions] ([Id], [WalletId], [Amount], [Description], [Date]) VALUES (N'b98658df-3f0c-4e42-557c-08ddb81b8e05', N'273de9b8-ed33-46b6-977d-3deb6955af31', CAST(100.00 AS Decimal(18, 2)), N'Monthly Basic subscription tokens', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
GO

INSERT [dbo].[TokenTransactions] ([Id], [WalletId], [Amount], [Description], [Date]) VALUES (N'a0f30dab-22bb-4793-557d-08ddb81b8e05', N'273de9b8-ed33-46b6-977d-3deb6955af31', CAST(-40.00 AS Decimal(18, 2)), N'Purchased song: Shape of You', CAST(N'2025-06-30T21:17:44.3581579' AS DateTime2))
GO

INSERT [dbo].[TokenTransactions] ([Id], [WalletId], [Amount], [Description], [Date]) VALUES (N'587cb6e3-4b4c-4c51-4dc0-08ddb9765bce', N'9bd73cf0-5654-4a94-aa78-36636f01f3c2', CAST(100.00 AS Decimal(18, 2)), N'Monthly Basic subscription tokens', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
GO

INSERT [dbo].[TokenTransactions] ([Id], [WalletId], [Amount], [Description], [Date]) VALUES (N'8a8a8e8f-7cd9-44be-4dc1-08ddb9765bce', N'9bd73cf0-5654-4a94-aa78-36636f01f3c2', CAST(-40.00 AS Decimal(18, 2)), N'Purchased song: Shape of You', CAST(N'2025-07-02T14:40:15.4670899' AS DateTime2))
GO

INSERT [dbo].[UserPurchasedSongs] ([SongId], [UserId]) VALUES (N'9a4dcc7c-2658-4314-b841-0d842312e75d', N'a29bf1b9-b582-41ca-9371-1d6011847e52')
GO

INSERT [dbo].[UserPurchasedSongs] ([SongId], [UserId]) VALUES (N'9a4dcc7c-2658-4314-b841-0d842312e75d', N'db75b733-93ad-40a1-8b61-31768f29f349')
GO

INSERT [dbo].[UserPurchasedSongs] ([SongId], [UserId]) VALUES (N'9a4dcc7c-2658-4314-b841-0d842312e75d', N'6c4aff19-3600-432b-b969-45214e4df5ff')
GO

INSERT [dbo].[UserPurchasedSongs] ([SongId], [UserId]) VALUES (N'9a4dcc7c-2658-4314-b841-0d842312e75d', N'af4b8b98-6f95-4561-9a1e-50d897821b11')
GO

INSERT [dbo].[UserPurchasedSongs] ([SongId], [UserId]) VALUES (N'9a4dcc7c-2658-4314-b841-0d842312e75d', N'fd23789a-3f0a-4a79-a639-5919a97b26e3')
GO

INSERT [dbo].[UserPurchasedSongs] ([SongId], [UserId]) VALUES (N'9a4dcc7c-2658-4314-b841-0d842312e75d', N'ec69c2a9-9bd6-4964-9b01-5bee8720fdc2')
GO

INSERT [dbo].[UserPurchasedSongs] ([SongId], [UserId]) VALUES (N'9a4dcc7c-2658-4314-b841-0d842312e75d', N'b18a3fb5-e2ae-4938-b7a5-668f0b962f7e')
GO

INSERT [dbo].[UserPurchasedSongs] ([SongId], [UserId]) VALUES (N'9a4dcc7c-2658-4314-b841-0d842312e75d', N'0ad19552-c4fb-4431-b179-8c8b426ae500')
GO

INSERT [dbo].[UserPurchasedSongs] ([SongId], [UserId]) VALUES (N'9a4dcc7c-2658-4314-b841-0d842312e75d', N'e0205863-ff0c-4504-be06-9025f4afcf25')
GO

INSERT [dbo].[UserPurchasedSongs] ([SongId], [UserId]) VALUES (N'9a4dcc7c-2658-4314-b841-0d842312e75d', N'57ddfa5d-d33c-4645-8d3c-a10ae2e44317')
GO

INSERT [dbo].[UserPurchasedSongs] ([SongId], [UserId]) VALUES (N'9a4dcc7c-2658-4314-b841-0d842312e75d', N'14d76cbd-3a22-4880-ac0c-a40d02abbb27')
GO

INSERT [dbo].[UserPurchasedSongs] ([SongId], [UserId]) VALUES (N'9a4dcc7c-2658-4314-b841-0d842312e75d', N'cd8faf23-71ee-4e7f-b559-a6b01d0ed0a7')
GO

INSERT [dbo].[UserPurchasedSongs] ([SongId], [UserId]) VALUES (N'9a4dcc7c-2658-4314-b841-0d842312e75d', N'80595119-8969-47db-8b25-b6986620f168')
GO

INSERT [dbo].[UserPurchasedSongs] ([SongId], [UserId]) VALUES (N'9a4dcc7c-2658-4314-b841-0d842312e75d', N'38c944fe-d173-4572-9d28-baf73b47810f')
GO

INSERT [dbo].[UserPurchasedSongs] ([SongId], [UserId]) VALUES (N'9a4dcc7c-2658-4314-b841-0d842312e75d', N'3111ab22-d6d8-4dac-81cd-d94ce632a41c')
GO

INSERT [dbo].[UserPurchasedSongs] ([SongId], [UserId]) VALUES (N'9a4dcc7c-2658-4314-b841-0d842312e75d', N'04b6d3fc-3ba2-4a76-bfe0-db32ff4fb0a5')
GO

INSERT [dbo].[UserPurchasedSongs] ([SongId], [UserId]) VALUES (N'9a4dcc7c-2658-4314-b841-0d842312e75d', N'd27c92ae-2d1c-4426-b007-eb468a8a91bd')
GO

INSERT [dbo].[Users] ([Id], [Name]) VALUES (N'a29bf1b9-b582-41ca-9371-1d6011847e52', N'John Doe')
GO

INSERT [dbo].[Users] ([Id], [Name]) VALUES (N'db75b733-93ad-40a1-8b61-31768f29f349', N'Lotte')
GO

INSERT [dbo].[Users] ([Id], [Name]) VALUES (N'8b5f93dd-63d0-4a88-af8a-3762e4a4e12f', N'Chalsey')
GO

INSERT [dbo].[Users] ([Id], [Name]) VALUES (N'6c4aff19-3600-432b-b969-45214e4df5ff', N'Robin')
GO

INSERT [dbo].[Users] ([Id], [Name]) VALUES (N'af4b8b98-6f95-4561-9a1e-50d897821b11', N'Misha')
GO

INSERT [dbo].[Users] ([Id], [Name]) VALUES (N'd42c4fcb-a4ba-4d04-b57d-58c41f822b63', N'Chalsey')
GO

INSERT [dbo].[Users] ([Id], [Name]) VALUES (N'fd23789a-3f0a-4a79-a639-5919a97b26e3', N'John')
GO

INSERT [dbo].[Users] ([Id], [Name]) VALUES (N'ec69c2a9-9bd6-4964-9b01-5bee8720fdc2', N'Cole')
GO

INSERT [dbo].[Users] ([Id], [Name]) VALUES (N'b18a3fb5-e2ae-4938-b7a5-668f0b962f7e', N'Drake')
GO

INSERT [dbo].[Users] ([Id], [Name]) VALUES (N'0ad19552-c4fb-4431-b179-8c8b426ae500', N'Viola')
GO

INSERT [dbo].[Users] ([Id], [Name]) VALUES (N'e0205863-ff0c-4504-be06-9025f4afcf25', N'T')
GO

INSERT [dbo].[Users] ([Id], [Name]) VALUES (N'57ddfa5d-d33c-4645-8d3c-a10ae2e44317', N'Peter Parker')
GO

INSERT [dbo].[Users] ([Id], [Name]) VALUES (N'14d76cbd-3a22-4880-ac0c-a40d02abbb27', N'Harry')
GO

INSERT [dbo].[Users] ([Id], [Name]) VALUES (N'cd8faf23-71ee-4e7f-b559-a6b01d0ed0a7', N'Jin')
GO

INSERT [dbo].[Users] ([Id], [Name]) VALUES (N'9fc26e64-e1f4-484f-ae2f-b2cffb5e7645', N'Ginny')
GO

INSERT [dbo].[Users] ([Id], [Name]) VALUES (N'80595119-8969-47db-8b25-b6986620f168', N'Marco')
GO

INSERT [dbo].[Users] ([Id], [Name]) VALUES (N'38c944fe-d173-4572-9d28-baf73b47810f', N'Lilly')
GO

INSERT [dbo].[Users] ([Id], [Name]) VALUES (N'3111ab22-d6d8-4dac-81cd-d94ce632a41c', N'Doornroosje')
GO

INSERT [dbo].[Users] ([Id], [Name]) VALUES (N'04b6d3fc-3ba2-4a76-bfe0-db32ff4fb0a5', N'Tara')
GO

INSERT [dbo].[Users] ([Id], [Name]) VALUES (N'd27c92ae-2d1c-4426-b007-eb468a8a91bd', N'Lola')
GO

INSERT [dbo].[Wallets] ([Id], [Balance], [UserId]) VALUES (N'e87cfe90-74a8-427e-8e4d-07434ce77eb7', 60, N'3111ab22-d6d8-4dac-81cd-d94ce632a41c')
GO

INSERT [dbo].[Wallets] ([Id], [Balance], [UserId]) VALUES (N'98850df4-b36b-47f3-b64b-1cb1098f634d', 60, N'b18a3fb5-e2ae-4938-b7a5-668f0b962f7e')
GO

INSERT [dbo].[Wallets] ([Id], [Balance], [UserId]) VALUES (N'09afba9b-d27e-432d-9aca-1d4298050111', 0, N'8b5f93dd-63d0-4a88-af8a-3762e4a4e12f')
GO

INSERT [dbo].[Wallets] ([Id], [Balance], [UserId]) VALUES (N'648416ce-dfc4-49a0-bde9-26b284fa6511', 60, N'fd23789a-3f0a-4a79-a639-5919a97b26e3')
GO

INSERT [dbo].[Wallets] ([Id], [Balance], [UserId]) VALUES (N'c32d8308-d5b6-4aa1-9a90-33fd2ae1abf1', 60, N'04b6d3fc-3ba2-4a76-bfe0-db32ff4fb0a5')
GO

INSERT [dbo].[Wallets] ([Id], [Balance], [UserId]) VALUES (N'9bd73cf0-5654-4a94-aa78-36636f01f3c2', 60, N'a29bf1b9-b582-41ca-9371-1d6011847e52')
GO

INSERT [dbo].[Wallets] ([Id], [Balance], [UserId]) VALUES (N'a0bfbd52-743b-4531-90ba-3de7483f44e5', 60, N'af4b8b98-6f95-4561-9a1e-50d897821b11')
GO

INSERT [dbo].[Wallets] ([Id], [Balance], [UserId]) VALUES (N'273de9b8-ed33-46b6-977d-3deb6955af31', 60, N'd27c92ae-2d1c-4426-b007-eb468a8a91bd')
GO

INSERT [dbo].[Wallets] ([Id], [Balance], [UserId]) VALUES (N'a65a672e-7d48-4cf0-9768-432494b881d6', 60, N'38c944fe-d173-4572-9d28-baf73b47810f')
GO

INSERT [dbo].[Wallets] ([Id], [Balance], [UserId]) VALUES (N'f2b99dc6-9f67-461a-a583-6cf1c03eaf64', 60, N'14d76cbd-3a22-4880-ac0c-a40d02abbb27')
GO

INSERT [dbo].[Wallets] ([Id], [Balance], [UserId]) VALUES (N'ce8ce813-3485-42da-8605-6facf57a8848', 60, N'6c4aff19-3600-432b-b969-45214e4df5ff')
GO

INSERT [dbo].[Wallets] ([Id], [Balance], [UserId]) VALUES (N'efa09136-f53a-4ce2-9ba1-8759ed343dca', 60, N'0ad19552-c4fb-4431-b179-8c8b426ae500')
GO

INSERT [dbo].[Wallets] ([Id], [Balance], [UserId]) VALUES (N'94ba97f9-6267-48d9-9460-8bc197902616', 60, N'80595119-8969-47db-8b25-b6986620f168')
GO

INSERT [dbo].[Wallets] ([Id], [Balance], [UserId]) VALUES (N'75a37f91-a197-44d9-a67b-8ecdcb319b64', 0, N'9fc26e64-e1f4-484f-ae2f-b2cffb5e7645')
GO

INSERT [dbo].[Wallets] ([Id], [Balance], [UserId]) VALUES (N'6cf15283-e8af-4214-bd2b-8ff0763602a3', 60, N'e0205863-ff0c-4504-be06-9025f4afcf25')
GO

INSERT [dbo].[Wallets] ([Id], [Balance], [UserId]) VALUES (N'e2bee17c-a2ee-4a04-94da-999021cac118', 60, N'57ddfa5d-d33c-4645-8d3c-a10ae2e44317')
GO

INSERT [dbo].[Wallets] ([Id], [Balance], [UserId]) VALUES (N'7515ad25-2522-4a6f-8711-a6122757c3b8', 60, N'cd8faf23-71ee-4e7f-b559-a6b01d0ed0a7')
GO

INSERT [dbo].[Wallets] ([Id], [Balance], [UserId]) VALUES (N'25d7f92f-20b3-4cc8-b1bc-a8ea3f4b663b', 60, N'ec69c2a9-9bd6-4964-9b01-5bee8720fdc2')
GO

INSERT [dbo].[Wallets] ([Id], [Balance], [UserId]) VALUES (N'60b00d09-1064-4273-a9f4-b0586174c7c4', 60, N'db75b733-93ad-40a1-8b61-31768f29f349')
GO

INSERT [dbo].[Wallets] ([Id], [Balance], [UserId]) VALUES (N'14febe1a-663a-47cd-89b0-f8e034302710', 0, N'd42c4fcb-a4ba-4d04-b57d-58c41f822b63')
GO

USE [master]
GO

ALTER DATABASE [MusicStreamingPlatform] SET  READ_WRITE
GO
