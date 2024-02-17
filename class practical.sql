create database task;

create table Customers(
CustomerID int primary key,
FirstName varchar (255),
LastName varchar (255),
Email varchar(255),
PhoneNumber varchar(255),
OrderID int ,
 foreign key (OrderID) references Orders(OrderID)
);

insert into Customers (CustomerID,FirstName,LastName,Email,PhoneNumber,OrderID) values
 (1, 'John', 'Doe', 'john.doe@example.com', 1234567890, 1),
    (2, 'Jane', 'Smith', 'jane.smith@example.com', 9876543210, 2),
    (3, 'Alice', 'Johnson', 'alice.johnson@example.com', 1122334455, 3),
    (4, 'Michael', 'Brown', 'michael.brown@example.com', 9988776655, 4),
    (5, 'Emily', 'Jones', 'emily.jones@example.com', 6677889900, 5),
    (6, 'David', 'Martinez', 'david.martinez@example.com', 5544332211, 6),
    (7, 'Sarah', 'Garcia', 'sarah.garcia@example.com', 3355779988,7),
    (8, 'Daniel', 'Lopez', 'daniel.lopez@example.com', 8899776655,8),
    (9, 'Jessica', 'Rodriguez', 'jessica.rodriguez@example.com', 1122556677,9),
    (10, 'Matthew', 'Hernandez', 'matthew.hernandez@example.com', 5577998866,10
	);


	create table Orders (
	OrderID int primary key,
	CustomerID int,
	OrderDate  varchar (255),
	TotalAmount varchar (255),
	OrderDetailID int,
    foreign key (OrderDetailID) references OrderDetails(OrderDetailID)

	);

	insert into Orders(OrderID,CustomerID,OrderDate,TotalAmount,OrderDetailID) values 
	 (1, 1, '2024-02-17', '100.00',1),
    (2, 2, '2024-02-16', '75.50',2),
    (3, 3, '2024-02-15', '200.25',3),
    (4, 1, '2024-02-14', '150.75',4),
    (5, 4, '2024-02-13', '300.00',5),
    (6, 2, '2024-02-12', '80.20',6),
    (7, 5, '2024-02-11', '95.60',7),
    (8, 3, '2024-02-10', '125.40',8),
    (9, 1, '2024-02-09', '180.90',9),
    (10, 4, '2024-02-08', '220.30',10);

	create table OrderDetails(
	OrderDetailID int primary key,
	OrderID int ,
    ProductID int,
	Quantity varchar  (255),
	UnitPrice varchar (255),
	foreign key (ProductID) references Products(ProductID)

	);
	 
	 insert into OrderDetails(OrderDetailID,OrderID,ProductID,Quantity,UnitPrice) values 
	 (1, 1, 101, '2', '10.50'),
    (2, 1, 102, '1', '15.25'),
    (3, 2, 103, '3', '8.75'),
    (4, 2, 104, '2', '20.00'),
    (5, 3, 105, '1', '12.99'),
    (6, 3, 106, '4', '5.75'),
    (7, 4, 107, '2', '9.50'),
    (8, 4, 108, '3', '18.25'),
    (9, 5, 109, '5', '7.99'),
    (10, 5, 110, '1', '25.00');
	  


    create table Products(
	ProductID int primary key,
	ProductName varchar(255),
	UnitPrice varchar(255),
	InstockQuantity varchar(255),
	);
	insert into Products(ProductID,ProductName,UnitPrice,InstockQuantity) values
	(101, 'Product A', '10.50', '50'),
    (102, 'Product B', '15.25', '30'),
    (103, 'Product C', '8.75', '70'),
    (104, 'Product D', '20.00', '20'),
    (105, 'Product E', '12.99', '60'),
    (106, 'Product F', '5.75', '40'),
    (107, 'Product G', '9.50', '45'),
    (108, 'Product H', '18.25', '25'),
    (109, 'Product I', '7.99', '55'),
    (110, 'Product J', '25.00', '15');

    select * from Customers
	select * from Orders
	select * from OrderDetails
    select * from Products

	     --query1--
	Create login Order_Cleark With password='Order';
	create user Order_Cleark for login Order_Cleark;
	grant all to Order_Cleark;
	revoke insert ,all from Order_Cleark;
		--query2--
 
	    --query3--
	select FirstName,LastName,OrderDate,TotalAmount from Customers  as c inner join  orders as o on c.CustomerID = o.CustomerID;
	 
	 	--query4--
    select ProductName ,TotalAmount from Orders as o inner join Products as p on o.OrderID = o.OrderID;

        --query5--
		create procedure Get_order_by_customer
		as
		begin
		select FirstName,LastName,OrderDate,TotalAmount from Customers  as c inner join  orders as o on c.CustomerID = o.CustomerID;
		end
		exec Get_order_by_customer
		--query6--
		create view ordersummery
		as
		select OrderID, OrderDate,CustomerID,TotalAmount from Orders;
		select * from ordersummery;

		--query7--
	