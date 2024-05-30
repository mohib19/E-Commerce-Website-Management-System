create database dborderitems;
use dborderitems;
-- OrderItems Table
CREATE TABLE OrderItems (
    OrderItemID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10, 2) NOT NULL
   
);
-- Insert queries for OrderItems Table
INSERT INTO OrderItems (OrderID, ProductID, Quantity, UnitPrice) VALUES
(1, 1, 1, 699.99),
(1, 2, 1, 19.99),
(2, 3, 1, 19.99),
(3, 4, 6, 9.99),
(4, 2, 1, 1299.99);
