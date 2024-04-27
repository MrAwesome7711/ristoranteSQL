-- Active: 1713892331730@@127.0.0.1@3306@ristorante
DELIMITER $$
CREATE TRIGGER chef_check
    BEFORE INSERT ON orderItem
BEGIN
    IF NEW.orderItem.EmployeeID NOT IN (
        SELECT EmployeeID
        FROM employee
        WHERE Role = 'chef'
    )
    THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'That Employee is not a chef';
    END IF;
END$$
delimiter ;
