# Snowflake FinOps & Analytics Engineering Project

## 🎯 Project Overview
This project demonstrates a production-ready **dbt (data build tool)** pipeline designed to audit and manage **Snowflake credit consumption**. 

The goal is to provide the Finance team with clear visibility into daily warehouse costs, converting Snowflake's raw metadata into actionable financial insights.



---

## 🏗️ Architecture & Tech Stack
* **Data Warehouse:** Snowflake
* **Transformation:** dbt Core (v1.9+)
* **Orchestration & CI/CD:** GitHub Actions
* **Language:** SQL & Jinja
* **Logic Standards:** Medallion Architecture (Staging -> Marts)

---

## 🛠️ Key Features

### 1. Modular Data Modeling
* **Staging Layer:** Cleaning, casting, and normalizing raw Snowflake `ACCOUNT_USAGE` logs.
* **Mart Layer:** Aggregating data to a daily warehouse grain for reporting.

### 2. Advanced Jinja Macros
Implemented a reusable `convert_usd_to_eur` macro to handle currency conversion dynamically, ensuring the code remains DRY (Don't Repeat Yourself).

### 3. Data Quality & Governance
Integrated built-in dbt tests (`unique`, `not_null`, `accepted_values`) to ensure the integrity of financial data before it reaches the dashboard.

### 4. Automated CI/CD
A custom GitHub Actions workflow triggers on every Pull Request to:
1.  Spin up a temporary Python environment.
2.  Connect to Snowflake using secure GitHub Secrets.
3.  Run `dbt build` to validate code and tests before merging to `main`.

---


## 🚀 How to Run Locally

Follow these steps to set up the project on your machine. This guide assumes you have **Python 3.9+** installed.

### 1. Clone the Repository
Open your terminal and clone the project to your local directory.
```PowerShell
# Clone the repository
git clone [https://github.com/jkschola/snowflake-finops-ae.git](https://github.com/jkschola/snowflake-finops-ae.git)

# Enter the project directory
cd snowflake-finops-ae
```

### 2. Setup Virtual Environment

It is best practice to isolate your dbt installation using a virtual environment.

**Windows (PowerShell):**

```PowerShell
# Create the virtual environment
python -m venv venv

# Activate the environment
.\venv\Scripts\activate
```

**Mac/Linux (Bash):**

```Bash
# Create the virtual environment
python -m venv venv

# Activate the environment
source venv/bin/activate
```

### 3. Install Dependencies

Install dbt-snowflake and any required project packages.

```PowerShell
# Install dbt-snowflake adapter
pip install dbt-snowflake

# Install dbt packages (like dbt_utils) defined in packages.yml
dbt deps
```

### 4. Configure Environment Variables

This project uses environment variables to keep your Snowflake credentials secure. Replace the placeholders with your actual Snowflake details.

**Windows (PowerShell):**

```PowerShell
# Set credentials for the current session
$env:DBT_ACCOUNT = "your_org-your_account"
$env:DBT_PASSWORD = "your_secure_password"
```

**Mac/Linux (Bash):**

```Bash
# Export credentials for the current session
export DBT_ACCOUNT="your_org-your_account"
export DBT_PASSWORD="your_secure_password"
```

### 5. Verify and Build

Test the connection and run the models to populate your Snowflake environment.

```PowerShell
# Verify the connection to Snowflake
dbt debug --profiles-dir .

# Run and Test the entire pipeline (Staging to Marts)
dbt build --profiles-dir .
```

---

## 📈 Database Schema

- **Database:** `FINOPS_DEV`

- **Key Model:** `fct_daily_warehouse_costs` — Provides daily EUR spend per warehouse.

---

**Author:** Schola Janvier

**Role:** *Analytics Engineer*