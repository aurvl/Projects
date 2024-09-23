-- Open MySQL and run the following code
-- Not execute if you have already create the DB
-- CREATE DATABASE fraud_db;
USE fraud_db;

CREATE TABLE transactions(
	transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100),
    gender VARCHAR(25),
    country VARCHAR(50),
    state VARCHAR(50),
    city VARCHAR(50),
    category VARCHAR(100),
    amount INT,
    fraud_status BOOLEAN,
    likes_money INT,
    risk_choice VARCHAR(10),	
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

SELECT * FROM transactions;
