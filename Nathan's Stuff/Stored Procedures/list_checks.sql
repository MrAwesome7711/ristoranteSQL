USE ristorante;

-- CREATING THE PROCEDURE --
DROP PROCEDURE IF EXISTS list_checks;

DELIMITER $$

CREATE PROCEDURE list_checks (IN id INT)
BEGIN
    SELECT CheckNumber, Amount as "Total", PaymentMethod, CardNumber
        FROM _check
        WHERE OrderID = id;
END$$

DELIMITER ;



-- TESTING THE PROCEDURE
CALL list_checks(1);
CALL list_checks(2);