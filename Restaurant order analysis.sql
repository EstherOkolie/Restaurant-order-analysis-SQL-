--view the menu_items and order_details SELECT *
FROM menu_items;


SELECT *
FROM order_details;


--Find the number of items on the menu
SELECT COUNT(item_name) AS number_of_items FROM menu_items;

--What are the least and most expensive item on the menu SELECT MIN(price) AS least_price,
MAX(price) AS max_price FROM menu_items;

--How many dishes are in each category?
SELECT category, COUNT(item_name) AS count_of_dishes FROM menu_items
GROUP BY category;


--What is the average dish price within each category? SELECT category, AVG(price) AS average_price
FROM menu_items GROUP BY category;
 
--what is the date range of the table? SELECT MIN(order_date) AS start_date,
MAX(order_date) AS end_date FROM order_details;

---How many orders were made within the date range? SELECT COUNT(DISTINCT(order_id)) AS count_of_oders FROM order_details;

--How many items were ordered within the date range? SELECT COUNT(item_id)
FROM order_details;


--Which orders had the most number of items? SELECT order_id, COUNT(item_id) AS count_of_items FROM order_details
GROUP BY order_id
ORDER BY COUNT(item_id) DESC;


--How many orders had more than 12 items?
SELECT COUNT(*) FROM
(SELECT order_id, COUNT(item_id) AS items_count FROM order_details
GROUP BY order_id
HAVING COUNT(item_id) > 12) AS items_count;
