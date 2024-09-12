CREATE DATABASE Epicerie;
USE Epicerie;

CREATE TABLE Ventes(
	CustomerID INT,
    Date DATE,
    Product VARCHAR(50),
    Quantity INT,
    Price DECIMAL(4,2),
    Avis VARCHAR(50)
    );

SELECT * FROM Ventes;
