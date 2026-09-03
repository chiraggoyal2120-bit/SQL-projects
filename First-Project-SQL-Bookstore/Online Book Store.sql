-- Create Database
CREATE DATABASE OnlineBookstore;

-- Create Tables
DROP TABLE IF EXISTS Books;
CREATE TABLE Books (
    Book_ID INT PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Published_Year INT,
    Price NUMERIC(10, 2),
    Stock INT
);
DROP TABLE IF EXISTS customers;
CREATE TABLE Customers (
    Customer_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    City VARCHAR(50),
    Country VARCHAR(150)
);
DROP TABLE IF EXISTS orders;
CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT REFERENCES Customers(Customer_ID),
    Book_ID INT REFERENCES Books(Book_ID),
    Order_Date DATE,
    Quantity INT,
    Total_Amount NUMERIC(10, 2)
);

SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Orders;


-- Data Imported directly into table without using query

-- Advance Questions : 

-- 1) Retrieve the total number of books sold for each genre:
Select Sum(o.quantity) as total_sold, b.genre
from orders o
JOIN books b ON o.book_id=b.book_id
Group by b.genre;

-- 2) Find the average price of books in the "Fantasy" genre:
Select AVG(price) as Avg_price
From Books
Where genre='Fantasy';

-- 3) List customers who have placed at least 2 orders:
Select COUNT(o.order_id) as order_quantity, o.customer_id, c.name
from orders o
JOIN Customers c on o.customer_id=c.customer_id
Group by o.customer_id, c.name
Having COUNT(o.order_id)>=2

-- 4) Find the most frequently ordered book:
Select Count(o.order_id) as order_count, o.book_id, b.title
From orders o
JOIN books b on b.book_id=o.book_id
Group by o.book_id, b.title
ORDER BY order_count DESC LIMIT 1;

-- 5) Show the top 3 most expensive books of 'Fantasy' Genre :
Select title, genre, price from books
Where genre='Fantasy'
Order by price desc LIMIT 3;

-- 6) Retrieve the total quantity of books sold by each author:
Select Sum(o.quantity) as Total_Sold, b.author
From orders o
JOIN books b on o.book_id=b.book_id
Group by b.author;

-- 7) List the cities where customers who spent over $30 are located:
Select distinct c.city ,o.total_amount
From orders o
JOIN customers c on o.customer_id=c.customer_id
Where o.total_amount>30;

-- 8) Find the customer who spent the most on orders:
Select Sum(o.total_amount) AS Total_Spent, o.customer_id, c.name
from orders o
JOIN customers c on o.customer_id=c.customer_id
Group by o.customer_id, c.name
Order by Sum(o.total_amount) desc LIMIT 1;

--9) Calculate the stock remaining after fulfilling all orders:
SELECT b.book_id, b.title, b.stock, COALESCE(SUM(o.quantity),0) AS Order_quantity,  
	b.stock- COALESCE(SUM(o.quantity),0) AS Remaining_Quantity
	FROM books b
LEFT JOIN orders o ON b.book_id=o.book_id
GROUP BY b.book_id ORDER BY b.book_id;

-- Basic Query

-- 1) Retrieve all books in the "Fiction" genre:
Select * from Books
Where genre='Fiction';

-- 2) Find books published after the year 1950:
Select * from Books
Where published_year> 1950;

-- 3) List all customers from the Canada:
Select * from customers
Where country = 'Canada';

-- 4) Show orders placed in November 2023:
Select * from Orders
Where order_date between '2023-11-01' AND '2023-11-30';

-- 5) Retrieve the total stock of books available:
Select Sum(stock) as Total_stock from books;

-- 6) Find the details of the most expensive book:
Select * from books
Order by price desc
Limit 1;

-- 7) Show all customers who ordered more than 1 quantity of a book:
Select * from orders
Where quantity>1;

-- 8) Retrieve all orders where the total amount exceeds $20:
Select * from orders
Where total_amount>20;

-- 9) List all genres available in the Books table:
Select Distinct genre
from Books;

-- 10) Find the book with the lowest stock:
Select * from books
Order by stock
LIMIT 1;

-- 11) Calculate the total revenue generated from all orders:
Select Sum(total_amount) As total_revenue
from orders;

