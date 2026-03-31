# 🛒 E-Commerce Performance Analysis
> **Stack:** SQL Server · Power BI · Python  
> **Period:** March 2012 – March 2015 (Q1)
> **Prepared by:** Dung Nguyen

---

## 📌 Project Overview

This project analyzes the business performance of a toy e-commerce company across **3 years of transactional data**. The analysis covers revenue trends, product performance, refund risks, and cross-sell opportunities — delivered through an interactive Power BI dashboard and a structured business report.

### Key Numbers at a Glance

| Metric | Value |
|---|---|
| Total Revenue | $1,938,510 |
| Total Gross Profit | $1,220,000+ |
| Gross Margin % | 62.74% |
| Total Units Sold | 40,025 |
| Total Website Sessions | 472,871 |
| Overall Refund Rate | 4.32% |

---

## 🗂️ Repository Structure

```
ecommerce-analysis-sql-powerbi/
│
├── 📄 README.md
│
├── 📂 SQL views/
│   ├── Create Views.sql              # 4 CREATE VIEW statements (with comments)
│   ├── vw_product_sales.csv          # Revenue, COGS, margin by product/month
│   ├── vw_product_refunds.csv        # Refund count & rate by product/month
│   ├── vw_crosssell.csv              # Cross-sell pairs analysis
│   └── vw_product_pageviews.csv      # Product page traffic with UTM breakdown
│
├── 📄 Ecommerce Dashboard Project.pdf   # Power BI dashboard export (2 pages)
├── 📄 [Report][Ecommerce_Analysis].pdf  # Business analysis report (10 pages)
└── 📦 [Dataset][Ecom 2] Ecommerce 2.zip # Raw source data (6 tables)
```

> 📎 **Power BI file (.pbix):** Too large for GitHub — [Download from Google Drive](https://drive.google.com/file/d/1LOHNqtu1fKs4epHjyDKvZLlYBAJV7P-e/view?usp=sharing)

---

## 🗃️ Data Schema

| Table | Rows | Description |
|---|---|---|
| `orders` | 32,313 | Order-level summary |
| `order_items` | 40,025 | Product-level detail per order |
| `order_item_refunds` | 1,731 | Refund transactions |
| `products` | 4 | Product catalog |
| `website_sessions` | 472,871 | User visit sessions |
| `website_pageviews` | 1,048,575 | Page-level traffic |

---

## 🔧 SQL Views

Four views were created in SQL Server as the data layer for Power BI:

| View | Purpose |
|---|---|
| `vw_product_sales` | Revenue, COGS, gross profit & margin % by product/month |
| `vw_product_refunds` | Refund count & refund rate % by product/month |
| `vw_crosssell` | Cross-sell pairs — products frequently bought together |
| `vw_product_pageviews` | Product page traffic with UTM source, campaign & device type |

---

## 📊 Dashboard (Power BI — 2 Pages)

> 📎 **[Download Interactive Dashboard (.pbix)](https://drive.google.com/file/d/1LOHNqtu1fKs4epHjyDKvZLlYBAJV7P-e/view?usp=sharing)**  
> 📄 Static export: `Ecommerce Dashboard Project.pdf`

### Page 1 — Detail
Focused on product-level performance with filters by Year and Product Name.

### Page 2 — Overview
Focused on traffic, marketing sources, and conversion performance.


### DAX Measures

| Measure | Formula Logic |
|---|---|
| `Total Revenue` | `Total Gross Profit` | `Gross Margin %` |
| `Total Units Sold` | `Overall Refund Rate %` | `Primary Orders` |
| `Product Conversion Rate %` | `Refund Rate %` | `Total Sessions` |
| `Product Page Views` |

---

## 💡 Key Insights

- **Revenue grew 8x** in 3 years — from $129K (2012) to $1.08M (2014), with Q1 2015 already at $340K (+78.4% vs Q1 2014)
- **Gross margin improved** steadily from 61.0% (2012) to 63.4% (Q1 2015), reflecting economy of scale
- **The Original Mr. Fuzzy** dominates with 62.5% of total revenue but carries the highest refund rate (5.11%)
- **The Hudson River Mini bear** (launched Feb 2014) is the standout performer — lowest refund rate (1.28%), highest conversion rate (22.26%), and 68.4% margin
- **The Birthday Sugar Panda** has the highest margin (68.5%) but also the highest refund rate (6.04%) — needs investigation
- **Refund rate is trending down** from 6.54% (2012) to 3.63% (Q1 2015), signaling improving product quality
- **Cross-sell rate** reached 23.9% of all orders containing multiple items
- **Desktop consistently outperforms mobile** in session volume; gsearch is the dominant traffic source

---

## 🛠️ Tools & Technologies

| Tool | Usage |
|---|---|
| SQL Server (SSMS) | Data storage, CREATE VIEW, query analysis |
| Power BI Desktop | Dashboard design, DAX measures, data modeling |

---

## 👤 Author

**Dung Nguyen**  
Aspiring Data Analyst  
[dungnguyenbo@gmail.com](mailto:dungnguyenbo@gmail.com)  
[github.com/dg-ng](https://github.com/dg-ng)
