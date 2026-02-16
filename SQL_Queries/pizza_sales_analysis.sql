/* =========================================
   Pizza Sales Analysis - SQL Queries
   Database: SQL Server
========================================= */

-------------------------------------------
-- KPI 1: Total Revenue
-------------------------------------------
SELECT SUM(total_price) AS total_revenue
FROM pizza_sales;


-------------------------------------------
-- KPI 2: Average Order Value
-------------------------------------------
SELECT 
    SUM(total_price) / COUNT(DISTINCT order_id) AS avg_order_value
FROM pizza_sales;


-------------------------------------------
-- KPI 3: Total Pizzas Sold
-------------------------------------------
SELECT SUM(quantity) AS total_pizza_sold
FROM pizza_sales;


-------------------------------------------
-- KPI 4: Total Orders
-------------------------------------------
SELECT COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales;


-------------------------------------------
-- KPI 5: Average Pizzas Per Order
-------------------------------------------
SELECT 
    CAST(SUM(quantity) AS DECIMAL(10,2)) /
    CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) 
    AS avg_pizza_per_order
FROM pizza_sales;


-------------------------------------------
-- Daily Order Trend
-------------------------------------------
SELECT 
    DATENAME(WEEKDAY, order_date) AS day_name,
    COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY DATENAME(WEEKDAY, order_date)
ORDER BY total_orders DESC;


-------------------------------------------
-- Sales by Pizza Category
-------------------------------------------
SELECT 
    pizza_category,
    SUM(total_price) AS total_amount,
    CAST(SUM(total_price) * 100.0 / 
        (SELECT SUM(total_price) FROM pizza_sales) 
        AS DECIMAL(10,2)) AS percentage_contribution
FROM pizza_sales
GROUP BY pizza_category;


-------------------------------------------
-- Sales by Pizza Category (February Only)
-------------------------------------------
SELECT 
    pizza_category,
    SUM(total_price) AS total_amount,
    CAST(SUM(total_price) * 100.0 / 
        (SELECT SUM(total_price) FROM pizza_sales) 
        AS DECIMAL(10,2)) AS percentage_contribution
FROM pizza_sales
WHERE MONTH(order_date) = 2
GROUP BY pizza_category;


-------------------------------------------
-- Sales by Pizza Size
-------------------------------------------
SELECT 
    pizza_size,
    SUM(total_price) AS total_amount,
    CAST(SUM(total_price) * 100.0 / 
        (SELECT SUM(total_price) FROM pizza_sales) 
        AS DECIMAL(10,2)) AS percentage_contribution
FROM pizza_sales
GROUP BY pizza_size;


-------------------------------------------
-- Top 5 Best Selling Pizzas (By Revenue)
-------------------------------------------
SELECT TOP 5
    pizza_name,
    CAST(SUM(total_price) AS DECIMAL(10,2)) AS total_revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_revenue DESC;


-------------------------------------------
-- Bottom 5 Pizzas (By Revenue)
-------------------------------------------
SELECT TOP 5
    pizza_name,
    CAST(SUM(total_price) AS DECIMAL(10,2)) AS total_revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_revenue ASC;


