--------------------------------------------------------
--  File created - Monday-February-13-2023   
--------------------------------------------------------
DROP TABLE "SUHASSAN"."ACCOUNT" cascade constraints;
DROP TABLE "SUHASSAN"."PAYMENT" cascade constraints;
DROP TABLE "SUHASSAN"."REVIEWS" cascade constraints;
DROP TABLE "SUHASSAN"."SELLER" cascade constraints;
DROP TABLE "SUHASSAN"."SERVICE" cascade constraints;
DROP TABLE "SUHASSAN"."SERVICELEVEL" cascade constraints;
DROP VIEW "SUHASSAN"."EXPENSIVE";
DROP VIEW "SUHASSAN"."FASTDELIVERY";
DROP VIEW "SUHASSAN"."FAST_D";
DROP VIEW "SUHASSAN"."FAST_DELIEVRY";
DROP VIEW "SUHASSAN"."FAST_DELIVERY";
DROP VIEW "SUHASSAN"."FAST_DSD";
DROP VIEW "SUHASSAN"."GOOD_RESPONSE";
DROP VIEW "SUHASSAN"."GOOD_RESPONSE_RATE";
DROP VIEW "SUHASSAN"."SPORTSSERVICE";
DROP VIEW "SUHASSAN"."SPORTSSERVICES";
DROP VIEW "SUHASSAN"."SPORTSSERVICE_";
DROP VIEW "SUHASSAN"."SPORTS_SERVICE";
DROP VIEW "SUHASSAN"."SPORTS_SERVICES";
--------------------------------------------------------
--  DDL for Table ACCOUNT
--------------------------------------------------------

  CREATE TABLE "SUHASSAN"."ACCOUNT" 
   (	"USERNAME" VARCHAR2(25 BYTE), 
	"ID" NUMBER(*,0), 
	"PASSWORD" VARCHAR2(12 BYTE), 
	"EMAIL" VARCHAR2(20 BYTE), 
	"NAME" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DBCOURSE" ;
--------------------------------------------------------
--  DDL for Table PAYMENT
--------------------------------------------------------

  CREATE TABLE "SUHASSAN"."PAYMENT" 
   (	"CONFIRMATION_NUM" NUMBER(*,0), 
	"PRICE" BINARY_DOUBLE, 
	"DISCOUNT" BINARY_DOUBLE, 
	"TYPE" VARCHAR2(20 BYTE), 
	"BILLING_ADDRESS" VARCHAR2(20 BYTE), 
	"DATES" DATE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DBCOURSE" ;
--------------------------------------------------------
--  DDL for Table REVIEWS
--------------------------------------------------------

  CREATE TABLE "SUHASSAN"."REVIEWS" 
   (	"SELLER" VARCHAR2(20 BYTE), 
	"RATING" NUMBER(*,0), 
	"SERVICES" VARCHAR2(20 BYTE), 
	"DATES" DATE, 
	"SERVICE_TYPE" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DBCOURSE" ;
--------------------------------------------------------
--  DDL for Table SELLER
--------------------------------------------------------

  CREATE TABLE "SUHASSAN"."SELLER" 
   (	"INBOX_RESPONSE" VARCHAR2(30 BYTE), 
	"EARNINGS" VARCHAR2(20 BYTE), 
	"ORDER_COMPLETION_RATE" VARCHAR2(20 BYTE), 
	"DELIEVERD_ON_TIME_RATE" VARCHAR2(20 BYTE), 
	"ORDER_RESPONSE_RATE" VARCHAR2(20 BYTE), 
	"ID" NUMBER(*,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DBCOURSE" ;
--------------------------------------------------------
--  DDL for Table SERVICE
--------------------------------------------------------

  CREATE TABLE "SUHASSAN"."SERVICE" 
   (	"ID" NUMBER(*,0), 
	"DESCRIPTION" VARCHAR2(100 BYTE), 
	"PORTFOLIO" VARCHAR2(20 BYTE), 
	"NAME" VARCHAR2(20 BYTE), 
	"LEVELS" VARCHAR2(20 BYTE), 
	"SERVICE_NAME" VARCHAR2(20 BYTE), 
	"SERVICE_TYPE" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DBCOURSE" ;
--------------------------------------------------------
--  DDL for Table SERVICELEVEL
--------------------------------------------------------

  CREATE TABLE "SUHASSAN"."SERVICELEVEL" 
   (	"ID" NUMBER(*,0), 
	"TYPE" VARCHAR2(20 BYTE), 
	"PRICE" VARCHAR2(20 BYTE), 
	"DESCRIPTION" VARCHAR2(500 BYTE), 
	"RESPONSE_TIME_MINS" NUMBER, 
	"DELIVERY_TIME_DAYS" NUMBER
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DBCOURSE" ;
--------------------------------------------------------
--  DDL for View EXPENSIVE
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SUHASSAN"."EXPENSIVE" ("CONFIRMATION_NUM", "PRICE", "DISCOUNT", "TYPE", "BILLING_ADDRESS", "DATES") AS 
  (SELECT "CONFIRMATION_NUM","PRICE","DISCOUNT","TYPE","BILLING_ADDRESS","DATES"
    FROM payment 
    WHERE price >= 100)
;
--------------------------------------------------------
--  DDL for View FASTDELIVERY
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SUHASSAN"."FASTDELIVERY" ("DELIVERY_TIME_DAYS", "NAME") AS 
  (Select sl.DELIVERY_TIME_DAYS, s.name
    FROM servicelevel sl, service s
    WHERE DELIVERY_TIME_DAYS <= 10
    AND sl.id = s.id)
;
--------------------------------------------------------
--  DDL for View FAST_D
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SUHASSAN"."FAST_D" ("DELIVERY_TIME_DAYS") AS 
  (Select DELIVERY_TIME_DAYS
    FROM servicelevel
    WHERE DELIVERY_TIME_DAYS <= 10)
;
--------------------------------------------------------
--  DDL for View FAST_DELIEVRY
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SUHASSAN"."FAST_DELIEVRY" ("DELIVERY_TIME_DAYS", "ORDER_RESPONSE_RATE", "NAME") AS 
  (Select sl.delivery_time_days, Order_response_rate, s.name
    FROM Service s, Servicelevel sl, seller
    WHERE s.id = sl.id
    AND sl.delivery_time_days <= 10
    AND order_response_rate >= 70)
;
--------------------------------------------------------
--  DDL for View FAST_DELIVERY
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SUHASSAN"."FAST_DELIVERY" ("DELIVERY_TIME_DAYS", "ORDER_RESPONSE_RATE", "NAME") AS 
  (Select sl.delivery_time_days, Order_response_rate, s.name
    FROM Service s, Servicelevel sl, seller
    WHERE s.id = sl.id
    AND sl.delivery_time_days <= 10
    AND order_response_rate >= 70)
;
--------------------------------------------------------
--  DDL for View FAST_DSD
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SUHASSAN"."FAST_DSD" ("DELIVERY_TIME_DAYS", "NAME") AS 
  (Select sl.DELIVERY_TIME_DAYS, s.name
    FROM servicelevel sl, service s
    WHERE DELIVERY_TIME_DAYS <= 10
    AND sl.id = s.id)
;
--------------------------------------------------------
--  DDL for View GOOD_RESPONSE
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SUHASSAN"."GOOD_RESPONSE" ("NAME", "ORDER_RESPONSE_RATE") AS 
  (Select u.name, Order_response_rate
    FROM Seller s, account u
    Where s.id = u.id
    AND s.order_response_rate >= 70)
;
--------------------------------------------------------
--  DDL for View GOOD_RESPONSE_RATE
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SUHASSAN"."GOOD_RESPONSE_RATE" ("NAME", "ORDER_RESPONSE_RATE") AS 
  (Select u.name, Order_response_rate
    FROM Seller s, account u
    Where s.id = u.id
    AND s.order_response_rate >= 70)
;
--------------------------------------------------------
--  DDL for View SPORTSSERVICE
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SUHASSAN"."SPORTSSERVICE" ("SERVICE_TYPE", "USERNAME", "PRICE") AS 
  (SELECT r.service_type, s.username, price
    FROM reviews r, account s, servicelevel
    WHERE r.service_type = 'Sport'
    AND r.seller = s.name)
;
--------------------------------------------------------
--  DDL for View SPORTSSERVICES
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SUHASSAN"."SPORTSSERVICES" ("SERVICE_TYPE", "USERNAME", "PRICE") AS 
  (SELECT r.service_type, s.username, sl.price
    FROM reviews r, account s, servicelevel sl
    WHERE r.service_type = 'Sport'
    AND r.seller = s.name)
;
--------------------------------------------------------
--  DDL for View SPORTSSERVICE_
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SUHASSAN"."SPORTSSERVICE_" ("SERVICES", "USERNAME", "PRICE") AS 
  (SELECT r.services, s.username, sl.price
    FROM reviews r, account s, servicelevel sl
    WHERE r.service_type = 'Sport'
    AND r.seller = s.name)
;
--------------------------------------------------------
--  DDL for View SPORTS_SERVICE
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SUHASSAN"."SPORTS_SERVICE" ("SERVICES", "USERNAME", "PRICE") AS 
  (SELECT r.services, a.username, sl.price
    FROM reviews r, account a, servicelevel sl
    WHERE r.service_type = 'Sport'
    AND a.name = r.seller
    AND a.id = sl.id)
;
--------------------------------------------------------
--  DDL for View SPORTS_SERVICES
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SUHASSAN"."SPORTS_SERVICES" ("SERVICES", "USERNAME", "PRICE") AS 
  (SELECT services, username, price
    FROM reviews r, account, servicelevel
    WHERE r.service_type = 'Sport')
;
REM INSERTING into SUHASSAN.ACCOUNT
SET DEFINE OFF;
REM INSERTING into SUHASSAN.PAYMENT
SET DEFINE OFF;
REM INSERTING into SUHASSAN.REVIEWS
SET DEFINE OFF;
REM INSERTING into SUHASSAN.SELLER
SET DEFINE OFF;
REM INSERTING into SUHASSAN.SERVICE
SET DEFINE OFF;
REM INSERTING into SUHASSAN.SERVICELEVEL
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index REVIEWS_PK
--------------------------------------------------------

  CREATE INDEX "SUHASSAN"."REVIEWS_PK" ON "SUHASSAN"."REVIEWS" ("SELLER") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  STORAGE( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DBCOURSE" ;
--------------------------------------------------------
--  DDL for Index USERS_PK
--------------------------------------------------------

  CREATE INDEX "SUHASSAN"."USERS_PK" ON "SUHASSAN"."ACCOUNT" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  STORAGE( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DBCOURSE" ;
--------------------------------------------------------
--  DDL for Index PAYMENT_PK
--------------------------------------------------------

  CREATE INDEX "SUHASSAN"."PAYMENT_PK" ON "SUHASSAN"."PAYMENT" ("CONFIRMATION_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  STORAGE( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DBCOURSE" ;
--------------------------------------------------------
--  DDL for Index SERVICELEVEL_PK
--------------------------------------------------------

  CREATE INDEX "SUHASSAN"."SERVICELEVEL_PK" ON "SUHASSAN"."SERVICELEVEL" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  STORAGE( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DBCOURSE" ;
--------------------------------------------------------
--  DDL for Index SELLER_PK
--------------------------------------------------------

  CREATE INDEX "SUHASSAN"."SELLER_PK" ON "SUHASSAN"."SELLER" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  STORAGE( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DBCOURSE" ;
--------------------------------------------------------
--  DDL for Index SERVICE_PK
--------------------------------------------------------

  CREATE INDEX "SUHASSAN"."SERVICE_PK" ON "SUHASSAN"."SERVICE" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  STORAGE( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DBCOURSE" ;
--------------------------------------------------------
--  Constraints for Table SERVICELEVEL
--------------------------------------------------------

  ALTER TABLE "SUHASSAN"."SERVICELEVEL" ADD CONSTRAINT "SERVICELEVEL_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  STORAGE( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DBCOURSE"  ENABLE;
 
  ALTER TABLE "SUHASSAN"."SERVICELEVEL" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PAYMENT
--------------------------------------------------------

  ALTER TABLE "SUHASSAN"."PAYMENT" ADD CONSTRAINT "PAYMENT_PK" PRIMARY KEY ("CONFIRMATION_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  STORAGE( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DBCOURSE"  ENABLE;
 
  ALTER TABLE "SUHASSAN"."PAYMENT" MODIFY ("CONFIRMATION_NUM" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SELLER
--------------------------------------------------------

  ALTER TABLE "SUHASSAN"."SELLER" ADD CONSTRAINT "SELLER_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  STORAGE( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DBCOURSE"  ENABLE;
 
  ALTER TABLE "SUHASSAN"."SELLER" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ACCOUNT
--------------------------------------------------------

  ALTER TABLE "SUHASSAN"."ACCOUNT" ADD CONSTRAINT "ACCOUNT_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  STORAGE( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DBCOURSE"  ENABLE;
 
  ALTER TABLE "SUHASSAN"."ACCOUNT" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SERVICE
--------------------------------------------------------

  ALTER TABLE "SUHASSAN"."SERVICE" ADD CONSTRAINT "SERVICE_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  STORAGE( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DBCOURSE"  ENABLE;
 
  ALTER TABLE "SUHASSAN"."SERVICE" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REVIEWS
--------------------------------------------------------

  ALTER TABLE "SUHASSAN"."REVIEWS" ADD CONSTRAINT "REVIEWS_PK" PRIMARY KEY ("SELLER")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  STORAGE( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DBCOURSE"  ENABLE;
 
  ALTER TABLE "SUHASSAN"."REVIEWS" MODIFY ("SELLER" NOT NULL ENABLE);
