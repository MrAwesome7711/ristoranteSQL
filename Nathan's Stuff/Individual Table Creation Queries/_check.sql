-- Active: 1713892331730@@127.0.0.1@3306@ristorante
use ristorante;

DROP TABLE IF EXISTS _check;

CREATE TABLE _check (
    CheckNumber INT NOT NULL AUTO_INCREMENT,
    OrderID INT NOT NULL,
    PaymentMethod CHAR(4) NOT NULL,
    Amount DECIMAL NOT NULL,
    CardNumber BIGINT(16) NULL,
    CONSTRAINT check_PK PRIMARY KEY(CheckNumber),
    CONSTRAINT orderCheck_FK FOREIGN KEY(OrderID)
        REFERENCES _order(OrderID),
    CONSTRAINT method_CHK CHECK(PaymentMethod IN ('cash', 'card'))
);