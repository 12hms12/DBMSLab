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
    courseNum int , foreign key(courseNum) references course(courseNum),
    sem int,
    isbn int , foreign key(isbn) references text(isbn)
);

insert into enroll values('1',1,3,123);
insert into enroll values('5',5,4,124);
insert into enroll values('2',2,4,756);
insert into enroll values('3',3,3,201);
insert into enroll values('4',4,4,1025);

create table book_adoption(
    courseNum int , foreign key(courseNum) references course(courseNum),
    sem int,
    isbn int, foreign key(isbn) references text(isbn)
);

insert into book_adoption values(1,3,123);
insert into book_adoption values(2,4,756);
insert into book_adoption values(3,3,201);
insert into book_adoption values(4,4,1025);
insert into book_adoption values(5,4,124);


--query a.
select distinct c.courseNum , c.courseName
from course c
where(
    select count(*)
    from book_adoption ba
    where ba.courseNum = c.courseNum
) > 1;


--query b.
SELECT DISTINCT c.department
FROM course c
WHERE c.courseNum = (
    SELECT MAX(ba.courseNum)  
    FROM book_adoption ba
    JOIN text t ON t.isbn = ba.isbn
    WHERE t.publisher = 'Tata-McGraw'
);

--query c.
SELECT DISTINCT e.regno, s.stud_name
FROM ENROLL e
JOIN STUDENT s ON e.regno = s.regno
WHERE (
    SELECT COUNT(DISTINCT c.department)
    FROM course c
    WHERE c.courseNum = e.courseNum
) > 1;

--query d.
select s.stud_name , s.regno
from student s 
where s.regno not in (
    select e.regno from enroll e 
);


-- query i.
select distinct t.publisher , count(*) as Number_of_Books
from text t 
group by t.publisher ; 


-- query f
select t.title
from text t 
join enroll e on e.isbn = t.isbn 
where t.isbn in (
    select ba.isbn
    from book_adoption ba 
    where ba.courseNum in (
        select c.courseNum
        from course c 
    )
);

