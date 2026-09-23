# Power BI Dashboard Guide

## Dashboard title
E-Commerce Product Recommendation & Customer Segmentation

## Import
Open Power BI Desktop → Get Data → Text/CSV.

Import:
- data/customers.csv
- data/products.csv
- data/orders.csv
- data/customer_segments.csv (after running the Python script)

Create relationships:
- customers[Customer_ID] → orders[Customer_ID]
- products[Product_ID] → orders[Product_ID]
- customer_segments[Customer_ID] → customers[Customer_ID]

## Recommended visuals
1. KPI Card - Total Revenue
2. KPI Card - Total Orders
3. KPI Card - Total Customers
4. KPI Card - Average Rating
5. Bar Chart - Revenue by Product Category
6. Bar Chart - Top 10 Products
7. Donut Chart - Customer Segment
8. Column Chart - Revenue by Customer Segment
9. Line Chart - Monthly Revenue
10. Scatter Chart - Frequency vs Monetary Value
11. Table - Customer ID, Recency, Frequency, Monetary, Cluster
12. Slicers - City, Category, Customer Segment, Payment Method

## DAX measures

Total Revenue = SUM(orders[Amount])

Total Orders = DISTINCTCOUNT(orders[Order_ID])

Total Customers = DISTINCTCOUNT(orders[Customer_ID])

Average Order Value = DIVIDE([Total Revenue], [Total Orders])

Average Rating = AVERAGE(orders[Rating])

Total Units = SUM(orders[Quantity])

## Dashboard story
The dashboard should allow a user to:
- identify high-value customers,
- compare customer segments,
- identify popular products,
- compare product categories,
- inspect purchasing patterns,
- and view customer clusters created by K-Means.
