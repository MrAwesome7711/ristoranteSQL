-- Active: 1713892331730@@127.0.0.1@3306@ristorante
use ristorante;

DROP TABLE IF EXISTS _table;

CREATE TABLE _table (
    TableNumber INT NOT NULL,
    Type VARCHAR(100),
    Capacity INT,
    CONSTRAINT table_PK PRIMARY KEY(TableNumber),
    CONSTRAINT type_CHK CHECK(Type IN ('booth', 'highTop', 'lowTop', 'bar'))
);