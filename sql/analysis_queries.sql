-- E-Commerce Product Recommendation & Customer Segmentation
-- MySQL-compatible analysis queries

-- 1. Customer purchase history
SELECT Customer_ID, COUNT(*) AS Orders, SUM(Amount) AS Spending
FROM orders
GROUP BY Customer_ID
ORDER BY Spending DESC;

-- 2. RFM metrics
SELECT
    Customer_ID,
    DATEDIFF('2026-09-08', MAX(Order_Date)) AS Recency,
    COUNT(Order_ID) AS Frequency,
    SUM(Amount) AS Monetary
FROM orders
GROUP BY Customer_ID;

-- 3. Top products
SELECT p.Product, p.Category, SUM(o.Quantity) AS Units_Sold, SUM(o.Amount) AS Revenue
FROM orders o
JOIN products p ON o.Product_ID = p.Product_ID
GROUP BY p.Product_ID, p.Product, p.Category
ORDER BY Revenue DESC
LIMIT 10;

-- 4. Repeat customers
SELECT Customer_ID, COUNT(DISTINCT Order_ID) AS Orders
FROM orders
GROUP BY Customer_ID
HAVING COUNT(DISTINCT Order_ID) > 1
ORDER BY Orders DESC;

-- 5. Category performance
SELECT p.Category, SUM(o.Amount) AS Revenue, AVG(o.Rating) AS Avg_Rating
FROM orders o
JOIN products p ON o.Product_ID = p.Product_ID
GROUP BY p.Category
ORDER BY Revenue DESC;

-- 6. Customer segment performance
SELECT c.Customer_Segment,
       COUNT(DISTINCT c.Customer_ID) AS Customers,
       COUNT(o.Order_ID) AS Orders,
       SUM(o.Amount) AS Revenue
FROM customers c
LEFT JOIN orders o ON c.Customer_ID = o.Customer_ID
GROUP BY c.Customer_Segment
ORDER BY Revenue DESC;

-- 7. Rating analysis
SELECT Rating, COUNT(*) AS Reviews, AVG(Amount) AS Avg_Order_Value
FROM orders
GROUP BY Rating
ORDER BY Rating DESC;

-- 8. Monthly revenue
SELECT DATE_FORMAT(Order_Date,'%Y-%m') AS Month,
       SUM(Amount) AS Revenue
FROM orders
GROUP BY DATE_FORMAT(Order_Date,'%Y-%m')
ORDER BY Month;

-- 9. Product recommendation candidates:
-- products purchased by customers who also purchased another product
SELECT o1.Customer_ID,
       o1.Product_ID AS Purchased_Product,
       o2.Product_ID AS Recommended_Product,
       COUNT(*) AS Co_Purchase_Count
FROM orders o1
JOIN orders o2
  ON o1.Customer_ID = o2.Customer_ID
 AND o1.Product_ID <> o2.Product_ID
GROUP BY o1.Customer_ID, o1.Product_ID, o2.Product_ID
ORDER BY Co_Purchase_Count DESC;

-- 10. Window function: product revenue ranking
WITH product_sales AS (
    SELECT p.Product_ID, p.Product, SUM(o.Amount) AS Revenue
    FROM orders o
    JOIN products p ON o.Product_ID = p.Product_ID
    GROUP BY p.Product_ID, p.Product
)
SELECT Product, Revenue,
       RANK() OVER (ORDER BY Revenue DESC) AS Revenue_Rank
FROM product_sales;
