create database dbcartitems;
use dbcartitems;
-- CartItems Table
CREATE TABLE CartItems (
    CartItemID INT AUTO_INCREMENT PRIMARY KEY,
    CartID INT,
    ProductID INT,
    Quantity INT NOT NULL
);
-- Insert queries for CartItems Table
INSERT INTO CartItems (CartID, ProductID, Quantity) VALUES
(1, 1, 1),
(2, 3, 2),
(3, 5, 1),
(4, 2, 1),
(5, 4, 3);
