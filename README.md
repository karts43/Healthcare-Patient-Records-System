# 🏥 Healthcare Patient Records System

## 🎯 Project Goal
Analyze existing hospital data to discover insights like:
- Average hospital stay duration  
- Most common diseases  
- Doctor and department performance  
- Billing trends and payment modes  

## 💡 Why This Project
Hospitals handle thousands of records — patients, doctors, treatments, and bills — every day.  
This system helps manage and analyze this data efficiently to improve:
- Healthcare quality  
- Cost optimization  
- Resource utilization  

### Key Analytical Questions:
- Which diseases occur most frequently?  
- Which doctor or department has the best recovery rate?  
- What’s the average cost per treatment?  
- What’s the readmission rate (sign of care quality)?  

---

## 🧩 Database Design

| No. | Table Name   | Purpose | Key Fields |
|-----|---------------|----------|-------------|
| 1 | **Patient** | Stores patient personal & demographic details | PID (PK) |
| 2 | **Doctor** | Stores doctor details and specialization | DID (PK) |
| 3 | **Appointment** | Records patient admissions & assigned doctors | AID (PK), PID (FK), DID (FK) |
| 4 | **Treatment** | Records treatments given during each appointment | TID (PK), AID (FK) |
| 5 | **Billing** | Stores billing details linked to patients & appointments | BID (PK), PID (FK), AID (FK) |

---

## 🗄️ **Database Used**
**Oracle SQL**

---

## ⚙️ **How to Run**
1. Run `database_schema.sql` → Creates all tables and relationships.  
2. Run `sample_inserts.sql` → Inserts sample data into tables.  
3. Execute your custom queries for analytics and reporting.

---

## 🧠 **Example Queries**
```sql
-- 1️⃣ Find most common diseases
SELECT DIAGNOSIS, COUNT(*) AS TOTAL_CASES
FROM TREATMENT
GROUP BY DIAGNOSIS
ORDER BY TOTAL_CASES DESC;

-- 2️⃣ Find top performing doctors by completed appointments
SELECT D.DNAME, COUNT(A.AID) AS COMPLETED_CASES
FROM DOCTOR D
JOIN APPOINTMENT A ON D.DID = A.DID
WHERE A.STATUS = 'Completed'
GROUP BY D.DNAME
ORDER BY COMPLETED_CASES DESC;

-- 3️⃣ Average billing cost per patient
SELECT P.PNAME, AVG(B.TOTALCOST) AS AVG_COST
FROM PATIENT P
JOIN BILLING B ON P.PID = B.PID
GROUP BY P.PNAME;
