/*
 Navicat Premium Data Transfer

 Source Server         : local_5433_pgsql12.4
 Source Server Type    : PostgreSQL
 Source Server Version : 120004
 Source Host           : localhost:5433
 Source Catalog        : 1025
 Source Schema         : proj

 Target Server Type    : PostgreSQL
 Target Server Version : 120004
 File Encoding         : 65001

 Date: 16/02/2022 17:37:50
*/


-- ----------------------------
-- Table structure for VAERSDATA
-- ----------------------------
DROP TABLE IF EXISTS VAERSDATA;
CREATE TABLE proj.VAERSDATA (
  VAERS_ID mediumtext,
  RECVDATE mediumtext,
  STATE mediumtext,
  AGE_YRS mediumtext,
  CAGE_YR mediumtext,
  CAGE_MO mediumtext,
  SEX mediumtext,
  RPT_DATE mediumtext,
  SYMPTOM_mediumtext mediumtext,
  DIED mediumtext,
  DATEDIED mediumtext,
  L_THREAT mediumtext,
  ER_VISIT mediumtext,
  HOSPITAL mediumtext,
  HOSPDAYS mediumtext,
  X_STAY mediumtext,
  DISABLE mediumtext,
  RECOVD mediumtext,
  VAX_DATE mediumtext,
  ONSET_DATE mediumtext,
  NUMDAYS mediumtext,
  LAB_DATA mediumtext,
  V_ADMINBY mediumtext,
  V_FUNDBY mediumtext,
  OTHER_MEDS mediumtext,
  CUR_ILL mediumtext,
  HISTORY mediumtext,
  PRIOR_VAX mediumtext,
  SPLTTYPE mediumtext,
  FORM_VERS mediumtext,
  TODAYS_DATE mediumtext,
  BIRTH_DEFECT mediumtext,
  OFC_VISIT mediumtext,
  ER_ED_VISIT mediumtext,
  ALLERGIES mediumtext
)
;
