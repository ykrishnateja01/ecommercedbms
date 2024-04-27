/*Product table*/
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(255),
    Price DECIMAL(10, 2),
   
);
/*Customers Table*/

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(255),
    Email VARCHAR(255),
    Address VARCHAR(255)
);


/*Orders Table*/

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    Quantity INT,
    OrderDate DATE
);


/*Sales Table*/

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    CustomerID INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


/*Inventory Table*/

CREATE TABLE Inventory (
    ProductID INT PRIMARY KEY,
    QuantityInStock INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
)


/*Inserting data into products table*/

INSERT INTO Products (ProductID, ProductName, Price)
VALUES (1, 'Soap', 49.99),
       (2, 'Shampoo', 35.99),
       (3, 'Book', 79.99),
       (4,'pen',9.99),
       (5,'mobile',9999);

 

/* Inserting data into Customers tabl*/


INSERT INTO Customers (CustomerID, Name, Email, Address)
VALUES (1, 'Subhash', 'subhash@gmail.com', 'guntur'),
       (2, 'Aditya', 'aditya@gmail.com', 'hyderbad'),
       (3, 'Satya Krishna', 'skrishna@gmail.com', 'Kakinada'),
       (4,'Chinni Krishna','chinni@gmail.com','guntur'),
       (5,'Krishna Teja','teja@gmail.com','guntur');

 

/* Inserting data into Orders table*/

INSERT INTO Orders (OrderID, CustomerID, ProductID, Quantity, OrderDate)
VALUES (1, 1, 1, 2, '2024-04-23'),
       (2, 2, 2, 1, '2024-04-24'),
       (3, 3, 3, 3, '2024-04-25'),
       (4, 2, 1, 4, '2024-04-23'),
       (5, 3, 2, 2, '2024-04-24');


 


/*Inserting data into Sales table*/


INSERT INTO Sales (SaleID, OrderID, ProductID, CustomerID)
VALUES (1, 1, 1, 1),
       (2, 2, 2, 2),
       (3, 3, 3, 4),
       (4, 2, 5, 3),
       (5, 3, 3, 2);

 

/* Inserting data into Inventory table*/

INSERT INTO Inventory (ProductID, QuantityInStock)
VALUES (1, 100),
       (2, 70),
       (3, 150),
       (4, 250),
       (5, 120);

/*Queries on the tables*/

SELECT * FROM Products;


SELECT * FROM Customers WHERE Email = 'chinni@gmail.com';


SELECT * FROM Orders WHERE CustomerID = 2;


SELECT * FROM Sales WHERE OrderID = 3;


SELECT * FROM Inventory WHERE ProductID = 1;

/*Creation of views using the tables*/
  
CREATE VIEW SalesWithProductDetails AS
    SELECT S.SaleID, S.OrderID, P.ProductID, P.ProductName, P.Price
    FROM Sales S
    JOIN Products P ON S.ProductID = P.ProductID;
SELECT * FROM   SalesWithProductDetails;

CREATE VIEW ProductsWithInventory AS
    SELECT P.ProductID, P.ProductName, P.Price, I.QuantityInStock
    FROM Products P
    JOIN Inventory I ON P.ProductID = I.ProductID;

CREATE VIEW CustomersAndOrders AS
    SELECT C.CustomerID, C.Name, O.OrderID, O.ProductID, O.Quantity, O.OrderDate
    FROM Customers C
    JOIN Orders O ON C.CustomerID = O.CustomerID;

CREATE VIEW SalesWithCustomerDetails AS
    SELECT S.SaleID, S.OrderID, C.CustomerID, C.Name, C.Email, C.Address
    FROM Sales S
    JOIN Customers C ON S.CustomerID = C.CustomerID;

CREATE VIEW OrdersWithDetails AS
    SELECT O.OrderID, P.ProductID, P.ProductName, P.Price, C.CustomerID, C.Name
    FROM Orders O
    JOIN Products P ON O.ProductID = P.ProductID
    JOIN Customers C ON O.CustomerID = C.CustomerID;



  




 
