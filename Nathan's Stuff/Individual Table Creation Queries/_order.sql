-- Active: 1713892331730@@127.0.0.1@3306@ristorante
use ristorante;

DROP TABLE IF EXISTS _order;

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