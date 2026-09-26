# E-Commerce SQL + Power BI Dataset — Version 2

Version 2 keeps the same tables, columns, products, order items, order dates, payment methods, statuses, and overall order/revenue totals as Version 1, but improves customer behavior.

## Files
- customers.csv — 100 customers
- products.csv — 50 products
- orders.csv — 1,000 orders
- order_items.csv — 2,479 order-item rows
- 01_database_setup.sql — MySQL setup script

## Version 2 changes
- Completed-order customer frequency is redesigned into: 35 one-time customers, 30 low-frequency repeat customers, 25 medium-frequency repeat customers, and 10 high-frequency repeat customers.
- Customer signup dates are regenerated so each customer signs up before their first order.
- Product catalog and order-item quantities are unchanged, so overall product-level revenue remains comparable to Version 1.
- Existing SQL table/column names remain unchanged, so the current SQL queries and Power BI model can be reused.
