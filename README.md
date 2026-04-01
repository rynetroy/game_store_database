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
- Ensing accurate aggregation across transactional data  

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


