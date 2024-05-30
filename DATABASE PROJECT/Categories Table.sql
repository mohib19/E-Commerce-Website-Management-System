create database dbcategories;
use dbcategories;
-- Categories Table
CREATE TABLE Categories (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(50) NOT NULL UNIQUE,
    Description TEXT,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- Insert queries for Categories Table
INSERT INTO Categories (CategoryName, Description) VALUES
('Electronics', 'Devices and gadgets'),
('Books', 'Various genres of books'),
('Clothing', 'Men and Women clothing'),
('Home & Kitchen', 'Home appliances and kitchenware'),
('Sports', 'Sporting goods and equipment');
