
Project Title: Sales and Inventory Management System

Description:
Imagine you are tasked with designing a Sales and Inventory Management System for a retail business. The business sells various products and needs a robust database system to manage sales transactions, track inventory levels, and generate reports. The system should be capable of handling the following functionalities:

Product Management:

Create a table to store product information, including product ID, name, category, price, and quantity in stock.
Implement SQL scripts to insert, update, and delete products.
Sales Transactions:

Create a table to record sales transactions, including transaction ID, product ID, quantity sold, transaction date, and total amount.
Develop SQL queries to insert new sales transactions and update the inventory accordingly.
Inventory Management:

Implement stored procedures or triggers to automatically update the quantity in stock when a sale occurs.
Create a mechanism to alert when the inventory falls below a specified threshold.
Reports:

Design SQL queries to generate reports such as:
Total sales for a specific period.
Best-selling products.
Current inventory status.create database SIMS;


use SIMS;
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(255),
    Category NVARCHAR(50),
    Price DECIMAL(10, 2),
    QuantityInStock INT
);

CREATE TABLE SalesTransactions (
    TransactionID INT PRIMARY KEY,
    ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
    QuantitySold INT,
    TransactionDate DATETIME,
    TotalAmount DECIMAL(10, 2)
);
INSERT INTO Products (ProductID, ProductName, Category, Price, QuantityInStock)
VALUES
(1, 'Laptop', 'Electronics', 1200.00, 50),
(2, 'Smartphone', 'Electronics', 800.00, 30),
(3, 'Coffee Maker', 'Appliances', 100.00, 20),
(4, 'Running Shoes', 'Apparel', 80.00, 100),
(5, 'Backpack', 'Accessories', 50.00, 40);

INSERT INTO SalesTransactions (TransactionID, ProductID, QuantitySold, TransactionDate, TotalAmount)
VALUES
(1, 1, 5, '2023-01-15 10:30:00', 6000.00),
(2, 2, 3, '2023-02-01 15:45:00', 2400.00),
(3, 4, 10, '2023-02-10 09:00:00', 800.00),
(4, 3, 2, '2023-03-05 14:20:00', 200.00),
(5, 5, 8, '2023-04-02 11:10:00', 400.00);

INSERT INTO Products (ProductID, ProductName, Category, Price, QuantityInStock)
VALUES
(6, 'fan', 'Electronics', 200.00, 50)

INSERT INTO SalesTransactions (TransactionID, ProductID, QuantitySold, TransactionDate, TotalAmount)
VALUES
(6, 6, 5, '2023-01-15 10:30:00', 6000.00),
(7, 4, 3, '2023-02-01 15:45:00', 2400.00),
(8, 2, 10, '2023-02-10 09:00:00', 800.00),
(9, 3, 2, '2023-03-05 14:20:00', 200.00),
(10, 1, 8, '2023-04-02 11:10:00', 400.00);
select * from Products
select * from SalesTransactions

QUESTIONS & ANSWERS:
select function:
1.Retrieve all columns from the Products table
 select * from products

2.What are the ProductName and Price of products from the 'Electronics' category?
select productName, price from products where category = 'Electronics'

Aggregate Function:
3.What is the total quantity in stock for all products?
select sum (quantityInStock) as TotalQuantityInStock from products;

Join Operation:
4.Display the TransactionID, ProductName, QuantitySold, and TotalAmount 
from the SalesTransactions table along with the corresponding product details from the Products table.
select st.TransactionID, p.productName, st.quantitysold, st.TotalAmount from salesTransactions st
join products p on st.productID = p.productID;

5.Date Comparison:
Which transactions from the SalesTransactions table occurred after '2023-02-01'?
select * from salesTransactions where TransactionDate > '2023-02-01'

select * from Products
select * from SalesTransactions

......6.Group By and Aggregation:
Can you calculate the total quantity sold for each product category?
select p.category, sum(st.quantitysold) as TotalQuantitysold from products p
join salesTransactions st on p.productID = st.productID GROUP BY category;

7.Insert Data:
Add a new product with values (7, 'Headphones', 'Electronics', 150.00, 15) to the Products table.
insert into products (productID, productName, category, price, quantityInstock) 
VALUES (7, 'Headphone', 'Electronics', 150.00, 15);

8.How would you increase the QuantityInStock for the product with ProductID 2 by 5?
update products set QuantityInStock = QuantityInStock + 5 where productID = 2;

9.Delete Data:
Remove all transactions with a TotalAmount less than 500 from the SalesTransactions table.
delete from salesTransactions where TotalAmount < 500;

10. Subquery:
Retrieve the ProductName and Price of products from the Products table where the Price is higher
than the average price of all products.
select productName, price from products where price > (select AVG(price) from products);
