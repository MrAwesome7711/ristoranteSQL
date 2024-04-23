-- Active: 1713892331730@@127.0.0.1@3306@ristorante
use ristorante;

DROP TABLE IF EXISTS orderItem;

CREATE TABLE orderItem (
    OrderID INT NOT NULL,
    EmployeeID INT NOT NULL,
    DishID INT NOT NULL,
    Options VARCHAR(255),
    CONSTRAINT table_PKs PRIMARY KEY(OrderID, EmployeeID, DishID),
    CONSTRAINT Order_FK FOREIGN KEY(OrderID)
        REFERENCES _order(OrderID),
    CONSTRAINT Emp_FK FOREIGN KEY(EmployeeID)
        REFERENCES employee(EmployeeID),
    CONSTRAINT Order_FK FOREIGN KEY(DishID)
        REFERENCES dish(DishID)
;)
