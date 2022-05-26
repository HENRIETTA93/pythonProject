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

 Date: 26/05/2022 13:47:09
*/


-- ----------------------------
-- Table structure for Distributors
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Distributors]') AND type IN ('U'))
	DROP TABLE [dbo].[Distributors]
GO

CREATE TABLE [dbo].[Distributors] (
  [Distributor_Name] varchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [Description] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Address] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Fax] varchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [Phone] varchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [Email] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [Website] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[Distributors] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Distributors
-- ----------------------------
INSERT INTO [dbo].[Distributors] ([Distributor_Name], [Description], [Address], [Fax], [Phone], [Email], [Website]) VALUES (N'AVO Trading', N'Distribution area is South Australia, Northern Territory, Mildura VIC, Broken Hill NSW and Kangaroo Island.', N'5 Armiger Court Holden Hill SA 5088', NULL, N'08 8395 7548', N'orders@avotrading.com.au', N'http://www.avotrading.com.au')
GO

INSERT INTO [dbo].[Distributors] ([Distributor_Name], [Description], [Address], [Fax], [Phone], [Email], [Website]) VALUES (N'Bell Bird Food Service', N'Foodservice Distributor', N'Unit 5, 26 Megalong St Katoomba NSW 2780', NULL, N'02 5845 6958', N'bellbird@yahoo.com', NULL)
GO

INSERT INTO [dbo].[Distributors] ([Distributor_Name], [Description], [Address], [Fax], [Phone], [Email], [Website]) VALUES (N'Bibina', N'Retail Distributor', N'355 Hillsborough Road Warners Bay NSW 2282', NULL, N'02 4954 6044', N'www.bibina.com.au', NULL)
GO

INSERT INTO [dbo].[Distributors] ([Distributor_Name], [Description], [Address], [Fax], [Phone], [Email], [Website]) VALUES (N'Blockman Foods', N'Foodservice Distributor', N'Lvl30/ 66 Goulburn St, Sydney, NSW 2000', NULL, N'(02) 9331 4451', N'blockman@gmail.com', NULL)
GO

INSERT INTO [dbo].[Distributors] ([Distributor_Name], [Description], [Address], [Fax], [Phone], [Email], [Website]) VALUES (N'Chefs Pantry', N'Foodservice Distributor', N'Factory 3 / 170 Boundary Road, Braeside VIC 3195', NULL, N'(03) 9580 4477', N'info@chefspantry.com.au', N'www.chefspantry.com.au')
GO

INSERT INTO [dbo].[Distributors] ([Distributor_Name], [Description], [Address], [Fax], [Phone], [Email], [Website]) VALUES (N'Creating Addictions', N'Foodservice Distributor', N'3 Cornwall Close Terrigal NSW 2260', NULL, N'4354 2446', N'creatingaddictions@gmail.com', N'http://www.creatingaddictions.com.au')
GO

INSERT INTO [dbo].[Distributors] ([Distributor_Name], [Description], [Address], [Fax], [Phone], [Email], [Website]) VALUES (N'Daily Fresh Food Service', N'Foodservice Distributor Erinfen Pty Ltd', N'353 Chisholm Road Regents Park NSW 2143', NULL, N'02 9644 0000', N'enquiries@dailyfresh.com.au', N'http://www.dailyfresh.com.au')
GO

INSERT INTO [dbo].[Distributors] ([Distributor_Name], [Description], [Address], [Fax], [Phone], [Email], [Website]) VALUES (N'Devings Fine Foods', N'Foodservice Distributor', N'5 / 241 Camboon Road Malaga WA 6090', NULL, N'08 9248 5834', N'sales@devings.com.au', N'http://www.devings.com.au')
GO

INSERT INTO [dbo].[Distributors] ([Distributor_Name], [Description], [Address], [Fax], [Phone], [Email], [Website]) VALUES (N'Ecotel', N'Foodservice Distributor', N'45 Gilbert St Adelaide SA 5000', NULL, N'08 84103633', N'sales@ecotel.asia', N'http://www.ecotel.asia')
GO

INSERT INTO [dbo].[Distributors] ([Distributor_Name], [Description], [Address], [Fax], [Phone], [Email], [Website]) VALUES (N'Epicurean Essentials', N'Foodservice Distributor', N'Unit 2 / 41A Sunbeam Road Glynde SA 5070', NULL, N'0419 330 139', NULL, NULL)
GO

INSERT INTO [dbo].[Distributors] ([Distributor_Name], [Description], [Address], [Fax], [Phone], [Email], [Website]) VALUES (N'EWH Food Services', NULL, N'119 Vanessa St Kingsgrove NSW 220', NULL, N'(02) 9503 3333', N'sales@ewhfoodservices.com.au', N'http://www.ewhfoodservices.com.au')
GO

INSERT INTO [dbo].[Distributors] ([Distributor_Name], [Description], [Address], [Fax], [Phone], [Email], [Website]) VALUES (N'Fermex Distributors', N'Quality ingredients for bakers, pastry, cake and pie makers.', N'21 Walker St Tennyson QLD 4105', NULL, N'07 3892 3455', NULL, NULL)
GO

INSERT INTO [dbo].[Distributors] ([Distributor_Name], [Description], [Address], [Fax], [Phone], [Email], [Website]) VALUES (N'Food Point', N'Foodservice Distributor', N'26 Oakdale Road, Gateshead NSW', NULL, N'02 4957 7277', N'sales@foodpointnsw.com.au', NULL)
GO

INSERT INTO [dbo].[Distributors] ([Distributor_Name], [Description], [Address], [Fax], [Phone], [Email], [Website]) VALUES (N'Foodmont', N'Foodservice Distributor', N'15 Senna Road Wingfield SA 5013', NULL, N'08 8359 6159', NULL, NULL)
GO

INSERT INTO [dbo].[Distributors] ([Distributor_Name], [Description], [Address], [Fax], [Phone], [Email], [Website]) VALUES (N'France Gourmet', N'Brisbane based supplier of ingredients for french style cooking.', N'1 / 32 Porter St Hemmant QLD 4174', NULL, N'07 3390 8477', N'info@francegourmet.com.au', N'http://www.francegourmet.com.au')
GO

INSERT INTO [dbo].[Distributors] ([Distributor_Name], [Description], [Address], [Fax], [Phone], [Email], [Website]) VALUES (N'Fried Cafe', N'A fun name for a small restaurant that offers a variety of fried food dishes or a fried food brand.', N'182 Grange Avenue Schofields NSW 2762', NULL, N'14 3393 3553', N'admin@Fried Cafe.com.au', NULL)
GO

INSERT INTO [dbo].[Distributors] ([Distributor_Name], [Description], [Address], [Fax], [Phone], [Email], [Website]) VALUES (N'Fried Flavor', N'A name that is easy to remember. Suitable for a business that prepares a variety of fried foods.', N'Unit 8, 114 Canterbury Rd Kilsyth VIC 3137', NULL, N'12 3393 3553', N'admin@Fried Flavor.com.au', NULL)
GO

INSERT INTO [dbo].[Distributors] ([Distributor_Name], [Description], [Address], [Fax], [Phone], [Email], [Website]) VALUES (N'Frozen Fork', N'A short and catchy name for a business that prepares frozen meals.', N'156 Churchill Rd North Cavan SA 5094', NULL, N'15 3393 3553', N'admin@Frozen Fork.com.au', NULL)
GO

INSERT INTO [dbo].[Distributors] ([Distributor_Name], [Description], [Address], [Fax], [Phone], [Email], [Website]) VALUES (N'Global Confectionery', N'Global Confectionery distribute our retail products throughout Victoria.', N'Unit 8, 114 Canterbury Rd Kilsyth VIC 3137', NULL, N'03 9761 5012', N'globalconfectionery@gmail.com', N'http://www.globalconfectionery.com')
GO

INSERT INTO [dbo].[Distributors] ([Distributor_Name], [Description], [Address], [Fax], [Phone], [Email], [Website]) VALUES (N'Gourmet & More', N'Retail Distributor', N'Unit 3 / 4 Zeta Crescent O''Connor WA 6163', NULL, N'(08) 9337 8634', N'hello@gourmetandmore.com.au', N'http://gourmetandmore.com.au/')
GO

INSERT INTO [dbo].[Distributors] ([Distributor_Name], [Description], [Address], [Fax], [Phone], [Email], [Website]) VALUES (N'Henfresh', N'Foodservice Distributor', N'182 Grange Avenue Schofields NSW 2762', NULL, N'02 9627 4333', N'info@henfresh.com.au', N'http://www.henfresh.com.au')
GO

INSERT INTO [dbo].[Distributors] ([Distributor_Name], [Description], [Address], [Fax], [Phone], [Email], [Website]) VALUES (N'Holco', N'Foodservice Distributor', N'156 Churchill Rd North Cavan SA 5094', NULL, N'(08) 8162 8400', NULL, N'http://www.holco.com.au')
GO

INSERT INTO [dbo].[Distributors] ([Distributor_Name], [Description], [Address], [Fax], [Phone], [Email], [Website]) VALUES (N'Hong Australia', N'Foodservice Distributor', N'176 Power Street Doonside NSW 2767', NULL, N'02 8805 1400', N'sales@jlstewart.com.au', N'http://www.jlstewart.com.au')
GO

INSERT INTO [dbo].[Distributors] ([Distributor_Name], [Description], [Address], [Fax], [Phone], [Email], [Website]) VALUES (N'Imports of France', N'Foodservice Distributor', N'Unit 3 - 6 / 38 Thornton Crescent Mitcham VIC 3132', NULL, N'03 9872 3945', NULL, N'http://www.importsoffrance.com.au')
GO

INSERT INTO [dbo].[Distributors] ([Distributor_Name], [Description], [Address], [Fax], [Phone], [Email], [Website]) VALUES (N'J&L Borgo', N'Foodservice Distributor', N'289-295 Princes Hwy, Kembla Grange NSW 2526', NULL, N'02 4423 0033', N'john@jlborgo.com.au', NULL)
GO

INSERT INTO [dbo].[Distributors] ([Distributor_Name], [Description], [Address], [Fax], [Phone], [Email], [Website]) VALUES (N'Jimele Distibution', N'Specialty food distributors to the hotel, restaurant, patisserie, retail and catering industry.', N'Unit 3 / 28 - 34 Nevilles Street Underwood QLD 4119', NULL, N'07 3808 2037', N'info@jimele.com.au', N'http://www.jimele.com.au')
GO

INSERT INTO [dbo].[Distributors] ([Distributor_Name], [Description], [Address], [Fax], [Phone], [Email], [Website]) VALUES (N'JL Stewart & Son', NULL, N'176 Power Street Doonside NSW 2767', NULL, N'02 8805 1400', N'sales@jlstewart.com.au', N'http://www.jlstewart.com.au')
GO

INSERT INTO [dbo].[Distributors] ([Distributor_Name], [Description], [Address], [Fax], [Phone], [Email], [Website]) VALUES (N'Le Petit Gourmet', N'A family business distributing gourmet products Queensland wide.', N'2 / 4 Natasha St Capalaba QLD 4157', NULL, N'07 5448 8634', N'info@lepetitgourmet.com.au', N'http://www.lepetitgourmet.com.au')
GO

INSERT INTO [dbo].[Distributors] ([Distributor_Name], [Description], [Address], [Fax], [Phone], [Email], [Website]) VALUES (N'Locale Foods', N'Foodservice Distributor', N'14 Valley View Close Milton NSW 2538', NULL, N'02 9588 2456', NULL, NULL)
GO

INSERT INTO [dbo].[Distributors] ([Distributor_Name], [Description], [Address], [Fax], [Phone], [Email], [Website]) VALUES (N'Saucy Plate', N'A sassy name that taunts the taste buds with a promise of delicious food, ideal for a caterer.', N'Unit 3 / 4 Zeta Crescent O''Connor WA 6163', NULL, N'13 3393 3553', N'admin@Saucy Plate.com.au', NULL)
GO

INSERT INTO [dbo].[Distributors] ([Distributor_Name], [Description], [Address], [Fax], [Phone], [Email], [Website]) VALUES (N'Saucy Sub', N'A cheeky name that simply rolls off the tongue and is easy to remember, ideal for a sandwich shop.', N'21 Walker St Tennyson QLD 4105', NULL, N'8 3393 3553', N'admin@Saucy Sub.com.au', NULL)
GO

INSERT INTO [dbo].[Distributors] ([Distributor_Name], [Description], [Address], [Fax], [Phone], [Email], [Website]) VALUES (N'Savour Foodservice', N'Foodservice Distributor', N'141 Bathurst Street Hobart TAS 7000', NULL, N'0418 915 683', NULL, N'http://www.savourfoods.com.au/')
GO

INSERT INTO [dbo].[Distributors] ([Distributor_Name], [Description], [Address], [Fax], [Phone], [Email], [Website]) VALUES (N'Southern Cross Supplies', N'Foodservice Distributor', N'6B Rich Street Marrickville NSW 2204', NULL, N'02 9572 7888', N'info@southerncrosssupplies.com.au', N'http://www.southerncrosssupplies.com.au')
GO

INSERT INTO [dbo].[Distributors] ([Distributor_Name], [Description], [Address], [Fax], [Phone], [Email], [Website]) VALUES (N'Southern Highlands Foods', N'Foodservice Distributor', N'6 Hampshire Lane, Goulburn NSW 2580', NULL, N'02 4821 3995', N'Kathy@vandcfoods.com.au?', NULL)
GO

INSERT INTO [dbo].[Distributors] ([Distributor_Name], [Description], [Address], [Fax], [Phone], [Email], [Website]) VALUES (N'Spoonful Deli', N'A delightful and fun name for a deli or food business that offers a generous variety of snack foods.', N'Unit 5, 26 Megalong St Katoomba NSW 2780', NULL, N'16 3393 3553', N'admin@Spoonful Deli.com.au', NULL)
GO

INSERT INTO [dbo].[Distributors] ([Distributor_Name], [Description], [Address], [Fax], [Phone], [Email], [Website]) VALUES (N'Succeed Food', N'An upbeat name that suggests positive outcomes and benefits, suitable for a health food business.', N'355 Hillsborough Road Warners Bay NSW 2282', NULL, N'17 3393 3553', N'admin@Succeed Food.com.au', NULL)
GO

INSERT INTO [dbo].[Distributors] ([Distributor_Name], [Description], [Address], [Fax], [Phone], [Email], [Website]) VALUES (N'Taste Cuts', N'A simple and effective name that is suitable for a meat processing business.', N'15 Senna Road Wingfield SA 5013', NULL, N'10 3393 3553', N'admin@Taste Cuts.com.au', NULL)
GO

INSERT INTO [dbo].[Distributors] ([Distributor_Name], [Description], [Address], [Fax], [Phone], [Email], [Website]) VALUES (N'Taste of Paradise', N'Retail and Foodservice Distributor', N'6 Fleet Street Moonah TAS 7009', NULL, N'1800 600 654', NULL, N'http://www.tasteofparadise.com.au')
GO

INSERT INTO [dbo].[Distributors] ([Distributor_Name], [Description], [Address], [Fax], [Phone], [Email], [Website]) VALUES (N'The Fearocious Feed', N'Foodservice Distributor', N'Unit 2, 68 Christian Rd Punchbowl NSW 2196', NULL, N'02 9758 9666', N'info@fearociousfeed.com.au', N'http://www.fearociousfeed.com.au')
GO

INSERT INTO [dbo].[Distributors] ([Distributor_Name], [Description], [Address], [Fax], [Phone], [Email], [Website]) VALUES (N'The Foodshed', N'Foodservice Distributor', N'53A Vincent Rd Wangaratta VIC 3677', NULL, N'03 5722 4980', NULL, N'http://thefoodshed.com.au/')
GO

INSERT INTO [dbo].[Distributors] ([Distributor_Name], [Description], [Address], [Fax], [Phone], [Email], [Website]) VALUES (N'The Grocer', N'Foodservice Distributor', N'69 Tacoma Circuit Canning Vale WA 6155', NULL, N'08 9455 1611', N'admin@thegrocer.com.au', N'http://www.thegrocer.com.au')
GO

INSERT INTO [dbo].[Distributors] ([Distributor_Name], [Description], [Address], [Fax], [Phone], [Email], [Website]) VALUES (N'The Italian Pantry', N'Foodservice Distributor', N'27 - 29 Federal Street North Hobart TAS 7000', NULL, N'03 6231 2788', NULL, N'http://www.italianpantry.com.au/')
GO

INSERT INTO [dbo].[Distributors] ([Distributor_Name], [Description], [Address], [Fax], [Phone], [Email], [Website]) VALUES (N'Visco Selected Fine Foods', N'Manufactures and wholesales gourmet foods for caterers, restaurants, hotels and delicatessens.', N'126 Gosport St Hemmant QLD 4174', NULL, N'07 3393 3553', NULL, N'http://www.viscofoods.com')
GO

INSERT INTO [dbo].[Distributors] ([Distributor_Name], [Description], [Address], [Fax], [Phone], [Email], [Website]) VALUES (N'Wise Pans', N'A unique and intriguing name that suggests a cost-effective catering company.', N'1 / 32 Porter St Hemmant QLD 4174', NULL, N'11 3393 3553', N'admin@Wise Pans.com.au', NULL)
GO

INSERT INTO [dbo].[Distributors] ([Distributor_Name], [Description], [Address], [Fax], [Phone], [Email], [Website]) VALUES (N'Yummy Spoonful', N'A cute and fun name for a business that prepares ready meals or a corner deli.', N'26 Oakdale Road, Gateshead NSW', NULL, N'9 3393 3553', N'admin@Yummy Spoonful.com.au', NULL)
GO

INSERT INTO [dbo].[Distributors] ([Distributor_Name], [Description], [Address], [Fax], [Phone], [Email], [Website]) VALUES (N'Zhang C H', N'Foodservice Distributor', N'?88 Sussex St, Sydney, NSW 2001', NULL, N'0478 707 649', NULL, NULL)
GO


-- ----------------------------
-- Primary Key structure for table Distributors
-- ----------------------------
ALTER TABLE [dbo].[Distributors] ADD CONSTRAINT [PK__Distribu__BDE11711976AEF64] PRIMARY KEY CLUSTERED ([Distributor_Name])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO

