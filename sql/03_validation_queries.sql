-- KPI validation
SELECT ROUND(SUM(NULLIF(REPLACE("Sales", ',', ''), '')::numeric), 2) AS total_sales, ROUND(SUM(NULLIF(REPLACE("Order Profit Per Order", ',', ''), '')::numeric), 2) AS total_profit, COUNT(*) FILTER (WHERE "Late_delivery_risk" = '1') AS late_deliveries, COUNT(DISTINCT "Order Id") AS orders, COUNT(DISTINCT "Customer Id") AS customers, COUNT(DISTINCT "Product Card Id") AS products FROM public.supply_chain_raw;

-- Sales and profit by market
SELECT "Market", ROUND(SUM(NULLIF(REPLACE("Sales", ',', ''), '')::numeric), 2) AS sales, ROUND(SUM(NULLIF(REPLACE("Order Profit Per Order", ',', ''), '')::numeric), 2) AS profit FROM public.supply_chain_raw GROUP BY "Market" ORDER BY sales DESC;

-- Sales by category
SELECT "Category Name", ROUND(SUM(NULLIF(REPLACE("Sales", ',', ''), '')::numeric), 2) AS sales FROM public.supply_chain_raw GROUP BY "Category Name" ORDER BY sales DESC;

-- Late-delivery rate by shipping mode
SELECT "Shipping Mode", COUNT(*) AS shipments, ROUND(100.0 * COUNT(*) FILTER (WHERE "Late_delivery_risk" = '1') / COUNT(*), 2) AS late_delivery_rate_pct FROM public.supply_chain_raw GROUP BY "Shipping Mode" ORDER BY late_delivery_rate_pct DESC;

-- Monthly sales trend
SELECT DATE_TRUNC('month', "order date (DateOrders)"::timestamp)::date AS month, ROUND(SUM(NULLIF(REPLACE("Sales", ',', ''), '')::numeric), 2) AS sales FROM public.supply_chain_raw GROUP BY 1 ORDER BY 1;
