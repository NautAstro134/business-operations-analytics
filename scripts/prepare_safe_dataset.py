"""Create an analytics-safe DataCo CSV without direct customer PII."""

import csv
from pathlib import Path

SOURCE = Path("data/raw/DataCoSupplyChainDataset.csv")
OUTPUT = Path("data/processed/dataco_analytics_safe.csv")

FIELD_MAP = {
    "Order Id": "order_id",
    "Customer Id": "customer_id",
    "Product Card Id": "product_id",
    "Category Name": "category_name",
    "Product Name": "product_name",
    "Market": "market",
    "Order Region": "order_region",
    "Customer Segment": "customer_segment",
    "Shipping Mode": "shipping_mode",
    "Delivery Status": "delivery_status",
    "Late_delivery_risk": "late_delivery_risk",
    "order date (DateOrders)": "order_date",
    "shipping date (DateOrders)": "shipping_date",
    "Days for shipping (real)": "actual_shipping_days",
    "Days for shipment (scheduled)": "scheduled_shipping_days",
    "Sales": "sales",
    "Order Profit Per Order": "profit",
    "Order Item Quantity": "quantity",
    "Order Item Product Price": "product_price",
    "Order Item Discount": "discount",
}

if not SOURCE.exists():
    raise FileNotFoundError(
        f"Dataset not found: {SOURCE.resolve()}\n"
        "Download DataCoSupplyChainDataset.csv and place it at data/raw/."
    )

OUTPUT.parent.mkdir(parents=True, exist_ok=True)

with SOURCE.open("r", encoding="utf-8-sig", newline="") as source_file:
    reader = csv.DictReader(source_file)
    missing = sorted(set(FIELD_MAP).difference(reader.fieldnames or []))
    if missing:
        raise ValueError(f"Missing expected source columns: {missing}")

    with OUTPUT.open("w", encoding="utf-8", newline="") as output_file:
        writer = csv.DictWriter(output_file, fieldnames=list(FIELD_MAP.values()))
        writer.writeheader()
        row_count = 0
        for source_row in reader:
            writer.writerow({
                safe_name: source_row[source_name]
                for source_name, safe_name in FIELD_MAP.items()
            })
            row_count += 1

print(f"Wrote {row_count:,} analytics-safe rows to {OUTPUT.resolve()}")
