/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     11/26/2015 7:40:50 AM                        */
/*==============================================================*/


drop table if exists INVOICE;

drop table if exists INVOICE_DETAIL;

drop table if exists PRODUCT;

drop table if exists STAFF;

drop table if exists TYPE;

/*==============================================================*/
/* Table: INVOICE                                               */
/*==============================================================*/
create table INVOICE
(
   I_ID                 int not null auto_increment,
   S_ID                 int,
   TOTAL_PRICE          int,
   DATE                 datetime,
   NOTE                 text,
   primary key (I_ID)
);

/*==============================================================*/
/* Table: INVOICE_DETAIL                                        */
/*==============================================================*/
create table INVOICE_DETAIL
(
   IDE_ID               int not null auto_increment,
   P_ID                 int not null,
   I_ID                 int not null,
   QUANTITY             int not null,
   primary key (IDE_ID)
);

/*==============================================================*/
/* Table: PRODUCT                                               */
/*==============================================================*/
create table PRODUCT
(
   P_ID                 int not null auto_increment,
   K_ID                 int,
   NAME                 text not null,
   PRICE                int not null,
   DISCOUNT             int,
   NOTE                 text,
   primary key (P_ID)
);

/*==============================================================*/
/* Table: STAFF                                                 */
/*==============================================================*/
create table STAFF
(
   S_ID                 int not null auto_increment,
   NAME                 text,
   BIRTHDAY             date,
   POSITION             text,
   NOTE                 text,
   PASSWORD             text,
   ID_LOGIN             text,
   ROLE                 text,
   primary key (S_ID)
);

/*==============================================================*/
/* Table: TYPE                                                  */
/*==============================================================*/
create table TYPE
(
   K_ID                 int not null auto_increment,
   NAME                 text,
   NOTE                 text,
   primary key (K_ID)
);

alter table INVOICE add constraint FK_STAFF_INVOICE foreign key (S_ID)
      references STAFF (S_ID) on delete restrict on update restrict;

alter table INVOICE_DETAIL add constraint FK_DETAIL_PRODUCT foreign key (P_ID)
      references PRODUCT (P_ID) on delete restrict on update restrict;

alter table INVOICE_DETAIL add constraint FK_INVOICE_INVOICE_DETAIL foreign key (I_ID)
      references INVOICE (I_ID) on delete restrict on update restrict;

alter table PRODUCT add constraint FK_PRODUCT_TYPE foreign key (K_ID)
      references TYPE (K_ID) on delete restrict on update restrict;

