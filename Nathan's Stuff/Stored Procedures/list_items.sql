-- Active: 1713892331730@@127.0.0.1@3306@ristorante
USE ristorante;

-- CREATING THE PROCEDURE --
DROP PROCEDURE IF EXISTS list_items;

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



-- TESTING THE PROCEDURE
CALL list_items(1);
CALL list_items(2);