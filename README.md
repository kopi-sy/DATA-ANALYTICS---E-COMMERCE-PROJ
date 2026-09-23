# E-Commerce Product Recommendation & Customer Segmentation

> Data Analytics Bootcamp team project

## Objective
Understand customer purchasing behavior and recommend relevant products using customer purchase history, product information, ratings, purchase frequency and spending.

## Project Modules
- **Excel:** Customer sales analysis, product performance and RFM calculations
- **SQL:** RFM metrics, purchase history, top products, repeat customers, co-purchase analysis and window functions
- **Python:** EDA, data cleaning checks, RFM feature engineering and visualization
- **Machine Learning:** K-Means customer segmentation
- **Power BI:** Customer analytics and product/revenue dashboard

## Dataset
The repository contains synthetic/sample data created for academic demonstration. It is not real customer data.

## Folder Structure
```text
data/
  customers.csv
  products.csv
  orders.csv
  ecommerce_transactions.csv

excel/
  ecommerce_customer_analysis.xlsx

sql/
  analysis_queries.sql

python/
  customer_segmentation.py
  requirements.txt

powerbi/
  dashboard_guide.md

docs/
  PROJECT_REPORT.md
```

## How to Run Python
```bash
pip install -r python/requirements.txt
python python/customer_segmentation.py
```

## Expected ML Output
The Python script creates:
`data/customer_segments.csv`

It also creates two analysis images inside `docs/`.

## Power BI
Follow `powerbi/dashboard_guide.md` to build the dashboard in Power BI Desktop.

## Team Project
Course: DATA ANALYTICS BOOTCAMP (SD0203)
Project: E-Commerce Product Recommendation & Customer Segmentation
