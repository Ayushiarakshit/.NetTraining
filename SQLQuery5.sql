create database ItemDetails

create table Orders
(
orderID int,
customerID int,
dateOrdered datetime,
dateRequired datetime,
OrderStatus nvarchar(20)
)

insert into Orders
values
(1,320,'2022-12-25','2022-12-28','Delivered'),
(2,325,'2022-01-10','2022-01-13','Delivered'),
(3,323,'2022-02-20','2022-02-23','Shipped'),
(4,322,'2022-02-22','2022-02-24','Packed'),
(5,324,'2022-02-23','2022-02-24','Delivered'),
(6,321,'2022-01-25','2022-01-28','Delivered')

create table Products
(
ProductID int,
name nvarchar(50),
description nvarchar(50),
quantity int,
unitprice int
)

insert into Products
values
(121,'Mobile','Samsung',30,25000),
(122,'Laptop','Apple',20,125000),
(123,'Smart Watch','Boat',80,5000),
(124,'Earphone','Boat',100,1000),
(125,'Watch','Fossil',25,7000)

create table OrderDetails
(
orderID int,
ProductID int,
quantity int,
lineNumber int
)

insert into OrderDetails
values
(1,123,2,676889),
(2,121,1,878978),
(3,125,2,787879),
(4,124,8,878986),
(5,122,1,454679),
(6,124,5,878799)

select * from OrderDetails
select * from Orders
select * from Products

CREATE PROCEDURE spGetOrderStatus
AS
BEGIN
     SELECT D.orderID,D.ProductID,O.OrderStatus
     FROM OrderDetails D join Orders O
	 on D.orderID=O.orderID
END

exec spGetOrderStatus

CREATE PROCEDURE spGetProductDetails
AS
BEGIN
     SELECT D.orderID,P.name,P.description,D.quantity
     FROM OrderDetails D join Products P
	 on D.ProductID=P.ProductID
END

exec spGetProductDetails