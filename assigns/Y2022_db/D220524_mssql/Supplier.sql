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

 Date: 26/05/2022 13:46:14
*/


-- ----------------------------
-- Table structure for Supplier
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Supplier]') AND type IN ('U'))
	DROP TABLE [dbo].[Supplier]
GO

CREATE TABLE [dbo].[Supplier] (
  [Supplier_Name] varchar(30) COLLATE Chinese_PRC_CI_AS  NOT NULL
)
GO

ALTER TABLE [dbo].[Supplier] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Supplier
-- ----------------------------
INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Abtey')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Beech''s Fine Chocolates')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Belberry')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Belcolade')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Belgian  Butters')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Ben''s Couture')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Bianca Chocolate')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Biscuits By Jen')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Bostani')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Brioche Pasquier')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Bristows')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'British Foods')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Butlers')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Caluwe Artisan')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Cartwright and Butler')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Cavalier')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Choc Stars')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Chocolate and Love')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Chocolatree')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Colac')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Comfort Piping Bags')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Crops')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Davies')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Davies Chocolates')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Decorations Unlimited')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Diabolic')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Dobla?under?Decorations')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Dolfin')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Droste')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Duncans of Deeside')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Elegent Chocolates')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Elfin''s Homemade')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Furniss')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Gourmand')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Grande Catering Supplies')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Green Dream')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Hats R Us')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Heindl')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Heinze')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Ickx')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Inhouse Production')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Jansen')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'JJ Food Service')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'King Monty')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'La Delicieuse')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Lamaros')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Leman Artisanal Decorations')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Luxardo')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Mackays')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Mademoiselle de Margaux')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Mol dárt')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Moutarde de Meaux')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Neuszer Stolz')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'New English Tea')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Niederegger')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Noble')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Peddling Pastry')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Perlege')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Pernigotti')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Pidy')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Poppies')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Puratos')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Roka')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Roma Truffles')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Rosetta''s')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Royal Preserve')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Salmiac')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Schlunder')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Stollenwerk')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Sweet Meadow')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Sweet Switch')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Sweets Without')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Tilleys')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Timson')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Top Jam')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Trefin')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Van Coillie')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Vandemoortele')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Vegter')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Villars')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Willies Cacao')
GO

INSERT INTO [dbo].[Supplier] ([Supplier_Name]) VALUES (N'Zucceroo')
GO


-- ----------------------------
-- Primary Key structure for table Supplier
-- ----------------------------
ALTER TABLE [dbo].[Supplier] ADD CONSTRAINT [PK__Supplier__C919E829CF23E65F] PRIMARY KEY CLUSTERED ([Supplier_Name])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO

