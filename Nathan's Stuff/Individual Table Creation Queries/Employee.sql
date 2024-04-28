-- Active: 1713892331730@@127.0.0.1@3306@ristorante
use ristorante;

drop table if exists employee;
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
