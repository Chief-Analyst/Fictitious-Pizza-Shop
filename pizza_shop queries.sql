-- To check for details contained in the order details table
SELECT * 
FROM pizza_shop.order_details;

-- To check for details contained in the orders table
SELECT * 
FROM pizza_shop.orders;

-- To check for details contained in the pizza_types table
SELECT *
FROM pizza_shop.pizza_types;

-- To check for details contained in the pizzas table
SELECT * 
FROM pizza_shop.pizzas;

-- Joining all four tables 
SELECT * 
FROM pizza_shop.orders AS orders
JOIN pizza_shop.order_details AS order_details
ON orders.order_id = order_details.order_id
LEFT JOIN pizza_shop.pizzas AS pizza
ON order_details.pizza_id = pizza.pizza_id
LEFT JOIN pizza_shop.pizza_types AS pizza_types
ON pizza.pizza_type_id = pizza_types.pizza_type_id;

-- Selecting only columns useful to my analysis
SELECT 
	   orders.order_id,
	   order_details.order_details_id,
       orders.time,
       orders.date,
       pizza.pizza_id,
       order_details.quantity,
       pizza.price,
       pizza.price * order_details.quantity AS total_price,
       pizza.size,
       pizza_types.name,
       pizza_types.category
FROM pizza_shop.orders orders
INNER JOIN pizza_shop.order_details order_details
ON orders.order_id = order_details.order_id
INNER JOIN pizza_shop.pizzas pizza
ON order_details.pizza_id = pizza.pizza_id
INNER JOIN pizza_shop.pizza_types pizza_types
ON pizza.pizza_type_id = pizza_types.pizza_type_id;

-- Checking to see which hour range had the highest spike in orders
SELECT 
	  orders.order_id,
	   order_details.order_details_id,
       orders.time,
       orders.date,
       pizza.pizza_id,
       order_details.quantity,
       pizza.price,
       pizza.price * order_details.quantity AS total_price,
       pizza.size,
       pizza_types.name,
       pizza_types.category
FROM pizza_shop.orders orders
INNER JOIN pizza_shop.order_details order_details
ON orders.order_id = order_details.order_id
INNER JOIN pizza_shop.pizzas pizza
ON order_details.pizza_id = pizza.pizza_id
INNER JOIN pizza_shop.pizza_types pizza_types
ON pizza.pizza_type_id = pizza_types.pizza_type_id
WHERE time BETWEEN 11 AND 11;
-- Results: Open hours is between 11:00am to 22:59pm
-- Between 11:00am to 11:59am on the dates recorded, 113 orders were taken
-- Between 12:00pm to 12:59pm on the dates recorded, 357 orders were taken
-- Between 13:00pm to 13:59pm on the dates recorded, 295 orders were taken
-- Between 14:00pm to 14:59pm on the dates recorded, 215 orders were taken
-- Between 15:00pm to 11:59pm on the dates recorded, 174 orders were taken
-- Between 16:00pm to 11:59pm on the dates recorded, 200 orders were taken
-- Between 17:00pm to 17:59pm on the dates recorded, 260 orders were taken
-- Between 18:00pm to 18:59pm on the dates recorded, 267 orders were taken
-- Between 19:00pm to 19:59pm on the dates recorded, 238 orders were taken
-- Between 20:00pm to 20:59am on the dates recorded, 164 orders were taken
-- Between 21:00pm to 21:59pm on the dates recorded, 114 orders were taken
-- Between 22:00pm to 22:59pm on the dates recorded, 65 orders were taken

-- Getting the day with the most sales between 2015/01/01 - 2015/01/19
SELECT 
	   orders.order_id,
	   order_details.order_details_id,
       orders.time,
       orders.date,
       pizza.pizza_id,
       order_details.quantity,
       pizza.price,
       pizza.price * order_details.quantity AS total_price,
       pizza.size,
       pizza_types.name,
       pizza_types.category
FROM pizza_shop.orders orders
INNER JOIN pizza_shop.order_details order_details
ON orders.order_id = order_details.order_id
INNER JOIN pizza_shop.pizzas pizza
ON order_details.pizza_id = pizza.pizza_id
INNER JOIN pizza_shop.pizza_types pizza_types
ON pizza.pizza_type_id = pizza_types.pizza_type_id
WHERE date = '2015-01-19'
-- Results
-- 2015/01/01 = 161 sales recorded
-- 2015/01/02 = 160 sales recorded
-- 2015/01/03 = 154 sales recorded
-- 2015/01/04 = 106 sales recorded
-- 2015/01/05 = 121 sales recorded
-- 2015/01/06 = 144 sales recorded 
-- 2015/01/07 = 133 sales recorded
-- 2015/01/08 = 171 sales recorded
-- 2015/01/09 = 123 sales recorded
-- 2015/01/10 = 145 sales recorded
-- 2015/01/11 = 114 sales recorded
-- 2015/01/12 = 118 sales recorded
-- 2015/01/13 = 117 sales recorded
-- 2015/01/14 = 144 sales recorded
-- 2015/01/15 = 123 sales recorded
-- 2015/01/16 = 155 sales recorded
-- 2015/01/17 = 122 sales recorded
-- 2015/01/18 = 119 sales recorded
-- 2015/01/19 = 32 sales recorded