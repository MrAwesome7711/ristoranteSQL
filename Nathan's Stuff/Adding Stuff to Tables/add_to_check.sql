-- Active: 1713892331730@@127.0.0.1@3306@ristorante
USE ristorante;

INSERT INTO _check (OrderID, PaymentMethod, Amount, CardNumber) VALUES 
    (1, 'card', 112.78, 1234567890123456),
    (2, 'card', 170.85, 5274263840112138),
    (3, 'cash', 120.56, NULL),
    (4, 'card', 420.88, 4204204204204204),
    (5, 'card', 199.33, 7774667890133476),
    (6, 'cash', 20.00, NULL),
    (7, 'card', 222.66, 7310982378018729),
    (8, 'cash', 120.22, NULL);