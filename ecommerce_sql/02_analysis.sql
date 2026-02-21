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
	,sum(oi.price) AS revenue
	,ROUND(
        100.0 * SUM(oi.total)
        / SUM(SUM(oi.total)) OVER (), 2
    ) AS revenue_share_pct
FROM order_items oi
LEFT JOIN products p ON oi.product_id = p.product_id 
GROUP BY p.category
ORDER BY revenue DESC
;


-- 2.Ціна і знижки. 
-- Мета: Як знижки впливають на обсяг продажів і виручку по ключових категоріях?

  
