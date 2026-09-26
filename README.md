# E-Commerce Sales & Customer Analytics | SQL + Power BI

An end-to-end **E-Commerce Sales and Customer Analytics** project using **SQL and Power BI** to analyze sales performance, customer behavior, product performance, order trends, payment methods, and revenue growth.

The project covers the complete workflow from **SQL-based data analysis and business queries to an interactive Power BI dashboard**.

---

## 📌 Project Overview

This project analyzes an e-commerce dataset containing customers, products, orders, and order-item information.

The analysis focuses on answering important business questions such as:

* What is the overall revenue generated?
* How many orders were completed, cancelled, and pending?
* Which product categories generate the most revenue?
* Which products have the highest sales quantity and revenue?
* Who are the highest-value customers?
* What is the average order value?
* Which customers are repeat customers?
* Which payment methods contribute the most revenue?
* How does revenue change month over month?
* How are completed orders distributed across months?
* What is the running total of revenue?
* Which cities contribute to revenue?

---

## 🛠️ Tools & Technologies

* **SQL**

  * Data exploration
  * Joins
  * Aggregations
  * GROUP BY / HAVING
  * Subqueries
  * CTEs
  * Window Functions
  * Ranking
  * Revenue calculations
  * Month-over-month analysis

* **Microsoft Power BI**

  * Data modeling
  * DAX measures
  * Interactive dashboards
  * KPI Cards
  * Bar Charts
  * Line Charts
  * Donut Charts
  * Tables
  * Map Visualizations

---

## 📂 Dataset

The project uses four main tables:

| Table         | Description                                           |
| ------------- | ----------------------------------------------------- |
| `customers`   | Customer information                                  |
| `products`    | Product, category, and price information              |
| `orders`      | Order date, status, customer, and payment information |
| `order_items` | Products and quantities associated with each order    |

The dataset contains:

* **100 customers**
* **50 products**
* **1K orders**
* Completed, cancelled, and pending orders
* Multiple product categories
* Multiple payment methods

---

## 🗃️ SQL Analysis

The `SQL queries.sql` file contains the SQL analysis performed throughout the project.

The queries cover:

### Customer Analysis

* Customer counts
* Customer spending
* Customer lifetime value
* Average order value
* Repeat customer identification
* Customer category purchasing behavior
* Customer revenue contribution

### Product Analysis

* Product quantities sold
* Product revenue
* Category-level performance
* Top-selling products
* Top-revenue products
* Average product price

### Order Analysis

* Completed orders
* Cancelled orders
* Pending orders
* Order status analysis
* Monthly order trends
* Payment method analysis

### Revenue Analysis

* Total revenue
* Monthly revenue
* Revenue by category
* Revenue by payment method
* Running total revenue
* Revenue growth
* Repeat-customer revenue contribution

### Advanced SQL Concepts

The project also uses:

* `JOIN`
* `GROUP BY`
* `HAVING`
* `CASE`
* Subqueries
* CTEs
* `ROW_NUMBER()`
* Window functions
* Aggregations
* Percentage calculations
* Ranking and partitioning

---

## 📊 Power BI Dashboard

The Power BI report contains four analytical pages.

### 1. Executive Overview

Provides a high-level view of business performance.

**KPIs:**

* Total Revenue
* Completed Orders
* Total Customers
* Average Order Value
* Cancelled Percentage

**Visualizations:**

* Monthly Revenue Trend
* Revenue by Category
* Revenue by Payment Method
* Orders by Status

---

### 2. Product & Category Analysis

Analyzes product and category performance.

**KPIs:**

* Total Products
* Total Quantity Sold

**Visualizations:**

* Average Product Price by Category
* Revenue Contribution by Category
* Top 10 Products by Quantity Sold
* Top 10 Products by Revenue

---

### 3. Customer Analysis

Provides insights into customer value and behavior.

**KPIs:**

* Repeat Customers
* Repeat Customer %

**Visualizations:**

* Top 10 Customers by Lifetime Value
* Top 10 Customers by Revenue
* Top 10 Customers by Average Order Value
* Revenue by City

---

### 4. Order & Sales Trends

Focuses on order activity and revenue trends over time.

**KPIs:**

* Total Orders
* Cancelled Orders
* Total Revenue

**Visualizations:**

* Revenue by Payment Method
* Monthly Completed Orders
* Running Total Revenue by Year Month
* Revenue Growth % by Year Month

---

## 📈 Key Metrics

The final Power BI dashboard provides metrics including:

| Metric               |  Value |
| -------------------- | -----: |
| Total Revenue        |  9.74M |
| Completed Orders     |    864 |
| Total Customers      |    100 |
| Average Order Value  | 11.27K |
| Cancelled Orders     |     76 |
| Cancelled Percentage |  7.60% |
| Total Products       |     50 |
| Total Quantity Sold  |     5K |
| Repeat Customers     |     65 |

---

## 📷 Dashboard Preview

Screenshots of the Power BI dashboards are available in the `Screenshots/` folder.

The dashboard includes:

* Executive Overview
* Product & Category Analysis
* Customer Analysis
* Order & Sales Trends

---

## 📁 Repository Structure

```text
SQL-POWERBI-ecommerce-data-analysis/
│
├── Dataset/
│   ├── customers
│   ├── products
│   ├── orders
│   └── order_items
│
├── Screenshots/
│   ├── Executive Overview
│   ├── Product & Category Analysis
│   ├── Customer Analysis
│   └── Order & Sales Trends
│
├── PowerBI analysis.pbix
│
├── SQL queries.sql
│
└── README.md
```

---

## 🔍 Project Workflow

```text
E-Commerce Dataset
        ↓
Data Exploration
        ↓
SQL Analysis
        ↓
Business Questions
        ↓
Data Modeling
        ↓
DAX Measures
        ↓
Power BI Dashboard
        ↓
Business Insights
```

---

## 🎯 Business Skills Demonstrated

This project demonstrates practical skills in:

* SQL data analysis
* Relational data understanding
* Data modeling
* Business KPI development
* Customer analytics
* Sales analytics
* Revenue analysis
* Product performance analysis
* Time-series analysis
* DAX
* Power BI dashboard development
* Data visualization
* Translating business questions into analytical queries

---

## 👨‍💻 Project Author

**Krithiga V**


`SQL` `Power BI` `DAX` `Data Analysis` `Data Visualization`
