create database dbaddresses;
use dbaddresses;
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
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- Insert queries for Addresses Table
INSERT INTO Addresses (UserID, AddressLine1, AddressLine2, City, State, ZipCode, Country) VALUES
(1, '123 Elm Street', NULL, 'Metropolis', 'NY', '10001', 'USA'),
(2, '456 Oak Avenue', 'Apt 2', 'Gotham', 'NJ', '07001', 'USA'),
(3, '789 Pine Road', NULL, 'Star City', 'CA', '90001', 'USA'),
(4, '321 Maple Lane', 'Suite 5', 'Central City', 'TX', '73301', 'USA'),
(5, '654 Birch Boulevard', NULL, 'Coast City', 'FL', '33101', 'USA');
