
SELECT * FROM sales;

DROP TABLE IF EXISTS customer;
SELECT customer_id, first_name, middle_name, last_name, segment
INTO customer FROM sales;

DROP TABLE IF EXISTS address;
SELECT postal_code, city, state, country, region, customer_id
INTO address FROM sales;

DROP TABLE IF EXISTS product;
SELECT product_id, product_name, category, sub_category
INTO product FROM sales;

DROP TABLE IF EXISTS orders;
SELECT order_id, order_date, product_id
INTO orders FROM sales;

DROP TABLE IF EXISTS shipping;
SELECT ship_date, ship_mode, postal_code
INTO shipping FROM sales;

ALTER TABLE sales DROP COLUMN row_id, DROP COLUMN order_id, DROP COLUMN order_date, 
DROP COLUMN ship_date, DROP COLUMN ship_mode, DROP COLUMN customer_id, DROP COLUMN customer_name,
DROP COLUMN segment, DROP COLUMN country, DROP COLUMN city, DROP COLUMN state, 
DROP COLUMN postal_code, DROP COLUMN region, DROP COLUMN product_id, DROP COLUMN category,
DROP COLUMN sub_category, DROP COLUMN product_name, DROP COLUMN first_name, 
DROP COLUMN last_name, DROP COLUMN middle_name;



ALTER TABLE "customer" ADD CONSTRAINT "fk_customer_customer_id" FOREIGN KEY("customer_id")
REFERENCES "address" ("customer_id");

ALTER TABLE "customer" ADD CONSTRAINT "fk_customer_order_id" FOREIGN KEY("order_id")
REFERENCES "orders" ("order_id");

ALTER TABLE "address" ADD CONSTRAINT "fk_address_postal_code" FOREIGN KEY("postal_code")
REFERENCES "shipping" ("zip_code");

ALTER TABLE "product" ADD CONSTRAINT "fk_product_product_id" FOREIGN KEY("product_id")
REFERENCES "orders" ("product_id");

ALTER TABLE "product" ADD CONSTRAINT "fk_product_sales_id" FOREIGN KEY("sales_id")
REFERENCES "sales" ("sales_id");

ALTER TABLE "sales" ADD CONSTRAINT "fk_sales_ship_id" FOREIGN KEY("ship_id")
REFERENCES "shipping" ("ship_id");

