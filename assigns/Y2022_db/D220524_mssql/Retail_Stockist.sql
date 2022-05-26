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

 Date: 26/05/2022 13:46:30
*/


-- ----------------------------
-- Table structure for Retail_Stockist
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Retail_Stockist]') AND type IN ('U'))
	DROP TABLE [dbo].[Retail_Stockist]
GO

CREATE TABLE [dbo].[Retail_Stockist] (
  [Retail_ID] int  IDENTITY(1,1) NOT NULL,
  [Retail_Stockist] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [Address] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Phone] varchar(30) COLLATE Chinese_PRC_CI_AS  NULL,
  [Website] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [State] char(4) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[Retail_Stockist] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Retail_Stockist
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Retail_Stockist] ON
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'1', N'4 Cousins', N'363-383 Nepean Hwy, Parkdale VIC 3195', N'(03) 9580 0591', N'http://www.4cousins.com.au/', N'VIC ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'2', N'A Bongiovanni & Son', N'176 - 178 Victoria St, Seddon, VIC 3011', N'03 9689 8669', NULL, N'VIC ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'3', N'About Life', N'1 Kiaora Lane Double Bay NSW', NULL, N'http://aboutlife.com.au/store/content/451/Double-Bay/', N'NSW ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'4', N'About Life', N'31 - 37 Oxford Street Bondi Junction NSW', NULL, N'http://aboutlife.com.au/store/content/373/Bondi-Junction/', N'NSW ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'5', N'About Life', N'520 Miller Street Cammeray NSW', NULL, N'http://aboutlife.com.au/store/content/376/cammeray/', N'NSW ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'6', N'About Life', N'605 Darling Street Rozelle', N'02 9554 3248', N'http://aboutlife.com.au/store/', N'NSW ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'7', N'Accoutrement', N'611 Military Road Mosman NSW 2088', N'02 9969 1031', N'http://www.accoutrement.com.au/', N'NSW ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'8', N'Aherns Fruit Market & Fine Foods', N'29 Toora Road, Foster, VIC 3960', N'03 5682 2095', NULL, N'VIC ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'9', N'Bairnsdale Gourmet Deli', N'144 Main St, Bairnsdale, VIC 3875', N'03 5152 1544', NULL, N'VIC ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'10', N'Barwon Foods', N'18-20 Donga Road, North Geelong VIC 3215', N'03 5278 6433', N'barwonfoods.com.au', N'VIC ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'11', N'Black Rock Chocolates', N'4 Bluff Rd, Black Rock, VIC 3193', N'03 9589 0555', NULL, N'VIC ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'12', N'Blackwattle Deli', N'Sydney Fish Markets, Bank St, Pyrmont, Sydney NSW 2009', N'(02) 9660 6998', NULL, N'NSW ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'13', N'Blairgowrie IGA', N'2833 - 2835 Point Nepean Road, Blairgowrie, VIC 394', N'03 5988 8550', NULL, N'VIC ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'14', N'Bowral''s Sweets & Treats', N'High Street Arcade Bowral NSW 2576', N'(02) 4861 3975', NULL, N'NSW ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'15', N'Brighton Chocolates', N'334 Bay Street, Brighton, VIC 3186', N'03 9596 6418', NULL, N'VIC ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'16', N'CBG Foodservice', N'88-90 Rebecca Drive, Ravenhall VIC', N'03 5975 6695', N'CBG.com.au', N'VIC ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'17', N'Choc Haven', N'37 Kitchener Street, Canberra, ACT, 2600', N'61 2 9524 8331', N'info@tqintertrade.com.au', N'ACT ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'18', N'Chocogram', N'590 Botany Road Alexandria', N'02 8060 2994', N'www.chocogram.com.au', N'NSW ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'19', N'Chocolate Stop', N'83/ 9 Carey St, Darwin, NT 0800', N'(08) 8942 2012', N'Coriental.com.au', N'ACT ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'20', N'CHUNG’S ORIENTAL TRADING P/L', N'49 ALLIED DRIVE TULLERMARINE VIC', N'03 5984 2019', N'Coriental.com.au', N'VIC ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'21', N'Colless Foods', N'32 Woodlands Road Katoomba NSW 2780', N'02 4780 1100', NULL, N'NSW ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'22', N'Darrell Lea, Darwin', N'24 Harvey St, Darwin, NT 0800', N'(08) 8981 1193', NULL, N'ACT ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'23', N'Darrell Lea, Geelong', N'71 Malop St, Geelong VIC 3220', N'(03) 5221 6106', NULL, N'VIC ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'24', N'David Jones Foodhalls', N'1 Lomond Tce, East Brisbane, QLD 4169', N'(07) 3391 2281', N'davidjones.com.au', N'QLD ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'25', N'Davies Chocolates Pty Ltd', N'181 Kingsgrove Rd, Kingsgrove, ACT, 2609', N'+61 2 9502 2811', N'daveschocolates.com.au', N'ACT ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'26', N'Deli Alemente', N'Manuka Terrace, cnr Franklin Street & Flinders Way, Manuka', N'(02) 6239 6186', N'Use phone instead.', N'ACT ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'27', N'Deli Cravings', N'Shop 15 Belconnen Fresh Food Markets Lathlain Street Belconnen ACT 2617', N'6251 4056', N'http://www.delicravings.com.au/', N'ACT ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'28', N'Deli Planet', N'Fyshwick Markets, 12 Dalby St, Fyshwick ACT 2609', N'02 6295 8067', N'http://www.deliplanet.net.au', N'ACT ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'29', N'Down Town Milk Bar', N'Franklin St Manuka ACT 2603', N'(02) 6295 8034', NULL, N'ACT ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'30', N'Favourite Flavours', N'37 Mitchell St, Bendigo, VIC 3550', N'03 5444 2147', NULL, N'VIC ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'31', N'Favourite Flavours', N'81 Cavenagh St, Darwin, NT 0800', N'0411 578 052', NULL, N'ACT ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'32', N'Forest Way Fresh', N'341 Mona Vale Road Terrey Hills NSW 2084', N'(02) 9486 3340', N'http://www.forestwayfresh.com/', N'NSW ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'33', N'Fried Cafe', N'182 Grange Avenue Schofields QLD 2762', N'(07) 3391 2286', NULL, N'QLD ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'34', N'Fried Flavor', N'Unit 8, 114 Canterbury Rd Kilsyth QLD 3137', N'(07) 3391 2284', NULL, N'QLD ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'35', N'Gallegher Specialty Store', N'175 Scott St, Newcastle, NSW 2300', N'(02) 4927 0096', NULL, N'NSW ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'36', N'Garian Foods', N'2/13 Douglas Mawson Drive, Dubbo NSW 2830', N'02 6884 1166', NULL, N'NSW ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'37', N'Go Vita', N'Lvl8/ 15 London Cct, Canberra, ACT 2600', N'(02) 6249 1444', NULL, N'ACT ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'38', N'Go Vita', N'Shop G88 Woden Westfield WODEN ACT 2606', N'02 6281-5274', N'http://www.govita.com.au/', N'ACT ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'39', N'Gum Tree Good Food (Albert Park)', N'87-89 Dundas Place Albert Park VIC 3206', NULL, NULL, N'VIC ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'40', N'Hansel and Gretal', N'40 Townshend Street PHILLIP ACT 2606', N'02 6282 5009', N'http://hanselandgretel.net.au/', N'ACT ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'41', N'Healthy Life', N'Shop EG05 (Fresh Food Court, Ground floor) Bunda Street Civic ACT 2601', N'02 6249 8251', N'http://www.healthylife.net.au/find-a-store/healthy-life-canberra-centre/', N'ACT ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'42', N'Heavenly ', N'19 Finniss St, Darwin, NT 0800', N'0411 579 514', NULL, N'ACT ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'43', N'HEY TIGER', N'121 KING STREET MELBOURNE VIC', N'03 6984 2019', N'heytiger.com.au', N'VIC ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'44', N'IGA Kingston', N'66 Giles Street, Kingston, ACT 2604', N'N/A', N'http://stores.iga.com.au/store/iga-kingston-2.html', N'ACT ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'45', N'IGA Northcote', N'284-288 High St, Northcote VIC 3070', N'(03) 9481 3411', N'http://northcoteiga.com.au/', N'VIC ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'46', N'I''m Sugar Free', N'21 Peel St, West Melbourne VIC 3003', N'03 8348 5100', N'http://www.imsugarfree.com.au/', N'VIC ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'47', N'LaManna Direct', N'10 English St, Essendon Fields VIC 3041', N'03 9026 9205', N'www.lamannadirect.com.au', N'VIC ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'48', N'Le Petit Lapin', N'322 Glen Eira Road, Elsternwick VIC 2185', N'03 9528 2788', N'http://www.lepetitlapin.com.au/', N'VIC ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'49', N'Lee M H', N'199 King St, Newcastle, NSW 2300', N'(02) 4929 2591', NULL, N'NSW ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'50', N'Leisure Coast Fruit Market', N'75 Princes Highway Fairy Meadow, NSW 2519', N'02 4285 1211 or 02 4285 1168', N'http://lcfruitanddeli.com.au/', N'NSW ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'51', N'Leo’s Fine Food and Wine – Hartwell', N'2 Summerhill Rd, Glen Iris VIC 3146', N'03 9889 1881', NULL, N'VIC ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'52', N'Leo’s Fine Food and Wine – Heidelberg', N'133-137 Burgundy St, Heidelberg, VIC 3084', N'03 9243 3733', NULL, N'VIC ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'53', N'Leo’s Fine Food and Wine – Kew', N'26 Princess St, Kew, VIC 3101', N'03 9853 8314', NULL, N'VIC ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'54', N'Mansfield Sweets', N'92 High St, Mansfield, VIC 3722', N'03 5773221', NULL, N'VIC ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'55', N'Martelli’s Markets', N'Rouse Hill Town Centre, Windsor Rd, Rouse Hill NSW 2155', N'(02) 9836 5500', NULL, N'NSW ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'56', N'Martelli''s Fruit Market', N'28 Shepherds Dr Cherrybrook NSW 2126', N'(02) 9481 0444', NULL, N'NSW ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'57', N'Maxi Foods – Upper Ferntree Gully', N'Shop 2, 1202 Burwood Hwy, Upper Ferntree Gully, VIC 3156', N'03 9752 4299', NULL, N'VIC ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'58', N'Myer', N'54 Norman St, East Brisbane, QLD 4169', N'(07) 3391 6412', N'myer.com.au', N'QLD ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'59', N'Newtown Licensed Grocery', N'19 Stinton Ave, Newtown, VIC, 3220', N'(03) 5221 1628', NULL, N'VIC ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'60', N'Norton St Grocer Bondi Junction', N'Fresh Food Hall Shop 1027 Westfield Shopping Centre, Bondi Junction NSW 2022', N'(02) 9386 5800', N'http://www.nortonstgrocer.com.au/store/bondi-junction/', N'NSW ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'61', N'Norton St Grocer Leichhardt', N'Shop B1, 51-57 Norton Street (Norton St. Plaza), Leichhardt NSW 2040', N'(02) 9572 7511', N'http://www.nortonstgrocer.com.au/store/leichhardt/', N'NSW ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'62', N'Nuts About Candy', N'Westfields Hurstville NSW', N'02 9580 0585', NULL, N'NSW ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'63', N'Palm Beach Wine Co.', N'1109 Barrenjoey Road Palm Beach NSW 2108', N'02 9974 4304', N'http://palmbeachwineco.com/', N'NSW ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'64', N'Parisi’s Food Hall', N'19-21 Dover Rd, Rose Bay NSW 2029', N'(02) 9371 2411', N'http://www.parisisfoodhall.com.au/', N'NSW ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'65', N'Pendle Stores', N'53 Walker St, North Sydney, NSW 2060', N'(02) 9956 7584', NULL, N'NSW ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'66', N'Port Fairy Confectionery', N'53 Sackville St, Port Fairy VIC 3284', N'(03) 5568 2977', N'https://www.facebook.com/portfairyconfectionery/', N'VIC ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'67', N'Primo Fine Foods', N'19 Garema Circuit, Kingsgrove NSW 2208', N'02 4423 0033', NULL, N'NSW ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'68', N'Pure Indulgence Fine Chocolates', N'Shop 9, Star Village Arcade, Smith St, The Mall, Darwin, Northern Territory 0800', N'(08) 8981 2947', NULL, N'ACT ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'69', N'Rathdowne Village Deli', N'378 Rathdowne St, Carlton North, VIC 3054', N'03 9347 4181', NULL, N'VIC ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'70', N'Renaissance IGA Glenferrie Hawthorn', N'550 Glenferrie Rd, Hawthorn VIC 3122', N'(03) 9818 5218', N'https://renshop.com.au/', N'VIC ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'71', N'Renaissance IGA Hawthon Square', N'102 Burwood Rd, Hawthorn VIC 3122', N'(03) 9818 9503', N'https://renshop.com.au/', N'VIC ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'72', N'Royal Randwick Fruit Market', N'13/73-109 Belmore Road, Randwick NSW 2031', N'(02) 9399 8296', NULL, N'NSW ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'73', N'Saucy Plate', N'Unit 3 / 4 Zeta Crescent O''Connor QLD 6163', N'(07) 3391 2285', NULL, N'QLD ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'74', N'Saucy Sub', N'21 Walker St Tennyson NSW 4105', N'8 3393 3553', NULL, N'NSW ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'75', N'SM BRANDS', N'137 GREEN STREET RICHMOND VIC', N'03 5985 2019', N'smbrands.com.au', N'VIC ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'76', N'Something Special Gifts', N'175 Auburn St, Goulburn NSW, 2580', N'02 48219001', N'www.something-special.net.au/', N'NSW ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'77', N'Spoonful', N'543A High St, Prahran, VIC 3181', N'03 9521 5212', N'spoonful.net.au', N'VIC ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'78', N'Stringers Stores Sorento', N'2-8 Ocean Beach Road, Sorrento, VIC 3943', N'03 5984 2010', NULL, N'VIC ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'79', N'Taffys on Looker Cafe', N'15 Looker Road, Montmorency, VIC 3094', N'03 9439 5196', N'www.taffysonlooker.com', N'VIC ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'80', N'Taste Cuts', N'15 Senna Road Wingfield QLD 5013', N'(07) 3391 2282', NULL, N'QLD ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'81', N'The Berry Bon Bon', N'Shop 3, 90 Alexandra Street Berry NSW 2535', N'(02) 4464 2278', N'http://www.theberrybonbon.com.au/', N'NSW ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'82', N'The Candy Store', N'Shop 6 178 Leura Mall Leura NSW 2780', N'(02) 4782 4090', N'http://candystore.com.au/', N'NSW ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'83', N'The Chocolate Kettle', N'Shop 10, The Mall, 90 Main St, Mornington, VIC 3931', N'03 5975 6819', N'www.thechocolatekettle.com.au', N'VIC ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'84', N'The Complete Basketcase', NULL, N'03 9329 1933', N'www.thebasketcase.com.au', N'VIC ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'85', N'The Essential Ingredient', N'731-735 Darling St Rozelle NSW 2039', N'(02) 9555 8300', N'http://www.sydneyessential.com.au/', N'NSW ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'86', N'The Hunting Ground', N'Shop 3, 102 York St, Sale, VIC 3850', N'03 5144 4709', NULL, N'VIC ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'87', N'The Lolly Shop', N'34 Marcus Clarke St, Canberra, ACT 2601', N'(02) 6169 5074', N'http://www.govita.com.au/', N'ACT ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'88', N'The Lolly Shop', N'Federation Square, O’Hanlon Place, Nicholls 2913', N'6230 2556', NULL, N'ACT ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'89', N'The Newtown Provedore', N'317a Pakington St, Newtown, VIC 3220', N'(03) 5221 5654', N'www.thenewtownprovedore.com.au', N'VIC ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'90', N'The Pantry', N'Shop 10, 750 Collins St, Melbourne, VIC 3008', N'03 9670 7425', N'thepantry.com.au', N'VIC ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'91', N'The Produce Store', N'68 High St, Mansfield VIC 3722', N'(03) 5779 1404', N'www.theproducestore.com.au', N'VIC ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'92', N'The Treat Factory', N'Old Creamery Lane Berry NSW 2535', N'02 4464 1112', N'http://www.treatfactory.com.au/', N'NSW ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'93', N'The Village Grocer', N'Shop 72 Stockland 197-215 Condamine Street Balgowlah NSW 2093', N'02 9949 4355', N'http://www.thevillagegrocer.com.au/', N'NSW ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'94', N'Visco Selected Fine Foods', N'126 Gosport St Hemmant NSW 4174', N'07 3393 3553', NULL, N'NSW ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'95', N'Wise Pans', N'1 / 32 Porter St Hemmant QLD 4174', N'(07) 3391 2283', NULL, N'QLD ')
GO

INSERT INTO [dbo].[Retail_Stockist] ([Retail_ID], [Retail_Stockist], [Address], [Phone], [Website], [State]) VALUES (N'96', N'Yummy Spoonful', N'26 Oakdale Road, Gateshead NSW', N'9 3393 3553', NULL, N'NSW ')
GO

SET IDENTITY_INSERT [dbo].[Retail_Stockist] OFF
GO


-- ----------------------------
-- Auto increment value for Retail_Stockist
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[Retail_Stockist]', RESEED, 96)
GO


-- ----------------------------
-- Primary Key structure for table Retail_Stockist
-- ----------------------------
ALTER TABLE [dbo].[Retail_Stockist] ADD CONSTRAINT [PK__Retail_S__28A65F137582B417] PRIMARY KEY CLUSTERED ([Retail_ID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Foreign Keys structure for table Retail_Stockist
-- ----------------------------
ALTER TABLE [dbo].[Retail_Stockist] ADD CONSTRAINT [FK__Retail_St__State__2F9A1060] FOREIGN KEY ([State]) REFERENCES [dbo].[State] ([State]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

