create table PERSON(
    driver_id varchar(30),
    driver_name varchar(50),
    driver_address varchar(100),
    primary key (driver_id)
);

insert into PERSON values ('1','Harsh','Mumbai');
insert into PERSON values('2','Arjun','Bangalore');
insert into PERSON values('3','Pranav','Panvel');
insert into PERSON values('4','Nikunj','Jaipur');
insert into PERSON values('5','Vaibhavv','Pune');

create table CAR(
    regno varchar(10),
    model varchar(30),
    yop int,
    primary key(regno)
);

insert into CAR values('911','Porsche','2021');
insert into CAR values('915','Ferrari','2015');
insert into CAR values('525','McLaren','1989');
insert into CAR values('984','Pagani','2022');
insert into CAR values('982','AlfaRomeo','2016');

create table ACCIDENT(
    reportNum int,
    accd_date DATE ,
    accd_loc varchar(30),
    primary key(reportNum)
);

insert into ACCIDENT values(420, to_date('2022-2-23','yyyy-mm-dd'),'Mumbai'); //1
insert into ACCIDENT values(421, to_date('2023-06-12','yyyy-mm-dd'),'Delhi'); //2
insert into ACCIDENT values(422, to_date('2023-08-30','yyyy-mm-dd'),'Udupi'); //3
insert into ACCIDENT values(423, to_date('2023-11-02','yyyy-mm-dd'),'Bangalore'); //4
insert into ACCIDENT values(424, to_date('2024-01-01','yyyy-mm-dd'),'NOIDA'); //5

create table OWNS(
    driver_id varchar(30),
    regno varchar(10),
    foreign key(driver_id) references PERSON(driver_id),
    foreign key(regno) references CAR(regno)
);

insert into OWNS values('1','984');
insert into OWNS values('2','911');
insert into OWNS values('3','915');
insert into OWNS values('4','525');
insert into OWNS values('5','982');

create table PARTICIPATED(
    driver_id varchar(30),
    regno varchar(20),
    reportNum int,
    damageAmt int,
    foreign key(driver_id) references PERSON(driver_id),
    foreign key(regno) references CAR(regno),
    foreign key(reportNum) references ACCIDENT(reportNum)
);

insert into PARTICIPATED values('3','525',423,10000);
insert into PARTICIPATED values('5','911',422,21000);
insert into PARTICIPATED values('4','984',420,4000);
insert into PARTICIPATED values('1','982',421,12000);
insert into PARTICIPATED values('2','915',424,11000);

update PARTICIPATED 
set damageAmt = 25000
where regno = 911 and reportNum = 422 ;

delete from PARTICIPATED where reportNum=420;

delete from ACCIDENT where (extract(year from accd_date) = 2022);

alter table participated drop column damageAmt;

set fineAmt = 45000 where regno = 982;

SQL> alter table participated
  2  add check (fineamt<5000) ;
alter table participated