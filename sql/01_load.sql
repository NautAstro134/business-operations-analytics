DROP TABLE IF EXISTS public.supply_chain_raw CASCADE;

CREATE TABLE public.supply_chain_raw (
    order_id text,
    customer_id text,
    product_id text,
    category_name text,
    product_name text,
    market text,
    order_region text,
    customer_segment text,
    shipping_mode text,
    delivery_status text,
    late_delivery_risk text,
    order_date text,
    shipping_date text,
    actual_shipping_days text,
    scheduled_shipping_days text,
    sales text,
    profit text,
    quantity text,
    product_price text,
    discount text
);

\copy public.supply_chain_raw FROM 'data/processed/dataco_analytics_safe.csv' WITH (FORMAT csv, HEADER true, ENCODING 'UTF8');
