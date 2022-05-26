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

 Date: 26/05/2022 13:46:49
*/


-- ----------------------------
-- Table structure for Product
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Product]') AND type IN ('U'))
	DROP TABLE [dbo].[Product]
GO

CREATE TABLE [dbo].[Product] (
  [Product_ID] varchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [Product_Desc] text COLLATE Chinese_PRC_CI_AS  NULL,
  [Discontinued] char(3) COLLATE Chinese_PRC_CI_AS  NULL,
  [Supplier_Name] varchar(30) COLLATE Chinese_PRC_CI_AS  NULL,
  [Unit_Price] float(53)  NULL,
  [Website] text COLLATE Chinese_PRC_CI_AS  NULL,
  [Category_Name] varchar(30) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[Product] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Product
-- ----------------------------
INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'100 Large Box Liners', N'100 Large Box Liners', N'No ', N'Grande Catering Supplies', N'12.5', N'https://CGSuppliers.com.nl', N'Liners')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'100 Medium Box Liners', N'100 Medium Box Liners', N'No ', N'Grande Catering Supplies', N'12.5', N'https://CGSuppliers.com.nl', N'Liners')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'100 Small Box Liners', N'100 Small Box Liners', N'No ', N'Grande Catering Supplies', N'12.5', N'https://CGSuppliers.com.nl', N'Liners')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'250 Large Box Liners', N'250 Large Box Liners', N'No ', N'Grande Catering Supplies', N'22', N'https://CGSuppliers.com.nl', N'Liners')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'250 Medium Box Liners', N'250 Medium Box Liners', N'No ', N'Grande Catering Supplies', N'22', N'https://CGSuppliers.com.nl', N'Liners')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'250 Small Box Liners', N'250 Small Box Liners', N'No ', N'Grande Catering Supplies', N'22', N'https://CGSuppliers.com.nl', N'Liners')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'50 Large Box Liners', N'50 Large Box Liners', N'No ', N'Grande Catering Supplies', N'7.5', N'https://CGSuppliers.com.nl', N'Liners')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'50 Medium Box Liners', N'50 Medium Box Liners', N'No ', N'Grande Catering Supplies', N'7.5', N'https://CGSuppliers.com.nl', N'Liners')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'50 Small Box Liners', N'50 Small Box Liners', N'No ', N'Grande Catering Supplies', N'7.5', N'https://CGSuppliers.com.nl', N'Liners')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'ABT16851', N'190g / 16 “Excellence Griottes” Dark chocolate with soft heart filled with Griottes', N'Yes', N'Abtey', N'26.7', N'https://www.abtey.fr/', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'ABT20858', N'250g / 20 “Royal des Lys” Liqueur Assortment Dark Chocolates', N'Yes', N'Abtey', N'68.15', N'https://www.abtey.fr/', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'APR3000IN', N'3kg Sea Shells Bulk ', N'No ', N'Trefin', N'45.8', N'https://www.trefin.com/', N'Seashells')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'APR3400IN', N'2kg Sea Shells Bulk ', N'No ', N'Trefin', N'78.65', N'https://www.trefin.com/', N'Seashells')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'APR3500IN', N'1kg Sea Shells Bulk ', N'No ', N'Trefin', N'39.8', N'https://www.trefin.com/', N'Seashells')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BEE132', N'90g Say It With Chocolates Thank You Assorted', N'No ', N'Beech''s Fine Chocolates', N'47.15', N'https://beechsfinechocolates.com/', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BEE133', N'90g Say It With Chocolates Happy Birthday Assorted', N'No ', N'Beech''s Fine Chocolates', N'65.05', N'https://beechsfinechocolates.com/', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BEE137', N'90g Say It With Chocolates I Love You   Assorted', N'No ', N'Beech''s Fine Chocolates', N'39.45', N'https://beechsfinechocolates.com/', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BEE155', N'150g Turkish Delight These are a chocolate delight that promises a true taste of the East. The natural rose flavour blends perfectly with the thick velvety milk chocolate for a real Turkish Delight. Beech’s Turkish Delight has a slightly firmer centre with a gorgeous rose flavour and the milk chocolate casing just melts in your mouth. The thicker layer of chocolate and the firmer texture makes this one of our customers’ all time favourites and it has remained the same for decades.', N'No ', N'Beech''s Fine Chocolates', N'35.4', N'https://beechsfinechocolates.com/', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BEE1555', N'250g Turkish Delight These are a chocolate delight that promises a true taste of the East. The natural rose flavour blends perfectly with the thick velvety milk chocolate for a real Turkish Delight. Beech’s Turkish Delight has a slightly firmer centre with a gorgeous rose flavour and the milk chocolate casing just melts in your mouth. The thicker layer of chocolate and the firmer texture makes this one of our customers’ all time favourites and it has remained the same for decades.', N'No ', N'Beech''s Fine Chocolates', N'71.7', N'https://beechsfinechocolates.com/', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BEE165', N'100g Ginger Chocolates Dark Dark chocolates with stem ginger centres.', N'No ', N'Beech''s Fine Chocolates', N'56.7', N'https://beechsfinechocolates.com/', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BEE211', N'150g Mint Chocolate Crisps Dark Chocolate', N'No ', N'Beech''s Fine Chocolates', N'46.4', N'https://beechsfinechocolates.com/', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BEE221', N'90g Ginger Creams Dark Chocolate ', N'No ', N'Beech''s Fine Chocolates', N'13.3', N'https://beechsfinechocolates.com/', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BEE222', N'90g Rose Creams Dark Chocolate ', N'No ', N'Beech''s Fine Chocolates', N'14.5', N'https://beechsfinechocolates.com/', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BEE2222', N'190g Rose Creams Dark Chocolate ', N'No ', N'Beech''s Fine Chocolates', N'31.75', N'https://beechsfinechocolates.com/', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BEE223', N'90g Violet Creams Dark Chocolate ', N'No ', N'Beech''s Fine Chocolates', N'16.45', N'https://beechsfinechocolates.com/', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BEE401', N'90g Mint Creams Dark Chocolate ', N'No ', N'Beech''s Fine Chocolates', N'54.5', N'https://beechsfinechocolates.com/', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BEL20B15 ', N'15kg Belcolade Baking Chunks Dark 51% U1800pc/kg ', N'No ', N'Belcolade', N'58.3', N'https://www.belcolade.com/', N'Fillings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BEL20B1IN ', N'1kg Belcolade Baking Chunks Dark 51% U 2000pc/kg ', N'No ', N'Belcolade', N'80.45', N'https://www.belcolade.com/', N'Fillings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BEL22B15 ', N'15kg Belcolade Baking Chunks White 23% RA 1800pc/kg ', N'No ', N'Belcolade', N'23.8', N'https://www.belcolade.com/', N'Fillings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BEL30B15 ', N'15kg Belcolade Baking Grains Dark 51%K20 20000pc/kg ', N'No ', N'Belcolade', N'20.05', N'https://www.belcolade.com/', N'Fillings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BEL31K10', N'10kg Belcolade Chocolate Grains Dark', N'No ', N'Belcolade', N'82.85', N'https://www.belcolade.com/en', N'Dark Chocolate')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BEL35K10B5', N'5kg Belcolade Chocolate Grains Milk', N'No ', N'Belcolade', N'21.75', N'https://www.belcolade.com/en', N'Milk Chocolate')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BEL501PARJB15', N'Belcolade Drops Dark 55% Dairy Free', N'No ', N'Belcolade', N'65.5', N'https://www.belcolade.com/en', N'Dark Chocolate')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BELCRF12 ', N'12kg (4×3kg) Cryst-O-Fil Dark 53% Chocolate ', N'No ', N'Belcolade', N'31.05', N'https://www.belcolade.com/', N'Fillings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BELCRF15 ', N'15kg Cryst-O-Fil Dark 53% Chocolate ', N'No ', N'Belcolade', N'96.85', N'https://www.belcolade.com/', N'Fillings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BELCRW15 ', N'15kg Cryst-O-Fil White 55% Chocolate ', N'No ', N'Belcolade', N'26.8', N'https://www.belcolade.com/', N'Fillings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BELCT065JB155', N'5kg Belcolade Cacao-Trace Drops Dark 65%', N'No ', N'Belcolade', N'51.95', N'https://www.belcolade.com/en', N'Dark Chocolate')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BELCT3X5J', N'10kg Belcolade Cacao Trace Drops Milk 34%', N'No ', N'Belcolade', N'20.2', N'https://www.belcolade.com/en', N'Milk Chocolate')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BELCT501J', N'10kg Belcolade Cacao Trace Drops Dark 55% ', N'No ', N'Belcolade', N'29.5', N'https://www.belcolade.com/en', N'Dark Chocolate')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BELCT501JB15', N'15kg Belcolade Cacao-Trace Drops Dark 55.5% J', N'No ', N'Belcolade', N'77.15', N'https://www.belcolade.com/en', N'Dark Chocolate')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BELCT516G', N'10kg (2x5kg) Belcolade Cacao-Trace Drops 28.5% White G', N'No ', N'Belcolade', N'28.65', N'https://www.belcolade.com/en', N'White Chocolate')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BELTSBL', N'Belcolade T-Shirt Brown Large', N'Yes', N'Belcolade', N'29.99', N'belcoladefashion.com.uk', N'T-Shirt')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BELTSBM', N'Belcolade T-Shirt Brown Medium', N'Yes', N'Belcolade', N'29.99', N'belcoladefashion.com.uk', N'T-Shirt')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BELTSBS', N'Belcolade T-Shirt Brown Small', N'Yes', N'Belcolade', N'29.99', N'belcoladefashion.com.uk', N'T-Shirt')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BELTSBX', N'Belcolade T-Shirt Brown Xlarge', N'Yes', N'Belcolade', N'29.99', N'belcoladefashion.com.uk', N'T-Shirt')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BIA1175', N'175g Truffles Caramel ', N'Yes', N'Bianca Chocolate', N'30.5', NULL, N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BIA2275', N'175g Truffles Extra Dark ', N'Yes', N'Bianca Chocolate', N'16', NULL, N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BIA3275', N'175g Forest Fruits ', N'Yes', N'Bianca Chocolate', N'39.45', NULL, N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BIA4275', N'175g Truffles Mint ', N'Yes', N'Bianca Chocolate', N'22.45', NULL, N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BIA5200', N'200g Premium Selection Assorted Gold assortment of Belgian chocolates', N'Yes', N'Bianca Chocolate', N'47.35', NULL, N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BLB201', N'Strawberry Preserve (12 Jars, 185g)', N'No ', N'Belberry', N'52.5', N'https://www.belberry.com/', N'Jam')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BLB2010', N'200gm jar of Strawberry Preserves', N'Yes', N'Royal Preserve', N'8', N'royalpreservefoods.org', N'Condiments')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BLB2012', N'200gm jar of Cherry Preserves', N'Yes', N'Royal Preserve', N'8', N'royalpreservefoods.org', N'Condiments')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BLB2013', N'200gm jar of Apricort Preserves', N'Yes', N'Royal Preserve', N'8', N'royalpreservefoods.org', N'Condiments')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BLB2014', N'200gm jar of Lime and Pineapple Preserves', N'Yes', N'Royal Preserve', N'8', N'royalpreservefoods.org', N'Condiments')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BLB2016', N'200gm jar of Blackberry Preserves', N'Yes', N'Royal Preserve', N'8', N'royalpreservefoods.org', N'Condiments')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BLB2017', N'200gm jar of Blood Orange Preserves', N'Yes', N'Royal Preserve', N'8', N'royalpreservefoods.org', N'Condiments')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BLB203', N'Apricot Preserve (12 Jars, 185g)', N'No ', N'Belberry', N'13', N'https://www.belberry.com/', N'Jam')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BLB205', N'Blackberry Preserve (12 Jars, 185g)', N'No ', N'Belberry', N'24', N'https://www.belberry.com/', N'Jam')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BLB207', N'Raspberry Preserve (12 Jars, 185g)', N'No ', N'Belberry', N'12', N'https://www.belberry.com/', N'Jam')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BLB209', N'Morello Cherry Preserve (12 Jars, 185g)', N'No ', N'Belberry', N'44', N'https://www.belberry.com/', N'Jam')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BLB218', N'4 Fruits Preserve (12 Jars, 185g)', N'No ', N'Belberry', N'91.5', N'https://www.belberry.com/', N'Jam')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BLB227', N'Fig & Port Preserve (12 Jars, 185g)', N'No ', N'Belberry', N'48.5', N'https://www.belberry.com/', N'Jam')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BOD5043JUZ', N'2.75kg Apple Bonbons', N'No ', N'Bristows', N'18.5', N'bristows.com.au', N'Pick and Mix')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BOD5043JUZ4', N'2.75kg Chocolate Bonbons', N'No ', N'Bristows', N'68.45', N'bristows.com.au', N'Pick and Mix')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BOD5043JUZ5', N'2.75kg Vanilla Bonbons', N'No ', N'Bristows', N'65.25', N'bristows.com.au', N'Pick and Mix')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BOD5043JUZ6', N'2kg Liquorice Brown Coins', N'Yes', N'British Foods', N'99.55', N'https://britishfoods.com.uk', N'Pick and Mix')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BOD5043JUZ7', N'2kg Caramel Liquorice Sticks', N'Yes', N'British Foods', N'99.55', N'https://britishfoods.com.uk', N'Pick and Mix')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BOD5043JUZ8', N'2kg Groitten', N'Yes', N'British Foods', N'99.55', N'https://britishfoods.com.uk', N'Pick and Mix')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BOD5043JUZ9', N'2kg Liquorice Brown Coins', N'Yes', N'British Foods', N'99.55', N'https://britishfoods.com.uk', N'Pick and Mix')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'Box for 1 Chocolate White 35mm x 35mm x 27mm', N'Box for 1 Chocolate White 35mm x 35mm x 27mm', N'No ', N'Inhouse Production', N'2', N'https://apromotrading.com.au/', N'Packaging')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'Box for 16 Chocolate Grey 35mm x 35mm x 27mm', N'Box for 16 Chocolate Grey 35mm x 35mm x 27mm', N'No ', N'Inhouse Production', N'20', NULL, N'Packaging')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'Box for 16 Chocolate White 35mm x 35mm x 27mm', N'Box for 16 Chocolate White 35mm x 35mm x 27mm', N'No ', N'Inhouse Production', N'20', N'https://apromotrading.com.au/', N'Packaging')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'Box for 2 Chocolate White 35mm x 35mm x 27mm', N'Box for 2 Chocolate White 35mm x 35mm x 27mm', N'No ', N'Inhouse Production', N'3', N'https://apromotrading.com.au/', N'Packaging')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'Box for 4 Chocolate White 35mm x 35mm x 27mm', N'Box for 4 Chocolate White 35mm x 35mm x 27mm', N'Yes', N'Inhouse Production', N'6', N'https://apromotrading.com.au/', N'Packaging')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'Box for 50 Chocolate Grey 35mm x 35mm x 27mm', N'Box for 50 Chocolate Grey 35mm x 35mm x 27mm', N'Yes', N'Inhouse Production', N'40', NULL, N'Packaging')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'Box for 50 Chocolate White 35mm x 35mm x 27mm', N'Box for 50 Chocolate White 35mm x 35mm x 27mm', N'Yes', N'Inhouse Production', N'40', N'https://apromotrading.com.au/', N'Packaging')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'Box for 8 Chocolate Grey 35mm x 35mm x 27mm', N'Box for 8 Chocolate Grey 35mm x 35mm x 27mm', N'No ', N'Inhouse Production', N'10', NULL, N'Packaging')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'Box for 8 Chocolate White 35mm x 35mm x 27mm', N'Box for 8 Chocolate White 35mm x 35mm x 27mm', N'Yes', N'Inhouse Production', N'10', N'https://apromotrading.com.au/', N'Packaging')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BST2869 ', N'120g Pouch Thin and Filled with Dark Milk Chocolate ', N'No ', N'Bostani', N'263.65', N'https://www.bostanichocolate.com/en-e', N'Confectionery')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BST2870', N'120g Pouch Thin and Filled with Caramel Milk Chocolate ', N'No ', N'Bostani', N'90.2', N'https://www.bostanichocolate.com/en-e', N'Confectionery')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BST2871', N'120g Pouch Thin and Filled with Milk Chocolate ', N'No ', N'Bostani', N'23.75', N'https://www.bostanichocolate.com/en-e', N'Confectionery')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BST2872', N'120g Pouch Thin and Filled with Strawberry', N'Yes', N'Bostani', N'216.9', N'https://www.bostanichocolate.com/en-e', N'Confectionery')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BST2873', N'120g Pouch Thin and Filled with Mint', N'Yes', N'Bostani', N'243.25', N'https://www.bostanichocolate.com/en-e', N'Confectionery')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BST2874', N'120g Pouch Thin and Filled with Pineapple', N'No ', N'Bostani', N'102.4', N'https://www.bostanichocolate.com/en-e', N'Confectionery')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BST28744', N'120g Pouch Thin and Filled with Marshmellow', N'No ', N'Bostani', N'62.1', N'https://www.bostanichocolate.com/en-e', N'Confectionery')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BST2875', N'120g Pouch Thin and Filled with Honey Crunch', N'No ', N'Bostani', N'190.15', N'https://www.bostanichocolate.com/en-e', N'Confectionery')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BST28799', N'120g Pouch Thin and Filled with Fudge', N'Yes', N'Bostani', N'205.25', N'https://www.bostanichocolate.com/en-e', N'Confectionery')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BTL192', N'200g Butlers Flake Truffles Milk Powder Puff Box Milk Chocolate', N'Yes', N'Butlers', N'90.25', N'https://www.butlerschocolates.com/en/?cCode=IE', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BTL195', N'200g Butlers Truffle Mac De Champ White Powder Puff Box White Chocolate', N'No ', N'Butlers', N'15.15', N'https://www.butlerschocolates.com/en/?cCode=IE', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BTL196', N'200g Butlers Truffle 70% Powder Puff 70% Cocoa Solids Dark Chocolate', N'No ', N'Butlers', N'18.4', N'https://www.butlerschocolates.com/en/?cCode=IE', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BTL323', N'170g Butlers Chocolate Caramels and Hazelnut Pralines Milk Chocolate', N'No ', N'Butlers', N'41.7', N'https://www.butlerschocolates.com/en/?cCode=IE', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BTL324', N'170g Butlers Chocolate Mint and Fondants Dark Chocolate', N'No ', N'Butlers', N'32.75', N'https://www.butlerschocolates.com/en/?cCode=IE', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BTL325', N'170g Butlers Chocolate Salt Caramels Dark Chocolate', N'Yes', N'Butlers', N'14.5', N'https://www.butlerschocolates.com/en/?cCode=IE', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BTL326', N'170g Butlers Chocolate Honeycomb Crisp Milk Chocolate', N'No ', N'Butlers', N'53.5', N'https://www.butlerschocolates.com/en/?cCode=IE', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BTL611', N'125g Butlers Famous Irish Assortment ', N'No ', N'Butlers', N'85.1', N'https://www.butlerschocolates.com/en/?cCode=IE', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BTL611D18', N'18 x 100g Butlers Bars Butterscotch Milk Chocolate', N'No ', N'Butlers', N'133.85', N'https://www.butlerschocolates.com/en/?cCode=IE', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BTL612D18', N'18 x 100g Butlers Bars Honeycomb Crunch Milk Chocolate', N'Yes', N'Butlers', N'102.15', N'https://www.butlerschocolates.com/en/?cCode=IE', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BTL613D18', N'18 x 100g Butlers Bars Mixed Berries White Chocolate', N'Yes', N'Butlers', N'126.8', N'https://www.butlerschocolates.com/en/?cCode=IE', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BTL615D18', N'18 x 100g Butlers Bars Dark Chocolate 70% Cocoa Solids', N'No ', N'Butlers', N'99.5', N'https://www.butlerschocolates.com/en/?cCode=IE', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BTL616D18', N'18 x 100g Butlers Bars Hazelnut Milk Chocolate', N'No ', N'Butlers', N'118.85', N'https://www.butlerschocolates.com/en/?cCode=IE', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BTL617D18', N'18 x 100g Butlers Bars Mint Dark Chocolate', N'No ', N'Butlers', N'187.35', N'https://www.butlerschocolates.com/en/?cCode=IE', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BTL660', N'250g / 20 Mini Bars Collection', N'No ', N'Butlers', N'47.9', N'https://www.butlerschocolates.com/en/?cCode=IE', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BTL804', N'125g Butlers Truffles Irish Cream ', N'Yes', N'Butlers', N'75.65', N'https://www.butlerschocolates.com/en/?cCode=IE', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BTL806', N'125g Butlers Truffles Irish Whiskey ', N'No ', N'Butlers', N'2.2', N'https://www.butlerschocolates.com/en/?cCode=IE', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BUT1088#', N'1.8kg / 216 Florentine Chocolate Assorted ', N'Yes', N'Belgian  Butters', N'74.5', N'https://www.destrooper-olivier.com/', N'Biscuits')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BUT2041#', N'1.44kg / 144 Petit Fours Assorted ', N'No ', N'Belgian  Butters', N'19', N'https://www.destrooper-olivier.com/', N'Biscuits')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'BUT5413#', N'960g / 72 Finest Patisserie Butter Waffle ', N'No ', N'Belgian  Butters', N'57', N'https://www.destrooper-olivier.com/', N'Biscuits')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'CAVCP0107', N'100g Cavalier Assortment Stevia 10 Premium Chocolates. No Sugars Added with sweetneners from Stevia', N'No ', N'Cavalier', N'60.8', N'http://www.cavalier.be/', N'No Sugar Added')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'CAVCZ1101', N'125g Cavalier Sea Shells Stevia Milk No Sugars Added with sweetneners from Stevia', N'No ', N'Cavalier', N'32.85', N'http://www.cavalier.be/', N'No Sugar Added')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'CAVMCR96', N'32 × 40 / 42g Bars Classic No Sugar Added 4 Assorted. No Sugars Added with Sweetnener Maltitol ', N'No ', N'Cavalier', N'27.25', N'http://www.cavalier.be/', N'No Sugar Added')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'CAVMCT01', N'14 × 85g Block NSA Milk ', N'Yes', N'Cavalier', N'46.45', N'http://www.cavalier.be/', N'No Sugar Added')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'CAVMCT03', N'14 × 85g Block NSA Dark', N'No ', N'Cavalier', N'103.45', N'http://www.cavalier.be/', N'No Sugar Added')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'CAVMCT033', N'25× 85g Block NSA Dark', N'Yes', N'Cavalier', N'94.707143', N'http://www.cavalier.be/', N'No Sugar Added')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'CAVSCR01', N'16 × 44g Bars Stevia Milk Chocolate No Sugars Added with sweetneners from Stevia', N'No ', N'Cavalier', N'65.4', N'http://www.cavalier.be/', N'No Sugar Added')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'CAVSCR02', N'16 × 40g Bars Hazelnuts Stevia Milk Chocolate No Sugars Added with sweetneners from Stevia', N'Yes', N'Cavalier', N'41.6', N'http://www.cavalier.be/', N'No Sugar Added')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'CAVSCR03', N'16 × 40g Bars Cocoa Nibs Stevia 85% Dark Chocolate No Sugars Added with sweetneners from Stevia', N'No ', N'Cavalier', N'90.1', N'http://www.cavalier.be/', N'No Sugar Added')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'CAVSCR05', N'16 × 40g Bars Praline Stevia Milk Chocolate No Sugars Added with sweetneners from Stevia', N'No ', N'Cavalier', N'32.35', N'http://www.cavalier.be/', N'No Sugar Added')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'CAVSCR055', N'12× 40g Bars Praline Stevia Milk Chocolate No Sugars Added with sweetneners from Stevia', N'Yes', N'Cavalier', N'113.6', N'http://www.cavalier.be/', N'No Sugar Added')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'CAVSCR07', N'16 × 40g Bars Caramel Stevia Milk Chocolate No Sugars Added with sweetneners from Stevia', N'No ', N'Sweet Switch', N'83.1', N'https://www.sweet-switch.com/', N'No Sugar Added')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'CAVSCR08', N'16 × 40g Bars Mocha Stevia Dark Chocolate No Sugars Added with sweetneners from Stevia', N'Yes', N'Cavalier', N'84.9', N'http://www.cavalier.be/', N'No Sugar Added')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'CAVSCR97', N'32 × 40g Bars Fruity Stevia 4 Assorted', N'No ', N'Cavalier', N'71.8', N'http://www.cavalier.be/', N'No Sugar Added')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'CAVSCT03', N'14 × 85g Tablet Solid Stevia Dark Chocolate with 85% Cocoa', N'No ', N'Cavalier', N'51.35', N'http://www.cavalier.be/', N'No Sugar Added')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'CAVSCT05', N'14 × 85g Tablet Stevia Milk Chocolate with Praline', N'Yes', N'Cavalier', N'32.85', N'http://www.cavalier.be/', N'No Sugar Added')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'CB4697', N'Custard Hard Boiled Sweets', N'Yes', N'Cartwright and Butler', N'205.25', N'https://www.cartwrightandbutler.co.uk/', N'Confectionery')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'CB5232', N'Salted Caramel Fudge - low sugar', N'No ', N'Cartwright and Butler', N'194.5', N'https://www.cartwrightandbutler.co.uk/', N'Confectionery')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'CB5262', N'150g Sea Toffees', N'No ', N'Cartwright and Butler', N'90.2', N'https://www.cartwrightandbutler.co.uk/', N'Confectionery')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'CCW70732', N'Medium Hearts Dark', N'No ', N'Belcolade', N'74.2', N'https://www.belcolade.com/en', N'Dark Chocolate')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'CGH0154', N'500g Paste Calvados Bouquet w-Alc. ', N'No ', N'Lamaros', N'79', N'http://www.lamaros.in', N'Fillings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'CGH0155', N'500g Paste Raspberry ', N'No ', N'Lamaros', N'84.45', N'http://www.lamaros.in', N'Fillings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'CGH0156', N'500g Paste Banana ', N'No ', N'Lamaros', N'95.75', N'http://www.lamaros.in', N'Fillings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'CGH0157', N'500g Paste Pear Williams w-Alc. ', N'No ', N'Lamaros', N'98.25', N'http://www.lamaros.in', N'Fillings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'CGH0158', N'500g Paste Cherry Dark (Weichsel) ', N'No ', N'Lamaros', N'15.7', N'http://www.lamaros.in', N'Fillings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'CGH0159', N'300g Flavour Cinnamon-Natural ', N'No ', N'Lamaros', N'20.2', N'http://www.lamaros.in', N'Fillings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'CGH0160', N'2kg Paste Amarena Cherry ', N'No ', N'Lamaros', N'21.8', N'http://www.lamaros.in', N'Fillings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'CGH0161', N'500g Paste Sabayon w-Alc. ', N'No ', N'Lamaros', N'22.5', N'http://www.lamaros.in', N'Fillings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'CGH0162', N'2kg Paste Mandarine Pastagrum ', N'No ', N'Lamaros', N'23.95', N'http://www.lamaros.in', N'Fillings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'CGH0163', N'2kg Paste Vanilla Bourbon Naturella ', N'No ', N'Lamaros', N'26.3', N'http://www.lamaros.in', N'Fillings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'CGH0164', N'500g Paste Amaretto ', N'No ', N'Lamaros', N'31.1', N'http://www.lamaros.in', N'Fillings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'CGH0165', N'500g Paste Pistachio with Sml Pcs ', N'No ', N'Lamaros', N'31.75', N'http://www.lamaros.in', N'Fillings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'CGH0166', N'500g Paste Fig ', N'No ', N'Lamaros', N'32.8', N'http://www.lamaros.in', N'Fillings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'CHT70125CCX1', N'400g Nuggets Raspberry Coated', N'No ', N'Chocolatree', N'93.15', N'chocolatree.com.au', N'Decorations')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'CHT70125CCX2', N'100 Discs Fine Stripe Dark 40mm', N'Yes', N'Chocolatree', N'39.75', N'chocolatree.com.au', N'Decorations')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'CHT70125CCX3', N'100 Discs Fine Stripe Dark 30mm', N'Yes', N'Chocolatree', N'45', N'chocolatree.com.au', N'Decorations')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'CHT70125CCX4', N'88 Spheres Clipper Blue/Pink 29mm', N'No ', N'Chocolatree', N'92.45', N'chocolatree.com.au', N'Decorations')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'CL100D60', N'60 x 100g Bars: Chocolate Stars 6 Facing x 10 units from each of the varieties. This counter display unit comes with bars. The stand is supplied flat and ready to fill.', N'No ', N'Choc Stars', N'162.75', N'http://www.chocstars.com/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'CL100D72', N'72 x 100g Bars; 6 Facing x 12 bars ', N'No ', N'Chocolate and Love', N'173.25', N'https://chocolateandlove.com/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'CL12000D12', N'Organic. Dairy Free. Gluten Free. 100g bar comes in a box of 12. Dark chocolate 71% cocoa.', N'Yes', N'Chocolate and Love', N'186.2', N'https://chocolateandlove.com/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'CL12002D12', N'Organic. Dairy Free. Gluten Free. 100g bar comes in a box of 12. Dark chocolate with orange. 65% cocoa.', N'No ', N'Chocolate and Love', N'152.4', N'https://chocolateandlove.com/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'CL12003D12', N'Organic. Dairy Free. Gluten Free. 100g bar comes in a box of 12. Dark chocolate with coffee. 55% cocoa.', N'No ', N'Chocolate and Love', N'132.1', N'https://chocolateandlove.com/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'CL12004D12', N'Organic. Dairy Free. Gluten Free. 100g bar comes in a box of 12. Dark chocolate with mint. 67% cocoa.', N'No ', N'Chocolate and Love', N'182.7', N'https://chocolateandlove.com/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'CL12015D12', N'Organic. Dairy Free. Gluten Free. 100g bar comes in a box of 12. Chocolate with caramel and sea salt. 55% cocoa.', N'Yes', N'Chocolate and Love', N'32.1', N'https://chocolateandlove.com/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'CL12029D12', N'100g bar comes in a box of 12. Single origin dark chocolate. 80% chocolate', N'No ', N'Chocolate and Love', N'19.3', N'https://chocolateandlove.com/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'CL12050D10', N'10 x 100g Bars Breakfast   Dark 50% cocoa', N'Yes', N'Choc Stars', N'44.4', N'http://www.chocstars.com/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'CL12054D10', N'10 x 100g Bars GG   Dark 50% cocoa', N'No ', N'Choc Stars', N'162.8', N'http://www.chocstars.com/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'CL12061D10', N'10 x 100g Bars Tattoo Dark 50% Cocoa', N'Yes', N'Choc Stars', N'182.2', N'http://www.chocstars.com/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'CL12140D10', N'10 x 100g Bars Vegas   Dark 50% Cocoa', N'No ', N'Choc Stars', N'164.45', N'http://www.chocstars.com/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'CL400BX', N'400g / 4 x 100g Chocolate and Love Gift Box ', N'No ', N'Chocolate and Love', N'86.65', N'https://chocolateandlove.com/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'COL#2009', N'260g Butlers Dessert Collection Large ', N'No ', N'Colac', N'34.9', N'https://www.colac.be/en', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'COL#2010', N'260g Butlers Cocktail Menu Assortment ', N'No ', N'Colac', N'10.35', N'https://www.colac.be/en', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'COL#2011', N'130g Butlers Export Artisan Box Assortment Blue Small ', N'No ', N'Colac', N'2.2', N'https://www.colac.be/en', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'COL#2012', N'310g Butlers Export Artisan Box Assortment Pink Medium ', N'No ', N'Colac', N'67.5', N'https://www.colac.be/en', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'COL#2013', N'210g Butlers Chocolate Box Assortment Rose Gold ', N'No ', N'Colac', N'59.35', N'https://www.colac.be/en', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'CRO001', N'1kg Frozen Apricot Puree', N'No ', N'Crops', N'99.5', N'http://www.crops.be/', N'Puree')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'CRO002', N'1kg Frozen Blackcurrant Puree', N'No ', N'Crops', N'16.5', N'http://www.crops.be/', N'Puree')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'CRO003', N'1kg Frozen Blueberry Puree', N'No ', N'Crops', N'11.5', N'http://www.crops.be/', N'Puree')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'CRO004', N'1kg Frozen Orange Puree', N'No ', N'Crops', N'27', N'http://www.crops.be/', N'Puree')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'CRO005', N'1kg Frozen Mango Puree', N'No ', N'Crops', N'90.5', N'http://www.crops.be/', N'Puree')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DAU1429', N'48 × 60g TS Berlin Donut Butter Not Filled', N'Yes', N'JJ Food Service', N'47.5', N'https://www.jjfoodservice.com/', N'Bread')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DAU2052', N'100 × 45g TS Brioche Roll ', N'No ', N'JJ Food Service', N'35', N'https://www.jjfoodservice.com/', N'Bread')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DAU3115', N'40 × 165g Demi Baguettes White 27cm Large ', N'Yes', N'JJ Food Service', N'71', N'https://www.jjfoodservice.com/', N'Bread')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DAU3203', N'95 × 65g Kaiser Roll Plain ', N'No ', N'JJ Food Service', N'72', N'https://www.jjfoodservice.com/', N'Bread')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DAU4141', N'60 × 100g RTB Figure of Eight ', N'No ', N'JJ Food Service', N'15.5', N'https://www.jjfoodservice.com/', N'Bread')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DAU6112', N'75 × 40g FB Rustic Mini Mix 3 Assorted', N'Yes', N'JJ Food Service', N'38', N'https://www.jjfoodservice.com/', N'Bread')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DAV010', N'150g Chocolate Coated Ginger Dark Chocolate Coated Ginger', N'No ', N'Davies', N'83.4', N'https://davieschocolates.com.au/', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DAV011', N'150g Chocolate Mints Dark Chocolate', N'No ', N'Davies', N'51.85', N'https://davieschocolates.com.au/', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DAV013', N'150g Chocolate Nutty Clusters Roasted Peanuts in delicious milk chocolate.', N'No ', N'Davies', N'15.3', N'https://davieschocolates.com.au/', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DAV026', N'150g Chocolate Coconut Roughs Milk Chocolate', N'No ', N'Davies', N'84.45', N'https://davieschocolates.com.au/', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DAV088', N'36 x 50g Ginger Bars Dark', N'No ', N'Davies Chocolates', N'91', N'https://davieschocolates.com.au/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DAV089', N'18 x 150g Ginger Bars Dark', N'No ', N'Davies Chocolates', N'154.3', N'https://davieschocolates.com.au/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DAV090', N'36 x 150g Ginger Bars Dark', N'No ', N'Davies Chocolates', N'188.6', N'https://davieschocolates.com.au/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DAV091', N'72 x 50g Ginger Bars Dark', N'No ', N'Davies Chocolates', N'155.05', N'https://davieschocolates.com.au/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DFS1973', N'60 x 100g Chocolate Chip Twists Custard', N'No ', N'Brioche Pasquier', N'15', N'https://www.pasquier.fr/en_uk/homepage', N'Pastries')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DFS1974', N'60 x 100g Regular Twists Custard', N'No ', N'Brioche Pasquier', N'95', N'https://www.pasquier.fr/en_uk/homepage', N'Pastries')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DFS1975', N'61 x 100g Caramel Twists Custard', N'No ', N'Brioche Pasquier', N'97.5', N'https://www.pasquier.fr/en_uk/homepage', N'Pastries')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DIAB2254', N'116g Pralines Assorted ', N'No ', N'Diabolic', N'64.1', N'https://diabolicfoods.com.au', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DIAB2255', N'185g Pralines Assorted ', N'No ', N'Diabolic', N'79.05', N'https://diabolicfoods.com.au', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DIAB2256', N'500g Vanilla Clusties Praline ', N'No ', N'Diabolic', N'99.45', N'https://diabolicfoods.com.au', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DIAB2257', N'500g Orange Clusties Dark ', N'No ', N'Diabolic', N'23', N'https://diabolicfoods.com.au', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DIAB2258', N'500g Cranberry Clusties Praline ', N'No ', N'Diabolic', N'86.35', N'https://diabolicfoods.com.au', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DIAB2259', N'500g Caramel Clusties Praline ', N'No ', N'Diabolic', N'11.95', N'https://diabolicfoods.com.au', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DIAB2260', N'50g Original Cups Assorted ', N'No ', N'Diabolic', N'93.5', N'https://diabolicfoods.com.au', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DIAB2261', N'100g Original Cups Assorted ', N'No ', N'Diabolic', N'44.65', N'https://diabolicfoods.com.au', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DIAB2262', N'200g Original Cups Assorted ', N'No ', N'Diabolic', N'34.8', N'https://diabolicfoods.com.au', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DOB38381', N'Sprinkle Fruit Mix White', N'No ', N'Dobla?under?Decorations', N'15.99', N'doblafoods.com.gm', N'Decorations')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DOB41119', N'Spaghetti Triple', N'No ', N'Dobla?under?Decorations', N'55.55', N'doblafoods.com.gm', N'Decorations')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DOB77038', N'Curvy Elegance Dark', N'No ', N'Dobla?under?Decorations', N'62.1', N'doblafoods.com.gm', N'Decorations')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DOB77318', N'Daisy Hollow White 36 Pack', N'No ', N'Dobla?under?Decorations', N'86.4', N'doblafoods.com.gm', N'Decorations')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DOB77319', N'Pearl Hollow White 36 Pack', N'No ', N'Dobla?under?Decorations', N'96.65', N'doblafoods.com.gm', N'Decorations')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DOL0030', N'70g bar of milk chocolate. 32% cocoa solids. Milk chocolate is a favourite of many, and this has Dolfin’s quality.', N'No ', N'Dolfin', N'104.55', N'http://www.dolfin.be/en/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DOL0175', N'Cardboard counter display unit. Available when purchasing 120 bars (8 x 15). ', N'No ', N'Dolfin', N'111.25', N'http://www.dolfin.be/en/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DOL0630', N'70g bar of milk chocolate. 32% cocoa solids. Milk chocolate with cinamon adding spice.', N'No ', N'Dolfin', N'52.9', N'http://www.dolfin.be/en/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DOL0730', N'70g bar milk chocolate. 32% cocoa solids. Spicy with hints of ginger, black pepper, cloves, cardamon and cinnamon.', N'No ', N'Dolfin', N'190', N'http://www.dolfin.be/en/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DOL1060', N'70g bar of dark chocolate with cocoa bean nibs. 70% cocoa solids. Cocoa bean nibs for crunchy texture with flavoursome dark chocolate.', N'No ', N'Dolfin', N'62.1', N'http://www.dolfin.be/en/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DOL1311', N'70g bar of dark chocolate. 52% cocoa solids. Fruit and nut combines well with dark chocolate.', N'Yes', N'Dolfin', N'172.35', N'http://www.dolfin.be/en/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DOL1335', N'70g bar of milk chocolate. 32% cocoa solids. Traditional flavours enhancing the chocolate.', N'No ', N'Dolfin', N'168.4', N'http://www.dolfin.be/en/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DOL1360', N'25 x 30g Bars Dominican Republic 88% Cocoa Solids Dark Chocolate', N'No ', N'Dolfin', N'56.45', N'http://www.dolfin.be/en/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DOL1361', N'25 x 30g Bars Brazil Pink Peppercorn Dark Chocolate', N'No ', N'Dolfin', N'94.2', N'http://www.dolfin.be/en/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DOL1362', N'25 x 30g Bars Spain Bitter Orange Dark Chocolate', N'No ', N'Dolfin', N'182', N'http://www.dolfin.be/en/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DOL1363', N'25 x 30g Bars Sri Lanka Lemon and Ginger Dark Chocolate', N'No ', N'Dolfin', N'174.9', N'http://www.dolfin.be/en/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DOL1364', N'25 x 30g Bars Vanuatu 38% Cocoa Solids Milk Chocolate', N'No ', N'Dolfin', N'92.3', N'http://www.dolfin.be/en/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DOL1365', N'25 x 30g Bars Morocco Apricot Milk Chocolate', N'Yes', N'Dolfin', N'116.2', N'http://www.dolfin.be/en/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DOL1366', N'25 x 30g Bars India Chai Masala Milk Chocolate', N'No ', N'Dolfin', N'63.25', N'http://www.dolfin.be/en/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DOL1367', N'25 x 30g Bars Italy Hazelnut Milk Chocolate', N'No ', N'Dolfin', N'119.65', N'http://www.dolfin.be/en/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DOL1368', N'200 x 30g Bars Carnet de Voyage/Travel Diary. 25 x ea of the assorted flavours with a cardboard counter display unit.', N'No ', N'Dolfin', N'21.2', N'http://www.dolfin.be/en/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DOL1426', N'108g / 24 Flower Gift Squares Assorted ', N'Yes', N'Dolfin', N'80.25', N'http://www.dolfin.be/en/', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DOL2421', N'70g Bar in Pouch Dulche de Leche and Rice Crisps Milk ', N'No ', N'Dolfin', N'129.2', N'http://www.dolfin.be/en/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DOL2424', N'70g Bar in Pouch Caramelized Macadamia Nuts Milk ', N'No ', N'Dolfin', N'161.95', N'http://www.dolfin.be/en/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DOL2427', N'70g Bar in Pouch Red Berries and Flax Seeds 60% Dark ', N'No ', N'Dolfin', N'20.9', N'http://www.dolfin.be/en/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DOL2430', N'70g Bar in Pouch Fleur de Sel 70% Dark ', N'No ', N'Dolfin', N'33.3', N'http://www.dolfin.be/en/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DOL3010', N'Lavender dark chocolate. 70g bar. 52% cocoa solids. Flavours of Haute-Provence.', N'Yes', N'Dolfin', N'99.5', N'http://www.dolfin.be/en/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DOL3130', N'70g bar of dark chocolate. 52% cocoa solids. Mint and dark chocolate is a traditional partnership.', N'No ', N'Dolfin', N'92.3', N'http://www.dolfin.be/en/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DOL3230', N'Dark chocolate with grilled almonds. 70g bar 52% cocoa solids. Grilled to intensify the flavour of the almonds, which complements the chocolate well.', N'No ', N'Dolfin', N'86', N'http://www.dolfin.be/en/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DOL3330', N'70g bar Pink Peppercorns dark chocolate. 52% cocoa solids. Peppery chocolate works.', N'Yes', N'Dolfin', N'125.5', N'http://www.dolfin.be/en/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DOL3430', N'70g bar of dark chocolate. 52% cocoa solids. The 10% of crystalised orange peel complements dark chocolate nicely.', N'No ', N'Dolfin', N'140.5', N'http://www.dolfin.be/en/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DOL3530', N'70g bar of dark chocolate. 52% cocoa solids. Dark chocolate with Earl Grey Tea.', N'No ', N'Dolfin', N'17.4', N'http://www.dolfin.be/en/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DOL3630', N'70g bar of dark chocolate. 52% cocoa solids. The fresh ginger to add a flavoursome tang', N'No ', N'Dolfin', N'181.75', N'http://www.dolfin.be/en/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DOL5012IN', N'108g / 24 Squares ', N'No ', N'Dolfin', N'44.65', N'http://www.dolfin.be/en/', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DOL5012IN1', N'108g / 24 Squares ', N'No ', N'Dolfin', N'35.4', N'http://www.dolfin.be/en/', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DOL5020IN', N'18g / 4 Squares Assorted Acetate ', N'No ', N'Dolfin', N'93.5', N'http://www.dolfin.be/en/', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DOL7530', N'70g bar of dark chocolate. 70% cocoa solids. For lovers of dark chocolate.', N'No ', N'Dolfin', N'19.3', N'http://www.dolfin.be/en/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DRO0010', N'12 x 95g Droste Rolls Butterscotch Milk ', N'No ', N'Droste', N'72.4', N'https://www.droste.nl/en/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DRO0050', N'12 x 100g Droste Rolls Milk ', N'No ', N'Droste', N'154.5', N'https://www.droste.nl/en/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DRO0150', N'12 x 100g Droste Rolls Dark ', N'Yes', N'Droste', N'183.4', N'https://www.droste.nl/en/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DRO0450', N'12 x 100g Droste Rolls Milk / White ', N'Yes', N'Droste', N'18.65', N'https://www.droste.nl/en/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DRO1600', N'8 x 170g Droste Twin Dark ', N'No ', N'Droste', N'128.35', N'https://www.droste.nl/en/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DRO1800', N'8 x 170g Droste Twin Dark / Mint and Milk / Orange Crisp ', N'No ', N'Droste', N'111.45', N'https://www.droste.nl/en/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DRO5000', N'200g Droste Assortment ', N'Yes', N'Droste', N'154.4', N'https://www.droste.nl/en/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DRO6050', N'12 x 95g Droste Rolls Stracciatella White ', N'No ', N'Droste', N'142', N'https://www.droste.nl/en/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DRO7050', N'12 x 100g Droste Rolls Milk / Orange Crisp ', N'No ', N'Droste', N'91.75', N'https://www.droste.nl/en/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DUN222#', N'3.6kg / 288 Olive Oil Oatcakes', N'Yes', N'Duncans of Deeside', N'13.5', N'https://www.duncansofdeeside.com/', N'Biscuits')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DUN226#', N'72 Bouchees Round Vol-au-Vent 4.5cm x 3cm Puff Pastry', N'No ', N'Duncans of Deeside', N'27', N'https://www.duncansofdeeside.com/', N'Canapes')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DUN229#', N'192 Mini Carré Vol Au Vent 3cm x 2.5cm Puff Pastry', N'No ', N'Duncans of Deeside', N'66', N'https://www.duncansofdeeside.com/', N'Canapes')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'DUN299#', N'90 Mini Scallop 5cm x 1cm Pressed Pastry', N'No ', N'Duncans of Deeside', N'21.5', N'https://www.duncansofdeeside.com/', N'Canapes')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'ECH14585', N'50g bar of dark chocolate with cocoa bean nibs. 50% cocoa solids. Cocoa bean nibs for crunchy texture with flavoursome dark chocolate.', N'No ', N'Elegent Chocolates', N'76.25', N'https://elegentchoc.com.vt', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'ECH14586', N'50g bar of dark chocolate. 52% cocoa solids. Mint and dark chocolate is a traditional partnership.', N'No ', N'Elegent Chocolates', N'13.15', N'https://elegentchoc.com.vt', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'ECH14587', N'50g bar of dark chocolate. 52% cocoa solids. The 10% of crystalised orange peel complements dark chocolate nicely.', N'No ', N'Elegent Chocolates', N'184.75', N'https://elegentchoc.com.vt', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'ECH14588', N'50 x 30g Bars Vanuatu 38% Cocoa Solids Milk Chocolate', N'No ', N'Elegent Chocolates', N'157.75', N'https://elegentchoc.com.vt', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'ECH14589', N'50g bar of dark chocolate. 50% cocoa solids. For lovers of dark chocolate.', N'No ', N'Elegent Chocolates', N'182.55', N'https://elegentchoc.com.vt', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'ECH14590', N'50g bar Pink Peppercorns dark chocolate. 52% cocoa solids. Peppery chocolate works.', N'No ', N'Elegent Chocolates', N'17.65', N'https://elegentchoc.com.vt', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'ECH14591', N'50g bar of milk chocolate. 32% cocoa solids. Traditional flavours enhancing the chocolate.', N'No ', N'Elegent Chocolates', N'182.05', N'https://elegentchoc.com.vt', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'ECH14592', N'50g Bar in Pouch Dulche de Leche and Rice Crisps Milk ', N'No ', N'Elegent Chocolates', N'38.1', N'https://elegentchoc.com.vt', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'ECH14593', N'50g bar milk chocolate. 32% cocoa solids. Spicy with hints of ginger, black pepper, cloves, cardamon and cinnamon.', N'No ', N'Elegent Chocolates', N'116.35', N'https://elegentchoc.com.vt', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'ECH14594', N'50g bar of milk chocolate. 32% cocoa solids. Milk chocolate is a favourite of many, and this has Dolfin’s quality.', N'No ', N'Elegent Chocolates', N'164.6', N'https://elegentchoc.com.vt', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'ECH14595', N'50 x 30g Bars Sri Lanka Lemon and Ginger Dark Chocolate', N'No ', N'Elegent Chocolates', N'59.6', N'https://elegentchoc.com.vt', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'ECH14596', N'200 x 30g Bars Carnet de Voyage/Travel Diary. 50 x ea of the assorted flavours with a cardboard counter display unit.', N'No ', N'Elegent Chocolates', N'76.25', N'https://elegentchoc.com.vt', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'ECH14597', N'50g bar of dark chocolate. 52% cocoa solids. The fresh ginger to add a flavoursome tang', N'No ', N'Elegent Chocolates', N'13.15', N'https://elegentchoc.com.vt', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'ECH14598', N'50g Bar in Pouch Red Berries and Flax Seeds 60% Dark ', N'No ', N'Elegent Chocolates', N'184.75', N'https://elegentchoc.com.vt', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'ECH14599', N'50g bar of milk chocolate. 32% cocoa solids. Milk chocolate with cinamon adding spice.', N'No ', N'Elegent Chocolates', N'157.75', N'https://elegentchoc.com.vt', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'ECH14600', N'50g bar of dark chocolate. 52% cocoa solids. Dark chocolate with Earl Grey Tea.', N'No ', N'Elegent Chocolates', N'182.55', N'https://elegentchoc.com.vt', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'ECH14601', N'50g Bar in Pouch Fleur de Sel 50% Dark ', N'No ', N'Elegent Chocolates', N'17.65', N'https://elegentchoc.com.vt', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'ECH14602', N'50g Bar in Pouch Caramelized Macadamia Nuts Milk ', N'No ', N'Elegent Chocolates', N'182.05', N'https://elegentchoc.com.vt', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'ECH14603', N'50 x 30g Bars Dominican Republic 88% Cocoa Solids Dark Chocolate', N'No ', N'Elegent Chocolates', N'38.1', N'https://elegentchoc.com.vt', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'ECH14604', N'50 x 30g Bars Brazil Pink Peppercorn Dark Chocolate', N'No ', N'Elegent Chocolates', N'116.35', N'https://elegentchoc.com.vt', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'ECH14605', N'50 x 30g Bars Italy Hazelnut Milk Chocolate', N'No ', N'Elegent Chocolates', N'164.6', N'https://elegentchoc.com.vt', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'ELF25478', N'2kg - 58 Honey Crunch Hazelnut Praline', N'No ', N'Elfin''s Homemade', N'56.5', N'http://www.elfins.com.ca', N'Chocolate')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'ELF25479', N'2kg - 76 Coeurs d’Amour Milk with Strawberry Fondant', N'No ', N'Elfin''s Homemade', N'77.8', N'http://www.elfins.com.ca', N'Chocolate')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'ELF25480', N'2kg - 54 Amarena Cherry - Amaretto Ganache', N'No ', N'Elfin''s Homemade', N'32.55', N'http://www.elfins.com.ca', N'Chocolate')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'ELF25481', N'2kg - 62 Crème Brulee Ganache', N'No ', N'Elfin''s Homemade', N'95.9', N'http://www.elfins.com.ca', N'Chocolate')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'ELF25482', N'2kg - 55 Brazil Almond Praline - Biscuit Drops - Florentine on Top', N'No ', N'Elfin''s Homemade', N'93.3', N'http://www.elfins.com.ca', N'Chocolate')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'ELF25483', N'2kg - 45 Cherry Ganache with Cherry on Liqueur', N'No ', N'Elfin''s Homemade', N'32.95', N'http://www.elfins.com.ca', N'Chocolate')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'ELF25484', N'2kg - 54 Black Orange', N'No ', N'Elfin''s Homemade', N'84.45', N'http://www.elfins.com.ca', N'Chocolate')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'ELF25485', N'2kg - 54 × 27.5g Cupcakes Strawberry Fondant and Cream Topping', N'No ', N'Elfin''s Homemade', N'89.7', N'http://www.elfins.com.ca', N'Chocolate')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'ELF25486', N'2kg - 55 Orange Almond Praline with Orange Pieces', N'No ', N'Elfin''s Homemade', N'90.55', N'http://www.elfins.com.ca', N'Chocolate')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'ELF25487', N'2kg - 58 Cake Slices Milk with Chocolate Ganache Dark and Pearls', N'No ', N'Elfin''s Homemade', N'45.8', N'http://www.elfins.com.ca', N'Chocolate')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'ELF25488', N'2kg - 57 Pear Williams Ganache Crisp', N'No ', N'Elfin''s Homemade', N'84.45', N'http://www.elfins.com.ca', N'Chocolate')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'FGTS0495', N'50 Premium Piece Cutlery Set - White', N'No ', N'Ben''s Couture', N'50', N'Bcouture.com.au', N'Cutlery')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'FGTS0496', N'100 Premium Piece Cutlery Set - White', N'No ', N'Ben''s Couture', N'90', N'Bcouture.com.au', N'Cutlery')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'FGTS0497', N'200 Premium Piece Cutlery Set - White', N'No ', N'Ben''s Couture', N'160', N'Bcouture.com.au', N'Cutlery')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'FGTS0498', N'50 Premium Piece Cutlery Set - Gold', N'No ', N'Ben''s Couture', N'50', N'Bcouture.com.au', N'Cutlery')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'FGTS0499', N'100 Premium Piece Cutlery Set - Gold', N'No ', N'Ben''s Couture', N'90', N'Bcouture.com.au', N'Cutlery')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'FGTS0500', N'200 Premium Piece Cutlery Set - Gold', N'No ', N'Ben''s Couture', N'160', N'Bcouture.com.au', N'Cutlery')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'FGTS0501', N'50 Premium Piece Cutlery Set - Silver', N'No ', N'Ben''s Couture', N'50', N'Bcouture.com.au', N'Cutlery')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'FGTS0502', N'100 Premium Piece Cutlery Set - Silver', N'No ', N'Ben''s Couture', N'90', N'Bcouture.com.au', N'Cutlery')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'FGTS0503', N'200 Premium Piece Cutlery Set - Silver', N'No ', N'Ben''s Couture', N'160', N'Bcouture.com.au', N'Cutlery')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'GO41080', N'90 × 80g Croissant Butter Straight Mini Chocolate Croissant', N'No ', N'Gourmand', N'40.5', N'https://www.gourmandpastries.com/en/home', N'Croissants')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'GO42081', N'90 × 80g Croissant Butter Curved Croissant Praliné', N'No ', N'Gourmand', N'53', N'https://www.gourmandpastries.com/en/home', N'Croissants')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'GO53010', N'150 × 30g Mini Chocolate Croissant Butter Croissant Butter Curved', N'No ', N'Gourmand', N'18.5', N'https://www.gourmandpastries.com/en/home', N'Croissants')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'GRD0001', N'12 x 55g Bars Organic with Walnut Pieces Milk Chocolate of 36% Cocoa', N'No ', N'Green Dream', N'80.55', N'http://www.biofam.eu/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'GRD0003', N'12 x 55g Bars Organic with Cranberries. Dark Chocolate of 72% Cocoa', N'No ', N'Green Dream', N'27.5', N'http://www.biofam.eu/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'GRD000333', N'12 x 55g Bars Organic with Cranberries. Dark Chocolate of 72% Cocoa', N'No ', N'Green Dream', N'161.25', N'http://www.biofam.eu/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'GRD0004', N'12 x 55g Bars Organic with Blueberries Pieces Dark Chocolate of 72% Cocoa', N'No ', N'Green Dream', N'187.25', N'http://www.biofam.eu/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'GRD0015', N'20 x 30g Bars, 5 Assorted ', N'No ', N'Green Dream', N'36.6', N'http://www.biofam.eu/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'GRD0021', N'85g Hazelnuts in Chocolate Coated in Milk Chocolate of 36% Cocoa', N'No ', N'Green Dream', N'91.15', N'http://www.biofam.eu/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'GRD0022', N'85g Cherries in Chocolate Coated in Dark Chocolate of 72% Cocoa', N'No ', N'Green Dream', N'134.5', N'http://www.biofam.eu/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'GRD0023', N'85g Cashew Nuts and Cranberries in Chocolate Coated in Dark Chocolate of 70% Cocoa', N'No ', N'Green Dream', N'199.9', N'http://www.biofam.eu/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'GRD0025', N'12 x 85g Bars Organic with Cherries Dark Chocolate', N'No ', N'Green Dream', N'55.85', N'http://www.biofam.eu/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'GRD0026', N'12 x 85g Bars Organic with Hazelnuts and Raisins Dark Chocolate', N'No ', N'Green Dream', N'165.3', N'http://www.biofam.eu/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'GRD0027', N'12 x 85g Bars Organic with Banana Milk Chocolate', N'No ', N'Green Dream', N'185.85', N'http://www.biofam.eu/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'GRD0028', N'12 x 85g Bars Organic with Caramel and Sea Salt Milk Chocolate', N'No ', N'Green Dream', N'77.9', N'http://www.biofam.eu/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'GRD00289', N'12 x 85g Bars Organic with Caramel and Sea Salt Milk Chocolate', N'No ', N'Green Dream', N'94.55', N'http://www.biofam.eu/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'HATS1', N'Apromo Cap - Small', N'No ', N'Hats R Us', N'9.95', N'hatsrus.com.au', N'Hats')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'HATS2', N'Apromo Cap - Medium', N'No ', N'Hats R Us', N'9.95', N'hatsrus.com.au', N'Hats')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'HATS3', N'Apromo Cap - Large', N'No ', N'Hats R Us', N'9.95', N'hatsrus.com.au', N'Hats')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'HDL427', N'1kg / 71 Chocolate Rounds Mozart Balls White Chocolate ', N'No ', N'Heindl', N'13.05', N'https://www.heindl.co.at/en', N'Confectionery')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'HDL4274', N'1kg / 71 Chocolate Rounds Mozart Balls Milk Chocolate ', N'Yes', N'Heindl', N'13.05', N'https://www.heindl.co.at/en', N'Confectionery')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'HDL4276', N'1kg / 71 Chocolate Rounds Mozart Balls Dark Chocolate ', N'No ', N'Heindl', N'55.75', N'https://www.heindl.co.at/en', N'Confectionery')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'HDL4277', N'1kg / 71 Chocolate Rounds Mozart Balls Carob Chocolate ', N'No ', N'Heindl', N'274.95', N'https://www.heindl.co.at/en', N'Confectionery')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'IKX0015', N'1kg / 62 Hazelnut Praline and Caramel Sugar', N'No ', N'Ickx', N'73.85', N'https://ickx-93dc28deafac.victhorious.com/en', N'Milk Chocolate')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'IKX0019', N'1kg / 55 Brazil Almond Praline / Biscuit Drops / Florentine on Top', N'Yes', N'Ickx', N'89.75', N'https://ickx-93dc28deafac.victhorious.com/en', N'Milk Chocolate')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'IKX0024', N'1kg / 57 Florentine Almond Praline', N'No ', N'Ickx', N'29.85', N'https://ickx-93dc28deafac.victhorious.com/en', N'Milk Chocolate')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'IKX0026', N'1kg / 70 Chocolate Mousse with Cocoa Nibs', N'No ', N'Ickx', N'67.9', N'https://ickx-93dc28deafac.victhorious.com/en', N'Milk Chocolate')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'IKX0028', N'1kg / 58 Honey Crunch Hazelnut Praline', N'No ', N'Ickx', N'91.95', N'https://ickx-93dc28deafac.victhorious.com/en', N'Milk Chocolate')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'IKX0031', N'1kg / 68 Picasso Apricot Amaretto Ganache', N'No ', N'Ickx', N'31.8', N'https://ickx-93dc28deafac.victhorious.com/en', N'Milk Chocolate')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'IKX0039', N'1kg / 62 Crème Brulee Ganache', N'No ', N'Ickx', N'40.35', N'https://ickx-93dc28deafac.victhorious.com/en', N'Milk Chocolate')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'IKX0041', N'1kg / 76 Coeurs d’Amour Milk with Strawberry Fondant', N'No ', N'Ickx', N'78.1', N'https://ickx-93dc28deafac.victhorious.com/en', N'Milk Chocolate')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'IKX00410', N'1kg - 50 Coeurs d’Amour Milk with Strawberry Fondant', N'No ', N'Ickx', N'33.75', N'https://ickx-93dc28deafac.victhorious.com/en', N'Milk Chocolate')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'IKX020207', N'1kg / 54 × 17.5g Cupcakes Strawberry Fondant and Cream Topping', N'Yes', N'Ickx', N'56.5', N'https://ickx-93dc28deafac.victhorious.com/en', N'Cupcakes')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'IKX020211', N'1kg / 54 × 17.5g Cupcakes Crispy Chocolate and Cream Topping with Pearls', N'No ', N'Ickx', N'78.1', N'https://ickx-93dc28deafac.victhorious.com/en', N'Cupcakes')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'IKX0700', N'1kg / 58 Cake Slices Milk with Chocolate Ganache Dark and Pearls', N'Yes', N'Ickx', N'32.55', N'https://ickx-93dc28deafac.victhorious.com/en', N'Cake Slices')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'IKX07000', N'1kg - 25 Cake Slices Milk with Chocolate Ganache Dark and Pearls', N'Yes', N'Ickx', N'99.65', N'https://ickx-93dc28deafac.victhorious.com/en', N'Cake Slices')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'IKX1005', N'1kg / 45 Cherry Ganache with Cherry on Liqueur', N'Yes', N'Ickx', N'63', N'https://ickx-93dc28deafac.victhorious.com/en', N'Dark Chocolate')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'IKX1014', N'1kg / 57 Pear Williams Ganache Crisp', N'Yes', N'Ickx', N'95.9', N'https://ickx-93dc28deafac.victhorious.com/en', N'Dark Chocolate')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'IKX1019', N'1kg / 54 Amarena Cherry / Amaretto Ganache', N'No ', N'Ickx', N'89.75', N'https://ickx-93dc28deafac.victhorious.com/en', N'Dark Chocolate')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'IKX1024', N'1kg / 54 Black Orange', N'Yes', N'Ickx', N'60.45', N'https://ickx-93dc28deafac.victhorious.com/en', N'Dark Chocolate')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'IKX200075', N'Assorted flowers 105g ', N'Yes', N'Ickx', N'10.55', N'https://ickx-93dc28deafac.victhorious.com/en', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'IKX2003', N'1kg / 55 Orange Almond Praline with Orange Pieces', N'Yes', N'Ickx', N'77.8', N'https://ickx-93dc28deafac.victhorious.com/en', N'White Chocolate')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'IKX2010', N'1kg / 43 Raspberry Ganache', N'No ', N'Ickx', N'63', N'https://ickx-93dc28deafac.victhorious.com/en', N'White Chocolate')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'IKX2025', N'1kg / 66 Assorted', N'No ', N'Ickx', N'96.55', N'https://ickx-93dc28deafac.victhorious.com/en', N'White Chocolate')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'IKX2026', N'1kg / 70 Raspberry Square White with Raspberry Ganache and Glaze', N'No ', N'Ickx', N'21.2', N'https://ickx-93dc28deafac.victhorious.com/en', N'White Chocolate')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN2015', N'1kg Paste Vanilla Bourbon Naturella ', N'No ', N'Jansen', N'93.9', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN2015R', N'350g Paste Vanilla Bourbon Naturella ', N'No ', N'Jansen', N'48.95', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN2020', N'1kg Paste Coconut ', N'Yes', N'Jansen', N'55.85', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN2020R', N'350g Paste Coconut ', N'No ', N'Jansen', N'74.2', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN219R', N'300g Flavour Butter-Cream ', N'No ', N'Jansen', N'74.25', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN220R', N'300g Flavour Bitteralmond – Real Natural ', N'No ', N'Jansen', N'32.1', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN239R', N'300g Flavour Cinnamon-Natural ', N'No ', N'Jansen', N'86.75', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN256R', N'300g Flavour Panettone ', N'No ', N'Jansen', N'24.7', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN310R', N'300g Flavour Rum Old Jamaica ', N'No ', N'Jansen', N'99.45', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN313R', N'300g Flavour Rum Coback ', N'Yes', N'Jansen', N'73.45', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN355R', N'300g Flavour Lemon Etna-Natural ', N'No ', N'Jansen', N'32.6', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN5003', N'1kg Paste Woodland Berries (6 Fruits) ', N'No ', N'Jansen', N'60.45', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN5003R', N'350g Paste Woodland Berries (6 Fruits) ', N'No ', N'Jansen', N'35.35', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN5005R', N'350g Paste Cherry “Black Forest” w/Alc. ', N'No ', N'Jansen', N'74.35', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN5009R', N'350g Paste Tiramisu ', N'No ', N'Jansen', N'28.55', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN5011R', N'350g Paste Cappuccino ', N'Yes', N'Jansen', N'43.65', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN5012', N'1kg Paste Sabayon w/Alc. ', N'No ', N'Jansen', N'78.75', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN5012R', N'350g Paste Sabayon w/Alc. ', N'No ', N'Jansen', N'91.7', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN5015', N'1kg Paste Caramel Fin ', N'No ', N'Jansen', N'50.6', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN5015R', N'350g Paste Caramel Fin ', N'No ', N'Jansen', N'37.2', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN5025', N'1kg Paste Blackberry ', N'No ', N'Jansen', N'35.25', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN5030', N'1kg Paste Rum Jamaica w/Alc. ', N'Yes', N'Jansen', N'52.75', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN5030R', N'350g Paste Rum Jamaica w/Alc. ', N'Yes', N'Jansen', N'44.55', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN5033R', N'350g Paste Gianduja ', N'No ', N'Jansen', N'99.05', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN5034', N'1kg Paste Fig ', N'No ', N'Jansen', N'54.35', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN5034R', N'350g Paste Fig ', N'No ', N'Jansen', N'97.2', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN5035', N'1kg Paste Cranberry ', N'No ', N'Jansen', N'33.25', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN5037', N'1kg Paste Amarena Cherry ', N'No ', N'Jansen', N'90.35', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN5037R', N'350g Paste Cherry Amarena ', N'No ', N'Jansen', N'55.8', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN5038R', N'350g Paste Pomegranate ', N'No ', N'Jansen', N'36.35', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN5040R', N'350g Paste Mango ', N'No ', N'Jansen', N'98.85', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN5041', N'1kg Paste Walnut with Sml Pcs ', N'Yes', N'Jansen', N'98.25', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN5041R', N'350g Paste Walnut with Small Pieces ', N'No ', N'Jansen', N'50.1', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN5044R', N'350g Paste Kiwi ', N'Yes', N'Jansen', N'42.85', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN5050', N'1kg Paste Bilberry (Blueberry) ', N'No ', N'Jansen', N'73.2', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN5050R', N'350g Paste Bilberry (Blueberry) ', N'No ', N'Jansen', N'33.2', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN5052', N'1kg Paste Plum ', N'No ', N'Jansen', N'75.9', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN5052R', N'350g Paste Plum ', N'Yes', N'Jansen', N'50.1', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN5055R', N'350g Paste Banana ', N'Yes', N'Jansen', N'80.5', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN5056', N'1kg Paste Apple Coxorange ', N'No ', N'Jansen', N'46.9', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN5057', N'1kg Paste Pear Williams w/Alc. ', N'No ', N'Jansen', N'32.75', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN5057R', N'350g Paste Pear Williams w/Alc. ', N'No ', N'Jansen', N'84.75', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN5062', N'1kg Paste Amaretto ', N'No ', N'Jansen', N'62.4', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN5062R', N'350g Paste Amaretto ', N'No ', N'Jansen', N'95.1', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN5065R', N'300g Paste Hazelnut Concentrated ', N'No ', N'Jansen', N'98.45', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN5066R', N'350g Paste Menthe Mint ', N'No ', N'Jansen', N'62.1', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN5070R', N'350g Paste Champagne Bouquet w/Alc. ', N'No ', N'Jansen', N'53.5', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN5075', N'1kg Paste Orange Pastagrum ', N'No ', N'Jansen', N'59.1', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN5075R', N'350g Paste Orange Pastagrum ', N'No ', N'Jansen', N'51.1', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN5076', N'1kg Paste Pineapple ', N'No ', N'Jansen', N'58.15', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN5076R', N'350g Paste Pineapple ', N'No ', N'Jansen', N'58.75', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN5077', N'1kg Paste Blood-Orange Pastagrum ', N'Yes', N'Jansen', N'51.4', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN5077R', N'350g Paste Blood-Orange Pastagrum ', N'No ', N'Jansen', N'59.9', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN5080', N'1kg Paste Strawberry w/Seeds ', N'No ', N'Jansen', N'52.35', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN5082', N'1kg Paste Raspberry ', N'No ', N'Jansen', N'36.7', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN5082R', N'350g Paste Raspberry ', N'No ', N'Jansen', N'80.2', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN5083R', N'350g Paste Cherry Dark (Weichsel) ', N'No ', N'Jansen', N'85.85', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN5084R', N'350g Paste Tea (Black) ', N'No ', N'Jansen', N'53.2', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN5085', N'1kg Paste Lemon Pastagrum ', N'Yes', N'Jansen', N'54.8', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN5086', N'1kg Paste Peach Melba ', N'No ', N'Jansen', N'46.85', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN5086R', N'350g Paste Peach Melba ', N'No ', N'Jansen', N'28.3', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN5088A', N'1kg Paste Pistachio Natural Unsweetened ', N'No ', N'Jansen', N'40.55', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN5088R', N'350g Paste Pistachio with Sml Pcs ', N'No ', N'Jansen', N'96.35', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN5090', N'1kg Paste Mandarine Pastagrum ', N'No ', N'Jansen', N'93.2', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN5090R', N'350g Paste Mandarin Pastagram ', N'Yes', N'Jansen', N'44.7', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN5093', N'1kg Paste Maracuja/Passionfruit ', N'Yes', N'Jansen', N'61.45', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN5094R', N'350g Paste Egg Punch ', N'Yes', N'Jansen', N'43.85', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN5095', N'1kg Paste Blackcurrant (Cassis) ', N'No ', N'Jansen', N'42.5', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN5095R', N'350g Paste Blackcurrant (Cassis) ', N'No ', N'Jansen', N'73.3', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN5100', N'1kg Paste Red Currant ', N'No ', N'Jansen', N'31.25', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN5100R', N'350g Paste Red Currant ', N'No ', N'Jansen', N'53.15', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN5113', N'1kg Paste Grappa w/Alc. ', N'No ', N'Jansen', N'37.9', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN5113R', N'350g Paste Grappa w/Alc. ', N'No ', N'Jansen', N'46.7', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN5120', N'1kg Paste Calvados Bouquet w/Fruit ', N'No ', N'Jansen', N'74.35', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'JAN5120R', N'350g Paste Calvados Bouquet w/Alc. ', N'No ', N'Jansen', N'80', N'https://jansen-aromen.de/en/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'KH499468', N'1kg Liquorice Brown Coins', N'No ', N'Salmiac', N'65.25', N'salmiacnestgen.com.dk', N'Pick and Mix')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'KH4994688', N'2kg Liquorice Brown Coins', N'No ', N'Salmiac', N'22.89', N'salmiacnestgen.com.dk', N'Pick and Mix')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'KH4994689', N'1kg Liquorice Brown Coins', N'No ', N'Salmiac', N'56.9', N'salmiacnestgen.com.dk', N'Pick and Mix')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'KH499469', N'1kg Caramel Liquorice Sticks', N'No ', N'Salmiac', N'65.25', N'salmiacnestgen.com.dk', N'Pick and Mix')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'KH499470', N'1kg Groitten', N'No ', N'Salmiac', N'99.99', N'salmiacnestgen.com.dk', N'Pick and Mix')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'KMT9299', N'205g Butlers Chocolate Box Assortment ', N'No ', N'King Monty', N'120.55', N'https://www.kingmonty.co.uk', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'KMT9300', N'360g Butlers Chocolate Box Assortment Large ', N'No ', N'King Monty', N'65.1', N'https://www.kingmonty.co.uk', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'KMT9301', N'100g Butlers Chocolate Collection ', N'No ', N'King Monty', N'84.35', N'https://www.kingmonty.co.uk', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'KMT9302', N'180g Butlers Chocolate Collection ', N'No ', N'King Monty', N'25.35', N'https://www.kingmonty.co.uk', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'KMT9303', N'130g Butlers Dessert Collection ', N'Yes', N'King Monty', N'15', N'https://www.kingmonty.co.uk', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'KMY0226', N'12 x 90g Bars King Monty Bars Hazelnut Crunch', N'Yes', N'King Monty', N'122.6', N'https://www.kingmonty.co.uk', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'KMY02266', N'12 x 90g Bars King Monty Bars Hazelnut Crunch', N'Yes', N'King Monty', N'94.2', N'https://www.kingmonty.co.uk', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'KMY0227', N'13 x 90g Bars King Monty Bars Purest Ecuador 71% Dark Chocolate ', N'Yes', N'King Monty', N'166.4', N'https://www.kingmonty.co.uk', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'KMY0228', N'12 x 90g Bars King Monty Bars Caramel', N'Yes', N'King Monty', N'76.85', N'https://www.kingmonty.co.uk', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'KMY0229', N'13 x 90g Bars King Monty Bars Pop Rice', N'Yes', N'King Monty', N'140.15', N'https://www.kingmonty.co.uk', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'KMY0230', N'14 x 90g Bars King Monty Bars Twisted', N'Yes', N'King Monty', N'165.7', N'https://www.kingmonty.co.uk', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'LEM640462', N'304g / 300Sacher OvalsDark Chocolate45mm x 13mm', N'No ', N'Leman Artisanal Decorations', N'65.9', N'LADFoodz,com.kn', N'Decorations')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'LEM640463', N'Farewell Rectangular Strips Dark Chocolate 80mm x 15mm ', N'No ', N'Leman Artisanal Decorations', N'56.75', N'LADFoodz,com.kn', N'Decorations')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'LEM640464', N'Poker Chips Blue White Chocoalte', N'No ', N'Leman Artisanal Decorations', N'37.95', N'LADFoodz,com.kn', N'Decorations')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'LEM640465', N'Poker Chips Blue White Chocoalte 38mm Diameter ', N'Yes', N'Leman Artisanal Decorations', N'48.75', N'LADFoodz,com.kn', N'Decorations')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'LEM640466', N'Poker Chips Red White Chocoalte', N'No ', N'Leman Artisanal Decorations', N'37.95', N'LADFoodz,com.kn', N'Decorations')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'LEM640467', N'Poker Chips Green White Chocoalte', N'No ', N'Leman Artisanal Decorations', N'37.95', N'LADFoodz,com.kn', N'Decorations')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'LEM640468', N'Poker Chips Black White Chocoalte', N'No ', N'Leman Artisanal Decorations', N'37.95', N'LADFoodz,com.kn', N'Decorations')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'LUB312L', N'12.5kg Block Praline Hazelnut Almond 32%: 16% Hazelnut, 16% Almond', N'No ', N'Puratos', N'75.65', N'https://www.puratos.com/', N'Fillings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'LUX553 ', N'1L Lux. Mambo Dry 70% ', N'No ', N'Luxardo', N'94.7', N'https://www.luxardo.it/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'LUX554 ', N'1L Lux. Caffe Extra 70% ', N'No ', N'Luxardo', N'68.2', N'https://www.luxardo.it/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'LUX557 ', N'1L Lux. Limoncello 70% ', N'No ', N'Luxardo', N'56.55', N'https://www.luxardo.it/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'LUX697  ', N'1L Lux. Alkermes 70% ', N'No ', N'Luxardo', N'54.45', N'https://www.luxardo.it/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'LUX701 ', N'1L Lux. Lacrime D’oro 70% ', N'No ', N'Luxardo', N'84.75', N'https://www.luxardo.it/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'MAR0107', N'60g Twigs Orange Dark Chocolate ', N'Yes', N'Mademoiselle de Margaux', N'62.35', N'https://en.mademoiselledemargaux.com/', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'MAR01073', N'30g Twigs Orange Dark Chocolate ', N'Yes', N'Mademoiselle de Margaux', N'78.1', N'https://en.mademoiselledemargaux.com/', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'MAR0108', N'60g Twigs Raspberry Dark Chocolate ', N'Yes', N'Mademoiselle de Margaux', N'56.45', N'https://en.mademoiselledemargaux.com/', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'MAR0112', N'60g Twigs Caramel Milk Chocolate ', N'Yes', N'Mademoiselle de Margaux', N'18.35', N'https://en.mademoiselledemargaux.com/', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'MAR1456', N'190g / 16 Cherries Armagnac and Dark Chocolate ', N'Yes', N'Mademoiselle de Margaux', N'8.1', N'https://en.mademoiselledemargaux.com/', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'MB115 ', N'5L Andalouse Sauce', N'No ', N'La Delicieuse', N'81.2', N'https://www.ladelicieuse.com', N'Sauces')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'MB116', N'5L BBQ Sauce', N'No ', N'La Delicieuse', N'76.15', N'https://www.ladelicieuse.com', N'Sauces')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'MB117', N'5L Chilli Sauce', N'Yes', N'La Delicieuse', N'90.25', N'https://www.ladelicieuse.com', N'Sauces')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'MB118', N'5L Mustard Sauce', N'No ', N'La Delicieuse', N'114.2', N'https://www.ladelicieuse.com', N'Sauces')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'MB119', N'5L Creamy Sauce', N'No ', N'La Delicieuse', N'49', N'https://www.ladelicieuse.com', N'Sauces')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'MB120', N'5L Bearnaise Sauce', N'No ', N'La Delicieuse', N'64.2', N'https://www.ladelicieuse.com', N'Sauces')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'MOL9005', N'3Kg Dry Heat Chocolate Melter Round', N'No ', N'Mol dárt', N'95.99', N'moldart.com', N'Equipment')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'MOL9006', N'6KG Dry Heat Chocolate Melter Round', N'No ', N'Mol dárt', N'135.5', N'moldart.com', N'Equipment')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'MOL9007', N'12KG Dry Heat Chocolate Melter Round', N'No ', N'Mol dárt', N'185.65', N'moldart.com', N'Equipment')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'MOL9008', N'24KG Dry Heat Chocolate Melter Round', N'No ', N'Mol dárt', N'199.99', N'moldart.com', N'Equipment')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'ND06907', N'12 x 100g Marzipan Chocolate Bar Classic Dark Marzipan coated in Dark Chocolate.', N'No ', N'Niederegger', N'76.25', N'https://www.niederegger.de/en/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'ND06912', N'12 x 100g Marzipan Chocolate Bar Classic Milk Marzipan coated in Milk Chocolate.', N'No ', N'Niederegger', N'13.15', N'https://www.niederegger.de/en/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'ND06927', N'12 x 100g Marzipan Chocolate Bar Orange Dark Marzipan coated in Dark Chocolate.', N'No ', N'Niederegger', N'189.75', N'https://www.niederegger.de/en/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'ND06945', N'24 x 40g Marzipan Stick Classic Dark Marzipan coated in Dark Chocolate.', N'No ', N'Niederegger', N'164.15', N'https://www.niederegger.de/en/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'NETCY222', N'100 x 35g Tin Great British Mints ', N'Yes', N'New English Tea', N'52.35', N'https://www.newenglishteastrade.com', N'No Sugar Added')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'NOB0001', N'116g Pralines Assorted ', N'No ', N'Noble', N'12.25', N'https://www.noble-food-group.com/nl/', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'NOB1001', N'110g Orange Clusties Dark ', N'Yes', N'Noble', N'70.7', N'https://www.noble-food-group.com/nl/', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'NOB1002', N'110g Caramel Clusties Milk ', N'Yes', N'Noble', N'43.55', N'https://www.noble-food-group.com/nl/', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'NOB1003', N'110g Cranberry Clusties Milk ', N'Yes', N'Noble', N'96.3', N'https://www.noble-food-group.com/nl/', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'NOB1004', N'110g Vanilla Clusties Milk ', N'Yes', N'Noble', N'10.55', N'https://www.noble-food-group.com/nl/', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'NOB1530', N'200g Original Cups Assorted ', N'No ', N'Noble', N'56.7', N'https://www.noble-food-group.com/nl/', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'NOB4003', N'50g Pure Selection Cups Assorted Duo Praline, Dark Praline, Caramel, Cherry, Champagne.', N'No ', N'Noble', N'30.5', N'https://www.noble-food-group.com/nl/', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'NOB4301', N'50g Original Cups Assorted ', N'Yes', N'Noble', N'52.2', N'https://www.noble-food-group.com/nl/', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'NOB5003', N'200g Pure Selection Cups Assorted ', N'No ', N'Noble', N'15.25', N'https://www.noble-food-group.com/nl/', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'NOB6004', N'185g Pralines Assorted ', N'No ', N'Noble', N'12.25', N'https://www.noble-food-group.com/nl/', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'NOB8301', N'100g Original Cups Assorted ', N'Yes', N'Noble', N'100.25', N'https://www.noble-food-group.com/nl/', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'ONE3003', N'Comfort Green 53cm', N'No ', N'Comfort Piping Bags', N'4.95', N'CPB.com.au', N'Equipment')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'ONE30047', N'100 Piping Bags Dispenser Orange Heat 59cm x 28cm', N'No ', N'Comfort Piping Bags', N'65', N'CPB.com.au', N'Pipping Bags')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'ONE30048', N'100 Piping Bags Dispenser Yellow 59cm x 28cm', N'No ', N'Comfort Piping Bags', N'65', N'CPB.com.au', N'Pipping Bags')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'ONE30049', N'100 Piping Bags Dispenser White 59cm x 28cm', N'No ', N'Comfort Piping Bags', N'65', N'CPB.com.au', N'Pipping Bags')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'ONE3005', N'Comfort Green 59cm', N'No ', N'Comfort Piping Bags', N'4.95', N'CPB.com.au', N'Equipment')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'ONE30050', N'100 Piping Bags Dispenser Silk 59cm x 28cm', N'No ', N'Comfort Piping Bags', N'25', N'CPB.com.au', N'Pipping Bags')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'ONE30051', N'100 Piping Bags Dispenser Original 59cm x 28cm', N'No ', N'Comfort Piping Bags', N'25', N'CPB.com.au', N'Pipping Bags')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'ONE30052', N'100 Piping Bags Dispenser Tan 59cm x 28cm', N'No ', N'Comfort Piping Bags', N'25', N'CPB.com.au', N'Pipping Bags')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'ONE30053', N'100 Piping Bags Dispenser  59cm x 28cm', N'No ', N'Comfort Piping Bags', N'25', N'CPB.com.au', N'Pipping Bags')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'ONE3110R', N'Sweetliner Piping Bags', N'No ', N'Comfort Piping Bags', N'18.99', N'CPB.com.au', N'Equipment')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'PA1017', N'1.2kg / 10 × 120g Apple Tartlets ', N'No ', N'Brioche Pasquier', N'79', N'https://www.pasquier.fr/en_uk/homepage', N'Macarons')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'PA1018', N'550g / 5 × 110g Raspberry Tartlets ', N'No ', N'Brioche Pasquier', N'81', N'https://www.pasquier.fr/en_uk/homepage', N'Macarons')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'PA1021', N'800g / 10 × 80g Chocolate Tartlets ', N'No ', N'Brioche Pasquier', N'85.5', N'https://www.pasquier.fr/en_uk/homepage', N'Macarons')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'PA61298', N'720g / 72 × 10g Macarons 6 Assorted The 72 piece pack contains more standard varieties of fillings including Lemon, Raspberry, Pistachio, Vanilla, Chocolate and Coffee.', N'No ', N'Brioche Pasquier', N'83.5', N'https://www.pasquier.fr/en_uk/homepage', N'Macarons')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'PA61303', N'360g / 36 × 10g Macarons 6 Assorted  The Macarons 36 piece box Romantic Collection', N'No ', N'Brioche Pasquier', N'12', N'https://www.pasquier.fr/en_uk/homepage', N'Macarons')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'PA61473', N'924g / 72 × 13g Macarons 6 Assorted vanilla, coffee, raspberry, lemon, pistachio, chocolate', N'No ', N'Brioche Pasquier', N'48', N'https://www.pasquier.fr/en_uk/homepage', N'Macarons')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'PAR20902', N'110 piece Caramels with Rose Petals', N'No ', N'Belcolade', N'44.55', N'https://www.belcolade.com/en', N'Candy')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'PAR20903', N'110 piece Nougat with Rose Petals', N'No ', N'Belcolade', N'91.95', N'https://www.belcolade.com/en', N'Candy')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'PAR20904', N'110 piece White Chocolate with Rose Petals', N'No ', N'Belcolade', N'80.25', N'https://www.belcolade.com/en', N'Candy')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'PED3374', N'Nougat Noir Roasted Hazelnuts', N'No ', N'Peddling Pastry', N'156.7', N'https://www.peddlingpastry.com.au/', N'Confectionery')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'PED3375', N'Nougat Noir Roasted Almond & Honey', N'No ', N'Peddling Pastry', N'57.8', N'https://www.peddlingpastry.com.au/', N'Confectionery')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'PED3376', N'Nougat Noir Roasted Almond & Cranberry', N'No ', N'Peddling Pastry', N'79.6', N'https://www.peddlingpastry.com.au/', N'Confectionery')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'PED3377', N'Rhubarb & Custard Hard Boiled Sweets', N'Yes', N'Cartwright and Butler', N'104.25', N'https://www.cartwrightandbutler.co.uk/', N'Confectionery')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'PED3378', N'Salted Caramel Fudge', N'No ', N'Cartwright and Butler', N'274.95', N'https://www.cartwrightandbutler.co.uk/', N'Confectionery')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'PED3379', N'150g Sea Salted Toffees', N'No ', N'Cartwright and Butler', N'79.6', N'https://www.cartwrightandbutler.co.uk/', N'Confectionery')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'PID020', N'192 Zakouskis Round Mini Vol-au-Vent 3.5cm x 2.2cm Puff Pastry', N'Yes', N'Pidy', N'85', N'https://www.pidy.com/en', N'Canapes')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'PID076A', N'400 Apero Assortment Neutral Neutral Shell', N'No ', N'Pidy', N'65', N'https://www.pidy.com/en', N'Canapes')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'PID076T', N'226 Apero Assortment Neutral Neutral Shell', N'No ', N'Pidy', N'99', N'https://www.pidy.com/en', N'Canapes')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'PID509', N'286 Mini Cones Neutral 2.5cm x 7.5cm Waffle Pastry', N'No ', N'Pidy', N'85', N'https://www.pidy.com/en', N'Canapes')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'PID717', N'192 Iris Flower Cup Neutral 3cm x 2.5cm Pressed Pastry', N'Yes', N'Pidy', N'32', N'https://www.pidy.com/en', N'Canapes')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'PID717PP', N'50 Iris Flower Cup Neutral 3cm x 2.5cm Pressed Pastry', N'Yes', N'Pidy', N'69.5', N'https://www.pidy.com/en', N'Canapes')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'PID790T', N'84 Cocktail Spoons Neutral 7.5cm x 3.5cm Puff Pastry', N'No ', N'Pidy', N'67', N'https://www.pidy.com/en', N'Canapes')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'PID793T', N'84 Duobelle Wave Neutral 6cm x 3cm Neutral Shell', N'No ', N'Pidy', N'95', N'https://www.pidy.com/en', N'Canapes')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'PLG3101 ', N'12 x 85g Tablets No Sugar Added Milk Chocolate ', N'No ', N'Sweets Without', N'53.65', N'https://sweetswithout.co.uk', N'No Sugar Added')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'PLG3102', N'16 x 85g Tablets No Sugar Added Muddles Chocolate ', N'No ', N'Sweets Without', N'109.5', N'https://sweetswithout.co.uk', N'No Sugar Added')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'PLG3103', N'15 x 85g Tablets No Sugar Added Cookies and Cream Chocolate ', N'No ', N'Sweets Without', N'72.2', N'https://sweetswithout.co.uk', N'No Sugar Added')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'PLG3104', N'13 x 85g Tablets No Sugar Added Dark Chocolate ', N'Yes', N'Sweets Without', N'88.6', N'https://sweetswithout.co.uk', N'No Sugar Added')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'PLG3105', N'14 x 85g Tablets No Sugar Added White Chocolate ', N'No ', N'Sweets Without', N'35.7', N'https://sweetswithout.co.uk', N'No Sugar Added')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'PLG31055', N'25x 85g Tablets No Sugar Added White Chocolate ', N'Yes', N'Sweets Without', N'52.35', N'https://sweetswithout.co.uk', N'No Sugar Added')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'PLG3107', N'12 x 85g Tablet with Lemon Ginger and Chilli No Sugar Added Milk Chocolate', N'Yes', N'Perlege', N'184.75', N'https://Perlege.com/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'PLG31077', N'12 x 85g Tablet with Lemon Ginger and Chilli No Sugar Added Milk Chocolate', N'Yes', N'Perlege', N'86.6', N'https://Perlege.com/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'PLG3108', N'12 x 85g Tablet with Blueberries and Almonds Cookies No Sugar Added Dark Chocolate', N'Yes', N'Perlege', N'157.75', N'https://Perlege.com/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'POP0250#', N'3.6kg / 492 Bretzel Craquelin CRAKINI ', N'No ', N'Poppies', N'76', N'https://www.poppies.com/en', N'Biscuits')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'POP1083', N'1kg / 150 Twists Puff Pastry ', N'No ', N'Poppies', N'89.5', N'https://www.poppies.com/en', N'Biscuits')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'POP1236', N'1kg / 68 Cocolito Coconut Macaroons ', N'No ', N'Poppies', N'79.5', N'https://www.poppies.com/en', N'Biscuits')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'POP1345', N'2.8kg / 168 × 16g Mini Eclairs Vanilla Cream with Chocolate Topping', N'No ', N'Poppies', N'42.5', N'https://www.poppies.com/en', N'Pastries')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'POP2045', N'800g / 52 Petit Fours Belgian 4 Assorted Mini Eclairs Swiss Crème with Chocolate Topping', N'No ', N'Poppies', N'9.5', N'https://www.poppies.com/en', N'Pastries')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'POP4180', N'2.3kg / 136 Mini Desserts 4 Assorted Mini Eclairs Swiss Crème with Chocolate Topping', N'No ', N'Poppies', N'73.5', N'https://www.poppies.com/en', N'Pastries')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'POP4260#', N'1.8kg / 300 Caramelito Speculoos Biscuit The real Belgian caramalised biscuit, known as speculoos, come with a deep caramel colour. A whisper of cinnamon gives the original taste.', N'No ', N'Poppies', N'29.5', N'https://www.poppies.com/en', N'Biscuits')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'POP4899', N'1.8kg / 375 Mini Palmiers Puff Pastry ', N'Yes', N'Poppies', N'19', N'https://www.poppies.com/en', N'Biscuits')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'POP5517', N'1.75kg / 120 × 15g Mini Almond Slices 4.7cm x 2.3cm', N'Yes', N'Poppies', N'70', N'https://www.poppies.com/en', N'Pastries')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'POP5986', N'1kg / 30 × 35g Medium Almond Slices 4.7cm x 4.5cm', N'Yes', N'Poppies', N'63', N'https://www.poppies.com/en', N'Pastries')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'POP8093', N'1.12kg / 16 × 70g Vanilla Slices', N'No ', N'Poppies', N'72.5', N'https://www.poppies.com/en', N'Pastries')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'PR0003', N'1.1kg / 71 Coeur d’Amour Orange Cream', N'No ', N'Caluwe Artisan', N'99.6', N'https://www.cdchocolates.com/en', N'Dark Chocolate')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'PR0008', N'0.8kg / 48 Passionata Pistachio', N'No ', N'Caluwe Artisan', N'57.75', N'https://www.cdchocolates.com/en', N'Dark Chocolate')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'PR0027', N'1kg / 46 Zebra Mocha Hazelnut Praline', N'No ', N'Caluwe Artisan', N'91.95', N'https://www.cdchocolates.com/en', N'White Chocolate')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'PR0054', N'1kg / 48 Automne Lemon', N'Yes', N'Caluwe Artisan', N'78.1', N'https://www.cdchocolates.com/en', N'Milk Chocolate')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'PR0125', N'1.2kg / 70 Othello Orange Liqueur Ganache', N'Yes', N'Caluwe Artisan', N'71.35', N'https://www.cdchocolates.com/en', N'Dark Chocolate')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'PR0130', N'1kg / 65 Angel Cherry with Liqueur', N'Yes', N'Caluwe Artisan', N'80.25', N'https://www.cdchocolates.com/en', N'Dark Chocolate')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'PR0411', N'1.2kg / 83 Leopold Cashew Praline', N'No ', N'Caluwe Artisan', N'77.15', N'https://www.cdchocolates.com/en', N'Milk Chocolate')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'PR1053', N'0.8kg / 56 La Finesse Marc de Champagne Cup', N'No ', N'Caluwe Artisan', N'18.05', N'https://www.cdchocolates.com/en', N'Milk Chocolate')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'PR5008', N'0.8kg / 61 Aztec Ganache Cocoa Nibs Cup', N'Yes', N'Caluwe Artisan', N'54.7', N'https://www.cdchocolates.com/en', N'Dark Chocolate')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'PR6201', N'0.9kg / 60 Alberic Soft Caramel Cup', N'No ', N'Caluwe Artisan', N'18.3', N'https://www.cdchocolates.com/en', N'Milk Chocolate')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'PR7001', N'0.8kg / 45 Signature Caramel Croquant', N'Yes', N'Caluwe Artisan', N'36.4', N'https://www.cdchocolates.com/en', N'Milk Chocolate')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'PR7038', N'0.8kg / 57 Gourmet Dark Ganache Cup', N'Yes', N'Caluwe Artisan', N'67.8', N'https://www.cdchocolates.com/en', N'Milk Chocolate')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'PRN2391', N'5kg Mandorlone Paste ', N'No ', N'Pernigotti', N'28.5', N'https://www.luxardo.it/', N'Gelato Ingredients')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'PRN2681', N'5.5kg Walnut Paste ', N'No ', N'Pernigotti', N'56.1', N'https://www.luxardo.it/', N'Gelato Ingredients')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'PRN2811', N'5.5kg Pistachio Paste ', N'No ', N'Pernigotti', N'73.1', N'https://www.luxardo.it/', N'Gelato Ingredients')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'PRN3391', N'4.8kg G. Zabaione C. Plastic Case ', N'No ', N'Pernigotti', N'44.95', N'https://www.luxardo.it/', N'Gelato Ingredients')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'PRN6015', N'1.25kg Mango ', N'No ', N'Pernigotti', N'70.75', N'https://www.luxardo.it/', N'Gelato Ingredients')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'PTF1563', N'2kg Pralifizz ', N'No ', N'Puratos', N'22.5', N'https://www.puratos.com/', N'Fillings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'PTF2523', N'1.5kg Pralirex Pistachio Paste 99% ', N'No ', N'Puratos', N'77.75', N'https://www.puratos.com/', N'Fillings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'PTF2668', N'5kg Patisfrance Praline Almond 50% ', N'No ', N'Puratos', N'93.95', N'https://www.puratos.com/', N'Fillings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'PTF2674', N'5kg Patisfrance Praline Almond / Hazelnut 50% ', N'No ', N'Puratos', N'31.1', N'https://www.puratos.com/', N'Fillings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'PTF2675', N'4kg Patisfrance Gianduja ', N'No ', N'Puratos', N'15.7', N'https://www.puratos.com/', N'Fillings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'PTF2738', N'1.5kg Pralirex Hazelnut Paste 100% ', N'No ', N'Puratos', N'82.95', N'https://www.puratos.com/', N'Fillings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'PTF2791', N'4.5kg Strawberry Filling Bake Stable. Packed in a bucket.', N'No ', N'Puratos', N'59.05', N'https://www.puratos.com/', N'Fillings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'PTF2792', N'4.5kg Apricot Filling Bake Stable. Packed in a bucket.', N'No ', N'Puratos', N'67.8', N'https://www.puratos.com/', N'Fillings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'PTF3235', N'4.5kg Pralicrac Salted Butter Caramel ', N'No ', N'Puratos', N'86.45', N'https://www.puratos.com/', N'Fillings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'PTF5619', N'4.5kg Pralicrac Chocolat Blanc ', N'No ', N'Puratos', N'89.2', N'https://www.puratos.com/', N'Fillings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'PUR1628', N' 5kg Deli Citron Tart Filling ', N'No ', N'Puratos', N'32.8', N'https://www.puratos.com/', N'Fillings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'PUR1646 ', N'5kg Deli Orange Tart Filling ', N'No ', N'Puratos', N'23.95', N'https://www.puratos.com/', N'Fillings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'PUR20220', N'1kg Paste Cherry ', N'No ', N'Puratos', N'55.3', N'https://www.puratos.com/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'PUR20222', N'1kg Paste Lemon ', N'No ', N'Puratos', N'85.05', N'https://www.puratos.com/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'PUR20224', N'1kg Paste Coconut ', N'No ', N'Puratos', N'31.75', N'https://www.puratos.com/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'PUR20226', N'1kg Paste Raspberry ', N'No ', N'Puratos', N'95.85', N'https://www.puratos.com/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'PUR20227', N'1kg Paste Strawberry ', N'No ', N'Puratos', N'60.3', N'https://www.puratos.com/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'PUR20228', N'1kg Paste Kiwi ', N'No ', N'Puratos', N'88.65', N'https://www.puratos.com/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'PUR20231', N'1kg Paste Orange ', N'No ', N'Puratos', N'20.2', N'https://www.puratos.com/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'PUR20233', N'1kg Paste Passion ', N'No ', N'Puratos', N'77.35', N'https://www.puratos.com/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'PUR20758', N'1kg Paste Mango ', N'No ', N'Puratos', N'26.3', N'https://www.puratos.com/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'QBZOOO1', N'100g Assorted Cake Decorations', N'No ', N'Decorations Unlimited', N'52.55', N'Dulimited.com.au', N'Decorations')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'QBZOOO2', N'200g Assorted Cake Decorations', N'No ', N'Decorations Unlimited', N'25.9', N'Dulimited.com.au', N'Decorations')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'QBZOOO3', N'400g Assorted Cake Decorations', N'No ', N'Decorations Unlimited', N'94.2', N'Dulimited.com.au', N'Decorations')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'QBZOOO4', N'800g Assorted Cake Decorations', N'No ', N'Decorations Unlimited', N'38', N'Dulimited.com.au', N'Decorations')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'QBZOOO5', N'100g Chocolate Cake Decorations', N'No ', N'Decorations Unlimited', N'72.15', N'Dulimited.com.au', N'Decorations')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'QBZOOO7', N'400g Chocolate Cake Decorations', N'No ', N'Decorations Unlimited', N'79.85', N'Dulimited.com.au', N'Decorations')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'QBZOOO8', N'800g Chocolate Cake Decorations', N'No ', N'Decorations Unlimited', N'62.65', N'Dulimited.com.au', N'Decorations')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'RKA12310#', N'1.6kg / 590 Cheese Crispies Cheddar ', N'No ', N'Roka', N'27', N'http://www.cheesecrispies.com/en/home', N'Biscuits')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'RKA12820#', N'1.6kg / 590 Cheese Crispies Gouda ', N'No ', N'Roka', N'89', N'http://www.cheesecrispies.com/en/home', N'Biscuits')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'RKA22680#', N'1.6kg / 210 Cheese Sticks Gouda ', N'No ', N'Roka', N'84.5', N'http://www.cheesecrispies.com/en/home', N'Biscuits')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'ROM233', N'1.5kg/108 Flake Truffles Bulk Milk Chocolate', N'No ', N'Roma Truffles', N'86.35', N'NA', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'ROM236', N'1.5kg/108 Flake Truffles Bulk White Chocolate', N'No ', N'Roma Truffles', N'11.95', N'NA', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'ROM314', N'125g Truffles Milk Luxury milk chocolate truffles.', N'No ', N'Roma Truffles', N'79.05', N'NA', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'ROM321', N'375g Luxury Truffles 3 Assorted Luxury milk, dark and white chocolate truffles.', N'No ', N'Roma Truffles', N'23', N'NA', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'ROM344', N'200g Truffles Milk Luxury milk chocolate truffles.', N'No ', N'Roma Truffles', N'99.45', N'NA', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'ROM3444', N'400g Truffles Milk Luxury milk chocolate truffles.', N'No ', N'Roma Truffles', N'13.3', N'NA', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'ROSE001', N'350g Creme  Filled Fudge -  Dark Milk Chocolate ', N'No ', N'Rosetta''s', N'263.65', N'Https://rosettasaust.com.au', N'Confectionery')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'ROSE002', N'350g Creme  Filled Fudge -  Caramel Milk Chocolate ', N'No ', N'Rosetta''s', N'90.2', N'Https://rosettasaust.com.au', N'Confectionery')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'ROSE004', N'350g Creme  Filled Fudge -  Strawberry', N'No ', N'Rosetta''s', N'216.9', N'Https://rosettasaust.com.au', N'Confectionery')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'ROSE005', N'350g Creme  Filled Fudge -  Mint', N'No ', N'Rosetta''s', N'243.25', N'Https://rosettasaust.com.au', N'Confectionery')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'ROSE006', N'350g Creme  Filled Fudge -  Pineapple', N'No ', N'Rosetta''s', N'102.4', N'Https://rosettasaust.com.au', N'Confectionery')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'ROSE007', N'350g Creme  Filled Fudge -  Honey Crunch', N'No ', N'Rosetta''s', N'190.15', N'Https://rosettasaust.com.au', N'Confectionery')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'SAU1001', N'1 litre Tomato Sauce', N'No ', N'Heinze', N'12.5', N'heinz.com.au', N'Condiments')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'SAU1002', N'1 litre Tomato Sauce - Salt Reduced', N'No ', N'Heinze', N'12.5', N'heinz.com.au', N'Condiments')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'SAU1003', N'1 litre BBQ Sauce', N'No ', N'Heinze', N'12.5', N'heinz.com.au', N'Condiments')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'SAU1004', N'1 litre Mustard', N'No ', N'Heinze', N'12.5', N'heinz.com.au', N'Condiments')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'SAU1005', N'1 litre Mayonnaise', N'No ', N'Heinze', N'12.5', N'heinz.com.au', N'Condiments')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'SCH292993', N'350g Paste Cocoa Naturella ', N'No ', N'Schlunder', N'15.3', N'https://schluender-germany.com/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'SCH292994', N'300g Flavour Vanilla Extra Fine ', N'No ', N'Schlunder', N'16', N'https://schluender-germany.com/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'SCH292995', N'1kg Paste Champagne Bouquet w/Alc. ', N'No ', N'Schlunder', N'18.2', N'https://schluender-germany.com/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'SCH292996', N'350g Paste Apple Coxorange ', N'No ', N'Schlunder', N'18.65', N'https://schluender-germany.com/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'SCH292997', N'1kg Paste Kiwi ', N'No ', N'Schlunder', N'18.85', N'https://schluender-germany.com/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'SCH292998', N'350g Paste Lemon Pastagrum ', N'No ', N'Schlunder', N'19', N'https://schluender-germany.com/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'SCH292999', N'300g Flavour Vanilla Coback ', N'No ', N'Schlunder', N'19.25', N'https://schluender-germany.com/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'SCH293000', N'350g Paste Maracuja/Passionfruit ', N'No ', N'Schlunder', N'21.35', N'https://schluender-germany.com/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'SCH293001', N'350g Paste Praline Fin ', N'No ', N'Schlunder', N'22.05', N'https://schluender-germany.com/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'SCH293002', N'350g Paste Blackberry ', N'No ', N'Schlunder', N'22.7', N'https://schluender-germany.com/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'SCH293003', N'1kg Paste Pomegranate ', N'No ', N'Schlunder', N'24.05', N'https://schluender-germany.com/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'SCH293004', N'350g Paste Lime ', N'No ', N'Schlunder', N'24.65', N'https://schluender-germany.com/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'SCH293005', N'1kg Paste Vanilla with Seeds ', N'No ', N'Schlunder', N'24.7', N'https://schluender-germany.com/', N'Flavourings')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'SCH459#', N'6kg / 696 Pumpernickel Cocktail Rounds ', N'No ', N'Schlunder', N'70.5', N'https://schluender-germany.com/', N'Biscuits')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'SKHS45552', N'25 Lime Macarons', N'No ', N'Biscuits By Jen', N'48.55', N'https://www.biscuitsbyjen.nz', N'Biscuits')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'SKHS45553', N'25 Chocolate Macarons', N'No ', N'Biscuits By Jen', N'48.55', N'https://www.biscuitsbyjen.nz', N'Biscuits')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'SKHS45554', N'25 Mocha Macarons', N'No ', N'Biscuits By Jen', N'48.55', N'https://www.biscuitsbyjen.nz', N'Biscuits')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'SKHS45555', N'25 Raspberry Macarons', N'No ', N'Biscuits By Jen', N'48.55', N'https://www.biscuitsbyjen.nz', N'Biscuits')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'SKHS45556', N'25 Caramel Macarons', N'No ', N'Biscuits By Jen', N'48.55', N'https://www.biscuitsbyjen.nz', N'Biscuits')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'SKHS45557', N'25 Grape Macarons', N'No ', N'Biscuits By Jen', N'48.55', N'https://www.biscuitsbyjen.nz', N'Biscuits')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'SKHS45558', N'25 Orange Macarons', N'No ', N'Biscuits By Jen', N'48.55', N'https://www.biscuitsbyjen.nz', N'Biscuits')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'SKHS45559', N'25 Lemon Macarons', N'No ', N'Biscuits By Jen', N'48.55', N'https://www.biscuitsbyjen.nz', N'Biscuits')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'SKHS45560', N'25 Strawberry Macarons', N'No ', N'Biscuits By Jen', N'48.55', N'https://www.biscuitsbyjen.nz', N'Biscuits')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'SON8300', N'1L Topping Chocolate', N'No ', N'Colac', N'98.4', N'https://www.colac.be/en', N'Sauces')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'SON8301', N'1L Topping Strawberry', N'No ', N'Colac', N'65.25', N'https://www.colac.be/en', N'Sauces')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'SON8302', N'1L Topping Caramel', N'No ', N'Colac', N'83.15', N'https://www.colac.be/en', N'Sauces')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'SON8303', N'1L Topping Salted Caramel', N'No ', N'Colac', N'117.3', N'https://www.colac.be/en', N'Sauces')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'SON8304', N'1L Topping Salted Pineapple', N'No ', N'Colac', N'94.55', N'https://www.colac.be/en', N'Sauces')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'SSW003', N'70g Stevia Chocolate Almond Dragees ', N'Yes', N'Sweet Switch', N'53.2', N'https://www.sweet-switch.com/', N'No Sugar Added')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'SSW005', N'70g Stevia Fruit Bonbons 5 Flavours Assorted', N'No ', N'Sweet Switch', N'67.45', N'https://www.sweet-switch.com/', N'No Sugar Added')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'SSW006', N'210g Stevia Sweetened Tropical Fruit Spread 70% Fruit', N'No ', N'Sweet Switch', N'47.25', N'https://www.sweet-switch.com/', N'No Sugar Added')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'SSW009', N'210g Stevia Sweetened Apricot Fruit Spread 70% Fruit', N'No ', N'Sweet Switch', N'59.4', N'https://www.sweet-switch.com/', N'No Sugar Added')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'SSW0099', N'400g Stevia Sweetened Apricot Fruit Spread 70% Fruit', N'Yes', N'Sweet Switch', N'84.9', N'https://www.sweet-switch.com/', N'No Sugar Added')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'SSW015', N'100g Stevia Sweetened Belgian Chocolate Chip Cookies ', N'No ', N'Sweet Switch', N'73.6', N'https://www.sweet-switch.com/', N'No Sugar Added')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'SSW019', N'150g / 6 Stevia Antioxidant Cereal Bars With Orange and Belgian Dark Chocolate', N'No ', N'Sweet Switch', N'66.65', N'https://www.sweet-switch.com/', N'No Sugar Added')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'SSW020', N'150g / 6 Stevia Fruit and Fibre Bars With Apricot, Plum and Belgian Milk Chocolate', N'No ', N'Sweet Switch', N'53.65', N'https://www.sweet-switch.com/', N'No Sugar Added')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'SSW021', N'70g Stevia Marshmallow Twists ', N'No ', N'Sweet Switch', N'63.35', N'https://www.sweet-switch.com/', N'No Sugar Added')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'SSW022', N'100g / 12 Stevia Lollipops 5 Assorted', N'No ', N'Sweet Switch', N'75.45', N'https://www.sweet-switch.com/', N'No Sugar Added')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'TLY202888', N'Tilleys Banana and Custard', N'No ', N'Tilleys', N'22.89', N'tilleysfoods.com.br', N'Pick and Mix')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'TLY202889', N'3.1kg Tilleys Blackberry and Apple', N'No ', N'Tilleys', N'45.25', N'tilleysfoods.com.br', N'Pick and Mix')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'TLY202890', N'3.17kg Tilleys Bullseyes', N'No ', N'Tilleys', N'22.89', N'tilleysfoods.com.br', N'Pick and Mix')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'TOP1458', N'188gm jar of Strawberry Fruit Chutney', N'No ', N'Top Jam', N'6.5', N'http://topjam.com.br', N'Condiments')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'TOP1459', N'188gm jar of Lemon Fruit Chutney', N'No ', N'Top Jam', N'6.5', N'http://topjam.com.br', N'Condiments')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'TOP1460', N'188gm jar of Cherry Fruit Chutney', N'No ', N'Top Jam', N'6.5', N'http://topjam.com.br', N'Condiments')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'TOP1461', N'188gm jar of Apricort Fruit Chutney', N'No ', N'Top Jam', N'6.5', N'http://topjam.com.br', N'Condiments')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'TOP1462', N'188gm jar of Lime and Pineapple Fruit Chutney', N'No ', N'Top Jam', N'6.5', N'http://topjam.com.br', N'Condiments')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'TOP1463', N'188gm jar of Lemon Fruit Chutney', N'No ', N'Top Jam', N'6.5', N'http://topjam.com.br', N'Condiments')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'TOP1464', N'188gm jar of Blackberry Fruit Chutney', N'No ', N'Top Jam', N'6.5', N'http://topjam.com.br', N'Condiments')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'TOP1465', N'188gm jar of Blood Orange Fruit Chutney', N'No ', N'Top Jam', N'6.5', N'http://topjam.com.br', N'Condiments')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'TRE161', N'1kg / 56 Salty Caramel Squares', N'No ', N'Trefin', N'32.95', N'https://www.trefin.com/', N'Dark Chocolate')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'TRE162', N'1kg / 62 Coffee Amalia Cappuccino Ganache', N'No ', N'Trefin', N'84.45', N'https://www.trefin.com/', N'Dark Chocolate')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'TRE163', N'1kg / 58 Marbled Rum Ganache', N'No ', N'Trefin', N'89.7', N'https://www.trefin.com/', N'White Chocolate')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'TRE164', N'1.2kg chocolate sea shells ', N'No ', N'Trefin', N'90.55', N'https://www.trefin.com/', N'Seashells')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'TRE266', N'Chocolate Hearts Praline Milk 65g ', N'No ', N'Trefin', N'26.2', N'https://www.trefin.com/ ', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'TRE269', N'Chocolate Sea Shells 200g ', N'No ', N'Trefin', N'28.85', N'https://www.trefin.com/ ', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'TRE270', N'Chocolate Hearts Praline Milk 200g ', N'No ', N'Trefin', N'81.9', N'https://www.trefin.com/ ', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'TRE2701', N'Chocolate Hearts Praline Milk 100g ', N'No ', N'Trefin', N'75.55', N'https://www.trefin.com/ ', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'TRE379', N'Belgian Filled Napolitans, Dark / Milk. 140 in a 1kg pack ', N'No ', N'Trefin', N'64.1', N'https://www.trefin.com/ ', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'VCO0200', N'200g assortment of pralines. ', N'No ', N'Van Coillie', N'58.35', N'https://pralineur.be/', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'VCO02002', N'200g assortment of pralines. ', N'Yes', N'Van Coillie', N'27.75', N'https://pralineur.be/', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'VCO1200', N'200g Orange Peel in dark chocolate. ', N'No ', N'Van Coillie', N'83.95', N'https://pralineur.be/', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'VCO2200', N'200g White chocolate with raspberry cream filling. ', N'No ', N'Van Coillie', N'41.4', N'https://pralineur.be/', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'VCO3200', N'200g Coffee, caramel and praline filled milk and white chocolate. ', N'No ', N'Van Coillie', N'18.4', N'https://pralineur.be/', N'Chocolate Boxed')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'VIL1400', N'300g / 3 x 100g Bars Gift Pack 100% Swiss Milk Chocolate', N'No ', N'Villars', N'182.55', NULL, N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'VM29394', N'50 x 110g Bake Up Butter Twists Chocolate and Custard Cream', N'No ', N'Vandemoortele', N'29.5', N'https://vandemoortele.com/en', N'Pastries')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'VM42464', N'150 x 15g Mini Muffins 2 Assorted: Vanilla with Chocolate Chips Chocolate with Chocolate Chips', N'No ', N'Vandemoortele', N'93.5', N'https://vandemoortele.com/en', N'Pastries')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'VM45237 ', N'48 x 98g Danish Pastries Maple Pecan Pre-Glazed ', N'No ', N'Vandemoortele', N'69', N'https://vandemoortele.com/en', N'Pastries')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'VM452371', N'24 x 98g Danish Pastries Maple Pecan Pre-Glazed ', N'No ', N'Vandemoortele', N'14', N'https://vandemoortele.com/en', N'Pastries')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'VM45680', N'120 x 42g Mini Mix Danish Pastries With 1 bag maple syrup and 1 bag icing sugar mix ', N'No ', N'Vandemoortele', N'52', N'https://vandemoortele.com/en', N'Pastries')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'VM46620', N'Doony’s Mini Donuts Mix', N'No ', N'Vandemoortele', N'16', N'https://vandemoortele.com/en', N'Pastries')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'WIL006D12', N'12 x 50g Bar Indonesian Surabaya Milk Chocolate 54% Cacao. Intense milk chocolate with caramel notes.', N'No ', N'Willies Cacao', N'86.85', N'https://www.williescacao.com/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'WIL050D144', N'144 x 50g Bars: Willies Single Estate 12 Facing x 12 units from any of varieties (point of sale display). The stand is supplied flat, ready to fill with bars.', N'No ', N'Willies Cacao', N'183.7', N'https://www.williescacao.com/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'WIL255D12', N'12 x 40g Bar Sur Del Lago Pure Gold  100% Cacao', N'No ', N'Willies Cacao', N'17.65', N'https://www.williescacao.com/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'WIL279D12', N'12 x 50g Bar Cuban Luscious Orange Dark Chocolate 65% Cacao. Delicate orange with honey notes.', N'No ', N'Willies Cacao', N'134.65', N'https://www.williescacao.com/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'WIL286D12', N'12 x 50g Bar Peruvian Hazelnut and Raisin Dark Chocolate 70% Cacao. Rich dark chocolate with hazelnut and raisin. Smooth and simply moreish.', N'No ', N'Willies Cacao', N'100.75', N'https://www.williescacao.com/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'WIL293D12', N'12 x 50g Bar Cuban Ginger and Lime Dark Chocolate 70% Cacao. Rich dark chocolate with ginger and lime. Layers of exotic flavours.', N'No ', N'Willies Cacao', N'172.35', N'https://www.williescacao.com/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'WIL354D12', N'12 x 50g Bar Venezuelan Rio Caribe Milk Chocolate 44% Cacao. Sublime single estate milk chocolate.', N'No ', N'Willies Cacao', N'116.35', N'https://www.williescacao.com/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'WIL361D12', N'12 x 50g Bar Venezuelan El Blanco White chocolate made with non-deodourised cocoa butter.', N'No ', N'Willies Cacao', N'164.6', N'https://www.williescacao.com/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'WIL422D12', N'12 x 50g Bar Indonesian Javan Light Breaking 69% Cocao', N'No ', N'Willies Cacao', N'157.15', N'https://www.williescacao.com/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'WIL446D12', N'12 x 50g Bar Peruvian Chulucanas 70% Cocao', N'No ', N'Willies Cacao', N'32.5', N'https://www.williescacao.com/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'WIL852D12', N'12 x 50g Bar Colombian Los Llanos Café Negro Dark Chocolate 70% Cacao. Smooth sophisticated coffee', N'No ', N'Willies Cacao', N'59.6', N'https://www.williescacao.com/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'WIL852D122', N'12 x 50g Bar Colombian Los Llanos Café Negro Dark Chocolate 70% Cacao. Smooth sophisticated coffee', N'No ', N'Willies Cacao', N'196.6', N'https://www.williescacao.com/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'WIL869D12', N'12 x 50g Bar Colombian Los Llanos 88% Cocao', N'No ', N'Willies Cacao', N'38.1', N'https://www.williescacao.com/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'WIL924D12', N'12 x 50g Bar Venezuelan El Blanco Raspberries and Cream White chocolate jewelled with raspberries.', N'No ', N'Willies Cacao', N'156.25', N'https://www.williescacao.com/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'WIL996D12', N'12 x 50g Bar Venezuelan Rio Caribe with Sea Flakes Milk Chocolate 44% Cacao', N'No ', N'Willies Cacao', N'182.05', N'https://www.williescacao.com/', N'Chocolate Bars')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'ZUC50526MB', N'Nonpareilles Silver 1kg', N'No ', N'Zucceroo', N'68.5', N'https://www.zucchero.it/eng', N'Sugar')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'ZUC50528MB', N'Nonpareilles Glitter Olive Green 1kg', N'No ', N'Zucceroo', N'69.5', N'https://www.zucchero.it/eng', N'Sugar')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'ZUC50535MB', N'Nonpareilles Glitter Gold 1kg', N'No ', N'Zucceroo', N'28', N'https://www.zucchero.it/eng', N'Sugar')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'ZUC50536M1', N'Nonpareilles Glitter Black 1kg', N'No ', N'Zucceroo', N'50.5', N'https://www.zucchero.it/eng', N'Sugar')
GO

INSERT INTO [dbo].[Product] ([Product_ID], [Product_Desc], [Discontinued], [Supplier_Name], [Unit_Price], [Website], [Category_Name]) VALUES (N'ZUC50537MB', N'Nonpareilles Glitter Blue 1kg', N'No ', N'Zucceroo', N'37', N'https://www.zucchero.it/eng', N'Sugar')
GO


-- ----------------------------
-- Primary Key structure for table Product
-- ----------------------------
ALTER TABLE [dbo].[Product] ADD CONSTRAINT [PK__Product__9834FB9A902E2A32] PRIMARY KEY CLUSTERED ([Product_ID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Foreign Keys structure for table Product
-- ----------------------------
ALTER TABLE [dbo].[Product] ADD CONSTRAINT [FK__Product__Supplie__2610A626] FOREIGN KEY ([Supplier_Name]) REFERENCES [dbo].[Supplier] ([Supplier_Name]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[Product] ADD CONSTRAINT [FK__Product__Categor__2704CA5F] FOREIGN KEY ([Category_Name]) REFERENCES [dbo].[Product_Category] ([Category_Name]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

