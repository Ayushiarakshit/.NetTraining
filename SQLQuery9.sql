create database CollegeData

create table Department
(
DeptID int,
DeptName nvarchar(50),
CourseID int,
TeacherID int,
StudentID int
)

insert into Department
values
(1,'CSE',211,53,103),
(2,'ECE',215,50,101),
(3,'EE',213,51,100),
(4,'CE',210,54,104),
(5,'ML',212,52,102)

create table Infrastructure
(
CollegeID int,
Rating int,
Building nvarchar(20),
LabFacility nvarchar(20)
)

insert into Infrastructure
values
(1001,3,'Good','Bad'),
(1002,5,'Excellent','Excellent'),
(1003,2,'Bad','Bad'),
(1004,4,'Good','Good'),
(1005,3,'Bad','Good')

create table Course
(
courseID int,
courseName nvarchar(50),
TheoryID int,
LabID int
)

insert into Course
values
(210,'Plotting and Graph',20,30),
(211,'JAVA',21,31),
(212,'K-Mapping',22,32),
(213,'Basic Electrical',23,33),
(214,'Signal & System',24,34)

create table Teachers
(
TeacherID int,
TeacherName nvarchar(50)
)

insert into Teachers
values
(50,'Sumanta Karmakar'),
(51,'Soumen Sen'),
(52,'Rupam Singh'),
(53,'Dhiran Kumar'),
(54,'Avik Dey')

create table Students
(
StudentID int,
StudentName nvarchar(50)
)

insert into Students
values
(100,'Ayush Kumar'),
(101,'Anjali Kumari'),
(102,'Sushmita Sharma'),
(103,'Sagnik Salui'),
(104,'Anand Singh')

create table Theory
(
TheoryID int,
TheoryName nvarchar(50)
)

insert into Theory
values
(20,'Plotting'),
(21,'JAVA'),
(22,'K-Map'),
(23,'Basic Electrical'),
(24,'Systems')

create table Lab
(
LabID int,
LabName nvarchar(20)
)

insert into Lab
values
(30,'Graph'),
(31,'JAVA'),
(32,'K-Map'),
(33,'Voltage Measuring'),
(34,'Signals')

select * from Department
select * from Infrastructure
select * from Course
select * from Teachers
select * from Students
select * from Theory
select * from Lab

create Procedure SP_getDepartmentDetails
AS
Begin
select D.DeptID, D.DeptName,C.CourseName,T.TeacherName,S.StudentName
from Department D
join Course C on D.CourseID=C.courseID
join Teachers T on D.TeacherID=T.TeacherID
join Students S on D.StudentID=S.StudentID
End

exec SP_getDepartmentDetails

CREATE PROCEDURE SP_getItemDescription
( 
@itemID int 
) 
AS 
BEGIN 
	SELECT C.first_name,C.last_name,I.description,I.amount,O.order_id 
	FROM Orders O 
	join Client C on O.client_id=C.client_id
	join Item I on O.order_id=I.order_id
	WHERE I.item_id=@itemID 
END 

EXEC SP_getItemDescription 1002;
