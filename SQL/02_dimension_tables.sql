USE supply_chain_control_tower;

-- ==========================================
-- Customer Dimension
-- ==========================================

CREATE TABLE dim_customer AS
SELECT DISTINCT
    customer_id,
    customer_segment,
    customer_city,
    customer_state,
    customer_country,
    customer_zipcode
FROM featured_supply_chain_ascii;


-- ==========================================
-- Product Dimension
-- ==========================================

CREATE TABLE dim_product AS
SELECT DISTINCT
    product_card_id,
    product_name,
    product_price,
    category_id,
    category_name,
    department_id,
    department_name
FROM featured_supply_chain_ascii;


-- ==========================================
-- Geography Dimension
-- ==========================================

CREATE TABLE dim_geography AS
SELECT DISTINCT
    market,
    order_region,
    order_country,
    order_state,
    order_city,
    latitude,
    longitude
FROM featured_supply_chain_ascii;


-- ==========================================
-- Date Dimension
-- ==========================================

CREATE TABLE dim_date AS
SELECT DISTINCT
    order_year,
    order_month,
    order_month_name,
    order_quarter,
    order_day_of_week
FROM featured_supply_chain_ascii;

SHOW TABLES;

SELECT COUNT(*) FROM dim_customer;

SELECT COUNT(*) FROM dim_product;

SELECT COUNT(*) FROM dim_geography;

SELECT COUNT(*) FROM dim_date;