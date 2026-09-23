# E-Commerce Product Recommendation & Customer Segmentation
# Run from the repository root.

import pandas as pd
import matplotlib.pyplot as plt
from sklearn.preprocessing import StandardScaler
from sklearn.cluster import KMeans

customers = pd.read_csv("data/customers.csv")
products = pd.read_csv("data/products.csv")
orders = pd.read_csv("data/orders.csv", parse_dates=["Order_Date"])

# Merge data for EDA
df = orders.merge(customers, on="Customer_ID").merge(products, on="Product_ID")

print("Shape:", df.shape)
print("\nMissing values:")
print(df.isnull().sum())
print("\nBasic statistics:")
print(df[["Quantity","Amount","Rating"]].describe())

# Customer-level RFM features
reference_date = df["Order_Date"].max() + pd.Timedelta(days=1)
rfm = df.groupby("Customer_ID").agg(
    Recency=("Order_Date", lambda x: (reference_date - x.max()).days),
    Frequency=("Order_ID", "count"),
    Monetary=("Amount", "sum")
).reset_index()

# K-Means segmentation
features = rfm[["Recency","Frequency","Monetary"]]
scaler = StandardScaler()
X = scaler.fit_transform(features)

kmeans = KMeans(n_clusters=4, random_state=42, n_init=10)
rfm["Cluster"] = kmeans.fit_predict(X)

print("\nCustomer segment summary:")
print(rfm.groupby("Cluster")[["Recency","Frequency","Monetary"]].mean().round(2))

# Save segmentation result
rfm.to_csv("data/customer_segments.csv", index=False)

# Revenue by category
category_revenue = df.groupby("Category")["Amount"].sum().sort_values(ascending=False)
category_revenue.plot(kind="bar", figsize=(9,5), title="Revenue by Category")
plt.ylabel("Revenue")
plt.tight_layout()
plt.savefig("docs/revenue_by_category.png", dpi=160)
plt.close()

# Customer cluster visualization
plt.figure(figsize=(8,5))
plt.scatter(rfm["Frequency"], rfm["Monetary"], c=rfm["Cluster"])
plt.xlabel("Purchase Frequency")
plt.ylabel("Total Spending")
plt.title("Customer Segmentation using K-Means")
plt.tight_layout()
plt.savefig("docs/customer_segments.png", dpi=160)
plt.close()

# Simple product recommendation logic:
# For each customer, find their most frequent categories/products.
customer_product = df.groupby(
    ["Customer_ID","Product"]
).size().reset_index(name="Purchase_Count")

top_products = customer_product.sort_values(
    ["Customer_ID","Purchase_Count"], ascending=[True,False]
).groupby("Customer_ID").head(3)

print("\nExample product recommendations:")
print(top_products.head(15))
