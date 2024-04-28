-- Active: 1713892331730@@127.0.0.1@3306@ristorante
-- Active: 1713892331730@@127.0.0.1@3306@ristorante
USE ristorante;

INSERT INTO employee VALUES
    (10001, 'Gregory Renato', 'host', 60000.00, 19900402, 19700510),
    (10002, 'Jeff Bridges', 'host', 57000.00, 19991114, 19790510),
    (10003, 'Laura Evergy', 'host', 55000.00, 20171212, 20000712),
    (10004, 'Gracie Lawrence', 'host', 50000.00, 20200601, 19990510),
    (20001, 'Frank Ramirez', 'chef', 103000.00, 19851115, 19670118),
    (20002, 'Jim Toller', 'chef', 99000.00, 19931214, 19750317),
    (20003, 'Jose Banero', 'chef', 95000.00, 19991115, 19790720),
    (20004, 'Lena Chevano', 'chef', 93000.00, 20011231, 19990418);

INSERT INTO dish VALUES
    (101, "Steve's Famous Lasagna", 25.00, "entree"),
    (102, "Fettuccine Alfredo", 18.00, "entree"),
    (103, "Pasta Carbonara", 17.00, "entree"),
    (104, "Cod Arracanato", 18.00, "entree"),
    (105, "Shrimp Sampler", 23.00, "entree"),
    (201, "Marinara and Parmesan Bruschetta", 10.00, "appetizer"),
    (202, "Garlic and Cheese Breadsticks", 12.00, "appetizer"),
    (203, "Spinach and Cheddar Rigatoni Bites", 13.00, "appetizer"),
    (204, "Chips and Italian-style Salsa", 10.00, "appetizer"),
    (205, "Calamari Fritto Misto", 15.00, "appetizer"),
    (301, "Ribollita", 10.00, "side"),
    (302, "Mac 'n' Cheese", 11.00, "side"),
    (303, "Garlic Bread", 10.50, "side"),
    (304, "Parmesan Risotto", 12.00, "side"),
    (305, "House Salad", 9.00, "side"),
    (401, "Tiramisu", 13.00, "dessert"),
    (402, "Icecream Sundae", 11.00, "dessert"),
    (403, "Pizzettes", 15.00, "dessert"),
    (404, "Italian Plum and Almond Cake", 11.00, "dessert"),
    (405, "White Peach Tart", 10.50, "dessert");

INSERT INTO _table VALUES
    (1, 'booth', 2),
    (2, 'booth', 4),
    (3, 'booth', 6),
    (4, 'booth', 4),
    (5, 'booth', 6),
    (6, 'highTop', 2),
    (7, 'highTop', 2),
    (8, 'highTop', 4),
    (9, 'highTop', 4),
    (10, 'highTop', 6),
    (11, 'highTop', 6),
    (12, 'highTop', 8),
    (13, 'lowTop', 2),
    (14, 'lowTop', 2),
    (15, 'lowTop', 4),
    (16, 'lowTop', 4),
    (17, 'lowTop', 6),
    (18, 'lowTop', 6),
    (19, 'lowTop', 8),
    (20, 'lowTop', 10),
    (21, 'bar', 1),
    (22, 'bar', 1),
    (23, 'bar', 1),
    (24, 'bar', 1),
    (25, 'bar', 1);

INSERT INTO _order (EmployeeID, TableNumber, PartySize, OrderDate) VALUES 
    (10001, 1, 2, 20230117),
    (10001, 5, 5, 20230219),
    (10002, 4, 4, 20230420),
    (10002, 3, 6, 20230521),
    (10003, 7, 2, 20230724),
    (10003, 21, 1, 20230822),
    (10004, 5, 5, 20230901),
    (10004, 8, 3, 20231004);

INSERT INTO orderitem VALUES 
    (1, 20001, 101, 'Extra Cheese'),
    (1, 20002, 302, NULL),
    (1, 20003, 401, NULL),
    (1, 20001, 102, NULL),
    (1, 20002, 301, NULL),
    (1, 20003, 402, 'Caramel Fudge, Sprinkles, Cookie Chunks'),
    (2, 20001, 104, NULL),
    (2, 20002, 105, 'Extra Garlic Shrimp'),
    (2, 20003, 103, 'Extra Parmesan'),
    (2, 20001, 101, 'Light on the Cheese'),
    (2, 20004, 102, NULL),
    (2, 20004, 201, NULL),
    (2, 20003, 202, NULL),
    (2, 20002, 203, 'Parmesan on Top'),
    (2, 20001, 204, NULL),
    (2, 20003, 205, NULL);

INSERT INTO card VALUES
    (1234567890123456, '123', 'Steve Stevenson', '123 SW 10th Street, Topeka, Kansas', 'Visa Debit'),
    (7774667890133476, '777', 'Jim Johnson', '1457 S Evergreen Avenue, Clearwater, Florida', 'Discover Credit'),
    (4204204204204204, '420', 'Herb Homegrown', '420 East Mary Jane Avenue, Denver, Colorado', 'Mastercard Debit'),
    (5274263840112138, 'A003', 'Jim Terley', '4545 Wanamaker Court, Topeka, Kansas', 'Visa Credit'),
    (7310982378018729, '123', 'Steve Stevenson', '1700 College Avenue, Topeka, Kansas', 'Mastercard Credit');

INSERT INTO _check (OrderID, PaymentMethod, Amount, CardNumber) VALUES 
    (1, 'card', 112.78, 1234567890123456),
    (2, 'card', 170.85, 5274263840112138),
    (3, 'cash', 120.56, NULL),
    (4, 'card', 420.88, 4204204204204204),
    (5, 'card', 199.33, 7774667890133476),
    (6, 'cash', 20.00, NULL),
    (7, 'card', 222.66, 7310982378018729),
    (8, 'cash', 120.22, NULL);

