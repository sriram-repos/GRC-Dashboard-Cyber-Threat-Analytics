# 🛡️ Enterprise Cyber Threat Analytics & GRC Dashboard (CIC-IDS2018) (In Progress expected to be completed by Aug 31 2026)

A high-performance Governance, Risk, and Compliance (GRC) data engineering and analytics solution. This project transforms raw intrusion detection flow logs into executive-ready security insights by mapping network attacks to the **NIST Cybersecurity Framework (CSF)** using PostgreSQL and Power BI.

---

## 📌 Executive Summary

Modern Security Operations Centers (SOCs) and GRC teams require actionable, aggregated risk metrics rather than millions of raw log entries. This project implements a full database transformation pipeline on the **CIC-IDS2018 dataset**[cite: 1], engineering a **12,000x data compression ratio** (reducing 3.6 million raw rows to ~300 aggregated materialized records)[cite: 1] to deliver instantaneous Power BI dashboard performance without sacrificing threat governance granularity.

---

## 🏗️ Technical Architecture & Data Pipeline


[ CIC-IDS2018 Dataset ] ➡️ [ PostgreSQL Staging ] ➡️ [ Entity Enrichment & IP Generation ]
                                                                   │
[ Power BI Consumption Layer ] ⬅️ [ Materialized Star Schema ] ⬅️ [ NIST Mapping & Aggregations ]


### Key Engineering Steps:
1. **Raw Staging**: Ingested raw intrusion dataset into a staging table (`ids_traffic`) aligned with CSV data types[cite: 1].
2. **Data Enrichment**: Engineered synthetic logic for `Src_Ip` and `Dst_Ip` mapped conditionally by attack categories to simulate enterprise enterprise network topology[cite: 1].
3. **Dimensional Modeling**: Designed a Star Schema comprising key dimension tables:
   * `Dim_Date`, `Dim_Port`, `Dim_Protocol`, `Dim_Ip_Loc`[cite: 1]
   * `Dim_NIST`: Maps specific attack signatures directly to NIST CSF controls[cite: 1].
4. **Fact Summarization**: Built a summarized fact table containing core volumetric metrics (`Total_Network_Flows`, `Total_Attack_Flows`) grouped by hour, IPs, and protocol identifiers[cite: 1].
5. **Performance Optimization**: Created a materialized view joining the star schema, compressing **3.6 million raw flow records down to approximately 300 performance-optimized rows**[cite: 1].
6. **YoY Trend Analytics**: Generated a prior-year baseline dataset to enable Year-over-Year (YoY) comparative threat reporting[cite: 1].
7. **Direct BI Integration**: Built an abstraction view on top of the materialized view to serve as a seamless, high-speed data source for Power BI[cite: 1].

---



## 📊 Dimensional Star Schema Design

| Table Name | Type | Description |
| :--- | :--- | :--- |
| `ids_traffic | Staging | Raw flow logs ingested directly from CIC-IDS2018 source files[cite: 1]. |
| `Dim_NIST` | Dimension | Framework mapping connecting attack vector signatures to NIST CSF control categories[cite: 1]. |
| `Dim_Date` | Dimension | Calendar data aiding time-intelligence and temporal trend analysis (Contain Data Generated for Years 2017 and 2018) [cite: 1]. |
| `Dim_Port` / `Dim_Protocol` | Dimension | Network transport protocol definitions and standard destination port lookups[cite: 1]. |
| `Dim_Ip_Loc` | Dimension | Network zone and geographic/internal IP location attributes[cite: 1]. |
| `Fct_Attack_Summary` | Fact | Summarized network flow volumes and security incident metrics[cite: 1]. |
| `mv_attack_flow_data` | Materialized View | Pre-calculated join of star schema optimized for fast Power BI refresh[cite: 1]. |
| `vw_attack_flow_data` | View | Abstraction interface consumed by Power BI[cite: 1]. |

---

## 🎯 GRC & Threat Alignment (NIST CSF)

By creating `Dim_NIST`[cite: 1], network anomalies are categorized against industry-standard security posture frameworks:

* **Identify / Protect**: Port scanning and network reconnaissance logs.
* **Detect**: Infiltration attempts, brute-force protocols, and botnet activity.
* **Respond**: DoS / DDoS high-volumetric flow events.

---

## 🚀 How to Replicate This Setup

### Prerequisites
* **PostgreSQL 14+**
* **Power BI Desktop**
* **Kaggle Account** (to access the public [CIC-IDS2018 Dataset](https://www.kaggle.com/))[cite: 1]

### Setup Instructions
1. **Clone the Repository**:
   ```bash
   git clone [https://github.com/sriram-repos/GRC-Dashboard-Cyber-Threat-Analytics.git](https://github.com/your-username/cic-ids2018-grc-powerbi-pipeline.git)
   cd cic-ids2018-grc-powerbi-pipeline
   ```

2. **Execute Database Scripts**:
   Run the scripts in order against your PostgreSQL instance:
   ```bash
   psql -d your_database -f sql/01_staging_schema.sql
   psql -d your_database -f sql/02_dimension_tables.sql
   psql -d your_database -f sql/03_ip_enrichment_logic.sql
   psql -d your_database -f sql/04_fact_aggregation.sql
   psql -d your_database -f sql/05_star_schema_materialized.sql
   psql -d your_database -f sql/06_yoy_comparison_data.sql
   psql -d your_database -f sql/07_powerbi_consumption_view.sql
   ```

3. **Power BI Setup**:
   * Open `power_bi/cic_ids2018_grc_dashboard.pbit` in Power BI Desktop.
   * Enter your PostgreSQL connection credentials when prompted.
   * Point the source query to `vw_powerbi_grc_report`[cite: 1].

---

## 💼 Business Impact & Value Delivered

* **Query Performance Optimization**: Reducing 3.6 million records to 300 materialized summary rows reduced dashboard load time from seconds to near-instantaneous query rendering[cite: 1].
* **Executive Accessibility**: Bridged technical SOC network security metrics with executive GRC compliance requirements using NIST mapping[cite: 1].
* **Historical Trend Analysis**: Enabled comparative YoY security posture reporting for risk assessment and resource allocation[cite: 1].

---
*Created as a demonstration piece for Cyber Threat Analytics, SQL Optimization, and GRC Reporting.*
