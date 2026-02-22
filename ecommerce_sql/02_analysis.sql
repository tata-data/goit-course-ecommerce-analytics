-- 1. Продуктова структура
-- Мета:  Визначити найпопулярнішу категорію товарів.

-- 1.1 Топ за кількістю транзакцій
SELECT
	p.category
  ,COUNT(DISTINCT oi.order_id) AS orders_count
	,ROUND(
    100.0 * COUNT(DISTINCT oi.order_id)
    / SUM(COUNT(DISTINCT oi.order_id)) OVER (), 2
) AS orders_share_pct
FROM order_items oi
LEFT JOIN products p ON oi.product_id = p.product_id 
GROUP BY p.category
ORDER BY orders_count DESC
;

-- 1.2 Топ за виручкою.
SELECT
    p.category
    ,SUM(oi.total) AS revenue
    ,ROUND(
        100.0 * SUM(oi.total)
        / SUM(SUM(oi.total)) OVER (), 2
    ) AS revenue_share_pct
FROM order_items oi
LEFT JOIN products p ON oi.product_id = p.product_id 
GROUP BY p.category
ORDER BY revenue DESC
;


-- 2. Середні чеки та знижка.

-- 2.1 AOV - Average Order Value
SELECT
	ROUND(
		SUM(total) / COUNT(DISTINCT order_id), 
		2
	) AS average_check
FROM order_items
;

-- 2.2 ARPU - Average Revenue Per User
SELECT
	ROUND(
		SUM(total) / COUNT(DISTINCT o.user_id), 
		2
	) AS avg_revenue_per_user
FROM order_items oi
INNER JOIN orders o
	ON o.order_id = oi.order_id 
;

--  2.3 Як знижки впливають на обсяг продажів?
WITH discounts AS (
    SELECT
        oi.order_id
        ,oi.product_id
        ,oi.quantity
        ,oi.total
        ,p.category
        ,CASE
	        WHEN CAST(REPLACE(oi.discount, '%', '') AS REAL) = 0
                THEN 'no_discount'
            WHEN CAST(REPLACE(oi.discount, '%', '') AS REAL) BETWEEN 1 AND 5 
            	THEN 'low_discount'
            WHEN CAST(REPLACE(oi.discount, '%', '') AS REAL) BETWEEN 6 AND 15 
            	THEN 'medium_discount'
 			WHEN CAST(REPLACE(oi.discount, '%', '') AS REAL) > 15 
 				THEN 'high_discount'
        END AS discount_type
    FROM order_items oi
    LEFT JOIN products p
        ON oi.product_id = p.product_id
)
SELECT
    category
    ,discount_type
    ,COUNT(DISTINCT order_id) AS orders_count
    ,SUM(quantity) AS items_qty
    ,SUM(total) AS revenue
    ,AVG(quantity)  AS avg_quantity
FROM discounts
GROUP BY
    category
    ,discount_type
ORDER BY
    category
    ,discount_type;



-- 3 Хто приносить більше виручки: нові чи повторні клієнти?
WITH user_orders_numbered AS (
    SELECT
        user_id
        ,order_id
        ,order_date
        ,ROW_NUMBER() OVER (
            PARTITION BY user_id
            ORDER BY order_date
        ) AS order_number
    FROM orders
),
customer_type_orders AS (
    SELECT
        uon.order_id
        ,uon.user_id
        ,uon.order_date
        ,oi.total,
        CASE
            WHEN uon.order_number = 1 THEN 'new'
            ELSE 'repeat'
        END AS customer_type
    FROM user_orders_numbered uon
    JOIN order_items oi
        ON oi.order_id = uon.order_id
)
SELECT
    customer_type
    ,SUM(total) AS revenue
FROM customer_type_orders
GROUP BY
    customer_type;



-- 4. Географія.

-- 4.1 з яких країн найбільше користувачів


-- 4.2 з яких країн найбільше грошей


-- 4.3 порівняти середній чек по країнах (AOV)
