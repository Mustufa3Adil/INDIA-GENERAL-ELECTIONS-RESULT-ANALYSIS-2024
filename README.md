# INDIA-GENERAL-ELECTIONS-RESULT-ANALYSIS-2024
SQL project analyzing the India General Election Results 2024 using complex queries. Covers party-wise and state-wise insights, vote distributions, and alliance comparisons.

# India General Elections 2024 – SQL Analysis Project

This project analyzes the 2024 Indian General Election results using SQL. It focuses on extracting meaningful insights from structured data such as party performance, alliance wins, vote distributions, and constituency-level statistics.

---

## 🧰 Tech Stack

- SQL (DDL & DML)
- PostgreSQL / MySQL (compatible queries)
- Data: General Election 2024 structured tables

---

## 📂 Database Schema

The database contains the following relational tables:

1. **states** – List of Indian states
2. **partywise_results** – Political parties and number of seats won
3. **constituencywise_results** – Constituency-level results
4. **constituencywise_details** – Candidate-wise vote data (EVM & postal)
5. **statewise_results** – Detailed results by state and status

All tables use appropriate foreign keys and normalization.

---

## 📊 Key SQL Queries Implemented

- Total number of seats
- Seats won by **NDA**, **I.N.D.I.A**, and **Others**
- State-wise seat distribution
- Vote margins and top candidates
- Leading and trailing candidates in specific states
- Distribution of EVM vs postal votes
- Party-wise and alliance-wise performance analysis
- Custom reports using `JOIN`, `GROUP BY`, `CASE`, `ROW_NUMBER()`, `CTEs`

---

## 🔍 Sample Query

```sql
SELECT State, COUNT(Constituency_ID) AS Total_Seats
FROM constituencywise_results
JOIN statewise_results USING (parliament_constituency)
JOIN states USING (state_id)
GROUP BY State
ORDER BY State;
