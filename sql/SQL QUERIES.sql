-- CREATE TABLE sales_data(
-- Row_ID INTEGER,
-- Order_ID VARCHAR,
-- My_Formatted_OrderDate DATE,
-- OrderMonth INTEGER,
-- OrderYear INTEGER,
-- My_Formatted_ShipDate DATE,
-- ShippedMonth INTEGER,
-- ShippedYear INTEGER,
-- Ship_Mode TEXT,
-- Customer_ID VARCHAR,
-- Customer_Name TEXT,
-- Segment TEXT,
-- Country TEXT,
-- City TEXT,
-- State TEXT,
-- Postal_Code INTEGER,
-- Region TEXT,
-- Product_ID VARCHAR,
-- Category TEXT,
-- Sub_Category TEXT,
-- Product_Name TEXT,
-- Sales DECIMAL

-- )



-- select * from sales_data limit 10;
-- select count(*) from  sales_data where sales is NULL;
-- select distinct count (*) from sales_data;
-- select * from sales_data where sales <=0

-- TOTAL SALES
-- select sum(sales) as total_sales from sales_data;

-- TOTAL SALES BY YEAR
-- select orderyear, sum(sales) as total_sales from sales_data
-- GROUP BY orderyear order by orderyear asc;

-- TOP 10 PRODUCTS SOLD
-- select product_name, sum(sales) as total_sales_by_product
-- from sales_data GROUP BY product_name ORDER BY 
-- total_sales_by_product DESC LIMIT 10;

-- SALES BY REGION
-- select region,sum(sales) as sales_by_region
-- from sales_data GROUP BY region ORDER BY sales_by_region
-- DESC

-- CREATE A PROFIT COLUMN AND ADD DATA
-- ALTER TABLE sales_data ADD COLUMN profit NUMERIC;
-- ALTER TABLE sales_data DROP COLUMN profit;
-- UPDATE sales_data
-- SET profit =
-- CASE
-- WHEN  category = 'Furniture' THEN sales*0.15
-- WHEN category ='Technology' THEN sales*0.25
-- WHEN category = 'Office Supplies' THEN sales* 0.20
-- ELSE sales*0.18
-- END;

-- CREATING VIEWS
-- 1.SALES TREND (TIME SERIES)
-- CREATE VIEW  sales_trend AS
-- SELECT my_formatted_orderdate,
-- SUM(sales) as total_sales,
-- SUM(profit) as total_profit
-- from sales_data GROUP BY my_formatted_orderdate
-- ORDER BY my_formatted_orderdate;

-- select a.orderyear, count(b.my_formatted_orderdate)
-- as count_of_sales,
-- sum(a.sales) as sales_per_year from 
-- sales_data as a inner join sales_trend as b 
-- using(my_formatted_orderdate)
-- group by orderyear order by orderyear;
-- conclusion:even when the count of sales increase from 2015 to 2016
-- the total amount in sales decreases


-- 2.SALES BY REGION
-- CREATE VIEW sales_by_region AS 
-- select region, sum(sales) as total_sales,
-- sum(profit) as total_profit from sales_data
-- group by region order by total_sales desc;
-- select * from sales_by_region;

-- 3.TOP PRODUCTS
-- CREATE VIEW top_products as
-- SELECT product_name, sum(sales) as total_sales,
-- sum(profit) as total_profit from sales_data
-- group by product_name
-- order by total_sales desc
-- limit 10;
-- select * from top_products;

-- 4.SALES BY CUSTOMER
-- CREATE VIEW sales_by_customers AS
-- SELECT customer_name, sum(sales) as total_sales,
-- sum(profit) as total_profit from sales_data
-- group by customer_name
-- order by total_sales desc;
-- select * from sales_by_customers;

-- 5. SALES BY CATEGORY
-- CREATE VIEW sales_by_category AS
-- SELECT 
--     category,
--     SUM(sales) AS total_sales,
--     SUM(profit) AS total_profit
-- FROM sales_data
-- GROUP BY category;
-- select * from sales_by_category;
