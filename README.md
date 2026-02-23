# goit-data-analytics-projects

Educational data analytics projects (SQL, Python, BI dashboards) completed during the GoIT Data Analyst course.

## Project 1: ecommerce_sql

SQL analytics of a fictional e-commerce store.

**Goal:** show how I can prepare data for analysis, answer typical e-commerce business questions and build a simple BI dashboard.

**What’s inside:**

- Normalization of a “flat” CSV into a relational schema (`users`, `orders`, `order_items`, `products`)
- ER diagram
- SQL queries for:
  - top categories by orders and by revenue
  - discount impact on sales
  - order statuses and return rate
  - revenue by country
  - monthly dynamics of revenue, orders and AOV
- E-commerce performance dashboard (Google Looker Studio) based on the SQL results

**Tech stack:**

- SQL (SQLite via DBeaver)
- Google Looker Studio (dashboard)

---

## Project 2: stackoverflow_python

Exploratory data analysis of the Stack Overflow Developer Survey in a Jupyter Notebook.

**Goal:** demonstrate how I work with survey data in Python: cleaning, EDA, visualisation and analytical write-up.

**What’s inside:**

- Loading survey results and schema into Pandas
- Basic data cleaning and missing values analysis
- Geographical analysis of Python developers’ compensation:
  - average / median yearly compensation
  - number of respondents by country
- Analysis of compensation vs. education level (EdLevel) with interpretation

**Tech stack:**

- Python, Jupyter Notebook
- Pandas, NumPy
- Matplotlib
