-- 1. Get all customers and their addresses.
    SELECT * FROM "addresses"
    JOIN "customers" ON "customers".id = "addresses".customer_id;
-- 2. Get all orders and their line items (orders, quantity and product).
    SELECT * FROM "orders"
    JOIN "line_items" ON "orders".id = "line_items".order_id;
-- 3. Which warehouses have cheetos?
    SELECT "warehouse".warehouse FROM "warehouse"
    JOIN "warehouse_product" ON "warehouse_product".warehouse_id = "warehouse".id
    JOIN "products" ON "products".id = "warehouse_product".product_id
    WHERE "products".description = 'cheetos' ;
-- 4. Which warehouses have diet pepsi?
    SELECT "warehouse".warehouse FROM "warehouse"
    JOIN "warehouse_product" ON "warehouse_product".warehouse_id = "warehouse".id
    JOIN "products" ON "products".id = "warehouse_product".product_id
    WHERE "products".description = 'diet pepsi' ;
-- 5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
    SELECT "customers".first_name, COUNT("customers".first_name) FROM "orders"
    JOIN "addresses" ON "addresses".id = "orders".address_id
    JOIN "customers" ON "customers".id = "addresses".customer_id
    GROUP BY "customers".first_name;
-- 6. How many customers do we have?
    SELECT COUNT(*) FROM "customers";
-- 7. How many products do we carry?
    SELECT COUNT(*) FROM "products";
-- 8. What is the total available on-hand quantity of diet pepsi?
    SELECT COUNT(*) FROM "line_items"
    JOIN "products" ON "products".id = "line_items".product_id
    WHERE "products".description =  'diet pepsi' ;