use alarmdb;
create table customertable(customerid varchar(100),fname varchar(100),mname varchar(100),lname varchar(100),emailid varchar(100) primary key,passwrd varchar(100),contactno numeric(10),address varchar(100),role varchar(100));

create table changepassword(emailid varchar(100) primary key,newpassword varchar(100),oldpassword varchar(100));

create table networkdetails(networkid varchar(100),nname varchar(100) primary key,timer numeric(10));

alter table changepassword add constraint fk_name foreign key (emailid) references customertable(emailid) on delete cascade;

create table usernetworkdetails(emailid varchar(100),networkid varchar(100),ownerflag varchar(10),joinflag varchar(10));

alter table usernetworkdetails add constraint fk_name1 foreign key (emailid) references customertable(emailid) on delete cascade;

create table producttable (productid varchar(100) primary key,productname varchar(100),productdesc varchar(100));

create table userproducttable(productid varchar(100),emailid varchar(100),macaddr varchar(100));
alter table userproducttable add constraint fk_name3 foreign key(emailid) references customertable(emailid) on delete cascade;