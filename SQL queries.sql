CREATE DATABASE ecommerce_analysis;
use ecommerce_analysis;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    country VARCHAR(50),
    signup_date DATE
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    payment_method VARCHAR(30),
    order_status VARCHAR(30),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_id INT,
    product_id INT,
    quantity INT,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

SELECT COUNT(*) FROM customers;

SELECT COUNT(*) FROM order_items;

SELECT COUNT(*) FROM orders;

SELECT COUNT(*) FROM products;

select * from customers;

select customer_name, city from customers;

-- QUERY HEADING 1: This query is used to display customers who is from city chennai.
select * from customers 
where city = 'Chennai';

-- QUERY HEADING 2: This query is used to display products whose price is greater than 2000.
select * from products 
where price > 2000;

-- QUERY HEADING 3: This query is used to display products ordered from highest to lowest price.
select * from products 
order by price desc;

-- QUERY HEADING 4: This query is used to find the five most expensive products.
select * from products 
order by price desc
limit 5;

-- QUERY HEADING 5: This query is used to count the total number of customers.
select count(*) as total_customers from customers;

-- QUERY HEADING 6: This query is used to calculate the average product price.
select avg(price) as average_price from products;

-- QUERY HEADING 7: This query is used to find the minimum and maximum product prices.
select min(price) as min_price, max(price) as max_price from products;

-- QUERY HEADING 8: This query is used to display all order item records.
select * from order_items;

-- QUERY HEADING 9: This query is used to calculate the total quantity of items sold.
select sum(quantity) as total_quantity from order_items;

-- QUERY HEADING 10: This query is used to count the number of products in each category.
select category, count(category) as product_count
from products
group by category;

-- QUERY HEADING 11: This query is used to calculate the average product price for each category.
select category, avg(price) as average_price
from products
group by category;

-- QUERY HEADING 12: This query is used to count orders by order status.
select order_status, count(*) as order_count
from orders
group by order_status;

-- QUERY HEADING 13: This query is used to count orders by payment method.
select payment_method, count(*) as order_count
from orders
group by payment_method;

-- QUERY HEADING 14: This query is used to calculate the number of orders for each month.
select year(order_date) as order_year, 
month(order_date) as order_month, count(*) as order_count
from orders
group by year(order_date), month(order_date)
order by order_year, order_month asc;

-- QUERY HEADING 15: This query is used to calculate total revenue from completed orders.
select sum(oi.quantity * p.price) as total_revenue from products p
join order_items oi on p.product_id = oi.product_id 
join orders o on oi.order_id = o.order_id 
where o.order_status = 'Completed';

-- QUERY HEADING 16: This query is used to calculate completed revenue by product category.
select p.category, sum(oi.quantity * p.price) as total_revenue from products p
join order_items oi on p.product_id = oi.product_id 
join orders o on oi.order_id = o.order_id 
where o.order_status = 'completed'
group by p.category;

-- QUERY HEADING 17: This query is used to calculate completed revenue for each customer.
select c.customer_id, c.customer_name, sum(oi.quantity * p.price) as total_revenue from products p
join order_items oi on p.product_id = oi.product_id 
join orders o on oi.order_id = o.order_id 
join customers c on o.customer_id = c.customer_id
where o.order_status = 'Completed'
group by c.customer_id, c.customer_name;

-- QUERY HEADING 18: This query is used to find the top 10 customers by completed revenue.
select c.customer_id, c.customer_name, sum(oi.quantity * p.price) as total_revenue from products p
join order_items oi on p.product_id = oi.product_id 
join orders o on oi.order_id = o.order_id 
join customers c on o.customer_id = c.customer_id
where o.order_status = 'Completed'
group by c.customer_id, c.customer_name
order by total_revenue desc
limit 10;

-- QUERY HEADING 19: This query is used to find the top 10 products by completed revenue.
select p.product_id, p.product_name, sum(oi.quantity * p.price) as total_revenue 
from products p
join order_items oi on p.product_id = oi.product_id 
join orders o on oi.order_id = o.order_id 
where o.order_status = 'Completed'
group by p.product_id, p.product_name
order by total_revenue desc
limit 10;

-- QUERY HEADING 20: This query is used to calculate completed revenue by customer city.
select c.city, sum(oi.quantity * p.price) as total_revenue from products p
join order_items oi on p.product_id = oi.product_id
join orders o on oi.order_id = o.order_id
join customers c on o.customer_id = c.customer_id
where o.order_status = 'Completed'
group by c.city;

-- QUERY HEADING 21: This query is used to find customers who have never placed an order.
select c.customer_id, c.customer_name from customers c
left join orders o on c.customer_id = o.customer_id
where o.customer_id is null;

-- QUERY HEADING 22: This query is used to find customers who placed more than 5 orders.
select c.customer_id, c.customer_name, count(o.customer_id) as order_count
from customers c join orders o on c.customer_id = o.customer_id
group by c.customer_id, c.customer_name
having order_count > 5;

-- QUERY HEADING 23: This query is used to find repeat customers who placed more than one order.
select c.customer_id, c.customer_name, count(o.customer_id) as order_count
from customers c join orders o on c.customer_id = o.customer_id
group by c.customer_id, c.customer_name
having order_count > 1;

-- QUERY HEADING 24: This query is used to calculate the percentage of cancelled orders.
select ((select count(*) from orders where order_status = 'Cancelled') /
(select count(*) from orders)) * 100.0
as cancelled_percentage;

-- QUERY HEADING 25: This query is used to calculate monthly completed revenue.
select year(order_date) as order_year, 
month(order_date) as order_month, sum(oi.quantity*p.price) as total_revenue
from products p 
join order_items oi on p.product_id = oi.product_id
join orders o on oi.order_id = o.order_id
where o.order_status = 'Completed'
group by year(order_date), month(order_date)
order by order_year, order_month;

-- QUERY HEADING 26: This query is used to calculate the average completed order value.
select (select sum(oi.quantity*p.price) as total_revenue
from products p 
join order_items oi on p.product_id = oi.product_id
join orders o on oi.order_id = o.order_id
where o.order_status = 'Completed') / 
(select count(*) as completed_orders from orders where order_status = 'Completed')
as average_order_value;

-- QUERY HEADING 27: This query is used to find the category with the highest completed revenue.
select p.category, sum(oi.quantity * p.price) as total_revenue from products p
join order_items oi on p.product_id = oi.product_id
join orders o on oi.order_id = o.order_id
where o.order_status = 'Completed'
group by p.category
order by total_revenue desc
limit 1;

-- QUERY HEADING 28: This query is used to find the customer with the highest completed revenue.
select c.customer_id, c.customer_name, sum(oi.quantity * p.price) as total_revenue 
from products p
join order_items oi on p.product_id = oi.product_id 
join orders o on oi.order_id = o.order_id 
join customers c on o.customer_id = c.customer_id
where o.order_status = 'Completed'
group by c.customer_id, c.customer_name
order by total_revenue desc
limit 1;

-- QUERY HEADING 29: This query is used to find the highest-revenue product in each category using ranking.
with product_revenue as (
    select p.category,
           p.product_id,
           p.product_name,
           sum(oi.quantity * p.price) as total_revenue
    from products p
    join order_items oi on p.product_id = oi.product_id
    join orders o on oi.order_id = o.order_id
    where o.order_status = 'Completed'
    group by p.category, p.product_id, p.product_name
),
ranked_products as (
    select category,
           product_id,
           product_name,
           total_revenue,
           row_number() over (
               partition by category
               order by total_revenue desc
           ) as product_rank
    from product_revenue
)
select category,
       product_name,
       total_revenue,
       product_rank
from ranked_products
where product_rank = 1;

-- QUERY HEADING 30: This query is used to find customers whose completed revenue is above the average customer revenue.
with customer_revenue as(select c.customer_id, c.customer_name , sum(oi.quantity*p.price) as total_revenue from products p
join order_items oi on p.product_id = oi.product_id
join orders o on oi.order_id = o.order_id
join customers c on o.customer_id = c.customer_id
where o.order_status = 'Completed'
group by c.customer_id, c.customer_name),
customer_average_revenue as
(select avg(cr.total_revenue) as average_customer_revenue from customer_revenue cr)
select customer_id, customer_name, total_revenue from customer_revenue cr
where cr.total_revenue > (select average_customer_revenue from customer_average_revenue);

-- QUERY HEADING 31: This query is used to find products whose completed revenue is above the average product revenue.
with product_revenue as(select p.product_id, p.product_name , sum(oi.quantity*p.price) 
as total_revenue from products p
join order_items oi on p.product_id = oi.product_id
join orders o on oi.order_id = o.order_id
where o.order_status = 'Completed'
group by p.product_id, p.product_name),
product_average_revenue as
(select avg(pr.total_revenue) as average_product_revenue from product_revenue pr)
select product_id, product_name, total_revenue from product_revenue pr
where pr.total_revenue > (select average_product_revenue from product_average_revenue);

-- QUERY HEADING 32: This query is used to find the second-highest product price.
select max(price) as second_highest_price from products 
where price not in (select max(price) from products);

-- QUERY HEADING 33: This query is used to find the highest-priced product in each category using row numbering.
with ranked_products as (select category, product_name, price,
 row_number() over (
               partition by category
               order by price desc
           ) as product_rank from products)
select category,product_name,price from ranked_products
where product_rank = 1;

-- QUERY HEADING 34: This query is used to find the first order date for each customer.
select c.customer_id, c.customer_name, min(o.order_date) as first_order_date from customers c
join orders o on c.customer_id = o.customer_id
group by c.customer_id, c.customer_name;

-- QUERY HEADING 35: This query is used to find the latest order date for each customer.
select c.customer_id, c.customer_name, max(o.order_date) as latest_order_date from customers c
join orders o on c.customer_id = o.customer_id
group by c.customer_id, c.customer_name;

-- QUERY HEADING 36: This query is used to classify customers as one-time or repeat customers.
select c.customer_id, c.customer_name, count(o.order_id) as order_count,
case when count(o.order_id) = 1 then 'one-time'
when count(o.order_id) > 1 then 'repeat'
end as customer_type
from customers c
join orders o on c.customer_id = o.customer_id
group by c.customer_id, c.customer_name;

-- QUERY HEADING 37: This query is used to calculate the average number of items per completed order.
select sum(oi.quantity) / count(distinct oi.order_id) as average_item_per_order
from order_items oi 
join orders o on oi.order_id = o.order_id
where o.order_status = 'Completed';

-- QUERY HEADING 38: This query is used to calculate completed revenue by payment method.
select o.payment_method, sum(oi.quantity * p.price) as total_revenue
from products p join order_items oi on p.product_id = oi.product_id
join orders o on oi.order_id = o.order_id
where o.order_status = 'Completed'
group by o.payment_method;

-- QUERY HEADING 39: This query is used to calculate monthly completed revenue and the previous month revenue.
select year(o.order_date) as year, month(o.order_date) as month, sum(oi.quantity * p.price) as total_revenue,
lag(sum(oi.quantity * p.price)) over(order by year(o.order_date), month(o.order_date)) as previous_month_revenue
from products p join order_items oi on p.product_id = oi.product_id
join orders o on oi.order_id = o.order_id
where o.order_status = 'Completed'
group by year(o.order_date), month(o.order_date);

-- QUERY HEADING 40: This query is used to select the ecommerce_analysis database before the monthly revenue analysis.
use ecommerce_analysis;

-- QUERY HEADING 41: This query is used to calculate month-over-month revenue growth percentage.
WITH monthly_revenue AS (
    SELECT
        YEAR(o.order_date) AS order_year,
        MONTH(o.order_date) AS order_month,
        SUM(oi.quantity * p.price) AS total_revenue
    FROM products p
    JOIN order_items oi
        ON p.product_id = oi.product_id
    JOIN orders o
        ON oi.order_id = o.order_id
    WHERE o.order_status = 'Completed'
    GROUP BY
        YEAR(o.order_date),
        MONTH(o.order_date)
), previous_month_revenue as 
(SELECT
    mr.order_year,
    mr.order_month,
    mr.total_revenue,
    LAG(total_revenue) OVER (
        ORDER BY order_year, order_month
    ) AS previous_month_revenue
FROM monthly_revenue mr
ORDER BY mr.order_year, mr.order_month)
select pr.order_year, pr.order_month, pr.total_revenue, pr.previous_month_revenue,
(((pr.total_revenue - pr.previous_month_revenue) / pr.previous_month_revenue) * 100.0) as revenue_growth_percentage
from previous_month_revenue pr 
order by pr.order_year, pr.order_month;

-- QUERY HEADING 42: This query is used to rank customers by total completed revenue.
with total_revenue as(
select c.customer_id, c.customer_name, sum(oi.quantity*p.price) as total_revenue 
from products p join order_items oi on p.product_id = oi.product_id
join orders o on oi.order_id = o.order_id
join customers c on o.customer_id = c.customer_id
where o.order_status = 'Completed'
group by c.customer_id, c.customer_name)
select customer_id, customer_name, total_revenue , 
rank() over(order by total_revenue desc) as customer_rank
from total_revenue;

-- QUERY HEADING 43: This query is used to rank products by revenue within each category.
with revenue_per_product as(
select p.category, p.product_id, p.product_name, sum(oi.quantity*p.price) as total_revenue
from products p join order_items oi on p.product_id = oi.product_id
join orders o on oi.order_id = o.order_id
where o.order_status = 'Completed'
group by p.category, p.product_id, p.product_name)
select category, product_name, total_revenue, 
rank() over(partition by category order by total_revenue desc) as product_rank
from revenue_per_product;

-- QUERY HEADING 44: This query is used to find the top three products by revenue within each category.
with revenue_per_product as(
select p.category, p.product_id, p.product_name, sum(oi.quantity*p.price) as total_revenue
from products p join order_items oi on p.product_id = oi.product_id
join orders o on oi.order_id = o.order_id
where o.order_status = 'Completed'
group by p.category, p.product_id, p.product_name), 
product_ranks as(
select category, product_name, total_revenue, 
rank() over(partition by category order by total_revenue desc) as product_rank
from revenue_per_product)
select category, product_name, total_revenue, product_rank 
from product_ranks 
where product_rank <= 3;

-- QUERY HEADING 45: This query is used to calculate cumulative monthly revenue.
WITH monthly_revenue AS (
    SELECT
        YEAR(o.order_date) AS order_year,
        MONTH(o.order_date) AS order_month,
        SUM(oi.quantity * p.price) AS total_revenue
    FROM products p
    JOIN order_items oi
        ON p.product_id = oi.product_id
    JOIN orders o
        ON oi.order_id = o.order_id
    WHERE o.order_status = 'Completed'
    GROUP BY
        YEAR(o.order_date),
        MONTH(o.order_date))
select order_year, order_month, total_revenue,
sum(total_revenue) over(order by order_year, order_month) as monthly_running_revenue
from monthly_revenue;

-- QUERY HEADING 46: This query is used to find each customer’s previous order date.
select c.customer_id, c.customer_name, o.order_id, o.order_date , 
lag(o.order_date) over(partition by c.customer_id order by o.order_date) as previous_order_date
from customers c join orders o on c.customer_id = o.customer_id;

-- QUERY HEADING 47: This query is used to calculate the number of days between consecutive customer orders.
with previous_order_dates as (
select c.customer_id, c.customer_name, o.order_id, o.order_date , 
lag(o.order_date) over(partition by c.customer_id order by o.order_date) as previous_order_date
from customers c join orders o on c.customer_id = o.customer_id)
select customer_id, customer_name, order_id, order_date, previous_order_date,
datediff(order_date, previous_order_date) as days_between_orders
from previous_order_dates;

-- QUERY HEADING 48: This query is used to find the first and second order dates for each customer.
with number_order_dates as (
select c.customer_id, c.customer_name, o.order_id, o.order_date , 
row_number() over(partition by c.customer_id order by o.order_date) as row_numbers
from customers c join orders o on c.customer_id = o.customer_id)
select customer_id, customer_name,
max(case when row_numbers = 1 then order_date end) as first_order_date,
max(case when row_numbers = 2 then order_date end) as second_order_date
from number_order_dates
group by customer_id, customer_name;

- QUERY HEADING 49: This query is used to calculate each category’s percentage contribution to total revenue.
WITH category_revenue AS (
    SELECT
        p.category,
        SUM(oi.quantity * p.price) AS total_revenue
    FROM products p
    JOIN order_items oi
        ON p.product_id = oi.product_id
    JOIN orders o
        ON oi.order_id = o.order_id
    WHERE o.order_status = 'Completed'
    GROUP BY p.category
)
SELECT
    category,
    total_revenue,
    (total_revenue / SUM(total_revenue) OVER ()) * 100
        AS revenue_percentage
FROM category_revenue;

-- QUERY HEADING 50: This query is used to find the month with the highest completed revenue.
select year(order_date) as order_year, month(order_date) as order_month,
sum(oi.quantity*p.price) as total_revenue from products p join order_items oi on p.product_id = oi.product_id
join orders o on oi.order_id = o.order_id
where o.order_status = 'Completed'
group by year(order_date), month(order_date)
order by total_revenue desc
limit 1;

-- QUERY HEADING 51: This query is used to calculate customer lifetime value based on completed revenue.
select c.customer_id, c.customer_name, sum(oi.quantity * p.price) as customer_lifetime_value
from products p join order_items oi on p.product_id = oi.product_id
join orders o on oi.order_id = o.order_id
join customers c on o.customer_id = c.customer_id
where o.order_status = 'Completed'
group by c.customer_id, c.customer_name
order by customer_lifetime_value desc;

-- QUERY HEADING 52: This query is used to calculate the average order value for each customer.
with order_value as(
select o.order_id, o.customer_id, sum(oi.quantity * p.price) as order_value
from products p join order_items oi on p.product_id = oi.product_id
join orders o on oi.order_id = o.order_id
where o.order_status = 'Completed'
group by o.order_id, o.customer_id)
select c.customer_id, c.customer_name , count(ov.order_id) as completed_orders,
avg(ov.order_value) as average_order_value 
from order_value ov
join customers c on ov.customer_id = c.customer_id
group by c.customer_id, c.customer_name;

-- QUERY HEADING 53: This query is used to find customers who purchased from more than one category.
with customer_product_category as(
select c.customer_id, c.customer_name , p.product_id, p.category
from products p join order_items oi on p.product_id = oi.product_id
join orders o on oi.order_id = o.order_id
join customers c on o.customer_id = c.customer_id
where o.order_status = 'Completed')
select customer_id, customer_name, count(distinct category) as categories_count
from customer_product_category
group by customer_id, customer_name
having count(distinct category) > 1;

-- QUERY HEADING 54: This query is used to find the most popular product in each category based on quantity sold.
with quantities_sold as(
select p.category, p.product_id, p.product_name, sum(oi.quantity) as quantity_sold 
from products p join order_items oi on p.product_id = oi.product_id
join orders o on oi.order_id = o.order_id
where o.order_status = 'Completed'
group by p.category, p.product_id, p.product_name),
numbered_quantity as (
select category, product_id, product_name, quantity_sold,
row_number() over(partition by category order by quantity_sold desc) as ranked_quantity
from quantities_sold)
select category, product_id, product_name, quantity_sold 
from numbered_quantity
where ranked_quantity = 1
order by category;

-- QUERY HEADING 55: This query is used to calculate the revenue contribution of repeat customers.
with repeat_customers as(
select customer_id, count(order_id) as completed_orders
from orders 
where order_status = 'Completed'
group by customer_id
having count(order_id) > 1), 
revenue as (
select rc.customer_id, sum(oi.quantity*p.price) as total_revenue
from repeat_customers rc join orders o on rc.customer_id = o.customer_id
join order_items oi on o.order_id = oi.order_id
join products p on oi.product_id = p.product_id
WHERE o.order_status = 'Completed'
group by rc.customer_id)
select sum(total_revenue) as repeat_customers_revenue,
(sum(total_revenue) / (select sum(oi.quantity * p.price) from products p join order_items oi on p.product_id = oi.product_id
						join orders o on oi.order_id = o.order_id where o.order_status = 'Completed')) * 100.0 
                        as repeat_customer_revenue_percentage
from revenue;