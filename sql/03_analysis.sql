-- Headline dashboard metrics
SELECT
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    COUNT(*) FILTER (WHERE late_delivery_risk = 1) AS late_deliveries,
    COUNT(DISTINCT order_id) AS orders,
    COUNT(DISTINCT customer_id) AS customers,
    COUNT(DISTINCT product_id) AS products
FROM public.supply_chain_analytics;

-- Sales and profit by market
SELECT
    market,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM public.supply_chain_analytics
GROUP BY market
ORDER BY total_sales DESC;

-- Sales by category
SELECT
    category_name,
    ROUND(SUM(sales), 2) AS total_sales
FROM public.supply_chain_analytics
GROUP BY category_name
ORDER BY total_sales DESC;

-- Late-delivery rate by shipping mode
SELECT
    shipping_mode,
    COUNT(*) AS shipments,
    COUNT(*) FILTER (WHERE late_delivery_risk = 1) AS late_shipments,
    ROUND(
        100.0 * COUNT(*) FILTER (WHERE late_delivery_risk = 1)
        / NULLIF(COUNT(*), 0),
        2
    ) AS late_delivery_rate_pct
FROM public.supply_chain_analytics
GROUP BY shipping_mode
ORDER BY late_delivery_rate_pct DESC;

-- Monthly sales trend
SELECT
    DATE_TRUNC('month', order_date)::date AS month,
    ROUND(SUM(sales), 2) AS total_sales
FROM public.supply_chain_analytics
GROUP BY 1
ORDER BY 1;

-- Source-quality checks
SELECT
    COUNT(*) AS row_count,
    COUNT(*) FILTER (WHERE order_id IS NULL) AS missing_order_ids,
    COUNT(*) FILTER (WHERE sales IS NULL) AS missing_sales,
    COUNT(*) FILTER (WHERE profit IS NULL) AS missing_profit,
    MIN(order_date) AS first_order_date,
    MAX(order_date) AS last_order_date
FROM public.supply_chain_analytics;
