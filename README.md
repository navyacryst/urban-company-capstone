# Urban Company Capstone Project

## Data Analysis, KPI Dashboard and Business Insights

This project is an end-to-end Urban Company service-operations analytics project covering data generation, data cleaning, SQL analysis, spreadsheet reconciliation, Tableau dashboarding, stakeholder insights, and AI-assisted reporting.

The project uses one reconciled dataset throughout Parts A–D so that the numbers remain consistent across SQL, Excel and Tableau.

---

## Tableau Public Dashboard

[View the Live Tableau Public Dashboard](https://public.tableau.com/app/profile/navya.crystal/viz/Capstone_17893822925660/BookingPerformanceRevenueDashboard?publish=yes)

The dashboard includes:

- Total Revenue KPI
- Total Bookings KPI
- Total SLA Breaches
- SLA Breach Rate
- Average Booking Value
- Revenue by Category
- Revenue by City Map
- City → Category Drill-down
- City filter
- Month Focus parameter

---

## Project Parts

### Part A — Data Setup, Python Sanity Check & SQL Diagnostic

Created and analyzed an Urban Company-style SQLite database containing booking, partner and category data.

Key outputs:

- `generate_data.py`
- `urban_service.db`
- `cities.csv`
- `categories.csv`
- `partners_import.csv`
- `bookings.csv`
- `verify_output.txt`
- `sanity_check.py`
- `01_dedup_and_joins.sql`
- `02_insert_delete.sql`
- `city_category_summary.csv`

The final reconciled dataset contains:

- 600 bookings
- ₹10,47,973 total revenue
- 79 SLA breaches
- 27 city-category combinations

---

### Part B — Spreadsheet Cross-Check & KPI Workbook

The exact `city_category_summary.csv` generated in Part A was imported into the spreadsheet workbook.

The workbook contains the required data, category reference table, VLOOKUP calculations, pivot analysis, SUMIFS/COUNTIFS KPI calculations and reconciliation checks against the SQL results.

Workbook:

`UrbanCompany_Capstone_Part_B.xlsx`

---

### Part C — Tableau Public Dashboard & Stakeholder Insights

The reconciled data was used to build an interactive Tableau Public dashboard.

The dashboard provides:

- Revenue analysis by category
- Revenue analysis by city
- City → Category drill-down
- KPI metrics
- SLA breach analysis
- Month Focus parameter
- Cross-chart city filtering

The full reconciled dataset produces an SLA Breach Rate of approximately **13.2% (79 breaches / 600 bookings)**.

Stakeholder narratives are documented in:

`DASHBOARD_STORY.md`

---

### Part D — AI-Augmented Reporting & Escalation Agent

Part D contains a reusable AI reporting prompt pack and a rule-based escalation-agent specification.

Files:

- `prompt_pack.md`
- `escalation_agent_spec.md`

The prompt pack contains:

1. Weekly Ops Summary Email
2. Stakeholder Narrative Draft
3. Complaint Triage Prompt

The escalation-agent specification includes numbered decision rules, guardrails, logging requirements and a hand-traced decision log using real booking records from the dataset.

---

## Repository Structure

| File | Purpose |
|---|---|
| `generate_data.py` | Generates the deterministic source dataset and SQLite database |
| `urban_service.db` | SQLite database |
| `cities.csv` | City reference data |
| `categories.csv` | Category reference data |
| `partners_import.csv` | Raw partner import data |
| `bookings.csv` | Booking data |
| `verify_output.txt` | Database verification results |
| `sanity_check.py` | Python sanity-check |
| `01_dedup_and_joins.sql` | SQL cleaning, deduplication and join analysis |
| `02_insert_delete.sql` | SQL insert/delete operations and final reconciliation |
| `city_category_summary.csv` | Final city-category aggregate used by Parts B and C |
| `UrbanCompany_Capstone_Part_B.xlsx` | Spreadsheet KPI and reconciliation workbook |
| `DASHBOARD_STORY.md` | Stakeholder narratives |
| `prompt_pack.md` | AI-assisted reporting prompts |
| `escalation_agent_spec.md` | Complaint escalation-agent specification |
| `README.md` | Project documentation |

---

## Key Reconciled Metrics

| Metric | Value |
|---|---:|
| Total Bookings | 600 |
| Total Revenue | ₹10,47,973 |
| Total SLA Breaches | 79 |
| SLA Breach Rate | 13.17% |
| Average Booking Value | ₹1,746.62 |

---

## Submission

This repository contains the complete set of project artifacts for Parts A–D.

The live Tableau Public dashboard is available here:

[Open Tableau Public Dashboard](https://public.tableau.com/app/profile/navya.crystal/viz/Capstone_17893822925660/BookingPerformanceRevenueDashboard?publish=yes)
