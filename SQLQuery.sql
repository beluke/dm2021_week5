---------------------------------------------------
-- MAIN QUESTIONS

-- 1. Select all the records from the "Customers" table.
select * from Customers;

-- 2. Get distinct countries from the Customers table.
select distinct Country from Customers;

-- 3. Get all the records from the table Customers where the Customer’s ID starts with “Bl”.
select * from Customers where CustomerID like 'BL%';

-- 4. Get the first 100 records of the orders table.
select top 100 * from Orders;

-- 5. Get all customers that live in the postal codes 1010, 3012, 12209, and 05023.
select * from Customers where PostalCode = '1010' or PostalCode = '3012' or PostalCode = '12209' or PostalCode = '05023';

-- 6. Get all orders where the ShipRegion is not equal to NULL.
select * from Orders where ShipRegion is not NULL;

-- 7. Get all customers ordered by the country, then by the city.
select * from Customers order by Country,City;

-- 8. Add a new customer to the customers table. You can use whatever values.
insert into Customers values ('LPBCD', 'Lukas Pukas Bukas Company Dude', 'Lukas Pukas', 'Owner of Things', '12345 Dingus Rd', 'Detroit', NULL, '48173', 'USA', '+1-734-1234567', '+1-734-1235678');

-- 9. Update all ShipRegion to the value ‘EuroZone’ in the Orders table, where the ShipCountry is equal to France.
update Orders set ShipRegion = 'EuroZone' where ShipCountry = 'France';

-- 10. Delete all orders from OrderDetails that have quantity of 1.
delete from [Order Details] where Quantity = 1;

-- 11. Find the CustomerID that placed order 10290 (orders table).
select CustomerID from Orders where OrderId = '10290';

-- 12. Join the orders table to the customers table.
select * from Orders join Customers on Orders.CustomerID = Customers.CustomerID;

-- 13. Get employees’ firstname for all employees who report to no one.
select * from Employees where ReportsTo is null;

-- 14. Get employees’ firstname for all employees who report to Andrew
select * from Employees where ReportsTo = '2';

---------------------------------------------------
-- EXTRAS 

--1. Calculate the average, max, and min of the quantity at the orderdetails table, grouped by the orderid.
select OrderId, avg(Quantity) as Average, max(Quantity) as Maximum, min(Quantity) as Mininum from [Order Details] group by OrderId;

--2. Calculate the average, max, and min of the quantity at the orderdetails table.
select avg(Quantity) as Average, max(Quantity) as Maximum, min(Quantity) as Mininum from [Order Details];

--3. Find all customers living in London or Paris
select * from Customers where City = 'london' or City = 'paris';

--4. Do an inner join, left join, right join on orders and customers tables.
select * from Orders inner join Customers on Orders.CustomerID = Customers.CustomerID;
select * from Orders left join Customers on Orders.CustomerID = Customers.CustomerID;
select * from Orders right join Customers on Orders.CustomerID = Customers.CustomerID;

--5. Make a list of cities where customers are coming from. The list should not have any duplicates or nulls.
select distinct City from Customers where City is not null;

--6. Show a sorted list of employees’ first names. 
select * from Employees order by FirstName;

--7. Find the average of employees’ salaries
-- no salary data

--8. Show the first name and last name for the employee with the highest salary.
-- no salary data

--9. Find a list of all employees who have a BA
select * from Employees where Notes like '% BA %';

--10. Find total for each order
select OrderID,Quantity from Invoices order by OrderID;

--11. Get a list of all employees who got hired between 1/1/1994 and today
select * from Employees where Employees.HireDate >= datefromparts(1994,1,1) and Employees.HireDate <= current_timestamp;

-- 12. Find how long employees have been working for Northwind (in years!)
select EmployeeID, FirstName, LastName, (year(current_timestamp) - year(HireDate)) as YearsEmployed from Employees; 

-- 13. Get a list of all products sorted by quantity (ascending and descending order)
select * from Products order by UnitsInStock desc;
select * from Products order by UnitsInStock asc;

-- 14. Find all products that are low on stock (quantity less than 6)
select * from Products where UnitsInStock < 6 order by UnitsInStock desc;

--15. Find a list of all discontinued products. 
select * from Products where Discontinued = 1;

--16. Find a list of all products that have Tofu in them.
select * from Products where ProductName like '%Tofu%';

--17. Find the product that has the highest unit price. 
select * from Products where UnitPrice = (select max(UnitPrice) from Products);

--18. Get a list of all employees who got hired after 1/1/1993
select * from Employees where HireDate > datefromparts(1993,1,1);

--19. Get all employees who have title : “Ms.” And “Mrs.”
select * from Employees where TitleOfCourtesy = 'Ms.' or TitleOfCourtesy = 'Mrs.';

--20. Get all employees who have a Home phone number that has area code 206
select * from Employees where HomePhone like '(206)%';