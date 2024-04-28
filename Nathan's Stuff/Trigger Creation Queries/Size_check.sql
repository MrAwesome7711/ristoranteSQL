-- Active: 1713892331730@@127.0.0.1@3306@ristorante
USE ristorante;

DROP TRIGGER IF EXISTS size_check;

DELIMITER $$
CREATE TRIGGER size_check
    BEFORE INSERT 
    ON _order
    FOR EACH ROW
BEGIN
    IF NEW.PartySize > (
        SELECT Capacity
        FROM _table
        WHERE _table.TableNumber = NEW.TableNumber
    )
    THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'That table is too small';
    END IF;
END$$
delimiter ;
