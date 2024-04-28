-- Active: 1713892331730@@127.0.0.1@3306@ristorante

USE ristorante;

-- List Employees --
SELECT EmployeeID AS "ID", Name, Role, Salary, Birthdate, HireDate
FROM employee;

-- List Dishes --
SELECT DishID AS "ID", Name, Category, Price
FROM Dish;

-- List Tables --
SELECT t.TableNumber as "Number", CONCAT(t.Type, " for ", t.Capacity) AS Type
FROM _table t;

-- List Orders --
SELECT o.OrderID, o.OrderDate, e.Name AS "host", o.TableNumber, o.PartySize
FROM _order o, _check c, employee e
WHERE o.OrderID = c.OrderID
    AND o.EmployeeID = e.EmployeeID
ORDER BY OrderID;

-- List Cards --
SELECT *
FROM card;