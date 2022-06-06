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

 Date: 26/05/2022 13:46:05
*/


-- ----------------------------
-- Table structure for State
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[State]') AND type IN ('U'))
	DROP TABLE [dbo].[State]
GO

CREATE TABLE [dbo].[State] (
  [State] char(4) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [State_Name] char(50) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[State] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of State
-- ----------------------------
INSERT INTO [dbo].[State] ([State], [State_Name]) VALUES (N'ACT ', N'the Australian Capital Territory                  ')
GO

INSERT INTO [dbo].[State] ([State], [State_Name]) VALUES (N'NSW ', N'New South Wales                                   ')
GO

INSERT INTO [dbo].[State] ([State], [State_Name]) VALUES (N'NT  ', N'Northern Territory                                ')
GO

INSERT INTO [dbo].[State] ([State], [State_Name]) VALUES (N'QLD ', N'Queensland                                        ')
GO

INSERT INTO [dbo].[State] ([State], [State_Name]) VALUES (N'VIC ', N'Victoria                                          ')
GO


-- ----------------------------
-- Primary Key structure for table State
-- ----------------------------
ALTER TABLE [dbo].[State] ADD CONSTRAINT [PK__State__BA803DAC1179BF52] PRIMARY KEY CLUSTERED ([State])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO

