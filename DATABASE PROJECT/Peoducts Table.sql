create database dbproducts;
use dbproducts;
-- Products Table
CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Description TEXT,
    Price DECIMAL(10, 2) NOT NULL,
    Stock INT NOT NULL,
    CategoryID INT,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- Insert queries for Products Table
INSERT INTO Products (ProductName, Description, Price, Stock, CategoryID) VALUES
('Smartphone', 'Latest model smartphone', 699.99, 50, 1),
('Laptop', 'High performance laptop', 1299.99, 30, 1),
('Fiction Book', 'Bestselling fiction novel', 19.99, 100, 2),
('T-Shirt', 'Cotton T-Shirt', 9.99, 200, 3),
('Blender', 'Multi-purpose kitchen blender', 49.99, 80, 4);
