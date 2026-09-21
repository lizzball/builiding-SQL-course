PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    city TEXT NOT NULL,
    province TEXT NOT NULL,
    signup_date DATE NOT NULL
);

CREATE TABLE products (
    product_id INTEGER PRIMARY KEY,
    product_name TEXT NOT NULL,
    category TEXT NOT NULL,
    unit_price REAL NOT NULL
);

CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    order_date DATE NOT NULL,
    status TEXT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INTEGER PRIMARY KEY,
    order_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    unit_price REAL NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO customers
(customer_id, first_name, last_name, city, province, signup_date)
VALUES
(1, 'Maya', 'Chen', 'Toronto', 'ON', '2025-01-14'),
(2, 'Jonah', 'Singh', 'Hamilton', 'ON', '2025-02-03'),
(3, 'Sofia', 'Martin', 'Montreal', 'QC', '2025-03-22'),
(4, 'Noah', 'Campbell', 'Vancouver', 'BC', '2025-04-09'),
(5, 'Avery', 'Wilson', 'Calgary', 'AB', '2025-05-16'),
(6, 'Leila', 'Roy', 'Ottawa', 'ON', '2025-06-01'),
(7, 'Theo', 'Brown', 'Halifax', 'NS', '2025-07-28'),
(8, 'Amara', 'Patel', 'Burlington', 'ON', '2025-08-13'),
(9, 'Felix', 'Tremblay', 'Quebec City', 'QC', '2025-09-05'),
(10, 'Nina', 'Brooks', 'Victoria', 'BC', '2025-10-19'),
(11, 'Rowan', 'Lee', 'Hamilton', 'ON', '2025-11-08'),
(12, 'Ivy', 'Khan', 'Toronto', 'ON', '2026-01-12');

INSERT INTO products
(product_id, product_name, category, unit_price)
VALUES
(101, 'Trail Bottle', 'Outdoors', 24.00),
(102, 'Merino Base Layer', 'Apparel', 89.00),
(103, 'Climbing Chalk Bag', 'Climbing', 32.00),
(104, 'Resistance Band Set', 'Training', 28.00),
(105, 'Travel Mug', 'Lifestyle', 35.00),
(106, 'Day Pack', 'Outdoors', 119.00),
(107, 'Yoga Mat', 'Training', 72.00),
(108, 'Insulated Vest', 'Apparel', 145.00);

INSERT INTO orders
(order_id, customer_id, order_date, status)
VALUES
(1001, 1, '2026-01-05', 'completed'),
(1002, 2, '2026-01-08', 'completed'),
(1003, 1, '2026-02-14', 'completed'),
(1004, 3, '2026-02-20', 'cancelled'),
(1005, 4, '2026-03-03', 'completed'),
(1006, 5, '2026-03-09', 'completed'),
(1007, 6, '2026-03-21', 'completed'),
(1008, 2, '2026-04-02', 'completed'),
(1009, 8, '2026-04-18', 'completed'),
(1010, 9, '2026-05-05', 'completed'),
(1011, 10, '2026-05-29', 'refunded'),
(1012, 11, '2026-06-04', 'completed'),
(1013, 1, '2026-06-18', 'completed'),
(1014, 12, '2026-07-07', 'completed'),
(1015, 4, '2026-07-24', 'completed'),
(1016, 6, '2026-08-11', 'completed'),
(1017, 8, '2026-08-30', 'completed'),
(1018, 2, '2026-09-04', 'completed');

INSERT INTO order_items
(order_item_id, order_id, product_id, quantity, unit_price)
VALUES
(1, 1001, 101, 2, 24.00),
(2, 1001, 105, 1, 35.00),
(3, 1002, 103, 1, 32.00),
(4, 1002, 104, 2, 28.00),
(5, 1003, 106, 1, 119.00),
(6, 1004, 107, 1, 72.00),
(7, 1005, 102, 1, 89.00),
(8, 1005, 101, 1, 24.00),
(9, 1006, 108, 1, 145.00),
(10, 1007, 107, 1, 72.00),
(11, 1007, 104, 1, 28.00),
(12, 1008, 105, 2, 35.00),
(13, 1009, 103, 1, 32.00),
(14, 1009, 101, 1, 24.00),
(15, 1010, 106, 1, 119.00),
(16, 1011, 108, 1, 145.00),
(17, 1012, 104, 3, 28.00),
(18, 1013, 102, 1, 89.00),
(19, 1013, 105, 1, 35.00),
(20, 1014, 107, 1, 72.00),
(21, 1014, 101, 2, 24.00),
(22, 1015, 106, 1, 119.00),
(23, 1016, 103, 2, 32.00),
(24, 1017, 108, 1, 145.00),
(25, 1018, 104, 1, 28.00),
(26, 1018, 105, 1, 35.00);

CREATE INDEX idx_orders_customer_id
    ON orders(customer_id);

CREATE INDEX idx_order_items_order_id
    ON order_items(order_id);

CREATE INDEX idx_order_items_product_id
    ON order_items(product_id);
