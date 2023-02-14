/*
 
 Source Schema         : mycron

 Target Server Type    : PostgreSQL
 Target Server Version : 150002 (150002)
 File Encoding         : 65001

 Date: 14/02/2023 14:47:06
*/


-- ----------------------------
-- Table structure for usermail
-- ----------------------------
DROP TABLE IF EXISTS "mycron"."usermail";
CREATE TABLE "mycron"."usermail" (
  "id_mail" int4 NOT NULL DEFAULT nextval('"mycron".usermail_id_mail_seq'::regclass),
  "hostname" varchar(255) COLLATE "pg_catalog"."default",
  "email" text COLLATE "pg_catalog"."default" NOT NULL,
  "password" text COLLATE "pg_catalog"."default",
  "audit_date" timestamp(6) DEFAULT now()
)
;

-- ----------------------------
-- Uniques structure for table usermail
-- ----------------------------
ALTER TABLE "mycron"."usermail" ADD CONSTRAINT "umail" UNIQUE ("email");

-- ----------------------------
-- Primary Key structure for table usermail
-- ----------------------------
ALTER TABLE "mycron"."usermail" ADD CONSTRAINT "usermail_pkey" PRIMARY KEY ("id_mail");
