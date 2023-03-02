CREATE table Employee
(
Id int,
Name nvarchar(50),
Gender nvarchar(20),
DepartmentId int
)

Insert into Employee
values
(1,'Sam','Male',1),
(2,'Ram','Male',1),
(3,'Sara','Female',3),
(4,'Todd','Male',2),
(5,'John','Male',3),
(6,'Sana','Female',2),
(7,'James','Male',1),
(8,'Rob','Male',2),
(9,'Steve','Male',1),
(10,'Pam','Female',2)

select * from Employee

create Procedure spGetEmployees
as
Begin
select Name,Gender from Employee
End

create procedure spGetEmployeeCountByCount
@Gender nvarchar(20),
@EmployeeCount int Output
as
Begin
Select @EmployeeCount =COUNT(Id)
from Employee
where Gender=@Gender
End

Declare @EmployeeTotal int
Exec spGetEmployeeCountByCount 'Male',@EmployeeTotal output
Print @EmployeeTotal

select * from tblEmployeee

Alter procedure spGetSalaryCount
@Gender nvarchar(20),
@SalaryCount int Output
as
Begin
Select @SalaryCount =Sum(Salary)
from tblEmployeee
where Gender=@Gender
End

Declare @EmployeeTotalSalary int
Exec spGetSalaryCount 'Male',@EmployeeTotalSalary output
Print @EmployeeTotalSalary

sp_helptext spGetSalaryCount

sp_depends spGetSalaryCount

create procedure spGetTotalEmp2
as
Begin
return (select count(ID) from tblEmployeee)
end

Declare @TotalEmp int
Exec @TotalEmp=spGetTotalEmp2 
Select @TotalEmp

create procedure spGetNamebyId
@Id int,
@Name nvarchar(20) output
AS
BEGIN
select @Name =Name from tblEmployeee where Id =@Id
End

Declare @EmployeeName nvarchar(20)
Exec spGetNamebyId 2,@EmployeeName out
Print 'Name of the Employee = '+ @EmployeeName

CREATE PROCEDURE spGetNamebyId2
@Id int
as 
begin
return  (select Name from tblEmployeee where Id=@Id)
end

declare @EmployeeName nvarchar(20)
exec @EmployeeName = spGetNamebyId2 1
print 'Name of the Employee = ' +@EmployeeName
