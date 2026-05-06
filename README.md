# 🛒 E-Commerce Sales Analysis | SQL + Power BI

## 📌 Project Summary
This project analyzes E-Commerce sales data to uncover revenue trends, customer behavior, and profitability insights using **MySQL and Power BI**.  
The goal was to transform raw transactional data into actionable business intelligence for strategic decision-making.

---

## 🎯 Business Objectives
- Identify Top Revenue Generating States
- Analyze Sales & Profit Trends
- Perform RFM Analysis for Customer Segmentation
- Detect High-Performing Categories
- Improve Customer Retention Strategy

---

## 🛠️ Tools & Technologies
- **MySQL** – Data Cleaning & Querying  
- **Power BI** – Interactive Dashboard & Data Visualization  
- **Excel** – Data Preprocessing  
- **DAX** – KPI Calculations  

---

## 📊 Key KPIs Created
- Total Sales
- Total Profit
- Profit Margin %
- Top 3 Revenue States
- Category-wise Revenue Contribution
- Customer Segmentation (RFM Model)
- Payment Mode Distribution
- Year-over-Year Growth %

---

## 📈 Dashboard Insights
- Maharashtra & Uttar Pradesh contribute the highest revenue.
- Electronics category generates maximum sales.
- UPI accounts for the largest transaction share.
- 70% of revenue comes from top-performing regions.
- Data-backed recommendations projected to improve customer retention by 15%.

---

## 🗄️ SQL Analysis Highlights

### 🔹 Top 3 States by Revenue
```sql
SELECT State, SUM(Sales_Amount) AS Total_Revenue
FROM orders
GROUP BY State
ORDER BY Total_Revenue DESC
LIMIT 3;
```

### 🔹 Profit Margin Calculation
```sql
SELECT 
    ROUND((SUM(Profit) / NULLIF(SUM(Sales_Amount),0)) * 100,2) AS Profit_Margin_Percentage
FROM orders;
```

### 🔹 Category-wise Sales
```sql
SELECT Category, SUM(Sales_Amount) AS Total_Sales
FROM orders
GROUP BY Category
ORDER BY Total_Sales DESC;
```

---

## 📂 Project Structure
```
E-Commerce-Sales-Analysis
│
├── Ecommerce_Sales_Analysis_Project.sql
├── E-com orders.csv.xlsx
├── E-commerce Sales Dashboard.pbix
├── dashboard.png
└── README.md
```

---

## 📷 Dashboard Preview
![Dashboard](dashboard.png)

---

## 🚀 Business Recommendations
- Focus marketing campaigns on high-performing states.
- Improve low-margin categories through pricing optimization.
- Strengthen retention strategies for medium-value RFM customers.
- Expand UPI-based promotional offers.

---

## 💼 Resume Impact Points
✔ Created Dynamic Dashboard for Executive Reporting  
✔ Applied RFM Analysis for Customer Segmentation  
✔ Identified 70% Revenue-Contributing Regions  
✔ Improved Data-Driven Decision Making  

---

## 📬 Contact
If you liked this project, feel free to connect with me on LinkedIn.

---

⭐ If you found this project helpful, don't forget to give it a star!
