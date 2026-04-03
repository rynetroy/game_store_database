# 🎮 DROP IF Orphan  
### Video Game Retailer Sales & Operations Analytics Database  
https://rynetroy.github.io/game_store_database/

---

## 📌 Project Overview

**DROP IF Orphan** is a database-driven analytics system designed to simulate and evaluate the operations of a modern video game and tabletop retailer.

The project leverages a **relational SQL database** to model real-world business workflows and generate actionable insights across:

- 📈 Sales performance  
- 🧍 Customer behavior  
- 📦 Inventory management  
- 🪑 Table rental utilization  

---

## 🏪 Business Context

This system models a hybrid retail business that includes:

- 🎲 **Product Sales** – Board games, miniatures, dice, and accessories  
- 🪑 **Table Rentals** – In-store gaming sessions with reservations  
- 💰 **Dynamic Pricing** – Peak-hour pricing rules for rentals  
- 🏬 **Multi-Location Support** – Independent store operations and inventory  

---

## 🎯 Objectives

This project demonstrates how SQL can be used to solve real-world business problems by:

- Designing a **fully normalized relational database**  
- Executing **complex multi-table queries**  
- Analyzing **customer and transaction data**  
- Translating business questions into **data-driven insights**  

---

## 🧠 Key Business Questions

The system answers critical operational questions such as:

- Which product categories generate the most revenue?  
- Who are the highest-value customers over time?  
- What are the busiest days and peak usage hours?  
- How do pricing rules impact total revenue?  
- Which customers purchase products but do not engage in rentals?  

---

## 📈 Business Impact

### 💰 Revenue Optimization
- Identified top-performing product categories and revenue drivers  
- Enabled breakdown of revenue by customer, category, and time  
- Simulated **dynamic pricing impact** on rental revenue  

---

### 👤 Customer Insights
- Ranked customers by total spending to identify high-value segments  
- Analyzed behavior to support targeted promotions and retention  
- Identified cross-sell opportunities (e.g., product buyers not renting tables)  

---

### 🪑 Operational Efficiency
- Measured **table utilization rates** to detect peak demand  
- Identified busiest days and hours for staffing optimization  
- Implemented availability logic to improve booking decisions  

---

### 📦 Inventory & Product Strategy
- Evaluated product performance using attribute-based filtering (EAV model)  
- Identified high-demand product types  
- Supported pricing and stocking decisions based on demand patterns  

---

### ⚙️ Advanced Analytics Capability
- Built queries across **17 interconnected tables**  
- Applied advanced SQL logic to solve end-to-end business problems  
- Translated operational challenges into scalable data solutions  

---

## 🗄️ Database Structure

The database consists of **17 interconnected tables**, including:

### Core Entities
- Customers  
- Products  
- Transactions  
- Tables (rental units)  
- Stores  

### Supporting Entities
- Inventory  
- Categories  
- Pricing Rules  
- Reservations  
- Attributes (EAV model)  

### Design Features
- Fully normalized schema  
- Junction tables for many-to-many relationships  

---

## ⚙️ Technical Highlights

### 🔹 Entity-Attribute-Value (EAV) Model
Supports flexible product attributes such as:
- Scale (e.g., 32mm)  
- Material (e.g., metal)  
- Piece count  

Enables dynamic filtering but requires advanced querying techniques like **self-joins**.

---

### 🔹 Advanced SQL Techniques

- Complex multi-table joins (5+ tables)  
- Nested subqueries for ranking and filtering  
- Aggregations: `SUM`, `AVG`, `COUNT`  
- Time-based calculations: `TIMESTAMPDIFF`  
- Conditional filtering: `NOT IN`, `LIKE`  
- Advanced logic: `GREATEST`, `LEAST`  

---

## 📊 Example Analyses

- 📈 Top revenue-generating product categories  
- 👤 Customer lifetime value and spending trends  
- 🪑 Table utilization and peak demand analysis  
- 💵 Revenue impact of dynamic pricing  

---

## 🚧 Key Challenges

- Efficient querying of the **EAV model**  
- Handling **time overlap logic** for reservations  
- Managing complex joins across multiple tables  
- Ensuring accurate aggregation across transactional data  

---

## 🛠️ Technologies Used

- SQL (MySQL)  
- Relational Database Design (ERD Modeling)  

---

## 🌐 Project Demo

👉 https://rynetroy.github.io/game_store_database/

---

## 👥 Team

- Ronald  
- Czanel  
- Luka  
- Troy  
- Sebastian  

---

## 📅 Date

April 2026  

---

## 💡 Summary

This project demonstrates how a structured relational database can simulate and analyze a real-world retail business.

By combining **data modeling, SQL querying, and analytical thinking**, the system delivers insights into:

- Revenue performance  
- Customer behavior  
- Operational efficiency  

---

## 🚀 Author Note

This project highlights practical skills aligned with real-world analytics roles:

- Business-driven SQL querying  
- Data modeling and database design  
- Operational and performance analysis  
