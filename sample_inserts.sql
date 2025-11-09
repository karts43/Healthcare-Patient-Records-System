/* ==========================================================================================================
   📘 Project Title: Healthcare Patient Records System
   📄 File Name: sample_inserts.sql
   📅 Description:
      This SQL script inserts sample data into all tables of the Healthcare Patient Records System database.
   =========================================================================================================== */

/* ===========================================================
   1️⃣ PATIENT TABLE
   -----------------------------------------------------------
   Purpose: Insert new patient records.
   Note: Use substitution variables (&) for interactive entry.
   =========================================================== */
INSERT INTO PATIENT (&PID, &PNAME, &AGE, &GENDER, &MNO, &ADDRESS);


/* ===========================================================
   2️⃣ DEPARTMENT TABLE
   -----------------------------------------------------------
   Purpose: Insert static records for all hospital departments.
   =========================================================== */
INSERT ALL
   INTO DEPARTMENT (DNO, DNAME, LOC) VALUES (1, 'CARDIOLOGY', 'PUNE')
   INTO DEPARTMENT (DNO, DNAME, LOC) VALUES (2, 'NEUROLOGY', 'MUMBAI')
   INTO DEPARTMENT (DNO, DNAME, LOC) VALUES (3, 'ORTHOPEDIC', 'PUNE')
   INTO DEPARTMENT (DNO, DNAME, LOC) VALUES (4, 'GENERAL MEDICINE', 'CHENNAI')
   INTO DEPARTMENT (DNO, DNAME, LOC) VALUES (5, 'DERMATOLOGY', 'PUNE')
SELECT * FROM DUAL;



/* ===========================================================
   3️⃣ DOCTOR TABLE
   -----------------------------------------------------------
   Purpose: Insert doctor details linked to departments.
   Relationships:
     - DNO references DEPARTMENT(DNO)
   =========================================================== */
INSERT ALL
  INTO DOCTOR (DID, DNAME, DNO, SPEC, MNO) VALUES (1001, 'PATIL', 3, 'BONE SPECIALIST', 9765432109)
  INTO DOCTOR (DID, DNAME, DNO, SPEC, MNO) VALUES (1002, 'DESAI', 2, 'BRAIN SURGEON', 9988776655)
  INTO DOCTOR (DID, DNAME, DNO, SPEC, MNO) VALUES (1003, 'SHARMA', 1, 'HEART SPECIALIST', 9123456789)
  INTO DOCTOR (DID, DNAME, DNO, SPEC, MNO) VALUES (1004, 'SHINDE', 2, 'NEUROLOGIST', 9876501234)
  INTO DOCTOR (DID, DNAME, DNO, SPEC, MNO) VALUES (1005, 'THOMAS', 5, 'SKIN SPECIALIST', 9765432109)
  INTO DOCTOR (DID, DNAME, DNO, SPEC, MNO) VALUES (1006, 'ALLEN', 3, 'ORTHO SURGEON', 9876501234)
SELECT * FROM DUAL;



/* ===========================================================
   4️⃣ APPOINTMENT TABLE
   -----------------------------------------------------------
   Purpose: Insert patient appointments with doctors.
   Relationships:
     - PID references PATIENT(PID)
     - DID references DOCTOR(DID)
   =========================================================== */
INSERT ALL
  INTO APPOINTMENT VALUES (1, '01-OCT-2025', '03-OCT-2025', 'Completed', 1, 1001)
  INTO APPOINTMENT VALUES (2, '04-OCT-2025', '07-OCT-2025', 'Completed', 2, 1002)
  INTO APPOINTMENT VALUES (3, '08-OCT-2025', NULL, 'Pending', 1, 1003)
  INTO APPOINTMENT VALUES (4, '10-OCT-2025', '12-OCT-2025', 'Completed', 3, 1001)
  INTO APPOINTMENT VALUES (5, '13-OCT-2025', NULL, 'Ongoing', 4, 1004)
  INTO APPOINTMENT VALUES (6, '15-OCT-2025', '17-OCT-2025', 'Completed', 2, 1002)
  INTO APPOINTMENT VALUES (7, '18-OCT-2025', NULL, 'Pending', 5, 1005)
  INTO APPOINTMENT VALUES (8, '20-OCT-2025', '23-OCT-2025', 'Completed', 6, 1006)
  INTO APPOINTMENT VALUES (9, '25-OCT-2025', NULL, 'Ongoing', 1, 1004)
  INTO APPOINTMENT VALUES (10, '28-OCT-2025', '30-OCT-2025', 'Completed', 3, 1005)
SELECT * FROM DUAL;



/* ===========================================================
   5️⃣ BILLING TABLE
   -----------------------------------------------------------
   Purpose: Insert billing data for each appointment.
   Relationships:
     - PID references PATIENT(PID)
     - AID references APPOINTMENT(AID)
   =========================================================== */
INSERT ALL
  INTO BILLING VALUES (1, 2500, 'Cash', '03-OCT-2025', 1, 1)
  INTO BILLING VALUES (2, NULL, NULL, '07-OCT-2025', 2, 2)
  INTO BILLING VALUES (3, 1500, 'UPI', '12-OCT-2025', 3, 4)
  INTO BILLING VALUES (4, 3200, 'Online', '17-OCT-2025', 2, 6)
  INTO BILLING VALUES (5, NULL, NULL, '23-OCT-2025', 6, 8)
  INTO BILLING VALUES (6, 1800, 'UPI', '30-OCT-2025', 3, 10)
  INTO BILLING VALUES (7, 2200, 'Card', '25-OCT-2025', 1, 9)
  INTO BILLING VALUES (8, 5000, 'Online', '03-NOV-2025', 5, 7)
  INTO BILLING VALUES (9, NULL, NULL, '10-NOV-2025', 4, 5)
  INTO BILLING VALUES (10, 4500, 'Cash', '15-NOV-2025', 1, 3)
SELECT * FROM DUAL;

-- Update NULL billing data once treatment is completed
UPDATE BILLING
SET TOTALCOST = 4280, PAYMODE = 'CASH'
WHERE BID = 5;

UPDATE BILLING
SET TOTALCOST = 2900, PAYMODE = 'CASH'
WHERE BID = 9;



/* ===========================================================
   6️⃣ TREATMENT TABLE
   -----------------------------------------------------------
   Purpose: Insert treatment records linked to each appointment.
   Relationships:
     - AID references APPOINTMENT(AID)
   =========================================================== */
INSERT ALL
  INTO TREATMENT (TID, DIAGNOSIS, MEDICINE, COST, AID) VALUES (1, 'Fracture', 'Painkiller', 2500, 1)
  INTO TREATMENT (TID, DIAGNOSIS, MEDICINE, COST, AID) VALUES (2, 'Migraine', 'Paracetamol', 1800, 2)
  INTO TREATMENT (TID, DIAGNOSIS, MEDICINE, COST, AID) VALUES (3, 'Heart Pain', 'Aspirin', 3000, 3)
  INTO TREATMENT (TID, DIAGNOSIS, MEDICINE, COST, AID) VALUES (4, 'Joint Pain', NULL, 2200, 4)
  INTO TREATMENT (TID, DIAGNOSIS, MEDICINE, COST, AID) VALUES (5, 'Skin Allergy', 'Ointment', 1500, 5)
  INTO TREATMENT (TID, DIAGNOSIS, MEDICINE, COST, AID) VALUES (6, 'Back Pain', 'Pain Gel', 2000, 6)
SELECT * FROM DUAL;



/* ===========================================================
   ✅ COMMIT CHANGES
   -----------------------------------------------------------
   Purpose: Save all insert and update operations permanently.
   =========================================================== */
COMMIT;

-- ✅ Commit complete
