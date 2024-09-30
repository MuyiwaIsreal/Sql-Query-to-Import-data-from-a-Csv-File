1	/*	creating order table */
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    total_amount NUMERIC(10, 2) NOT NULL
);
SELECT * from orders;

2	/*	inserting data from CSV */
COPY public."orders"
FROM 'C:\Program Files\PostgreSQL\16\EComerceDataset\orders.csv' DELIMITER ',' CSV HEADER;


3	/*	creating customers table */
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL,
    registration_date DATE NOT NULL
);
SELECT * from customers;



4	/*	creating order_items table */
CREATE TABLE order_itmes (
    order_id SERIAL NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price NUMERIC(10, 2) NOT NULL
);

5	/*	change table name from order_itmes to order_items */
ALTER TABLE order_itmes RENAME TO order_items;

SELECT * from order_items;

6	/*	change data type */
ALTER TABLE order_items
ALTER COLUMN order_id TYPE INT;

ALTER TABLE order_items
ALTER COLUMN price TYPE DECIMAL(10, 2);

7	/*	inserting order_items data from CSV */
COPY public."order_items"
FROM 'C:\Program Files\PostgreSQL\16\project_folder\EComerceDataset\order_items.csv' DELIMITER ',' CSV HEADER;

8	/*	creating product table */
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255),
    category VARCHAR(255)
);
SELECT * from public.products;

9	/*	inserting products data from CSV */
COPY public."products"
FROM 'C:\Program Files\PostgreSQL\16\product.csv' DELIMITER ',' CSV HEADER;

