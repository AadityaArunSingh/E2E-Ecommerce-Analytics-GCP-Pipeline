
# 🌩️ E2E Ecommerce Analytics GCP Pipeline Report

> **Workflow Type:** Serverless ETL & Visualization Pipeline          
> **Cloud Services Used:** BigQuery · Cloud Run · Vertex AI · Looker Studio          
> **Deployment:** Dockerized Flask app via Cloud Shell Editor          

This project explores cloud-native solutions for querying, analyzing, and visualizing large-scale datasets using **Google Cloud Platform (GCP)**. It implements a full pipeline from data storage and querying to dashboard visualization and serverless API deployment.

---

## 📐 A. Project Design & Planning

- **Objective:** Efficiently manage and analyze large static datasets using cloud tools.
- **Tools Used:**
  - **Storage:** Google Cloud Storage (GCS)
  - **Warehouse:** BigQuery
  - **Notebook/ML:** Vertex AI Workbench
  - **Dashboard:** Looker Studio
- **Functional Requirements:**
  - Store & query static dataset
  - Visualize data trends
  - Deploy analytical endpoints
- **Approximate Monthly Cost:** `$6.11`
- **Limitations:** High costs at scale for SMEs

---

## 🌍 B. Explore the Environment

- Used the `thelook-ecommerce` dataset (7 tables, 9–200MB)
- Deployed 83 GCP resources (BigQuery, Looker Studio, etc.)
- Sample Dashboards:
  - 📊 *Top-line Business Pulse*
  - 🗺️ *Distribution Center Efficiency*

---

## 📘 C. Familiarize with Solution

Outlined below are some challenges & suggestions from each BigQuery tutorial:

| Tutorial | Issue / Suggestion |
|---------|--------------------|
| BigQuery ML | Too much scaffolding; encourage code modification |
| SQL Translation | Avoid redundant `CREATE TABLE` |
| Fine-Grained Security | Data Policies need organization-level roles |
| Analytics Queries | Fixed `APPROX_QUARTILES` error via alias |
| Gen AI ML | Model not pre-deployed |
| App Connection | Notebook missing; required manual init |

---

## 🔍 D. Query the Dataset

### ✅ Query 1 – Product Category Sales by Distribution Center

```sql
SELECT dc.name AS center, LOWER(TRIM(p.category)) AS category,
       COUNT(order_items.product_id) AS units_sold,
       SUM(order_items.sale_price) AS total_sales
FROM ...
WHERE order_items.status = 'Shipped'
GROUP BY dc.name, category
ORDER BY dc.name, units_sold DESC;
```

- **Insights:**  
  - Highest sales: *Intimates, Sleep & Lounge*  
  - Top revenue centers: *Houston, Chicago*  
  - 📎 [View Result Screenshot](https://drive.google.com/file/d/10eHz407DWveKSJfiotPimIIxraXSLjZm/view?usp=sharing)

---

### ✅ Query 2 – Sales by Traffic Source and Country

```sql
SELECT u.country, u.traffic_source,
       COUNT(*) AS user_count,
       SUM(oi.sale_price) AS total_sales
FROM ...
WHERE o.status = 'Shipped'
GROUP BY u.country, u.traffic_source
ORDER BY country DESC;
```

- **Insights:**  
  - Top sales via *Search* from *China, US, Brazil*  
  - 📎 [View Result Screenshot](https://drive.google.com/file/d/1Bx5lABZ0cKbMjOItkGuvG2BnwrB83Jfz/view?usp=sharing)

---

## 📈 E. Update the Dashboard

📊 New Dashboard Page: **"Distribution Center Wise Profit Trend"**

| Visualization | Purpose | Notes |
|---------------|---------|-------|
| **Heatmap Table** | Profit by Center | Highlights best/worst performers |
| **Time Series Chart** | Profit Over Years | Shows yearly trend with regression line |
| **Bubble Map** | Geolocation Profit | Size of bubble = profit magnitude |

🔍 *Findings:*  
- Houston, Memphis, and Chicago are most profitable  
- Consistent growth in profit from 2019 to 2023

---

## 🌐 F. Querying Through Cloud Run

🧪 Flask Web App: [`queries-7xrnyfweoa`](https://queries-7xrnyfweoa-uc.a.run.app/)

### Features:
- **Query 1:** List distribution centers
- **Query 2:** Product cost stats by category

### Tech Stack:
- **Backend:** Flask (Python)
- **Frontend:** HTML + Jinja2
- **Deployment:** Docker + Cloud Run (Serverless)

🛠️ Built and deployed via **Cloud Shell Editor** using Docker container → Cloud Run instance.

---

## ☁️ G. Research: GCP vs AWS

| GCP Tool | AWS Equivalent |
|----------|----------------|
| Cloud Storage | Amazon S3 |
| BigQuery | Amazon Redshift |
| Vertex AI | Amazon SageMaker |
| Looker Studio | Amazon QuickSight |
| Cloud Run | AWS Lambda / Fargate |

### 💡 Challenges in AWS:
- More manual setup (IAM roles, S3 → Redshift, permissions)
- Steeper learning curve
- Less real-time interactivity in QuickSight

### 📉 Estimated AWS Cost: `$30.41 / month`

---

## 🎥 H. Video Demonstration

📄 [Download Report](https://surreyac-my.sharepoint.com/:w:/r/personal/as06670_surrey_ac_uk/Documents/CC%20Coursework%20Report.docx?d=w0c435b11e7084fb79416b6a2a36f504a&csf=1&web=1&e=kQBXEq)

---

## ✅ Summary

This project demonstrated:
- Real-world application of **GCP tools** for big data analytics
- Use of **SQL, dashboards, and cloud APIs** for insights
- A comparison of cloud ecosystems with **GCP's ease-of-use** standing out

> 🚀 *Cloud-native, scalable, and insightful — a complete data-driven pipeline!*
