/* ==============================================================================================================
   📘 Project Title: Healthcare Patient Records System
   📄 File Name: database_schema.sql
   📅 Description:
      This SQL script creates all tables and relationships for the Healthcare Patient Records System database.
      Includes: Patient, Department, Doctor, Appointment, Billing, and Treatment tables.
   =============================================================================================================== */


/* ===========================================================
   1️⃣ PATIENT TABLE
   -----------------------------------------------------------
   Purpose: Stores patient personal and demographic details.
   Key Field: PID (Primary Key)
   Relationships: Referenced by APPOINTMENT and BILLING tables.
   =========================================================== */
CREATE TABLE PATIENT 
(
  PID NUMBER,
  PNAME VARCHAR(30) NOT NULL,
  AGE NUMBER NULL,
  GENDER VARCHAR(10) NOT NULL,
  MNO NUMBER(10) CHECK(LENGTH(MNO)=10),
  ADDRESS VARCHAR(50) NULL
);

ALTER TABLE PATIENT
ADD CONSTRAINT PID_PK_PROJECT PRIMARY KEY(PID);

-- Verify constraint
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'PATIENT';

/* ===========================================================
   2️⃣ DEPARTMENT TABLE
   -----------------------------------------------------------
   Purpose: Stores hospital departments (e.g., Cardiology, Neurology).
   Key Field: DNO (Primary Key)
   Relationships: Referenced by DOCTOR table.
   =========================================================== */
CREATE TABLE DEPARTMENT
(
 DNO NUMBER,
 DNAME VARCHAR(25),
 LOC VARCHAR(10),
 CONSTRAINTS DNO_PK_PROJECT PRIMARY KEY(DNO)
);

/* ===========================================================
   3️⃣ DOCTOR TABLE
   -----------------------------------------------------------
   Purpose: Stores doctor details and specialization.
   Key Field: DID (Primary Key)
   Relationships:
     - DNO (Foreign Key) references DEPARTMENT(DNO)
     - Referenced by APPOINTMENT table.
   =========================================================== */
CREATE TABLE DOCTOR
(
    DID NUMBER,
    DNAME VARCHAR(30) NOT NULL,
    DNO NUMBER,
    SPEC VARCHAR(20) NOT NULL,
    MNO NUMBER(10) CHECK(LENGTH(MNO)=10),
    CONSTRAINTS DID_PK_PROJECT PRIMARY KEY(DID),
    CONSTRAINTS DNO_FK_PROJECT FOREIGN KEY (DNO) REFERENCES DEPARTMENT(DNO)
 );

/* ===========================================================
   4️⃣ APPOINTMENT TABLE
   -----------------------------------------------------------
   Purpose: Records patient appointments and admissions.
   Key Field: AID (Primary Key)
   Relationships:
     - PID (Foreign Key) references PATIENT(PID)
     - DID (Foreign Key) references DOCTOR(DID)
     - Referenced by BILLING and TREATMENT tables.
   =========================================================== */
CREATE TABLE APPOINTMENT
(
 AID NUMBER,
 APPOINTDATE DATE,
 DISCHARGEDATE DATE,
 STATUS VARCHAR(10),
 PID NUMBER,
 DID NUMBER,
 CONSTRAINTS AID_PK_APP_PROJECT PRIMARY KEY(AID),
 CONSTRAINTS PID_FK_APP_PROJECT FOREIGN KEY(PID) REFERENCES PATIENT(PID),
 CONSTRAINTS DID_FK_APP_PROJECT FOREIGN KEY(DID) REFERENCES DOCTOR(DID)
);

/* ===========================================================
   5️⃣ BILLING TABLE
   -----------------------------------------------------------
   Purpose: Stores billing information linked to each appointment.
   Key Field: BID (Primary Key)
   Relationships:
     - PID (Foreign Key) references PATIENT(PID)
     - AID (Foreign Key) references APPOINTMENT(AID)
   =========================================================== */
CREATE TABLE BILLING
(
 BID NUMBER,
 TOTALCOST NUMBER NULL,
 PAYMODE VARCHAR(15) NULL,
 BILLDATE DATE,
 PID NUMBER,
 AID NUMBER,
 CONSTRAINTS BID_PK_BILL_PROJECT PRIMARY KEY(BID),
 CONSTRAINTS PID_FK_BILL_PROJECT FOREIGN KEY(PID) REFERENCES PATIENT(PID),
 CONSTRAINTS AID_FK_BILL_PROJECT FOREIGN KEY(AID) REFERENCES APPOINTMENT(AID)
);

/* ===========================================================
   6️⃣ TREATMENT TABLE
   -----------------------------------------------------------
   Purpose: Records treatments and medicines prescribed per appointment.
   Key Field: TID (Primary Key)
   Relationships:
     - AID (Foreign Key) references APPOINTMENT(AID)
   =========================================================== */
CREATE TABLE TREATMENT
(
 TID NUMBER,
 DIAGNOSIS VARCHAR(25) NULL,
 MEDICINE VARCHAR(40) NULL,
 COST NUMBER NOT NULL,
 AID NUMBER,
 CONSTRAINTS TID_PK_TREAT_PROJECT PRIMARY KEY(TID),
 CONSTRAINTS AID_FK_TREAT_PROJECT FOREIGN KEY(AID) REFERENCES APPOINTMENT(AID)
);
