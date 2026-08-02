-- ================================================================
-- SQL DML TEMPLATE (TOPIC 09)
-- ================================================================
-- WHAT SHOULD BE ADDED HERE:
-- 1) INSERT scripts for all required tables in your database.
-- 2) At least 10 records per table with meaningful, realistic values.
-- 3) UPDATE / DELETE scripts where they are relevant to business logic.
-- 4) If UPDATE / DELETE are not relevant for a table, add a short note
--    in documentation explaining why.
-- 5) Comments by section so the script is easy to read and run.
--
-- SCRIPT GOALS:
-- - Populate the database with usable test data.
-- - Validate constraints through realistic DML scenarios.
-- - Support the core functionality of your application.
--
-- RECOMMENDED ORDER:
-- 1) Reference data (lookups/dictionaries)
-- 2) Core entities
-- 3) Transactional data
-- 4) Optional UPDATE / DELETE checks
--
-- IMPORTANT:
-- - Use anonymized or privacy-safe sample data where possible.
-- - The script must execute in PostgreSQL.
-- - Submit this as one SQL file.
-- ================================================================
-- Add your DML below this line
-- Insert queries for the location table
INSERT INTO restaurant_management.locations (name, address, city, email, phone, coords)
VALUES (
        'Smachno! Kyiv Center',
        '3 Khreshchatyk St',
        'Kyiv',
        'kyiv.center@smachno-group.ua',
        '+380441234501',
        ST_SetSRID(ST_MakePoint(30.5234, 50.4501), 4326)
    ),
    (
        'Smachno! Kyiv Podil',
        '10 Sahaidachnoho St',
        'Kyiv',
        'kyiv.podil@smachno-group.ua',
        '+380441234502',
        ST_SetSRID(ST_MakePoint(30.5172, 50.4649), 4326)
    ),
    (
        'Smachno! Lviv Rynok',
        '1 Rynok Square',
        'Lviv',
        'lviv.rynok@smachno-group.ua',
        '+380322345503',
        ST_SetSRID(ST_MakePoint(24.0316, 49.8397), 4326)
    ),
    (
        'Smachno! Odesa Deribasivska',
        '15 Deribasivska St',
        'Odesa',
        'odesa.deribasivska@smachno-group.ua',
        '+380482345504',
        ST_SetSRID(ST_MakePoint(30.7326, 46.4825), 4326)
    ),
    (
        'Smachno! Kharkiv Svobody',
        '7 Svobody Square',
        'Kharkiv',
        'kharkiv.svobody@smachno-group.ua',
        '+380572345505',
        ST_SetSRID(ST_MakePoint(36.2304, 49.9935), 4326)
    ),
    (
        'Smachno! Dnipro Yavornytskoho',
        '22 Dmytra Yavornytskoho Ave',
        'Dnipro',
        'dnipro.yavornytskoho@smachno-group.ua',
        '+380562345506',
        ST_SetSRID(ST_MakePoint(35.0462, 48.4647), 4326)
    ),
    (
        'Smachno! Zaporizhzhia Sobornyi',
        '54 Sobornyi Ave',
        'Zaporizhzhia',
        'zaporizhzhia.sobornyi@smachno-group.ua',
        '+380612345507',
        ST_SetSRID(ST_MakePoint(35.1396, 47.8388), 4326)
    ),
    (
        'Smachno! Vinnytsia Soborna',
        '31 Soborna St',
        'Vinnytsia',
        'vinnytsia.soborna@smachno-group.ua',
        '+380432345508',
        ST_SetSRID(ST_MakePoint(28.4682, 49.2331), 4326)
    ),
    (
        'Smachno! Poltava Zhovtneva',
        '12 Zhovtneva St',
        'Poltava',
        'poltava.zhovtneva@smachno-group.ua',
        '+380532345509',
        ST_SetSRID(ST_MakePoint(34.5514, 49.5883), 4326)
    ),
    (
        'Smachno! Ivano-Frankivsk Nezalezhnosti',
        '18 Nezalezhnosti St',
        'Ivano-Frankivsk',
        'if.nezalezhnosti@smachno-group.ua',
        '+380342345510',
        ST_SetSRID(ST_MakePoint(24.7111, 48.9226), 4326)
    );
-- Update the contact email for the Kyiv Center location (e.g. domain rebrand)
UPDATE restaurant_management.locations
SET email = 'kyiv.center@smachno.ua'
WHERE name = 'Smachno! Kyiv Center';
-- Delete the 'Smachno! Kyiv Podil' location
DELETE FROM restaurant_management.locations
WHERE name = 'Smachno! Kyiv Podil';
-- Insert queries for the staff table
INSERT INTO restaurant_management.staff (staff_role, first_name, last_name, middle_name, hire_date)
VALUES ('manager', 'Olena', 'Kovalenko', 'Ivanivna', '2021-03-15'),
    ('server', 'Dmytro', 'Bondarenko', NULL, '2022-06-01'),
    ('kitchen', 'Iryna', 'Tkachenko', 'Petrivna', '2020-11-20'),
    ('server', 'Andriy', 'Melnyk', NULL, '2023-02-10'),
    ('kitchen', 'Kateryna', 'Shevchenko', 'Oleksandrivna', '2021-08-05'),
    ('manager', 'Serhii', 'Petrenko', 'Mykolayovych', '2019-05-12'),
    ('server', 'Nataliya', 'Kravchenko', NULL, '2022-09-18'),
    ('kitchen', 'Oleksandr', 'Kovalchuk', 'Vasylyovych', '2020-01-25'),
    ('server', 'Yuliya', 'Boyko', NULL, '2023-07-03'),
    ('kitchen', 'Mykola', 'Rudenko', 'Stepanovych', '2021-12-14'),
    ('manager', 'Viktoriya', 'Savchenko', 'Olehivna', '2018-10-30'),
    ('bartender', 'Roman', 'Lysenko', NULL, '2022-04-22');
-- Insert queries for the shifts table
INSERT INTO restaurant_management.shifts (location_id, staff_id, start_shift, end_shift)
VALUES (
        (
            SELECT location_id
            FROM restaurant_management.locations
            WHERE name = 'Smachno! Kyiv Center'
        ),
        1,
        '2026-08-03 08:00:00+03',
        '2026-08-03 16:00:00+03'
    ),
    (
        (
            SELECT location_id
            FROM restaurant_management.locations
            WHERE name = 'Smachno! Kyiv Center'
        ),
        2,
        '2026-08-03 16:00:00+03',
        '2026-08-03 23:00:00+03'
    ),
    (
        (
            SELECT location_id
            FROM restaurant_management.locations
            WHERE name = 'Smachno! Lviv Rynok'
        ),
        3,
        '2026-08-03 08:00:00+03',
        '2026-08-03 16:00:00+03'
    ),
    (
        (
            SELECT location_id
            FROM restaurant_management.locations
            WHERE name = 'Smachno! Lviv Rynok'
        ),
        4,
        '2026-08-03 16:00:00+03',
        '2026-08-03 23:00:00+03'
    ),
    (
        (
            SELECT location_id
            FROM restaurant_management.locations
            WHERE name = 'Smachno! Odesa Deribasivska'
        ),
        5,
        '2026-08-04 08:00:00+03',
        '2026-08-04 16:00:00+03'
    ),
    (
        (
            SELECT location_id
            FROM restaurant_management.locations
            WHERE name = 'Smachno! Kharkiv Svobody'
        ),
        6,
        '2026-08-04 08:00:00+03',
        '2026-08-04 16:00:00+03'
    ),
    (
        (
            SELECT location_id
            FROM restaurant_management.locations
            WHERE name = 'Smachno! Dnipro Yavornytskoho'
        ),
        7,
        '2026-08-04 16:00:00+03',
        '2026-08-04 23:00:00+03'
    ),
    (
        (
            SELECT location_id
            FROM restaurant_management.locations
            WHERE name = 'Smachno! Zaporizhzhia Sobornyi'
        ),
        8,
        '2026-08-05 08:00:00+03',
        '2026-08-05 16:00:00+03'
    ),
    (
        (
            SELECT location_id
            FROM restaurant_management.locations
            WHERE name = 'Smachno! Vinnytsia Soborna'
        ),
        9,
        '2026-08-05 08:00:00+03',
        '2026-08-05 16:00:00+03'
    ),
    (
        (
            SELECT location_id
            FROM restaurant_management.locations
            WHERE name = 'Smachno! Poltava Zhovtneva'
        ),
        10,
        '2026-08-05 16:00:00+03',
        '2026-08-05 23:00:00+03'
    );
-- Update the shift ID for the Lviv location for the 
UPDATE restaurant_management.shifts
SET staff_id = 11
WHERE start_shift = '2026-08-03 16:00:00+03'
    AND location_id = (
        SELECT location_id
        FROM restaurant_management.locations
        WHERE name = 'Smachno! Lviv Rynok'
    );
-- Deleting the shift for staff member with id 10 and specific date
DELETE FROM restaurant_management.shifts
WHERE staff_id = 10
    AND start_shift = '2026-08-05 16:00:00+03';
-- Insert queries for Suppliers table
INSERT INTO restaurant_management.suppliers (name, contact_name, email, phone)
VALUES (
        'Svizha Ferma LLC',
        'Olena Kovalenko',
        'olena.kovalenko.svizhaferma@gmail.com',
        '+380671234601'
    ),
    (
        'MoreProduct Seafood',
        'Ihor Bondarenko',
        'ihor.bondarenko.moreproduct@gmail.com',
        '+380671234602'
    ),
    (
        'Zlatna Nyva Grain Co',
        'Nataliya Shevchenko',
        'nataliya.shevchenko.zlatnanyva@gmail.com',
        '+380671234603'
    ),
    (
        'Karpatski Syry Dairy',
        'Andriy Melnyk',
        'andriy.melnyk.karpatskisyry@gmail.com',
        '+380671234604'
    ),
    (
        'Myasna Maysternya Meat Supply',
        'Viktor Tkachenko',
        'viktor.tkachenko.myasnamaysternya@gmail.com',
        '+380671234605'
    ),
    (
        'Sady Podillya Fruits & Veg',
        'Kateryna Boyko',
        'kateryna.boyko.sadypodillya@gmail.com',
        '+380671234606'
    ),
    (
        'Chorne More Beverages',
        'Dmytro Savchenko',
        'dmytro.savchenko.chornemore@gmail.com',
        '+380671234607'
    ),
    (
        'Zolotyi Kolos Bakery Supply',
        'Yuliya Marchenko',
        'yuliya.marchenko.zolotyikolos@gmail.com',
        '+380671234608'
    ),
    (
        'Prykarpatska Oliya Oils & Spices',
        'Oleksandr Rudenko',
        'oleksandr.rudenko.prykarpatskaoliya@gmail.com',
        '+380671234609'
    ),
    (
        'Bilyi Lyst Packaging & Supplies',
        'Iryna Pavlenko',
        'iryna.pavlenko.bilylyst@gmail.com',
        '+380671234610'
    );
-- Updating the supplier name
UPDATE restaurant_management.suppliers
SET name = 'More Product Seafood'
WHERE name = 'MoreProduct Seafood';
-- Deleting the  supplier with id 5
DELETE FROM restaurant_management.suppliers
WHERE supplier_id = 5;
-- Insert queries for the restaurant_management.ingredients
-- supplier_id resolved by name via subquery to stay valid after the supplier DELETE above
INSERT INTO restaurant_management.ingredients (
        supplier_id,
        name,
        unit_measure,
        unit_cost,
        quantity_available
    )
VALUES (
        (
            SELECT supplier_id
            FROM restaurant_management.suppliers
            WHERE name = 'Svizha Ferma LLC'
        ),
        'Chicken Eggs',
        'dozen',
        45.00,
        200.00
    ),
    (
        (
            SELECT supplier_id
            FROM restaurant_management.suppliers
            WHERE name = 'Svizha Ferma LLC'
        ),
        'Fresh Milk',
        'liters',
        28.50,
        150.00
    ),
    (
        (
            SELECT supplier_id
            FROM restaurant_management.suppliers
            WHERE name = 'More Product Seafood'
        ),
        'Salmon Fillet',
        'kg',
        320.00,
        40.00
    ),
    (
        (
            SELECT supplier_id
            FROM restaurant_management.suppliers
            WHERE name = 'Zlatna Nyva Grain Co'
        ),
        'Wheat Flour',
        'kg',
        18.00,
        300.00
    ),
    (
        (
            SELECT supplier_id
            FROM restaurant_management.suppliers
            WHERE name = 'Karpatski Syry Dairy'
        ),
        'Mozzarella Cheese',
        'kg',
        210.00,
        80.00
    ),
    (
        (
            SELECT supplier_id
            FROM restaurant_management.suppliers
            WHERE name = 'Sady Podillya Fruits & Veg'
        ),
        'Tomatoes',
        'kg',
        32.00,
        120.00
    ),
    (
        (
            SELECT supplier_id
            FROM restaurant_management.suppliers
            WHERE name = 'Chorne More Beverages'
        ),
        'Sparkling Water',
        'liters',
        15.00,
        500.00
    ),
    (
        (
            SELECT supplier_id
            FROM restaurant_management.suppliers
            WHERE name = 'Zolotyi Kolos Bakery Supply'
        ),
        'Baking Yeast',
        'kg',
        95.00,
        25.00
    ),
    (
        (
            SELECT supplier_id
            FROM restaurant_management.suppliers
            WHERE name = 'Prykarpatska Oliya Oils & Spices'
        ),
        'Sunflower Oil',
        'liters',
        55.00,
        100.00
    ),
    (
        (
            SELECT supplier_id
            FROM restaurant_management.suppliers
            WHERE name = 'Bilyi Lyst Packaging & Supplies'
        ),
        'Takeaway Containers',
        'units',
        3.50,
        1000.00
    );
-- Restock update after delivery: increase available quantity for Salmon Fillet
UPDATE restaurant_management.ingredients
SET quantity_available = quantity_available + 60.00
WHERE name = 'Salmon Fillet';
-- Removing a discontinued ingredient
DELETE FROM restaurant_management.ingredients
WHERE name = 'Takeaway Containers';
-- Insert queries for the restaurant_management.menu_items table
INSERT INTO restaurant_management.menu_items (
        name,
        description,
        nutrition_info,
        weight_grams,
        price,
        preparation_time_min
    )
VALUES (
        'Kyiv-Style Chicken Schnitzel',
        'Breaded chicken breast cutlet, pan-fried until golden and served with a lemon wedge.',
        '540 kcal, 32g protein, 28g fat, 38g carbs',
        320,
        245.00,
        25
    ),
    (
        'Margherita Pizza',
        'Wood-fired pizza topped with mozzarella, tomato sauce, and fresh basil.',
        '780 kcal, 28g protein, 26g fat, 95g carbs',
        450,
        210.00,
        18
    ),
    (
        'Grilled Salmon Fillet',
        'Salmon fillet grilled to order and finished with olive oil and herbs.',
        '410 kcal, 38g protein, 22g fat, 6g carbs',
        280,
        385.00,
        22
    ),
    (
        'Classic Borscht',
        'Traditional beet and vegetable soup served with sour cream and rye bread.',
        '320 kcal, 9g protein, 12g fat, 40g carbs',
        400,
        95.00,
        15
    ),
    (
        'Caesar Salad with Chicken',
        'Romaine lettuce, grilled chicken, parmesan, and croutons tossed in Caesar dressing.',
        '460 kcal, 30g protein, 28g fat, 18g carbs',
        300,
        165.00,
        12
    ),
    (
        'Tomato & Mozzarella Bruschetta',
        'Toasted bread topped with diced tomatoes, fresh mozzarella, and basil.',
        '290 kcal, 11g protein, 14g fat, 28g carbs',
        180,
        110.00,
        10
    ),
    (
        'Milk Pancakes with Honey',
        'Fluffy milk-batter pancakes drizzled with honey and served with fresh fruit.',
        '520 kcal, 14g protein, 16g fat, 78g carbs',
        250,
        85.00,
        15
    ),
    (
        'Cheese Omelette',
        'Three-egg omelette folded with mozzarella cheese.',
        '380 kcal, 22g protein, 28g fat, 6g carbs',
        220,
        90.00,
        10
    ),
    (
        'Wheat Bread Basket',
        'Freshly baked wheat bread rolls served warm with butter.',
        '210 kcal, 7g protein, 3g fat, 40g carbs',
        150,
        45.00,
        5
    ),
    (
        'Sparkling Lemonade',
        'House-made lemonade with sparkling water and fresh mint.',
        '90 kcal, 0g protein, 0g fat, 22g carbs',
        350,
        55.00,
        3
    ),
    (
        'Tiramisu',
        'Classic Italian dessert with layers of mascarpone cream and espresso-soaked biscuits.',
        '410 kcal, 6g protein, 24g fat, 42g carbs',
        180,
        120.00,
        8
    ),
    (
        'Salmon Tartare Appetizer',
        'Diced fresh salmon with capers, red onion, and lemon, served as a starter.',
        '260 kcal, 24g protein, 16g fat, 4g carbs',
        150,
        220.00,
        15
    );
-- Insert queries for the restaurant_management.menu_item_ingredients table
-- ingredient_id and menu_item_id resolved by name via subquery to stay valid after the ingredient DELETE above
INSERT INTO restaurant_management.menu_item_ingredients (ingredient_id, menu_item_id, quantity_needed)
VALUES (
        (SELECT ingredient_id FROM restaurant_management.ingredients WHERE name = 'Wheat Flour'),
        (SELECT menu_item_id FROM restaurant_management.menu_items WHERE name = 'Kyiv-Style Chicken Schnitzel'),
        0.15
    ),
    (
        (SELECT ingredient_id FROM restaurant_management.ingredients WHERE name = 'Sunflower Oil'),
        (SELECT menu_item_id FROM restaurant_management.menu_items WHERE name = 'Kyiv-Style Chicken Schnitzel'),
        0.05
    ),
    (
        (SELECT ingredient_id FROM restaurant_management.ingredients WHERE name = 'Chicken Eggs'),
        (SELECT menu_item_id FROM restaurant_management.menu_items WHERE name = 'Kyiv-Style Chicken Schnitzel'),
        0.17
    ),
    (
        (SELECT ingredient_id FROM restaurant_management.ingredients WHERE name = 'Wheat Flour'),
        (SELECT menu_item_id FROM restaurant_management.menu_items WHERE name = 'Margherita Pizza'),
        0.25
    ),
    (
        (SELECT ingredient_id FROM restaurant_management.ingredients WHERE name = 'Baking Yeast'),
        (SELECT menu_item_id FROM restaurant_management.menu_items WHERE name = 'Margherita Pizza'),
        0.01
    ),
    (
        (SELECT ingredient_id FROM restaurant_management.ingredients WHERE name = 'Mozzarella Cheese'),
        (SELECT menu_item_id FROM restaurant_management.menu_items WHERE name = 'Margherita Pizza'),
        0.12
    ),
    (
        (SELECT ingredient_id FROM restaurant_management.ingredients WHERE name = 'Tomatoes'),
        (SELECT menu_item_id FROM restaurant_management.menu_items WHERE name = 'Margherita Pizza'),
        0.10
    ),
    (
        (SELECT ingredient_id FROM restaurant_management.ingredients WHERE name = 'Salmon Fillet'),
        (SELECT menu_item_id FROM restaurant_management.menu_items WHERE name = 'Grilled Salmon Fillet'),
        0.28
    ),
    (
        (SELECT ingredient_id FROM restaurant_management.ingredients WHERE name = 'Sunflower Oil'),
        (SELECT menu_item_id FROM restaurant_management.menu_items WHERE name = 'Grilled Salmon Fillet'),
        0.02
    ),
    (
        (SELECT ingredient_id FROM restaurant_management.ingredients WHERE name = 'Tomatoes'),
        (SELECT menu_item_id FROM restaurant_management.menu_items WHERE name = 'Classic Borscht'),
        0.20
    ),
    (
        (SELECT ingredient_id FROM restaurant_management.ingredients WHERE name = 'Sunflower Oil'),
        (SELECT menu_item_id FROM restaurant_management.menu_items WHERE name = 'Classic Borscht'),
        0.03
    ),
    (
        (SELECT ingredient_id FROM restaurant_management.ingredients WHERE name = 'Tomatoes'),
        (SELECT menu_item_id FROM restaurant_management.menu_items WHERE name = 'Tomato & Mozzarella Bruschetta'),
        0.15
    ),
    (
        (SELECT ingredient_id FROM restaurant_management.ingredients WHERE name = 'Mozzarella Cheese'),
        (SELECT menu_item_id FROM restaurant_management.menu_items WHERE name = 'Tomato & Mozzarella Bruschetta'),
        0.08
    ),
    (
        (SELECT ingredient_id FROM restaurant_management.ingredients WHERE name = 'Wheat Flour'),
        (SELECT menu_item_id FROM restaurant_management.menu_items WHERE name = 'Tomato & Mozzarella Bruschetta'),
        0.06
    ),
    (
        (SELECT ingredient_id FROM restaurant_management.ingredients WHERE name = 'Fresh Milk'),
        (SELECT menu_item_id FROM restaurant_management.menu_items WHERE name = 'Milk Pancakes with Honey'),
        0.20
    ),
    (
        (SELECT ingredient_id FROM restaurant_management.ingredients WHERE name = 'Wheat Flour'),
        (SELECT menu_item_id FROM restaurant_management.menu_items WHERE name = 'Milk Pancakes with Honey'),
        0.18
    ),
    (
        (SELECT ingredient_id FROM restaurant_management.ingredients WHERE name = 'Chicken Eggs'),
        (SELECT menu_item_id FROM restaurant_management.menu_items WHERE name = 'Milk Pancakes with Honey'),
        0.08
    ),
    (
        (SELECT ingredient_id FROM restaurant_management.ingredients WHERE name = 'Chicken Eggs'),
        (SELECT menu_item_id FROM restaurant_management.menu_items WHERE name = 'Cheese Omelette'),
        0.25
    ),
    (
        (SELECT ingredient_id FROM restaurant_management.ingredients WHERE name = 'Mozzarella Cheese'),
        (SELECT menu_item_id FROM restaurant_management.menu_items WHERE name = 'Cheese Omelette'),
        0.06
    ),
    (
        (SELECT ingredient_id FROM restaurant_management.ingredients WHERE name = 'Fresh Milk'),
        (SELECT menu_item_id FROM restaurant_management.menu_items WHERE name = 'Cheese Omelette'),
        0.05
    ),
    (
        (SELECT ingredient_id FROM restaurant_management.ingredients WHERE name = 'Wheat Flour'),
        (SELECT menu_item_id FROM restaurant_management.menu_items WHERE name = 'Wheat Bread Basket'),
        0.30
    ),
    (
        (SELECT ingredient_id FROM restaurant_management.ingredients WHERE name = 'Baking Yeast'),
        (SELECT menu_item_id FROM restaurant_management.menu_items WHERE name = 'Wheat Bread Basket'),
        0.02
    ),
    (
        (SELECT ingredient_id FROM restaurant_management.ingredients WHERE name = 'Sunflower Oil'),
        (SELECT menu_item_id FROM restaurant_management.menu_items WHERE name = 'Wheat Bread Basket'),
        0.02
    ),
    (
        (SELECT ingredient_id FROM restaurant_management.ingredients WHERE name = 'Sparkling Water'),
        (SELECT menu_item_id FROM restaurant_management.menu_items WHERE name = 'Sparkling Lemonade'),
        0.35
    ),
    (
        (SELECT ingredient_id FROM restaurant_management.ingredients WHERE name = 'Fresh Milk'),
        (SELECT menu_item_id FROM restaurant_management.menu_items WHERE name = 'Tiramisu'),
        0.10
    ),
    (
        (SELECT ingredient_id FROM restaurant_management.ingredients WHERE name = 'Chicken Eggs'),
        (SELECT menu_item_id FROM restaurant_management.menu_items WHERE name = 'Tiramisu'),
        0.08
    ),
    (
        (SELECT ingredient_id FROM restaurant_management.ingredients WHERE name = 'Salmon Fillet'),
        (SELECT menu_item_id FROM restaurant_management.menu_items WHERE name = 'Salmon Tartare Appetizer'),
        0.15
    ),
    (
        (SELECT ingredient_id FROM restaurant_management.ingredients WHERE name = 'Sunflower Oil'),
        (SELECT menu_item_id FROM restaurant_management.menu_items WHERE name = 'Salmon Tartare Appetizer'),
        0.01
    );
-- Insert queries for the restaurant_management.customers table
INSERT INTO restaurant_management.customers (email, first_name, last_name, phone)
VALUES (
        'taras.hrytsenko@gmail.com',
        'Taras',
        'Hrytsenko',
        '+380671235701'
    ),
    (
        'sofiya.lysenko@gmail.com',
        'Sofiya',
        'Lysenko',
        '+380671235702'
    ),
    (
        'maksym.polishchuk@gmail.com',
        'Maksym',
        'Polishchuk',
        '+380671235703'
    ),
    (
        'anna.kravchuk@gmail.com',
        'Anna',
        'Kravchuk',
        '+380671235704'
    ),
    (
        'bohdan.ovcharenko@gmail.com',
        'Bohdan',
        'Ovcharenko',
        '+380671235705'
    ),
    (
        'yana.moroz@gmail.com',
        'Yana',
        'Moroz',
        '+380671235706'
    ),
    (
        'roman.tkachuk@gmail.com',
        'Roman',
        'Tkachuk',
        '+380671235707'
    ),
    (
        'viktoriya.gnatiuk@gmail.com',
        'Viktoriya',
        'Gnatiuk',
        '+380671235708'
    ),
    (
        'pavlo.zinchenko@gmail.com',
        'Pavlo',
        'Zinchenko',
        '+380671235709'
    ),
    (
        'daryna.kucher@gmail.com',
        'Daryna',
        'Kucher',
        '+380671235710'
    );
-- Updating a customer's phone number after they reported a change
UPDATE restaurant_management.customers
SET phone = '+380991239999'
WHERE email = 'taras.hrytsenko@gmail.com';
-- Deleting a customer who requested account removal
DELETE FROM restaurant_management.customers
WHERE email = 'daryna.kucher@gmail.com';
-- Insert queries for the restaurant_management.customer_feedbacks
-- customer_id / location_id resolved by email / name via subquery so the
-- rows stay valid after the earlier customer and location DELETEs
INSERT INTO restaurant_management.customer_feedbacks (customer_id, location_id, description, rating)
VALUES (
        (
            SELECT customer_id
            FROM restaurant_management.customers
            WHERE email = 'sofiya.lysenko@gmail.com'
        ),
        (
            SELECT location_id
            FROM restaurant_management.locations
            WHERE name = 'Smachno! Kyiv Center'
        ),
        'Great atmosphere and friendly staff, the borscht was excellent.',
        5
    ),
    (
        (
            SELECT customer_id
            FROM restaurant_management.customers
            WHERE email = 'maksym.polishchuk@gmail.com'
        ),
        (
            SELECT location_id
            FROM restaurant_management.locations
            WHERE name = 'Smachno! Lviv Rynok'
        ),
        'Food arrived a bit cold, but the taste was still good.',
        3
    ),
    (
        (
            SELECT customer_id
            FROM restaurant_management.customers
            WHERE email = 'anna.kravchuk@gmail.com'
        ),
        (
            SELECT location_id
            FROM restaurant_management.locations
            WHERE name = 'Smachno! Odesa Deribasivska'
        ),
        'Loved the seafood platter, will definitely come back.',
        5
    ),
    (
        (
            SELECT customer_id
            FROM restaurant_management.customers
            WHERE email = 'bohdan.ovcharenko@gmail.com'
        ),
        (
            SELECT location_id
            FROM restaurant_management.locations
            WHERE name = 'Smachno! Kharkiv Svobody'
        ),
        'Service was slow during peak hours, took 40 minutes to get our order.',
        2
    ),
    (
        (
            SELECT customer_id
            FROM restaurant_management.customers
            WHERE email = 'yana.moroz@gmail.com'
        ),
        (
            SELECT location_id
            FROM restaurant_management.locations
            WHERE name = 'Smachno! Dnipro Yavornytskoho'
        ),
        'Cozy place, great for a family dinner.',
        4
    ),
    (
        (
            SELECT customer_id
            FROM restaurant_management.customers
            WHERE email = 'roman.tkachuk@gmail.com'
        ),
        (
            SELECT location_id
            FROM restaurant_management.locations
            WHERE name = 'Smachno! Zaporizhzhia Sobornyi'
        ),
        'The new menu items are fantastic, especially the desserts.',
        5
    ),
    (
        (
            SELECT customer_id
            FROM restaurant_management.customers
            WHERE email = 'viktoriya.gnatiuk@gmail.com'
        ),
        (
            SELECT location_id
            FROM restaurant_management.locations
            WHERE name = 'Smachno! Vinnytsia Soborna'
        ),
        'Average experience, nothing special but not bad either.',
        3
    ),
    (
        (
            SELECT customer_id
            FROM restaurant_management.customers
            WHERE email = 'pavlo.zinchenko@gmail.com'
        ),
        (
            SELECT location_id
            FROM restaurant_management.locations
            WHERE name = 'Smachno! Poltava Zhovtneva'
        ),
        'Staff was very attentive and accommodated our dietary restrictions.',
        5
    ),
    (
        (
            SELECT customer_id
            FROM restaurant_management.customers
            WHERE email = 'taras.hrytsenko@gmail.com'
        ),
        (
            SELECT location_id
            FROM restaurant_management.locations
            WHERE name = 'Smachno! Ivano-Frankivsk Nezalezhnosti'
        ),
        'Nice view from the terrace, coffee could be better.',
        4
    ),
    (
        (
            SELECT customer_id
            FROM restaurant_management.customers
            WHERE email = 'sofiya.lysenko@gmail.com'
        ),
        (
            SELECT location_id
            FROM restaurant_management.locations
            WHERE name = 'Smachno! Lviv Rynok'
        ),
        'Table was not ready despite our reservation, disappointing visit.',
        2
    );
-- Updating a feedback.
UPDATE restaurant_management.customer_feedbacks
SET description = 'Table was delayed by 10 minutes, but staff apologized and offered a free dessert.',
    rating = 3
WHERE description = 'Table was not ready despite our reservation, disappointing visit.';
-- Deleting a feedback entry
DELETE FROM restaurant_management.customer_feedbacks
WHERE description = 'Average experience, nothing special but not bad either.';