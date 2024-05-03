/* Steve's Italian Ristorante Database Creation
Class: CM336 Database Management Systems
Author: Nathan Walker
Date: 5-3-2023
Note: Queries on lines 133, 163, and 193 will throw errors
      when executed (which is what they are designed to do),
      so they have been temporarily commented out. Remove 
      the comments if you wish to execute them. 
*/

-- DATABASE CREATION --

DROP DATABASE IF EXISTS ristorante;

CREATE DATABASE ristorante;

USE ristorante;


-- TABLE CREATION --

-- Employee Table
CREATE TABLE employee (
    EmployeeID INT NOT NULL,
    Name VARCHAR(255) NOT NULL,
    Role CHAR(4) NOT NULL,
    Salary Decimal NULL,
    HireDate Date NULL,
    Birthdate date NULL,
    CONSTRAINT Emp_PK PRIMARY KEY(EmployeeID),
    CONSTRAINT Role_CHK CHECK(Role IN ('host', 'chef'))
);

-- Dish Table
CREATE TABLE dish (
    DishID INT NOT NULL,
    Name VARCHAR(255) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    Category VARCHAR(255) NOT NULL,
    CONSTRAINT dish_PK PRIMARY KEY(DishID),
    CONSTRAINT cat_CHK CHECK(Category IN ('appetizer', 'entree', 'side', 'dessert'))
);

-- Table Table
CREATE TABLE _table (
    TableNumber INT NOT NULL,
    Type VARCHAR(100),
    Capacity INT,
    CONSTRAINT table_PK PRIMARY KEY(TableNumber),
    CONSTRAINT type_CHK CHECK(Type IN ('booth', 'highTop', 'lowTop', 'bar'))
);

-- Order Table
CREATE TABLE _order (
    OrderID INT(9) NOT NULL AUTO_INCREMENT,
    EmployeeID INT NOT NULL,
    TableNumber INT NOT NULL,
    PartySize INT NOT NULL,
    OrderDate Date NOT NULL,
    CONSTRAINT order_PK PRIMARY KEY(OrderID),
    CONSTRAINT Host_FK FOREIGN KEY(EmployeeID)
        REFERENCES employee(EmployeeID),
    CONSTRAINT Table_FK FOREIGN KEY(TableNumber)
        REFERENCES _table(TableNumber)
);

-- Order Item Table
CREATE TABLE orderItem (
    OrderID INT NOT NULL,
    EmployeeID INT NOT NULL,
    DishID INT NOT NULL,
    Options VARCHAR(255),
    CONSTRAINT table_PKs PRIMARY KEY(OrderID, EmployeeID, DishID),
    CONSTRAINT Order_FK FOREIGN KEY(OrderID)
        REFERENCES _order(OrderID),
    CONSTRAINT Chef_FK FOREIGN KEY(EmployeeID)
        REFERENCES employee(EmployeeID),
    CONSTRAINT Dish_FK FOREIGN KEY(DishID)
        REFERENCES dish(DishID)
);

-- Card Table
CREATE TABLE card (
    CardNumber BIGINT(16) NOT NULL,
    CSC VARCHAR(4) NOT NULL,
    CardholderName VARCHAR(255) NOT NULL,
    BillingAddress VARCHAR(255) NOT NULL,
    CardType VARCHAR(255) NOT NULL,
    CONSTRAINT card_PK PRIMARY KEY(CardNumber)
);

-- Check Table
CREATE TABLE _check (
    CheckNumber INT NOT NULL AUTO_INCREMENT,
    OrderID INT NOT NULL,
    PaymentMethod CHAR(4) NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    CardNumber BIGINT(16) NULL,
    CONSTRAINT check_PK PRIMARY KEY(CheckNumber),
    CONSTRAINT orderCheck_FK FOREIGN KEY(OrderID)
        REFERENCES _order(OrderID),
    CONSTRAINT card_FK FOREIGN KEY(CardNumber)
        REFERENCES card(CardNumber),
    CONSTRAINT method_CHK CHECK(PaymentMethod IN ('cash', 'card'))
);



-- HOST CHECK TRIGGER --

-- Creation
DELIMITER $$
CREATE TRIGGER host_check
    BEFORE INSERT 
    ON _order
    FOR EACH ROW
BEGIN
    IF NEW.EmployeeID NOT IN (
        SELECT EmployeeID
        FROM employee
        WHERE Role = 'host'
    )
    THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 
        'That Employee is not a host';
    END IF;
END$$
DELIMITER ;

-- Test (will throw error)
-- Here we attempt to input a chef as the host for an order
/* INSERT INTO _order 
    (EmployeeID, TableNumber, PartySize, OrderDate) 
    VALUES (20001, 1, 2, 20230117); */



-- CHEF CHECK TRIGGER --

-- Creation
DELIMITER $$
CREATE TRIGGER chef_check
    BEFORE INSERT 
    ON orderitem
    FOR EACH ROW
BEGIN
    IF NEW.EmployeeID NOT IN (
        SELECT EmployeeID
        FROM employee
        WHERE Role = 'chef'
    )
    THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 
        'That Employee is not a chef';
    END IF;
END$$
DELIMITER ;

-- Test (will throw error)
-- Here we attempt to input a host as the chef for an orderitem
/* INSERT INTO orderitem VALUES 
    (2, 10003, 205, NULL); */



-- SIZE CHECK TRIGGER

-- Creation
DELIMITER $$
CREATE TRIGGER size_check
    BEFORE INSERT 
    ON _order
    FOR EACH ROW
BEGIN
    IF NEW.PartySize > (
        SELECT Capacity
        FROM _table
        WHERE _table.TableNumber = 
            NEW.TableNumber
    )
    THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 
        'That table is too small';
    END IF;
END$$
DELIMITER ;

-- Test (will throw error)
-- Here we attempt to seat an order to a table that is too small for the party size
/* INSERT INTO _order 
    (EmployeeID, TableNumber, PartySize, OrderDate) 
    VALUES (10001, 8, 5, 20230117); */



-- TABLE FILLING --

-- Employee Table
INSERT INTO employee VALUES
    (10001, 'Gregory Renato', 'host', 60000.00, 19900402, 19700510),
    (10002, 'Jeff Bridges', 'host', 57000.00, 19991114, 19790510),
    (10003, 'Laura Evergy', 'host', 55000.00, 20171212, 20000712),
    (10004, 'Gracie Lawrence', 'host', 50000.00, 20200601, 19990510),
    (20001, 'Frank Ramirez', 'chef', 103000.00, 19851115, 19670118),
    (20002, 'Jim Toller', 'chef', 99000.00, 19931214, 19750317),
    (20003, 'Jose Banero', 'chef', 95000.00, 19991115, 19790720),
    (20004, 'Lena Chevano', 'chef', 93000.00, 20011231, 19990418);

-- Dish Table
INSERT INTO dish VALUES
    (101, "Steve's Famous Lasagna", 25.00, "entree"),
    (102, "Fettuccine Alfredo", 18.00, "entree"),
    (103, "Pasta Carbonara", 17.00, "entree"),
    (104, "Cod Arracanato", 18.00, "entree"),
    (105, "Shrimp Sampler", 23.00, "entree"),
    (201, "Marinara and Parmesan Bruschetta", 10.00, "appetizer"),
    (202, "Garlic and Cheese Breadsticks", 12.00, "appetizer"),
    (203, "Spinach and Cheddar Rigatoni Bites", 13.00, "appetizer"),
    (204, "Chips and Italian-style Salsa", 10.00, "appetizer"),
    (205, "Calamari Fritto Misto", 15.00, "appetizer"),
    (301, "Ribollita", 10.00, "side"),
    (302, "Mac 'n' Cheese", 11.00, "side"),
    (303, "Garlic Bread", 10.50, "side"),
    (304, "Parmesan Risotto", 12.00, "side"),
    (305, "House Salad", 9.00, "side"),
    (401, "Tiramisu", 13.00, "dessert"),
    (402, "Icecream Sundae", 11.00, "dessert"),
    (403, "Pizzettes", 15.00, "dessert"),
    (404, "Italian Plum and Almond Cake", 11.00, "dessert"),
    (405, "White Peach Tart", 10.50, "dessert");

-- Table Table
INSERT INTO _table VALUES
    (1, 'booth', 2),
    (2, 'booth', 4),
    (3, 'booth', 6),
    (4, 'booth', 4),
    (5, 'booth', 6),
    (6, 'highTop', 2),
    (7, 'highTop', 2),
    (8, 'highTop', 4),
    (9, 'highTop', 4),
    (10, 'highTop', 6),
    (11, 'highTop', 6),
    (12, 'highTop', 8),
    (13, 'lowTop', 2),
    (14, 'lowTop', 2),
    (15, 'lowTop', 4),
    (16, 'lowTop', 4),
    (17, 'lowTop', 6),
    (18, 'lowTop', 6),
    (19, 'lowTop', 8),
    (20, 'lowTop', 10),
    (21, 'bar', 1),
    (22, 'bar', 1),
    (23, 'bar', 1),
    (24, 'bar', 1),
    (25, 'bar', 1);

-- Order Table
INSERT INTO _order (EmployeeID, TableNumber, PartySize, OrderDate) VALUES 
    (10001, 1, 2, 20230117),
    (10001, 5, 5, 20230219),
    (10002, 4, 4, 20230420),
    (10002, 3, 6, 20230521),
    (10003, 7, 2, 20230724),
    (10003, 21, 1, 20230822),
    (10004, 5, 5, 20230901),
    (10004, 8, 3, 20231004);

-- Order Item Table
INSERT INTO orderitem VALUES 
    (1, 20001, 101, 'Extra Cheese'),
    (1, 20002, 302, NULL),
    (1, 20003, 401, NULL),
    (1, 20001, 102, NULL),
    (1, 20002, 301, NULL),
    (1, 20003, 402, 'Caramel Fudge, Sprinkles, Cookie Chunks'),
    (2, 20001, 104, NULL),
    (2, 20002, 105, 'Extra Garlic Shrimp'),
    (2, 20003, 103, 'Extra Parmesan'),
    (2, 20001, 101, 'Light on the Cheese'),
    (2, 20004, 102, NULL),
    (2, 20004, 201, NULL),
    (2, 20003, 202, NULL),
    (2, 20002, 203, 'Parmesan on Top'),
    (2, 20001, 204, NULL),
    (2, 20003, 205, NULL);

-- Card Table
INSERT INTO card VALUES
    (1234567890123456, '123', 'Steve Stevenson', '123 SW 10th Street, Topeka, Kansas', 'Visa Debit'),
    (7774667890133476, '777', 'Jim Johnson', '1457 S Evergreen Avenue, Clearwater, Florida', 'Discover Credit'),
    (4204204204204204, '420', 'Herb Homegrown', '420 East Mary Jane Avenue, Denver, Colorado', 'Mastercard Debit'),
    (5274263840112138, 'A003', 'Jim Terley', '4545 Wanamaker Court, Topeka, Kansas', 'Visa Credit'),
    (7310982378018729, '123', 'Steve Stevenson', '1700 College Avenue, Topeka, Kansas', 'Mastercard Credit');

-- Check Table
INSERT INTO _check (OrderID, PaymentMethod, Amount, CardNumber) VALUES 
    (1, 'card', 112.78, 1234567890123456),
    (2, 'card', 170.85, 5274263840112138),
    (3, 'cash', 120.56, NULL),
    (4, 'card', 420.88, 4204204204204204),
    (5, 'card', 199.33, 7774667890133476),
    (6, 'cash', 20.00, NULL),
    (7, 'card', 222.66, 7310982378018729),
    (8, 'cash', 120.22, NULL);



-- LIST ITEMS PROCEDURE --

-- Creation
DELIMITER $$
CREATE PROCEDURE list_items (IN id INT)
BEGIN
    SELECT d.name as 'Dish', e.Name as 'Chef', o.Options
    FROM orderitem o, dish d, employee e
    WHERE o.EmployeeID = e.EmployeeID
        AND o.DishID = d.DishID
        AND o.OrderID = id;
END$$
DELIMITER ;

-- Testing
CALL list_items(1);
CALL list_items(2);



-- LIST CHECK PROCEDURE --

-- Creation
DELIMITER $$
CREATE PROCEDURE list_checks (IN id INT)
BEGIN
    SELECT CheckNumber, Amount as "Total", PaymentMethod, CardNumber
        FROM _check
        WHERE OrderID = id;
END$$
DELIMITER ;

-- Testing
CALL list_checks(1);
CALL list_checks(2);



-- OTHER SAMPLE SELECT STATEMENTS --

-- List Employees
SELECT EmployeeID AS "ID", Name, Role, Salary, Birthdate, HireDate
FROM employee;

-- List Dishes
SELECT DishID AS "ID", Name, Category, Price
FROM Dish;

-- List Tables
SELECT t.TableNumber as "Number", CONCAT(t.Type, " for ", t.Capacity) AS Type
FROM _table t;

-- List Orders
SELECT o.OrderID, o.OrderDate, e.Name AS "host", o.TableNumber, o.PartySize
FROM _order o, employee e
WHERE o.EmployeeID = e.EmployeeID
ORDER BY OrderID;

-- List Cards
SELECT *
FROM card;



-- SAMPLE TABLE CHANGES -- 

-- Update an Employee Salary
UPDATE Employee
    SET Salary = Salary + 1000
    WHERE EmployeeID = 10001;

SELECT *
FROM Employee
WHERE EmployeeID = 10001;



-- Update the name of a dish
UPDATE dish
    SET name = "Steve's Infamous Lasagna"
    WHERE DishID = 101;

SELECT *
FROM dish
WHERE DishID = 101;


-- Remove a card from the database
UPDATE _check
    SET CardNumber = NULL
    WHERE CardNumber = 4204204204204204;
DELETE FROM card
WHERE CardNumber = 4204204204204204;

SELECT * 
FROM _check;

SELECT *
FROM card;



-- END OF FILE -- 