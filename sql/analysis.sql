--Query to rank customers by total_profit generated.how would you handle ties in profit
SELECT 
customer_name,
ROUND(SUM(profit),0) as total_profit, 
DENSE_RANK() OVER (ORDER BY sum(profit)  DESC )
FROM sales
GROUP BY customer_name
LIMIT 5
;

--top selling product by region
SELECT 
Product_name,
state,
sum(sales),
DENSE_RANK() OVER (PARTITION BY state ORDER BY sum(sales) DESC) rankked
FROM sales
GROUP BY product_name,state
HAVING DENSE_RANK() OVER (PARTITION BY state ORDER BY sum(sales) DESC) <=5 ;

--profit margins 
ALTER TABLE sales 
ADD margins NUMERIC(15,6);

ALTER TABLE sales 
RENAME COLUMN sales TO revenue; 

UPDATE sales 
SET margins= ROUND(profit/revenue,0)
WHERE margins is null;

SELECT 
order_id,
AVG(margins) G
FROM sales 
GROUP BY order_id 
ORDER BY G DESC ; 

-- running total of sales 
SELECT 
ship_mode,
revenue,
round(avg(revenue) OVER (PARTITION BY ship_mode ORDER BY revenue desc),2)
FROM 
sales
GROUP BY ship_mode,revenue;

--the average profit 
SELECT 
customer_name, 
revenue,
SUM(revenue) OVER (PARTITION BY customer_name ORDER BY revenue DESC)
FROM 
sales 
GROUP BY customer_name,revenue;

--Customer purchase frequency 
SELECT DISTINCT(COUNT(order_id)) FROM sales;
SELECT 
customer_name, 
MONTH(order_date),
COUNT(order_id), 
LEAD(COUNT(order_id)) OVER (ORDER BY COUNT(order_id))
FROM 
sales
GROUP BY customer_name,MONTH(order_date)
HAVING COUNT(order_id) > 1;

--Percentile ranking 
SELECT 
product_name, 
SUM(revenue),
NTILE OVER (ORDER BY SUM(revenue) DESC)
FROM 
sales 
GROUP BY product_name;

--Subqueries & CTEs
WITH rex AS (
SELECT 
customer_name,
product_id,
Product_name 
FROM 
sales 
) 
SELECT 
r.customer_name, 
r.product_name,
s.customer_name, 
s.product_name, 
s.product_id
FROM 
sales s
INNER JOIN rex r
on r.product_name=s.product_name
;  
--- highest average sub-category
WITH JEK AS ( 
SELECT 
sub_category, 
SUM(profit) AS t
FROM 
sales
GROUP BY sub_category 
)
SELECT 
* 
FROM
JEK 
ORDER BY t DESC 
LIMIT 1; 

-- Orders above-average sales 
SELECT 
customer_name,
product_name, 
revenue
FROM 
sales 
WHERE revenue >
(SELECT avg(revenue) FROM sales) ;

-- the delay of shipping 
ALTER TABLE sales
ADD COLUMN delay date;

UPDATE sales 
SET delay=Ship_date-order_date;

SELECT 
EXTRACT(YEAR FROM order_date))
FROM 
sales;




SELECT * FROM sales;