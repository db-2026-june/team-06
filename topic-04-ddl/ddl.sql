-- ================================================================
-- SQL DDL TEMPLATE (TOPIC 04)
-- ================================================================
-- WHAT SHOULD BE ADDED HERE:
-- 1) Full PostgreSQL DDL for your finalized schema.
-- 2) CREATE TABLE statements for all entities from your ER diagram.
-- 3) Primary keys, foreign keys, NOT NULL, UNIQUE, CHECK constraints.
-- 4) Indexes for important search/join columns.
-- 5) Clean structure and comments (group by tables/constraints/indexes).
--
-- RECOMMENDED ORDER:
-- 1) Tables
-- 2) Constraints (if not inline)
-- 3) Indexes
--
-- TEAM NOTE:
-- Add short attribution comments for who implemented which part.
-- Example:
-- [Name] - users, roles, permissions tables
-- [Name] - orders, payments, invoices tables
--
-- IMPORTANT:
-- The script must run in PostgreSQL and produce a working schema that
-- matches your approved ER diagram and conceptual schema.
-- Submit this as one SQL file.
-- ================================================================
-- Add your DDL below this line
CREATE SCHEMA IF NOT EXISTS restaurant_management;
-- adding this extension to specify geo location coordinates to the location table entities
CREATE EXTENSION IF NOT EXISTS postgis;
CREATE TABLE IF NOT EXISTS restaurant_management.locations (
    location_id SERIAL PRIMARY KEY,
    name VARCHAR(120) NOT NULL,
    address VARCHAR(255) NOT NULL,
    city VARCHAR(100) NOT NULL,
    email VARCHAR(120) UNIQUE NOT NULL,
    phone VARCHAR(25) NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW() NOT NULL,
    coords GEOMETRY(Point, 4326) NOT NULL
);
-- TODO add the restaurant_management.staff table before the restaurant_management.shifts
CREATE TABLE IF NOT EXISTS restaurant_management.shifts (
    location_id INT REFERENCES restaurant_management.locations(location_id),
    staff_id INT REFERENCES restaurant_management.staffs(staff_id),
    start_shift TIMESTAMPTZ NOT NULL,
    end_shift TIMESTAMPTZ NOT NULL,
    PRIMARY KEY (location_id, staff_id, start_shift, end_shift)
);
CREATE TABLE IF NOT EXISTS restaurant_management.suppliers (
    supplier_id SERIAL PRIMARY KEY,
    name VARCHAR(120) NOT NULL,
    contact_name VARCHAR(120) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    phone VARCHAR(25) NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW() NOT NULL
);
CREATE TABLE IF NOT EXISTS restaurant_management.ingredients (
    ingredient_id SERIAL PRIMARY KEY,
    supplier_id INT REFERENCES restaurant_management.suppliers(supplier_id),
    name VARCHAR(120) NOT NULL,
    unit_measure VARCHAR(80) NOT NULL,
    unit_cost NUMERIC(8, 2) NOT NULL,
    quantity_available NUMERIC(8, 2) DEFAULT 0 NOT NULL
);
-- TODO add the restaurant_management.menu_items table before the restaurant_management.menu_item_ingredients
CREATE TABLE IF NOT EXISTS restaurant_management.menu_item_ingredients (
    ingredient_id INT REFERENCES restaurant_management.ingredients(ingredient_id),
    -- TODO add menu_item table
    menu_item_id INT REFERENCES restaurant_management.menu_items(menu_item_id),
    quantity_needed NUMERIC(8, 2) NOT NULL,
    -- Specifies composite primary key
    PRIMARY KEY (ingredient_id, menu_item_id)
);
CREATE TABLE IF NOT EXISTS restaurant_management.customers (
    customer_id SERIAL PRIMARY KEY,
    email VARCHAR(150) UNIQUE NOT NULL,
    first_name VARCHAR(120) NOT NULL,
    last_name VARCHAR(120) NOT NULL,
    phone VARCHAR(25) NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW() NOT NULL
);
CREATE TABLE IF NOT EXISTS restaurant_management.customer_feedbacks (
    feedback_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES restaurant_management.customers(customer_id),
    location_id INT REFERENCES restaurant_management.locations(location_id),
    description VARCHAR(500) NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW() NOT NULL,
    rating INT CHECK (
        rating BETWEEN 1 AND 5
    ) NOT NULL
);