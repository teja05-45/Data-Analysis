# Blinkit End‑to‑End Data Analysis

> A reproducible analytics project for quick‑commerce (Blinkit) using **Excel**, **Power BI**, **Python**, and **SQL** covering ingestion → warehousing → EDA → modeling → dashboards → reporting.

---

## 📌 Project Goals

* Analyze demand & supply patterns across cities, stores, hours, and product categories.
* Track KPIs like revenue growth, fulfillment rates, customer retention.
* Build forecasting and churn analysis using Python.
* Visualize insights using Power BI and share executive dashboards.

---

## 🧱 Repository Structure

```
blinkit-e2e-analysis/
├─ data/                       # Sample datasets (no PII)
│  ├─ raw/
│  ├─ processed/
├─ notebook
├─ sql/
│  ├─ ddl/                     # Table creation scripts
│  ├─ queries/                 # KPI and analysis queries
│  └─ transformations/         # Data cleaning SQL
├─ dashboards/
│  └─ powerbi/                 # Power BI .pbix files
├─ excel/
│  ├─ blinkit grocery data _raw.xlsx
│  └─ blinkitfrocery data.xlsx
├─ scripts/                    # Python scripts for ETL & modeling
├─ requirements.txt
└─ README.md
```

---

## 🗂️ Datasets (Example)

**Orders**: `order_id`, `user_id`, `store_id`, `order_ts`, `delivery_ts`, `subtotal`, `discount`, `tax`, `total_amount`
**Order\_Items**: `order_id`, `sku_id`, `category`, `qty`, `price`
**Inventory**: `store_id`, `sku_id`, `stock_level`, `date`
**Users**: `user_id`, `signup_date`, `city`, `loyalty_status`

---

## 🧰 Tech Stack

* **Excel**: Quick EDA, pivot tables, data cleaning.
* **SQL** (MySQL/PostgreSQL): Data storage, transformations, KPIs.
* **Python**: pandas, matplotlib, scikit-learn, statsmodels, Prophet.
* **Power BI**: Dashboards, interactive visualizations.

---

## ⚙️ Setup Instructions

```bash
# Clone repo
git clone https://github.com/<you>/blinkit-e2e-analysis.git
cd blinkit-e2e-analysis

# Python virtual environment
python -m venv .venv
source .venv/bin/activate   # Windows: .venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt

# Set up database tables
psql -U <user> -d blinkit -f sql/ddl/create_tables.sql
```

`requirements.txt`

```
pandas
numpy
matplotlib
scikit-learn
prophet
sqlalchemy
psycopg2-binary
jupyter
python-dotenv
```

---

## 📊 Core Metrics & KPIs

* **Orders**: Count by day/week/store.
* **Revenue**: Gross and Net Revenue, AOV (Average Order Value).
* **Fulfillment**: On-time delivery %, Fill Rate, Cancellation Rate.
* **Customer**: New vs Repeat, Retention %, Churn %, LTV.
* **Inventory**: Stock-out rate, Forecast Accuracy.

---

## 🔍 Analysis Steps

1. **Data Import**: Use Python (pandas) or SQL to load data into database.
2. **Data Cleaning**: Handle nulls, duplicates, type conversions.
3. **EDA**: Excel pivot tables, Python (matplotlib, seaborn) plots.
4. **SQL Queries**: Create KPIs using joins, group by, window functions.
5. **Modeling**: Demand forecasting (Prophet/ARIMA), Churn (Logistic Regression/XGBoost).
6. **Dashboard**: Load cleaned data into Power BI → build visuals.

---

## 🧪 Example SQL Query

```sql
SELECT store_id, DATE(order_ts) AS order_date,
       COUNT(*) AS total_orders,
       SUM(total_amount) AS revenue
FROM orders
GROUP BY store_id, DATE(order_ts)
ORDER BY order_date;
```

---

## 📈 Power BI Dashboard

* **Pages**: Sales Overview, Customer Retention, Fulfillment Metrics, Inventory Analysis.
* **Slicers**: Date, City, Store, Category.
* **Visuals**: Line Charts, Bar Charts, Maps, Funnel Charts.

---

## 🧾 Reporting

* Export daily KPIs to Excel using Python.
* Power BI dashboard auto-refresh for latest data.

---

## 🚀 How to Run

* Load raw data into SQL database.
* Run Python scripts to clean & process data.
* Use Excel for quick exploration.
* Connect Power BI to SQL/Excel for dashboards.

---

## 🗺️ Future Improvements

* Real-time data pipelines.
* Advanced ML models for forecasting & recommendations.
* Automated Power BI report scheduling.

---

## 🤝 Contributing

1. Fork repository.
2. Add feature branch & commit changes.
3. Submit Pull Request.

---

## 📄 License

MIT License.
