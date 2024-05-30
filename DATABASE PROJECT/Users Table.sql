create database dbuser;
use dbuser;
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
