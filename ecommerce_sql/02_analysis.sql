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




  
