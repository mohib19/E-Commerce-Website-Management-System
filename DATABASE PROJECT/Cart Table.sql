create database dbcart;
use dbcart;
-- Cart Table
CREATE TABLE Cart (
    CartID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- Insert queries for Cart Table
INSERT INTO Cart (UserID) VALUES
(1),
(2),
(3),
(4),
(5);
