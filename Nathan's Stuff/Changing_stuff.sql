-- Active: 1713892331730@@127.0.0.1@3306@ristorante

-- Update an Employee Salary --
SELECT *
FROM Employee
WHERE EmployeeID = 10001;

UPDATE Employee
    SET Salary = Salary + 1000
    WHERE EmployeeID = 10001;


-- Update the name of a dish --
SELECT *
FROM dish
WHERE DishID = 101;

UPDATE dish
    SET name = "Steve's Infamous Lasagna"
    WHERE DishID = 101;


-- Remove a card from the database --
SELECT * 
FROM _check;

SELECT *
FROM card;

UPDATE _check
    SET CardNumber = NULL
    WHERE CardNumber = 4204204204204204;

DELETE FROM card
WHERE CardNumber = 4204204204204204;
