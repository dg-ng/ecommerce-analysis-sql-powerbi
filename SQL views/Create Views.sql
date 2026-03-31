-- VIEW 1: vw_product_sales
CREATE VIEW vw_product_sales AS
SELECT p.product_id,
	p.product_name,
    YEAR(oi.created_at)                                      AS year,
    MONTH(oi.created_at)                                     AS month,
    FORMAT(oi.created_at, 'yyyy-MM')                         AS year_month,
    COUNT(oi.order_item_id)                                  AS units_sold,
    ROUND(SUM(oi.price_usd), 2)                              AS revenue,
    ROUND(SUM(oi.cogs_usd), 2)                               AS cogs,
    ROUND(SUM(oi.price_usd - oi.cogs_usd), 2)               AS gross_profit,
    ROUND(SUM(oi.price_usd - oi.cogs_usd)
          / NULLIF(SUM(oi.price_usd), 0) * 100, 1)          AS margin_pct
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_id,
    p.product_name,
    YEAR(oi.created_at),
    MONTH(oi.created_at),
    FORMAT(oi.created_at, 'yyyy-MM');


-- VIEW 2: vw_product_refunds
CREATE VIEW vw_product_refunds AS
SELECT p.product_id,
    p.product_name,
    FORMAT(oi.created_at, 'yyyy-MM')             AS year_month,
    COUNT(oi.order_item_id)                      AS units_sold,
    COUNT(r.order_item_refund_id)                AS refund_count,
    ROUND(CAST(COUNT(r.order_item_refund_id) AS FLOAT)/NULLIF(COUNT(oi.order_item_id), 0) * 100, 2)           AS refund_rate_pct
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
LEFT JOIN order_item_refunds r
    ON oi.order_item_id = r.order_item_id
GROUP BY p.product_id,
    p.product_name,
    FORMAT(oi.created_at, 'yyyy-MM');


-- VIEW 3: vw_crosssell
CREATE VIEW vw_crosssell AS
SELECT p1.product_name               AS primary_product,
    p2.product_name                  AS crosssell_product,
    COUNT(*)                         AS times_bought_together,
    ROUND(COUNT(*) * 100.0 / NULLIF((SELECT COUNT(*) FROM orders WHERE items_purchased >= 2), 0), 2)       AS pct_of_multi_orders
FROM orders o
JOIN order_items oi1
    ON o.order_id = oi1.order_id AND oi1.is_primary_item = 1
JOIN order_items oi2
    ON o.order_id = oi2.order_id AND oi2.is_primary_item = 0
JOIN products p1 ON oi1.product_id = p1.product_id
JOIN products p2 ON oi2.product_id = p2.product_id
GROUP BY p1.product_name, p2.product_name;


-- VIEW 4: vw_product_pageviews
CREATE VIEW vw_product_pageviews AS
SELECT ws.website_session_id,
    FORMAT(CAST(ws.created_at AS DATETIME), 'yyyy-MM') AS year_month,
    ws.utm_source,
    ws.utm_campaign,
    ws.device_type,
    wp.pageview_url,
    CASE 
        WHEN wp.pageview_url = '/the-original-mr-fuzzy'       THEN 1
        WHEN wp.pageview_url = '/the-forever-love-bear'        THEN 2
        WHEN wp.pageview_url = '/the-birthday-sugar-panda'     THEN 3
        WHEN wp.pageview_url = '/the-hudson-river-mini-bear'   THEN 4
    END AS product_id,
    CASE 
        WHEN wp.pageview_url = '/the-original-mr-fuzzy'       THEN 'The Original Mr. Fuzzy'
        WHEN wp.pageview_url = '/the-forever-love-bear'        THEN 'The Forever Love Bear'
        WHEN wp.pageview_url = '/the-birthday-sugar-panda'     THEN 'The Birthday Sugar Panda'
        WHEN wp.pageview_url = '/the-hudson-river-mini-bear'   THEN 'The Hudson River Mini bear'
    END AS product_name
FROM website_sessions ws
JOIN website_pageviews wp 
    ON ws.website_session_id = wp.website_session_id
WHERE wp.pageview_url IN ('/the-original-mr-fuzzy','/the-forever-love-bear', '/the-birthday-sugar-panda','/the-hudson-river-mini-bear'
)
