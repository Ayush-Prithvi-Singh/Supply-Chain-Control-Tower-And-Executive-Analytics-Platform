-- =====================================================
-- Supply Chain Control Tower & Executive Analytics Platform
-- =====================================================

-- Create Project Database

CREATE DATABASE IF NOT EXISTS supply_chain_control_tower;

USE supply_chain_control_tower;

-- =====================================================
-- Warehouse Architecture
-- =====================================================

-- Source File:
-- featured_supply_chain.csv

-- Staging Layer:
-- stg_supply_chain

-- Dimension Tables:
-- dim_customer
-- dim_product
-- dim_geography
-- dim_date

-- Fact Table:
-- fact_orders

-- Purpose:
-- Executive KPI Reporting
-- Logistics Monitoring
-- Profitability Analysis
-- Revenue Analysis
-- Risk Monitoring

SHOW DATABASES;
SHOW TABLES;
SELECT COUNT(*)
FROM featured_supply_chain_ascii;
DESCRIBE featured_supply_chain_ascii;