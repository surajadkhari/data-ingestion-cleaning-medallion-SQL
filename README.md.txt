# 🟫 Bronze Layer – Raw Data Import (SQL + Excel Format)

## 📌 Purpose
This section demonstrates how I implemented the **Bronze layer** of the **Medallion Architecture**, where I imported raw customer data from a `.csv` file into a SQL table without changing the data types or structure. This helps maintain data fidelity and auditability.

---

## 🪜 Step-by-Step Process

### ✅ 1. Inspect CSV and Generate SQL Column Definitions
- Opened `Customers.csv` in Excel.
- Copied the **header row** into **Column A**.
- In **Column B**, I used this formula to define the SQL data types as `varchar(100)`:

```excel
=A1 & " varchar(100),"
```

#This gave me the final schema for my SQL CREATE TABLE:

```sql
CustomerKey varchar(100),
Prefix varchar(100),
FirstName varchar(100),
LastName varchar(100),
BirthDate varchar(100),
MaritalStatus varchar(100),
Gender varchar(100),
EmailAddress varchar(100),
Salary varchar(100),
TotalChildren varchar(100),
EducationLevel varchar(100),
Occupation varchar(100),
HomeOwner varchar(100),

```
