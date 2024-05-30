create database dbpayments;
use dbpayments;
-- Payments Table
CREATE TABLE Payments (
    PaymentID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    PaymentDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Amount DECIMAL(10, 2) NOT NULL,
    PaymentMethod VARCHAR(50),
    Status VARCHAR(50) DEFAULT 'Completed'
);
-- Insert queries for Payments Table
INSERT INTO Payments (OrderID, Amount, PaymentMethod) VALUES
(1, 719.98, 'Credit Card'),
(2, 19.99, 'PayPal'),
(3, 59.98, 'Debit Card'),
(4, 1349.98, 'Credit Card'),
(5, 49.99, 'Credit Card');
