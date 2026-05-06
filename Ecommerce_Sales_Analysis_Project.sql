
-- ============================================
-- E-COMMERCE SALES DATA ANALYSIS PROJECT
-- Database: ecommerce_analysis
-- ============================================

-- 1. Create Database
CREATE DATABASE IF NOT EXISTS ecommerce_analysis;
USE ecommerce_analysis;

-- 2. Create Orders Table
CREATE TABLE IF NOT EXISTS orders (
    order_id INT,
    order_date DATE,
    customer_id INT,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    region VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(150),
    sales DECIMAL(10,2),
    quantity INT,
    profit DECIMAL(10,2),
    payment_mode VARCHAR(50)
);

-- ============================================
-- DATA ANALYSIS QUERIES
-- ============================================

-- 1. Total Orders, Sales and Profit
SELECT 
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM orders;

-- 2. Top 5 Revenue Generating Products
SELECT 
    product_name,
    SUM(sales) AS total_sales
FROM orders
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 5;

-- 3. Region Wise Sales Contribution
SELECT 
    region,
    SUM(sales) AS total_sales,
    ROUND((SUM(sales) / (SELECT SUM(sales) FROM orders)) * 100, 2) AS sales_percentage
FROM orders
GROUP BY region
ORDER BY total_sales DESC;

-- 4. Category Wise Performance
SELECT 
    category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM orders
GROUP BY category
ORDER BY total_sales DESC;

-- 5. Payment Mode Analysis
SELECT 
    payment_mode,
    COUNT(order_id) AS total_orders,
    SUM(sales) AS total_sales
FROM orders
GROUP BY payment_mode
ORDER BY total_sales DESC;

-- 6. Monthly Sales Trend
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(sales) AS monthly_sales
FROM orders
GROUP BY month
ORDER BY month;

-- 7. Top 3 States Contributing Highest Revenue
SELECT 
    state,
    SUM(sales) AS total_sales
FROM orders
GROUP BY state
ORDER BY total_sales DESC
LIMIT 3;

-- 8. RFM Analysis

-- Recency
SELECT 
    customer_id,
    DATEDIFF(MAX(order_date), MIN(order_date)) AS recency
FROM orders
GROUP BY customer_id;

-- Frequency
SELECT 
    customer_id,
    COUNT(order_id) AS frequency
FROM orders
GROUP BY customer_id;

-- Monetary
SELECT 
    customer_id,
    SUM(sales) AS monetary_value
FROM orders
GROUP BY customer_id;

-- 9. Profit Margin Percentage
SELECT 
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin_percentage
FROM orders;

-- 10. Loss Making Products
SELECT 
    product_name,
    SUM(profit) AS total_profit
FROM orders
GROUP BY product_name
HAVING total_profit < 0
ORDER BY total_profit;
