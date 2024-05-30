create database dbreviews;
use dbreviews;
-- Reviews Table
CREATE TABLE Reviews (
    ReviewID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID INT,
    UserID INT,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    Comment TEXT,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- Insert queries for Reviews Table
INSERT INTO Reviews (ProductID, UserID, Rating, Comment) VALUES
(1, 1, 5, 'Excellent smartphone!'),
(2, 2, 4, 'Great laptop, but a bit pricey.'),
(3, 3, 5, 'Loved this book!'),
(4, 4, 3, 'T-shirt is okay for the price.'),
(5, 5, 4, 'Good quality blender.');
