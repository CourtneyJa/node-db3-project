-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

SELECT ProductName, CategoryName FROM Product
join Category on Product.CategoryId = Category.Id

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

SELECT O.Id,Shipper.CompanyName, OrderDate from [Order] as o
JOIN Shipper on O.ShipVia =Shipper.Id
WHERE O.OrderDate < '2012-08-09';

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

SELECT P.ProductName, OD.Quantity from [OrderDetail] as OD
JOIN Product as P on OD.ProductId = P.Id
WHERE OD.OrderID = 10251
ORDER BY P.ProductName;

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

SELECT O.Id, C.CompanyName,E.LastName FROM [Order] as O
JOIN Customer as C ON O.CustomerId = C.Id
JOIN Employee as E ON O.EmployeeId = E.Id;