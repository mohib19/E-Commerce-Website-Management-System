create database dborders;
use dborders;
-- Orders Table
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    OrderDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Status VARCHAR(50) DEFAULT 'Pending',
    TotalAmount DECIMAL(10, 2) NOT NULL,
    ShippingAddress TEXT
);
-- Insert queries for Orders Table
INSERT INTO Orders (UserID, TotalAmount, ShippingAddress) VALUES
(1, 719.98, '123 Elm Street'),
(2, 19.99, '456 Oak Avenue'),
(3, 59.98, '789 Pine Road'),
(4, 1349.98, '321 Maple Lane'),
(5, 49.99, '654 Birch Boulevard');
