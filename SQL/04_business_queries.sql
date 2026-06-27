-- ==========================================================
-- Supply Chain Control Tower
-- Business KPI & Executive Analytics Queries
-- ==========================================================

USE supply_chain_control_tower;

-- ==========================================================
-- KPI 1: Executive Performance Summary
-- Purpose:
-- Provide a high-level overview of sales, profit,
-- customer base and order volume.
-- ==========================================================

SELECT
    ROUND(SUM(sales),2) AS total_sales,
    ROUND(SUM(order_profit_per_order),2) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders,
    COUNT(DISTINCT customer_id) AS total_customers
FROM fact_orders;

-- ==========================================================
-- KPI 2: Annual Revenue Trend
-- Purpose:
-- Analyze revenue performance across years.
-- ==========================================================

SELECT
    order_year,
    ROUND(SUM(sales),2) AS total_sales
FROM fact_orders
GROUP BY order_year
ORDER BY order_year;

-- ==========================================================
-- KPI 3: Monthly Revenue Performance
-- Purpose:
-- Identify strongest and weakest sales months.
-- ==========================================================

SELECT
    order_month_name,
    ROUND(SUM(sales),2) AS total_sales
FROM fact_orders
GROUP BY order_month_name
ORDER BY total_sales DESC;

-- ==========================================================
-- KPI 4: Quarterly Revenue & Profit Analysis
-- Purpose:
-- Compare business performance by quarter.
-- ==========================================================

SELECT
    order_quarter,
    ROUND(SUM(sales),2) AS revenue,
    ROUND(SUM(order_profit_per_order),2) AS profit
FROM fact_orders
GROUP BY order_quarter
ORDER BY order_quarter;

-- ==========================================================
-- KPI 5: Top 10 Products by Revenue
-- Purpose:
-- Identify highest revenue generating products.
-- ==========================================================

SELECT
    p.product_name,
    ROUND(SUM(f.sales),2) AS revenue
FROM fact_orders f
JOIN dim_product p
ON f.product_card_id = p.product_card_id
GROUP BY p.product_name
ORDER BY revenue DESC
LIMIT 10;

-- ==========================================================
-- KPI 6: Top 10 Products by Profit
-- Purpose:
-- Identify most profitable products.
-- ==========================================================

SELECT
    p.product_name,
    ROUND(SUM(f.order_profit_per_order),2) AS profit
FROM fact_orders f
JOIN dim_product p
ON f.product_card_id = p.product_card_id
GROUP BY p.product_name
ORDER BY profit DESC
LIMIT 10;

-- ==========================================================
-- KPI 7: Bottom 10 Products by Profit
-- Purpose:
-- Identify products causing profitability issues.
-- ==========================================================

SELECT
    p.product_name,
    ROUND(SUM(f.order_profit_per_order),2) AS profit
FROM fact_orders f
JOIN dim_product p
ON f.product_card_id = p.product_card_id
GROUP BY p.product_name
ORDER BY profit ASC
LIMIT 10;

-- ==========================================================
-- KPI 8: Revenue by Customer Segment
-- Purpose:
-- Evaluate contribution of customer groups.
-- ==========================================================

SELECT
    c.customer_segment,
    ROUND(SUM(f.sales),2) AS revenue
FROM fact_orders f
JOIN dim_customer c
ON f.customer_id = c.customer_id
GROUP BY c.customer_segment
ORDER BY revenue DESC;

-- ==========================================================
-- KPI 9: Revenue by Market
-- Purpose:
-- Compare performance across global markets.
-- ==========================================================

SELECT
    market,
    ROUND(SUM(sales),2) AS revenue
FROM featured_supply_chain_ascii
GROUP BY market
ORDER BY revenue DESC;

-- ==========================================================
-- KPI 10: Revenue by Region
-- Purpose:
-- Identify strongest performing regions.
-- ==========================================================

SELECT
    order_region,
    ROUND(SUM(sales),2) AS revenue
FROM featured_supply_chain_ascii
GROUP BY order_region
ORDER BY revenue DESC;

-- ==========================================================
-- KPI 11: Delivery Performance Distribution
-- Purpose:
-- Measure order fulfillment effectiveness.
-- ==========================================================

SELECT
    delivery_performance,
    COUNT(*) AS orders
FROM featured_supply_chain_ascii
GROUP BY delivery_performance;

-- ==========================================================
-- KPI 12: Average Delay by Shipping Mode
-- Purpose:
-- Evaluate logistics performance.
-- ==========================================================

SELECT
    shipping_mode,
    ROUND(AVG(shipping_delay_days),2) AS avg_delay
FROM featured_supply_chain_ascii
GROUP BY shipping_mode
ORDER BY avg_delay DESC;

-- ==========================================================
-- KPI 13: Shipment Risk Distribution
-- Purpose:
-- Assess operational shipping risk.
-- ==========================================================

SELECT
    shipment_risk_level,
    COUNT(*) AS orders
FROM fact_orders
GROUP BY shipment_risk_level;

-- ==========================================================
-- KPI 14: Late Delivery Risk Analysis
-- Purpose:
-- Understand risk exposure.
-- ==========================================================

SELECT
    late_delivery_risk,
    COUNT(*) AS orders
FROM fact_orders
GROUP BY late_delivery_risk;

-- ==========================================================
-- KPI 15: Profitability Classification
-- Purpose:
-- Analyze order profitability distribution.
-- ==========================================================

SELECT
    profit_category,
    COUNT(*) AS orders,
    ROUND(SUM(order_profit_per_order),2) AS profit
FROM fact_orders
GROUP BY profit_category;

-- ==========================================================
-- KPI 16: Discount Impact on Profitability
-- Purpose:
-- Determine whether aggressive discounting
-- impacts profits.
-- ==========================================================

SELECT
    high_discount_flag,
    ROUND(AVG(order_profit_per_order),2) AS avg_profit
FROM fact_orders
GROUP BY high_discount_flag;

-- ==========================================================
-- KPI 17: High Value Order Analysis
-- Purpose:
-- Measure contribution of premium orders.
-- ==========================================================

SELECT
    high_value_order_flag,
    COUNT(*) AS orders,
    ROUND(SUM(sales),2) AS revenue
FROM fact_orders
GROUP BY high_value_order_flag;

-- ==========================================================
-- KPI 18: Day-of-Week Revenue Analysis
-- Purpose:
-- Identify strongest sales days.
-- ==========================================================

SELECT
    order_day_of_week,
    ROUND(SUM(sales),2) AS revenue
FROM fact_orders
GROUP BY order_day_of_week
ORDER BY revenue DESC;

SELECT * FROM fact_orders;
SELECT * FROM dim_customer;
SELECT * FROM dim_product;
SELECT * FROM dim_geography;
SELECT * FROM dim_date;