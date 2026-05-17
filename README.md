# 🗄️ Inventory Database System

A relational database system built on **SQL Server** to manage inventory, suppliers, customers, employees, and orders.

---

## 📐 Schema Overview

| Table | Description |
|-------|-------------|
| `Employee` | Staff responsible for items and sales |
| `Customer` | Customers who place orders |
| `Item` | Products in the inventory |
| `Supplier` | Vendors who supply items |
| `Category` | Item classifications |
| `Orders` | Customer purchase records |
| `Supply` | Junction — links items to suppliers |
| `Contain` | Junction — links items to orders |

---

## 🔗 Relationships

- An **Item** can be supplied by one or more **Suppliers**
- A **Supplier** can supply zero or more **Items**
- An **Employee** is responsible for one or more **Items**
- An **Employee** can sell one or more **Orders**
- A **Customer** can place many **Orders**
- An **Order** contains one or more **Items**

---

## 🗂️ Entity Relationship Diagram

```
Employee ──< Item >── Category
    |
    └──< Orders >── Contain >── Item
            |
         Customer

Item >── Supply >── Supplier
```

---

## 🛠️ Setup

### 1. Create the Database

```sql
USE master
GO
CREATE DATABASE DBTask
USE DBTask
GO
```

### 2. Run DDL Script

Run the table creation scripts in this order to respect foreign key dependencies:

```
1. Employee
2. Category
3. Item
4. Supplier
5. Customer
6. Orders
7. Supply
8. Contain
```

### 3. Insert Seed Data

Run the insert scripts to populate all tables with sample data.

---

## 📋 Stored Procedures

| # | Procedure | Description |
|---|-----------|-------------|
| 1 | `sp_EmployeesHighValueOrders` | Employees who sold orders with total > 33,500 |
| 2 | `sp_ItemsSoldLastMonth` | Count of items sold last month with price > 500 |
| 3 | `sp_ItemsFromCairoSuppliers` | Items supplied from Cairo-based suppliers |
| 4 | `sp_CustomersLessThan3OrdersLastWeek` | Customers with fewer than 3 orders last week |
| 5 | `sp_CustomersBefore3Months` | Customers who purchased more than 3 months ago |
| 6 | `sp_ItemsUnder300` | Items priced below 300 EGP |
| 7 | `sp_OrdersPerCustomer` | Order count per customer |
| 8 | `sp_CustomersLastWeek` | Customers who ordered last week |
| 9 | `sp_ItemCountPerSupplier` | Total items supplied per supplier |
| 10 | `sp_ItemsSoldLastMonthByCategory` | Items sold last month grouped by category |


## 💡 Key SQL Concepts Used

- **DDL** — `CREATE TABLE`, `ALTER TABLE`, `ADD CONSTRAINT`
- **DML** — `INSERT`, `SELECT`
- **Joins** — `INNER JOIN`, `LEFT JOIN` across multiple tables
- **Aggregates** — `COUNT`, `SUM`, `AVG` with `GROUP BY` and `HAVING`
- **Date functions** — `GETDATE()`, `DATEADD()`, `MONTH()`, `YEAR()`
- **Stored Procedures** — `CREATE PROCEDURE`, `EXEC`
- **Constraints** — `PRIMARY KEY`, `FOREIGN KEY`, `NOT NULL`, `IDENTITY`

---
