use ristorante;
DROP TRIGGER IF EXISTS host_check;
DELIMITER $$
CREATE TRIGGER host_check
    BEFORE INSERT 
    ON _order
    FOR EACH ROW
BEGIN
    IF NEW._order.EmployeeID NOT IN (
        SELECT EmployeeID
        FROM employee
        WHERE Role = 'host'
    )
    THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'That Employee is not a host';
    END IF;
END$$
delimiter ;
