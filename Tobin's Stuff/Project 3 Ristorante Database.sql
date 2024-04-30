drop database if exists ristorante;
create database ristorante;
use ristorante;

create table dish (
  dishid int not null,
  dishname varchar(255) not null, 
  price decimal(10, 2) not null, 
  dishcategory varchar(255),
  primary key(dishid)
);

create table employee (
  employeeid int not null,
  empname varchar(255) not null,
  emprole varchar(50) not null,
  salary decimal(10, 2) not null,
  hiredate date not null,
  birthdate date not null,
  primary key(employeeid)
);

create table seating (
  tablenumber int not null,
  tabletype varchar(30) not null,
  primary key(tablenumber)
);

create table order_ (
  orderid int not null, 
  employeeid int not null, 
  tablenumber int not null,
  primary key(orderid),
  foreign key(employeeid) references employee(employeeid), 
  foreign key(tablenumber) references seating(tablenumber)
);

create table order_item (
  orderid int not null, 
  employeeid int not null, 
  dishid int not null,
  dishoptions varchar(100),
  primary key(orderid, employeeid, dishid), 
  foreign key(orderid) references order_(orderid),
  foreign key(employeeid) references employee(employeeid),
  foreign key(dishid) references dish(dishid)
);

create table payment (
  paymentid int not null, 
  paymentamt decimal(10, 2) not null,
  checknumber int not null,
  primary key(paymentid)
);

create table order_check (
  checknumber int not null, 
  orderid int not null, 
  paymentid int not null, 
  primary key(checknumber), 
  foreign key(orderid) references order_(orderid), 
  foreign key(paymentid) references payment(paymentid)
);

INSERT INTO dish (dishid, dishname, price, dishcategory) VALUES
(1, 'Spaghetti Carbonara', 12.99, 'Pasta'),
(2, 'Pepperoni Pizza', 10.99, 'Pizza'),
(3, 'Caesar Salad', 8.99, 'Salad'),
(4, 'Grilled Salmon', 16.99, 'Seafood'),
(5, 'Tiramisu', 6.99, 'Dessert'),
(6, 'Chicken Alfredo', 14.99, 'Pasta'),
(7, 'Caprese Salad', 9.99, 'Salad'),
(8, 'Cheeseburger', 11.99, 'Burger'),
(9, 'Mushroom Risotto', 13.99, 'Risotto'),
(10, 'Lemon Sorbet', 5.99, 'Dessert');

INSERT INTO employee (employeeid, empname, emprole, salary, hiredate, birthdate) VALUES
(1, 'John Smith', 'Host', 2500.00, '2023-01-15', '1997-05-10'),
(2, 'Emily Johnson', 'Chef', 3500.00, '2022-08-20', '1988-11-25'),
(3, 'Michael Williams', 'Chef', 2000.00, '2023-03-10', '1999-09-15'),
(4, 'Jessica Brown', 'Host', 2400.00, '2023-02-05', '2002-07-20'),
(5, 'Daniel Jones', 'Chef', 3800.00, '2022-09-28', '2001-04-30'),
(6, 'Olivia Garcia', 'Host', 2600.00, '2023-04-18', '2000-12-05'),
(7, 'William Martinez', 'Host', 2100.00, '2023-01-05', '1998-03-12'),
(8, 'Sophia Rodriguez', 'Chef', 3600.00, '2022-10-12', '1989-08-20'),
(9, 'David Wilson', 'Host', 2550.00, '2023-05-20', '1993-06-18'),
(10, 'Ava Lopez', 'Chef', 3700.00, '2022-11-08', '1992-10-15');

INSERT INTO seating (tablenumber, tabletype) VALUES
(101, 'Booth'),
(102, 'Table'),
(103, 'Booth'),
(104, 'Table'),
(105, 'Booth'),
(106, 'Table'),
(107, 'Booth'),
(108, 'Table'),
(109, 'Booth'),
(110, 'Table');

INSERT INTO order_ (orderid, employeeid, tablenumber) VALUES
(1, 1, 101),
(2, 2, 102),
(3, 3, 103),
(4, 4, 104),
(5, 5, 105),
(6, 6, 106),
(7, 7, 107),
(8, 8, 108),
(9, 9, 109),
(10, 10, 110);

INSERT INTO order_item (orderid, employeeid, dishid, dishoptions) VALUES
(1, 1, 1, 'Extra Sauce'),
(1, 2, 3, NULL),
(2, 3, 2, NULL),
(2, 4, 8, 'No Onions'),
(3, 5, 4, 'Medium Rare'),
(3, 6, 7, 'No Tomatoes'),
(4, 7, 6, NULL),
(4, 8, 9, 'No Mushrooms'),
(5, 9, 5, NULL),
(5, 10, 10, NULL);

INSERT INTO payment (paymentid, paymentamt, checknumber) VALUES
(1, 50.04, 1001),
(2, 45.49, 1002),
(3, 60.76, 1003),
(4, 35.24, 1004),
(5, 25.47, 1005),
(6, 55.33, 1006),
(7, 40.26, 1007),
(8, 75.78, 1008),
(9, 65.92, 1009),
(10, 30.62, 1010);

INSERT INTO order_check (checknumber, orderid, paymentid) VALUES
(001, 1, 1),
(002, 2, 2),
(003, 3, 3),
(004, 4, 4),
(005, 5, 5),
(006, 6, 6),
(007, 7, 7),
(008, 8, 8),
(009, 9, 9),
(010, 10, 10);

select *
from dish;

select *
from employee;

select *
from seating;

select *
from order_;

select *
from order_item;

select *
from payment;

select *
from order_check;

select *
from dish
order by price;

select *
from employee
where empname = 'Olivia Garcia';

select e.empname as employee_name,
e.emprole as employee_role,
d.dishname as dish_name,
oi.dishoptions
from order_item oi
join employee e on oi.employeeid = e.employeeid
join dish d on oi.dishid = d.dishid;

select *
from dish
where price > 9.99;

select sum(salary) as totalSalary
from employee;

update dish
set dishname = 'Strawberry Cheesecake'
where dishname = 'Tiramisu';

insert into dish
values (11, 'Oreo Cheesecake', 7.99, 'Dessert');

select *
from dish;

update dish
set price = price + 2.00
where price > 10.99;

select *
from dish
where price > 10.99;

alter table order_
  drop foreign key order__ibfk_2;

delete from seating
where tabletype = 'Booth';

select *
from seating
where tabletype = 'Booth';

update order_item
set dishoptions = 'No Veggies'
where dishoptions like 'No%';

select *
from order_item;

drop procedure if exists newDish;

delimiter $$

create procedure newDish(
  in dish_id int,
  in dish_name varchar(255), 
  in dish_price decimal(10, 2),
  in dish_category varchar(255)
)
begin
  insert into dish(dishid, dishname, price, dishcategory)
  values (dish_id, dish_name, dish_price, dish_category);
end $$

delimiter ;

call newDish(12, 'Lasagna', 8.99, 'Pasta');

select *
from dish;
