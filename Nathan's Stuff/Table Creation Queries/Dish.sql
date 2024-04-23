-- Active: 1713892331730@@127.0.0.1@3306@ristorante
use ristorante;

DROP TABLE IF EXISTS dish;

CREATE TABLE dish (
    DishID INT NOT NULL,
    Name VARCHAR(255) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    Category VARCHAR(255) NOT NULL,
    CONSTRAINT dish_PK PRIMARY KEY(DishID),
    CONSTRAINT cat_CHK CHECK(Category IN ('appetizer', 'entree', 'side', 'dessert'))
);