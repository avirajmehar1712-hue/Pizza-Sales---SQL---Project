-- pizza_sales_queries.sql
-- Queries for Pizza Sales Analysis

/* =====================
   A. KEY PERFORMANCE INDICATORS (KPIs)
   ===================== */

-- 1. Total Revenue
SELECT SUM(total_price) AS Total_Revenue
FROM pizza_sales;

-- 2. Average Order Value
SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS AVERAGE_ORDER_VALUE
FROM pizza_sales;

-- 3. Total Pizzas Sold
SELECT SUM(quantity) AS TOTAL_PIZZAS_SOLD
FROM pizza_sales;

-- 4. Total Orders Placed
SELECT COUNT(DISTINCT order_id) AS TOTAL_ORDER_PLACED
FROM pizza_sales;

-- 5. Average Pizzas Per Order
SELECT ROUND((SUM(quantity) / COUNT(DISTINCT order_id)), 2) AS AVERAGE_PIZZA_PER_ORDER
FROM pizza_sales;


/* =====================
   B. DAILY TREND FOR TOTAL ORDERS
   ===================== */
SELECT DAYNAME(order_date) AS ORDER_DAY,
       COUNT(DISTINCT order_id) AS TOTAL_ORDERS
FROM pizza_sales
GROUP BY DAYNAME(order_date);


/* =====================
   C. HOURLY TREND FOR TOTAL ORDERS
   ===================== */
SELECT HOUR(order_time) AS ORDER_HOURS,
       COUNT(DISTINCT order_id) AS TOTAL_ORDERS
FROM pizza_sales
GROUP BY HOUR(order_time);


/* =====================
   D. % OF SALES BY PIZZA CATEGORY
   ===================== */
SELECT (SUM(total_price) / (SELECT SUM(total_price) FROM pizza_sales)) * 100 AS PERCENTAGE_OF_TOTAL_SALES,
       pizza_category
FROM pizza_sales
GROUP BY pizza_category;


/* =====================
   E. % OF SALES BY PIZZA SIZE
   ===================== */
SELECT (SUM(total_price) / (SELECT SUM(total_price) FROM pizza_sales)) * 100 AS PERCENTAGE_OF_TOTAL_SALES,
       pizza_size
FROM pizza_sales
GROUP BY pizza_size;


/* =====================
   F. TOTAL PIZZAS SOLD BY PIZZA CATEGORY
   ===================== */
SELECT SUM(quantity) AS TOTAL_PIZZA_SOLD,
       pizza_category
FROM pizza_sales
GROUP BY pizza_category
ORDER BY SUM(quantity);


/* =====================
   G. TOP 5 BEST-SELLING PIZZAS
   ===================== */
SELECT SUM(quantity) AS TOTAL_PIZZAS_SOLD,
       pizza_name
FROM pizza_sales
GROUP BY pizza_name
ORDER BY TOTAL_PIZZAS_SOLD DESC
LIMIT 5;


/* =====================
   H. BOTTOM 5 WORST-SELLING PIZZAS
   ===================== */
SELECT SUM(quantity) AS TOTAL_PIZZAS_SOLD,
       pizza_name
FROM pizza_sales
GROUP BY pizza_name
ORDER BY TOTAL_PIZZAS_SOLD
LIMIT 5;
