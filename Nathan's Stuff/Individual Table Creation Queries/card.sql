-- Active: 1713892331730@@127.0.0.1@3306@ristorante
use ristorante;

DROP TABLE IF EXISTS card;

CREATE TABLE card (
    CardNumber BIGINT(16) NOT NULL,
    CSC VARCHAR(4) NOT NULL,
    CardholderName VARCHAR(255) NOT NULL,
    BillingAddress VARCHAR(255) NOT NULL,
    CardType VARCHAR(255) NOT NULL,
    CONSTRAINT card_PK PRIMARY KEY(CardNumber)
);
