-- Active: 1713892331730@@127.0.0.1@3306@ristorante
-- Active: 1713892331730@@127.0.0.1@3306@ristorante
use ristorante;

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

CREATE TABLE dish (
    DishID INT NOT NULL,
    Name VARCHAR(255) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    Category VARCHAR(255) NOT NULL,
    CONSTRAINT dish_PK PRIMARY KEY(DishID),
    CONSTRAINT cat_CHK CHECK(Category IN ('appetizer', 'entree', 'side', 'dessert'))
);

CREATE TABLE _table (
    TableNumber INT NOT NULL,
    Type VARCHAR(100),
    Capacity INT,
    CONSTRAINT table_PK PRIMARY KEY(TableNumber),
    CONSTRAINT type_CHK CHECK(Type IN ('booth', 'highTop', 'lowTop', 'bar'))
);

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

CREATE TABLE card (
    CardNumber INT(16) NOT NULL,
    CSC VARCHAR(4) NOT NULL,
    CardholderName VARCHAR(255) NOT NULL,
    BillingAddress VARCHAR(255) NOT NULL,
    CardType VARCHAR(255) NOT NULL,
    CONSTRAINT card_PK PRIMARY KEY(CardNumber)
);

CREATE TABLE _check (
    CheckNumber INT NOT NULL,
    OrderID INT NOT NULL,
    PaymentMethod CHAR(4) NOT NULL,
    Amount DECIMAL NOT NULL,
    CardNumber INT(16) NULL,
    CONSTRAINT check_PK PRIMARY KEY(CheckNumber),
    CONSTRAINT orderCheck_FK FOREIGN KEY(OrderID)
        REFERENCES _order(OrderID),
    CONSTRAINT method_CHK CHECK(PaymentMethod IN ('cash', 'card'))
);