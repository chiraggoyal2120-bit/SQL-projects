# 📚 Online Bookstore Sales & Inventory Analysis (SQL)

## 📌 Project Overview
This project involves designing a relational database for an online bookstore and writing SQL queries to extract actionable business intelligence. The goal of this analysis is to monitor inventory depletion, track customer purchasing behavior, and evaluate sales performance across different book genres.

## 🛠️ Technical Stack
* **Database:** PostgreSQL
* **Core Skills Demonstrated:** Relational Database Design, Primary/Foreign Keys, Multi-Table Joins, Data Aggregation, Filtering, and Subquery Logic.

## 📊 Key Business Insights Extracted
This project answers critical business questions using advanced SQL queries, including:

1. **Inventory Management:** Calculated the exact remaining stock for every book after fulfilling all recorded customer orders, ensuring accurate supply chain tracking.
2. **Customer Retention & Segmentation:** Identified high-value customers by isolating users who have placed multiple orders or spent above specific revenue thresholds.
3. **Revenue Analysis by Genre:** Aggregated total books sold and average pricing per genre to determine the most profitable inventory categories.
4. **Author Performance:** Tracked the total volume of books sold per author to identify top-performing creators.

## 📁 Repository Structure
* `Online Book Store.sql`: The SQL script containing the database schema, table creation, and all executed business queries.
* *Data Files: books.csv, orders.csv, customers.csv*

## 🚀 How to Run
1. Install PostgreSQL and a management tool like pgAdmin.
2. Execute the `CREATE DATABASE OnlineBookstore;` command.
3. Run the initial table creation scripts provided in the SQL file to build the schema for the `Books`, `Customers`, and `Orders` tables.
4. Import the raw data into the respective tables using pgAdmin's Import/Export tool (or the SQL `COPY` command) using the provided CSV files.
5. Execute the advanced and basic business queries to view the analysis.
