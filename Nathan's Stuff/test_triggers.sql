-- Active: 1713892331730@@127.0.0.1@3306@ristorante
USE ristorante;

-- TEST chef_check TRIGGER --
-- Here we attempt to input a host as the chef for an orderitem
INSERT INTO orderitem VALUES (2, 10003, 205, NULL);


-- TEST host_check TRIGGER --
-- Here we attempt to input a chef as the host for an order
INSERT INTO _order (EmployeeID, TableNumber, PartySize, OrderDate) 
    VALUES (20001, 1, 2, 20230117);

-- TEST size_check TRIGGER --
-- Here we attempt to seat an order to a table that is too small for the party size
INSERT INTO _order (EmployeeID, TableNumber, PartySize, OrderDate) 
    VALUES (10001, 8, 5, 20230117);