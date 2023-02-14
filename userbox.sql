/*
 
 Source Schema         : mycron

 
 Date: 14/02/2023 14:46:45
*/


-- ----------------------------
-- Table structure for userbox
-- ----------------------------
DROP TABLE IF EXISTS "mycron"."userbox";
CREATE TABLE "mycron"."userbox" (
  "id_mail" int4 NOT NULL,
  "current_box" varchar(255) COLLATE "pg_catalog"."default",
  "destination_box" varchar(255) COLLATE "pg_catalog"."default",
  "from" varchar(255) COLLATE "pg_catalog"."default",
  "subject" varchar(255) COLLATE "pg_catalog"."default",
  "attachment" varchar(255) COLLATE "pg_catalog"."default",
  "os_current_dir" varchar(255) COLLATE "pg_catalog"."default",
  "os_destination_dir" varchar(255) COLLATE "pg_catalog"."default",
  "group" char(2) COLLATE "pg_catalog"."default",
  "audit_date" timestamp(6) DEFAULT now()
)
;

-- ----------------------------
-- Foreign Keys structure for table userbox
-- ----------------------------
ALTER TABLE "mycron"."userbox" ADD CONSTRAINT "idx_id_mail" FOREIGN KEY ("id_mail") REFERENCES "mycron"."usermail" ("id_mail") ON DELETE NO ACTION ON UPDATE NO ACTION;
