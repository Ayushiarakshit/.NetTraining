select * from tblEmployeee

spGetTotalEmp2

CREATE PROCEDURE spGetEmployeee
AS
BEGIN
     SELECT ID, Name, Gender,Salary
     FROM tblEmployeee
END

exec spGetEmployeee