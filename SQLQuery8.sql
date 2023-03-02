select ascii('A')

declare @Number int
set @Number=97
while(@Number<=122)
begin
print char(@Number)
set @Number=@Number+1
end

declare @Number int
set @Number=65
while(@Number<=90)
begin
print lower(char(@Number))
set @Number=@Number+1
end

select ltrim('     Hello')
select rtrim('Hello    ')

SELECT LEN ('HELLO WORLD SQL') AS Result

declare
@num int
set @Num=1

while(@num<=20)
begin
if(@Num%2=0)
print cast(@Num as varchar) +' is even'
else
print cast(@Num as varchar) +' is odd'
set @num=@num+1
end

select LEFT('abcde',3)
select RIGHT('abcde',3)

select CHARINDEX('@','sara@abcd.com')

select SUBSTRING('AyushiAnkita',4,5)

select replicate('Mark',3)

select [Name] + SPACE(5) + Gender as Details
from tblEmployeee

Alter table tblEmployeee
add Email nvarchar(50)


insert into tblEmployeee(Email)
values
(
('Tom@gmail.com'),
('abc@gmail.com'),
('abc1@gmail.com'),
('abc2@gmail.com'),
('abc3@gmail.com'),
('abc4@gmail.com'),
('abc5@gmail.com'),
('abc6@gmail.com'),
('abc7@gmail.com'),
('abc8@gmail.com'),
('abc9@gmail.com')
)
select * from tblEmployeee
select * from tblPerson

select Email, REPLACE(Email,'.com','.net')as ConvertedEmail
from tblPerson

create table[tblDateTime]
(
[c_Time] [time](7) null,
[c_Date] [Date] NUll,
[c_smalldatetime] [smalldatetime] null,
[c_datetime] [datetime] null,
[c_datetime2] [datetime2](7) null,
[c_datetimeoffset] [datetimeoffset](7) null
)	

insert into  tblDateTime values
(GETDate(),GETDATE(),GETDate(),GETDATE(),GETDate(),GETDATE())

select * from tblDateTime

select ISDATE('Ayushi')
select ISDATE(GETDATE())
select ISDATE('2023-01-22 21:02:04.167')

select MONTH(Getdate())
select Month('01/31/2022')

DECLARE @date datetime2 = '2000-07-22';
SELECT
  DAY(@date) AS DAY,
  MONTH(@date) AS MONTH,
  YEAR(@date) AS YEAR;

create table DateOfBirth
(
id int,
name nvarchar(50),
DateOfBirth datetime
)

insert into DateOfBirth
values
(1,'Ayushi','2000-07-22 04:14:36.260'),
(2,'Aakriti','2003-11-01 08:16:42.890'),
(3,'Ankit','2001-03-02 12:06:30.370'),
(4,'Amit','2000-10-18 12:10:07.652')

select * from DateOfBirth

SELECT 
    DateOfBirth,
    Convert(nvarchar(30),DateOfBirth,100) as ConvertedDOB
	from DateOfBirth

SELECT  id,name, CONCAT(name,' - ', id) AS Name_id
FROM DateOfBirth;

create table registration
(
id int,
Name nvarchar(50),
Email nvarchar(50),
RegistrationDate datetime
)

insert into registration
values
(1,'John','john@gmail.com','2012-08-24 11:04:30.320'),
(2,'Sam','sam@gmail.com','2012-08-25 14:04:29.320'),
(3,'Todd','todd@gmail.com','2012-08-25 15:04:30.223'),
(4,'Mary','mary@gmail.com','2012-08-24 15:04:29.320'),
(5,'Sunil','sunil@gmail.com','2012-08-24 15:05:30.320'),
(6,'Mike','mike@gmail.com','2012-08-26 15:04:30.320')

select * from registration

select cast(RegistrationDate as date)as RegistrationDate, COUNT(id) as TotalRegistration
from registration
GROUP BY 
  CAST(RegistrationDate as DATE)

create function Age(@DOB date)
returns int
as
begin 
	declare @Age int
	set @Age = DATEDIFF(Year,@DOB,Getdate()) -
	case when (month(@DOB)>month(Getdate()))
	or(month(@DOB)=month(getdate())
	and day(@DOB)>Day(Getdate()))
	then 1
	else 0
end
	return @Age
end

select dbo.Age('10/08/1982')

create table emp
(
Id int,
Name nvarchar(50),
Salary int,
Gender nvarchar(20)
)

insert into emp
values
(1,'Sam',2500,'Male'),
(2,'Pam',6500,'Female'),
(3,'John',4500,'Male'),
(4,'Sara',5500,'Female'),
(5,'Todd',3100,'Male')

select * from emp where salary>5000 and Salary<7000

create Index IX_emp_salary
on emp(salary asc)

create table Employee3
(
Id int,
Name nvarchar(50),
Salary int,
Gender nvarchar(50),
DepartmentId int
)

insert into Employee3
values
(1,'John',5000,'Male',3),
(2,'Mike',3400,'Male',2),
(3,'Pam',6000,'Female',1),
(4,'Todd',4800,'Male',4),
(5,'Sara',3200,'Female',1),
(6,'Ben',4800,'Male',3)

create table Dept1
(
DeptId int,
DeptName nvarchar(20)
)

insert into Dept1
values
(1,'IT'),
(2,'Payroll'),
(3,'HR'),
(4,'Admin')

select * from Employee3
select * from Dept1

select E.Id, E.Name,E.Salary,E.Gender,D.DeptName
from Employee3 E left join Dept1 D
on E.DepartmentId=D.DeptId

create View vWEmployeeByDept
as
select E.Id, E.Name,E.Salary,E.Gender,D.DeptName
from Employee3 E left join Dept1 D
on E.DepartmentId=D.DeptId

select * from vWEmployeeByDept

Create view vWEmpDetails
as
select E.Id, E.Name,E.Gender,D.DeptName
from Employee3 E left join Dept1 D
on E.DepartmentId=D.DeptId

select * from vWEmpDetails