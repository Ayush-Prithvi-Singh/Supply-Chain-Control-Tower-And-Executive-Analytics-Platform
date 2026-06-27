USE supply_chain_control_tower;

-- ==========================================================
-- FACT TABLE BUILD
-- ==========================================================
-- ==========================================================
-- Fact Orders Table
-- Purpose:
-- Central transaction table for all sales,
-- profitability, logistics and operational KPIs.
-- ==========================================================

CREATE TABLE fact_orders AS
SELECT

    -- ==========================
    -- Primary Business Keys
    -- ==========================
    order_id,
    order_item_id,
    customer_id,
    product_card_id,

    -- ==========================
    -- Date Attributes
    -- ==========================
    order_date_dateorders,
    shipping_date_dateorders,
    order_year,
    order_month,
    order_month_name,
    order_quarter,
    order_day_of_week,

    -- ==========================
    -- Sales Metrics
    -- ==========================
    sales,
    order_item_total,
    sales_per_customer,

    -- ==========================
    -- Profitability Metrics
    -- ==========================
    benefit_per_order,
    order_profit_per_order,
    order_item_profit_ratio,

    -- ==========================
    -- Discount Metrics
    -- ==========================
    order_item_discount,
    order_item_discount_rate,

    -- ==========================
    -- Product Metrics
    -- ==========================
    order_item_product_price,
    product_price,
    order_item_quantity,

    -- ==========================
    -- Logistics Metrics
    -- ==========================
    days_for_shipping_real,
    days_for_shipment_scheduled,
    shipping_delay_days,
    shipping_mode,

    -- ==========================
    -- Operational Status
    -- ==========================
    delivery_status,
    delivery_performance,
    order_status,

    -- ==========================
    -- Risk Indicators
    -- ==========================
    late_delivery_risk,
    delayed_flag,
    on_time_flag,
    severe_delay_flag,

    -- ==========================
    -- Business Flags
    -- ==========================
    high_discount_flag,
    high_value_order_flag,
    loss_order_flag,

    -- ==========================
    -- Business Classifications
    -- ==========================
    profit_category,
    shipment_risk_level,
    sales_band,

    -- ==========================
    -- Geography
    -- ==========================
    market,
    order_region,
    order_country,
    order_state,
    order_city

FROM featured_supply_chain_ascii;