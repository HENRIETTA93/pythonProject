/*
 Navicat Premium Data Transfer

 Source Server         : mssql
 Source Server Type    : SQL Server
 Source Server Version : 15002000
 Source Host           : localhost:1433
 Source Catalog        : retail
 Source Schema         : dbo

 Target Server Type    : SQL Server
 Target Server Version : 15002000
 File Encoding         : 65001

 Date: 26/05/2022 13:46:41
*/


-- ----------------------------
-- Table structure for Product_Category
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Product_Category]') AND type IN ('U'))
	DROP TABLE [dbo].[Product_Category]
GO

CREATE TABLE [dbo].[Product_Category] (
  [Category_Name] varchar(30) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [Service_Type] varchar(30) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[Product_Category] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Product_Category
-- ----------------------------
INSERT INTO [dbo].[Product_Category] ([Category_Name], [Service_Type]) VALUES (N'Biscuits', N'Food Service')
GO

INSERT INTO [dbo].[Product_Category] ([Category_Name], [Service_Type]) VALUES (N'Bread', N'Frozen')
GO

INSERT INTO [dbo].[Product_Category] ([Category_Name], [Service_Type]) VALUES (N'Cake Slices', N'Imported Loose Chocolates')
GO

INSERT INTO [dbo].[Product_Category] ([Category_Name], [Service_Type]) VALUES (N'Canapes', N'Food Service')
GO

INSERT INTO [dbo].[Product_Category] ([Category_Name], [Service_Type]) VALUES (N'Candy', N'Imported Loose Chocolates')
GO

INSERT INTO [dbo].[Product_Category] ([Category_Name], [Service_Type]) VALUES (N'Chocolate', N'Imported Loose Chocolates')
GO

INSERT INTO [dbo].[Product_Category] ([Category_Name], [Service_Type]) VALUES (N'Chocolate Bars', N'Retail Product')
GO

INSERT INTO [dbo].[Product_Category] ([Category_Name], [Service_Type]) VALUES (N'Chocolate Boxed', N'Retail Product')
GO

INSERT INTO [dbo].[Product_Category] ([Category_Name], [Service_Type]) VALUES (N'Condiments', N'Retail Product')
GO

INSERT INTO [dbo].[Product_Category] ([Category_Name], [Service_Type]) VALUES (N'Confectionery', N'Retail Product')
GO

INSERT INTO [dbo].[Product_Category] ([Category_Name], [Service_Type]) VALUES (N'Croissants', N'Frozen')
GO

INSERT INTO [dbo].[Product_Category] ([Category_Name], [Service_Type]) VALUES (N'Cupcakes', N'Imported Loose Chocolates')
GO

INSERT INTO [dbo].[Product_Category] ([Category_Name], [Service_Type]) VALUES (N'Cutlery', N'Equipment')
GO

INSERT INTO [dbo].[Product_Category] ([Category_Name], [Service_Type]) VALUES (N'Dark Chocolate', N'Imported Loose Chocolates')
GO

INSERT INTO [dbo].[Product_Category] ([Category_Name], [Service_Type]) VALUES (N'Decorations', N'Decorations')
GO

INSERT INTO [dbo].[Product_Category] ([Category_Name], [Service_Type]) VALUES (N'Equipment', N'Equipment')
GO

INSERT INTO [dbo].[Product_Category] ([Category_Name], [Service_Type]) VALUES (N'Fillings', N'Patisserie')
GO

INSERT INTO [dbo].[Product_Category] ([Category_Name], [Service_Type]) VALUES (N'Flavourings', N'Patisserie')
GO

INSERT INTO [dbo].[Product_Category] ([Category_Name], [Service_Type]) VALUES (N'Gelato Ingredients', N'Patisserie')
GO

INSERT INTO [dbo].[Product_Category] ([Category_Name], [Service_Type]) VALUES (N'Gourmet Foods', N'Retail Product')
GO

INSERT INTO [dbo].[Product_Category] ([Category_Name], [Service_Type]) VALUES (N'Hats', N'Equipment')
GO

INSERT INTO [dbo].[Product_Category] ([Category_Name], [Service_Type]) VALUES (N'Jam', N'Food Service')
GO

INSERT INTO [dbo].[Product_Category] ([Category_Name], [Service_Type]) VALUES (N'Liners', N'Packaging')
GO

INSERT INTO [dbo].[Product_Category] ([Category_Name], [Service_Type]) VALUES (N'Macarons', N'Food Service')
GO

INSERT INTO [dbo].[Product_Category] ([Category_Name], [Service_Type]) VALUES (N'Milk Chocolate', N'Imported Loose Chocolates')
GO

INSERT INTO [dbo].[Product_Category] ([Category_Name], [Service_Type]) VALUES (N'No Sugar Added', N'Retail Product')
GO

INSERT INTO [dbo].[Product_Category] ([Category_Name], [Service_Type]) VALUES (N'Packaging', N'Packaging')
GO

INSERT INTO [dbo].[Product_Category] ([Category_Name], [Service_Type]) VALUES (N'Pastries', N'Frozen')
GO

INSERT INTO [dbo].[Product_Category] ([Category_Name], [Service_Type]) VALUES (N'Pick and Mix', N'Retail Product')
GO

INSERT INTO [dbo].[Product_Category] ([Category_Name], [Service_Type]) VALUES (N'Pipping Bags', N'Equipment')
GO

INSERT INTO [dbo].[Product_Category] ([Category_Name], [Service_Type]) VALUES (N'Puree', N'Frozen')
GO

INSERT INTO [dbo].[Product_Category] ([Category_Name], [Service_Type]) VALUES (N'Sauces', N'Patisserie')
GO

INSERT INTO [dbo].[Product_Category] ([Category_Name], [Service_Type]) VALUES (N'Seashells', N'Imported Loose Chocolates')
GO

INSERT INTO [dbo].[Product_Category] ([Category_Name], [Service_Type]) VALUES (N'Sugar', N'Food Service')
GO

INSERT INTO [dbo].[Product_Category] ([Category_Name], [Service_Type]) VALUES (N'T-Shirt', N'Equipment')
GO

INSERT INTO [dbo].[Product_Category] ([Category_Name], [Service_Type]) VALUES (N'White Chocolate', N'Imported Loose Chocolates')
GO


-- ----------------------------
-- Primary Key structure for table Product_Category
-- ----------------------------
ALTER TABLE [dbo].[Product_Category] ADD CONSTRAINT [PK__Product___B35EB4183E304DA0] PRIMARY KEY CLUSTERED ([Category_Name])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO

