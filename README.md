# 🎮 DROP IF Orphan  
### Video Game Retailer Sales Analysis Database

---

## 📌 Project Overview

**DROP IF Orphan** is a database-driven analytics system designed to simulate and evaluate the operations of a modern video game and tabletop retailer.

This project uses a **relational SQL database** to model real-world business scenarios and generate insights on:

- Sales performance  
- Customer behavior  
- Inventory structure  
- Table rental utilization  

The system supports complex queries to uncover trends in revenue, demand, and operations.

---

## 🏪 Business Context

This database models a hybrid retail business that includes:

- 🎲 **Product Sales**  
  Video games, board games, miniatures, dice, and accessories  

- 🪑 **Table Rentals**  
  In-store gaming sessions with reservable tables  

- 💰 **Dynamic Pricing**  
  Peak-hour pricing rules for rentals  

- 🏬 **Multi-Location Support**  
  Multiple stores with independent inventory, employees, and operations  

---

## 🎯 Objectives

The goal of this project is to apply **data-driven analysis using SQL** to:

- Design a **normalized relational database**
- Execute **complex multi-table queries**
- Analyze **customer purchasing behavior**
- Solve **real-world retail problems using data logic**

---

## 🧠 Key Analytical Questions

This system answers key business questions such as:

- Which product categories generate the highest revenue?  
- Who are the top-spending customers over time?  
- What are the busiest days for in-store activity?  
- Which inventory items meet specific attribute criteria?  
- How do peak pricing rules affect total revenue?  

---

## 📈 Business Impact

This project simulates real-world business insights that support data-driven decision-making.

### 💰 Revenue Optimization
- Identified top-performing product categories driving the highest revenue  
- Enabled revenue breakdown analysis by category, customer, and time period  
- Simulated **peak-hour pricing impact**, demonstrating how dynamic pricing increases rental revenue  

---

### 👤 Customer Insights
- Ranked customers by total spending to identify **high-value segments**  
- Analyzed purchasing behavior to support **targeted promotions and retention strategies**  
- Identified niche customer groups (e.g., rulebook buyers with no table usage) for cross-selling opportunities  

---

### 🪑 Operational Efficiency
- Measured **table utilization rates** to identify idle vs high-demand periods  
- Determined **busiest days and peak hours**, supporting staffing and scheduling decisions  
- Implemented reservation availability logic to improve customer experience  

---

### 📦 Inventory & Product Strategy
- Evaluated product performance using attribute-based filtering (EAV model)  
- Identified high-demand product types (e.g., miniatures, dice sets)  
- Supported pricing and stocking decisions based on demand trends  

---

### ⚙️ Advanced Analytics Capability
- Built queries across **17 interconnected tables**, simulating real production environments  
- Applied advanced SQL logic to solve business problems end-to-end  
- Translated business questions into **scalable data solutions**  

---

### 🚀 Business Value Summary

This system enables a retail business to:

- Increase revenue through pricing and product insights  
- Improve customer targeting and engagement  
- Optimize in-store resource utilization  
- Support data-driven operational decisions  

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
- Junction tables for many-to-many relationships  
- Fully normalized schema to reduce redundancy  

---

## ⚙️ Technical Highlights

### 🔹 Entity-Attribute-Value (EAV) Model

Used to support flexible product attributes such as:

- Scale (e.g., 32mm)  
- Material (e.g., metal)  
- Piece count  

This enables dynamic filtering but requires advanced querying techniques like **self-joins**.

---

### 🔹 Advanced SQL Techniques

- Multi-table joins (5+ tables)  
- Nested subqueries  
- Aggregations: `SUM`, `AVG`, `COUNT`  
- Time-based calculations: `TIMESTAMPDIFF`  
- Conditional filtering: `NOT IN`, `LIKE`  
- Advanced logic: `GREATEST`, `LEAST`  

---

## 📊 Example Analyses

- 📈 **Top Revenue Category**  
  Identifies highest-performing product segments  

- 👤 **Customer Spending Analysis**  
  Ranks customers by total purchase value  

- 🪑 **Table Utilization**  
  Measures demand and identifies idle capacity  

- 💵 **Dynamic Pricing Impact**  
  Quantifies revenue impact during peak hours  

---

## 🚧 Key Challenges

- Querying the **EAV model efficiently**  
- Handling **time overlap logic** for reservations  
- Managing **complex joins across multiple tables**  
- Ensuring accurate aggregation across transactional data  

---

## 🛠️ Technologies Used

- SQL (MySQL)  
- Relational Database Design (ERD Modeling)  

---

## 🌐 Project Demo

You can view the project interface here:

👉 Open `index.html`  
or  
https://rynetroy.github.io/game_stroy_database/

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

This project demonstrates how a structured relational database can be used to simulate and analyze a real-world retail business.

By combining **data modeling, SQL querying, and analytical thinking**, the system delivers insights into:

- Revenue performance  
- Customer behavior  
- Operational efficiency  

---

## 🚀 Author Note

This project highlights practical SQL skills aligned with real-world analytics roles, including:

- Business-driven querying  
- Data modeling  
- Performance analysis  
