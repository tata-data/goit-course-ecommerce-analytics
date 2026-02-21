CREATE TABLE Users AS
SELECT
	DISTINCT user_id
FROM 
	ecommerce_dataset
;


CREATE TABLE Orders AS
SELECT
	DISTINCT order_id
	,user_id
	,order_date
	,payment_method
	,delivery_status
	,device
	,country
FROM 
	ecommerce_dataset
;


CREATE TABLE Order_items AS
SELECT
	product_id
	,order_id
	,quantity
	,discount
	,price
	,total
FROM 
	ecommerce_dataset
;


CREATE TABLE Products AS
SELECT
	DISTINCT product_id
	,category
FROM 
	ecommerce_dataset
;
