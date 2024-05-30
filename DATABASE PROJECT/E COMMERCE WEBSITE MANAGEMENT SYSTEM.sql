create database ecommercewebmanagementsystem;
use ecommercewebmanagementsystem;
-- Users Table
CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50) NOT NULL UNIQUE,
    PasswordHash VARCHAR(255) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    FullName VARCHAR(100),
    Address TEXT,
    PhoneNumber VARCHAR(20),
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert queries for Users Table
INSERT INTO Users (Username, PasswordHash, Email, FullName, Address, PhoneNumber) VALUES
('john_doe', 'hashed_password_1', 'john@example.com', 'John Doe', '123 Elm Street', '123-456-7890'),
('jane_smith', 'hashed_password_2', 'jane@example.com', 'Jane Smith', '456 Oak Avenue', '987-654-3210'),
('alice_jones', 'hashed_password_3', 'alice@example.com', 'Alice Jones', '789 Pine Road', '555-123-4567'),
('bob_brown', 'hashed_password_4', 'bob@example.com', 'Bob Brown', '321 Maple Lane', '444-567-8901'),
('charlie_white', 'hashed_password_5', 'charlie@example.com', 'Charlie White', '654 Birch Boulevard', '333-789-0123');

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
SELECT 
    *
FROM
    users
        INNER JOIN
    Products ON Users.Userid = Products.ProductID;

-- Insert queries for Products Table
INSERT INTO Products (ProductName, Description, Price, Stock, CategoryID) VALUES
('Smartphone', 'Latest model smartphone', 699.99, 50, 1),
('Laptop', 'High performance laptop', 1299.99, 30, 1),
('Fiction Book', 'Bestselling fiction novel', 19.99, 100, 2),
('T-Shirt', 'Cotton T-Shirt', 9.99, 200, 3),
('Blender', 'Multi-purpose kitchen blender', 49.99, 80, 4);


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


-- Orders Table
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    OrderDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Status VARCHAR(50) DEFAULT 'Pending',
    TotalAmount DECIMAL(10, 2) NOT NULL,
    ShippingAddress TEXT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
alter table orders
modify column Status varchar(20);
select * from Categories left join Orders on Categories.CategoryID=Orders.OrderID union select * from Categories right join Orders on Categories.CategoryID=Orders.OrderID;

-- Insert queries for Orders Table
INSERT INTO Orders (UserID, TotalAmount, ShippingAddress) VALUES
(1, 719.98, '123 Elm Street'),
(2, 19.99, '456 Oak Avenue'),
(3, 59.98, '789 Pine Road'),
(4, 1349.98, '321 Maple Lane'),
(5, 49.99, '654 Birch Boulevard');

-- OrderItems Table
CREATE TABLE OrderItems (
    OrderItemID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
-- Insert queries for OrderItems Table
INSERT INTO OrderItems (OrderID, ProductID, Quantity, UnitPrice) VALUES
(1, 1, 1, 699.99),
(1, 2, 1, 19.99),
(2, 3, 1, 19.99),
(3, 4, 6, 9.99),
(4, 2, 1, 1299.99);

-- Payments Table
CREATE TABLE Payments (
    PaymentID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    PaymentDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Amount DECIMAL(10, 2) NOT NULL,
    PaymentMethod VARCHAR(50),
    Status VARCHAR(50) DEFAULT 'Completed',
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);
-- Insert queries for Payments Table
INSERT INTO Payments (OrderID, Amount, PaymentMethod) VALUES
(1, 719.98, 'Credit Card'),
(2, 19.99, 'PayPal'),
(3, 59.98, 'Debit Card'),
(4, 1349.98, 'Credit Card'),
(5, 49.99, 'Credit Card');


-- Reviews Table
CREATE TABLE Reviews (
    ReviewID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID INT,
    UserID INT,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    Comment TEXT,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
select* from Payments as P left join Reviews as R on P.OrderID=R.ReviewID;

-- Insert queries for Reviews Table
INSERT INTO Reviews (ProductID, UserID, Rating, Comment) VALUES
(1, 1, 5, 'Excellent smartphone!'),
(2, 2, 4, 'Great laptop, but a bit pricey.'),
(3, 3, 5, 'Loved this book!'),
(4, 4, 3, 'T-shirt is okay for the price.'),
(5, 5, 4, 'Good quality blender.');
-- Cart Table
CREATE TABLE Cart (
    CartID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
-- Insert queries for Cart Table
INSERT INTO Cart (UserID) VALUES
(1),
(2),
(3),
(4),
(5);

-- CartItems Table
CREATE TABLE CartItems (
    CartItemID INT AUTO_INCREMENT PRIMARY KEY,
    CartID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    FOREIGN KEY (CartID) REFERENCES Cart(CartID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
-- Insert queries for CartItems Table
INSERT INTO CartItems (CartID, ProductID, Quantity) VALUES
(1, 1, 1),
(2, 3, 2),
(3, 5, 1),
(4, 2, 1),
(5, 4, 3);

-- Addresses Table
CREATE TABLE Addresses (
    AddressID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    AddressLine1 VARCHAR(255) NOT NULL,
    AddressLine2 VARCHAR(255),
    City VARCHAR(100) NOT NULL,
    State VARCHAR(100) NOT NULL,
    ZipCode VARCHAR(20) NOT NULL,
    Country VARCHAR(100) NOT NULL,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
select * from CartItems right join Addresses on CartItems.CartItemID = Addresses.AddressID;
-- Insert queries for Addresses Table
INSERT INTO Addresses (UserID, AddressLine1, AddressLine2, City, State, ZipCode, Country) VALUES
(1, '123 Elm Street', NULL, 'Metropolis', 'NY', '10001', 'USA'),
(2, '456 Oak Avenue', 'Apt 2', 'Gotham', 'NJ', '07001', 'USA'),
(3, '789 Pine Road', NULL, 'Star City', 'CA', '90001', 'USA'),
(4, '321 Maple Lane', 'Suite 5', 'Central City', 'TX', '73301', 'USA'),
(5, '654 Birch Boulevard', NULL, 'Coast City', 'FL', '33101', 'USA');
