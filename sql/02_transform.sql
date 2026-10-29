CREATE OR REPLACE VIEW public.supply_chain_analytics AS
SELECT
    NULLIF(order_id, '')::bigint AS order_id,
    NULLIF(customer_id, '')::bigint AS customer_id,
    NULLIF(product_id, '')::bigint AS product_id,
    category_name,
    product_name,
    market,
    order_region,
    customer_segment,
    shipping_mode,
    delivery_status,
    NULLIF(late_delivery_risk, '')::integer AS late_delivery_risk,
    NULLIF(order_date, '')::timestamp AS order_date,
    NULLIF(shipping_date, '')::timestamp AS shipping_date,
    NULLIF(actual_shipping_days, '')::numeric AS actual_shipping_days,
    NULLIF(scheduled_shipping_days, '')::numeric AS scheduled_shipping_days,
    NULLIF(REPLACE(sales, ',', ''), '')::numeric AS sales,
    NULLIF(REPLACE(profit, ',', ''), '')::numeric AS profit,
    NULLIF(quantity, '')::numeric AS quantity,
    NULLIF(REPLACE(product_price, ',', ''), '')::numeric AS product_price,
    NULLIF(REPLACE(discount, ',', ''), '')::numeric AS discount
FROM public.supply_chain_raw;
