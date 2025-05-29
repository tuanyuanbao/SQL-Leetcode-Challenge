-- Question 13
-- Suppose that a website contains two tables, 
-- the Customers table and the Orders table. Write a SQL query to find all customers who never order anything.

-- Table: Customers.

-- +----+-------+
-- | Id | Name  |
-- +----+-------+
-- | 1  | Joe   |
-- | 2  | Henry |
-- | 3  | Sam   |
-- | 4  | Max   |
-- +----+-------+
-- Table: Orders.

-- +----+------------+
-- | Id | CustomerId |
-- +----+------------+
-- | 1  | 3          |
-- | 2  | 1          |
-- +----+------------+
-- Using the above tables as example, return the following:

-- +-----------+
-- | Customers |
-- +-----------+
-- | Henry     |
-- | Max       |
-- +-----------+


-- Solution 1: left join
SELECT Name AS Customers
FROM Customers c
LEFT JOIN Orders o ON c.Id = o.CustomerId
WHERE o.CustomerId IS NULL;

-- Solution 2:not exists
SELECT Id, Name
FROM Customers c
WHERE NOT EXISTS (
  SELECT 1 
  FROM Orders o 
  WHERE o.CustomerId = c.Id
);

-- Solution 3: not in(If Orders.CustomerId can contain NULL values— it won’t return any rows, because NULL comparisons are tricky)
SELECT Id, Name
FROM Customers
WHERE Id NOT IN (
  SELECT CustomerId FROM Orders
);
