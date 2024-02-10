create table student(
    regno varchar(10),
    stud_name varchar(20),
    major varchar(10),
    birthDay DATE ,
    primary key (regno)
);

insert into student values('1','Harsh','Computers',to_date('2003-12-12','yyyy-mm-dd'));
insert into student values('2','Dev','DSE',to_date('2003-12-30','yyyy-mm-dd'));
insert into student values('3','Aditya','Mech',to_date('2004-08-15','yyyy-mm-dd'));
insert into student values('4','Mihiran','ECE',to_date('2004-03-16','yyyy-mm-dd'));
insert into student values('5','Nikunj','IT',to_date('2003-10-20','yyyy-mm-dd'));

create table course(
    courseNum int,
    courseName varchar(20),
    department varchar(30),
    primary key (courseNum)
);

insert into course values(1,'Data Structures','ICT');
insert into course values(2,'Data Analytics','DSE');
insert into course values(3,'Thermodynamics','Mech');
insert into course values(4,'Analog Signal','ECE');
insert into course values(5,'Embedded Systems','IT');

create table text(
    isbn int,
    title varchar(30),
    publisher varchar(30),
    author varchar(30),
    primary key (isbn)
);

insert into text values(123,'Adv. Data Structs','Tata-McGraw','Silverschatz');
insert into text values(124,'Embedded Systems Design','Tata-McGraw','Silverschatz');
insert into text values(201,'Thermodynamics','Tata-McGraw','R.K. Rajput');
insert into text values(756,'Machine Learning','Penguin','Andrew Ng');
insert into text values(1025,'Analog System Design','Pearson','Kudeki');

create table enroll(
    regno varchar(10), foreign key(regno) references student(regno),
    courseNum int , foreign key(courseNum) references course(courseName),
    sem int,
    isbn int , foreign key(isbn) references text(isbn)
);



