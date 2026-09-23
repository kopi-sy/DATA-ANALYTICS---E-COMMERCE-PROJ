# Project Report
## E-Commerce Product Recommendation & Customer Segmentation

### 1. Objective
Understand customer purchasing behavior and recommend relevant products using customer purchase history, product information, ratings, purchase frequency and spending.

### 2. Data
The project uses a generated practice dataset containing:
- 300 customers
- 30 products
- 1,500 orders
- Customer details
- Product categories
- Purchase quantity and amount
- Ratings
- Payment method
- Order dates

**Important:** The dataset is synthetic/sample data created for the academic project. It is not claimed to be real customer data.

### 3. Technologies
Excel, SQL, Python, Pandas, Matplotlib, Scikit-learn, Power BI and K-Means clustering.

### 4. Excel
Customer sales analysis, product performance and RFM calculations are included in `excel/ecommerce_customer_analysis.xlsx`.

### 5. SQL
Queries cover RFM metrics, purchase history, top products, repeat customers, category performance, customer segments, monthly revenue, co-purchase recommendation candidates and ranking with window functions.

### 6. Python
Python performs EDA, missing-value checks, customer-level RFM feature engineering, K-Means clustering and basic product recommendation logic.

### 7. Machine Learning
K-Means clustering is applied to standardized Recency, Frequency and Monetary features to group customers into four behavioral clusters.

### 8. Power BI
The Power BI guide describes the dashboard, relationships, recommended visuals and DAX measures.

### 9. Sample dataset-level observations
- Total orders: 1500
- Total revenue: ₹7,410,600.40
- Average rating: 4.25/5
- Highest-revenue category in this sample: Electronics
- Highest-revenue product in this sample: Office Chair

These observations describe the synthetic dataset only.

### 10. Conclusion
The project demonstrates an end-to-end analytics workflow: data preparation → Excel analysis → SQL analysis → Python EDA → RFM feature engineering → K-Means customer segmentation → product recommendation logic → Power BI reporting.
