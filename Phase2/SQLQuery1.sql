-- Ex 01 
-- Assumptions:
-- All Fields Not Null since the next trigger inserts all information into
-- Since The Primary Key in Employee_Details (and all others table either) is
-- type numeric(10) I changed the Record_Id from numeric(5) to numeric(10)
USE [EMPLOYEE-ALEJANDRO]
GO

DROP TABLE DB_Actions;
GO

CREATE TABLE DB_Actions(
  Id          NUMERIC     CONSTRAINT DB_Actions_Id_NN_CK NOT NULL IDENTITY(1,1),
  Table_Name  VARCHAR(20) CONSTRAINT DB_Actions_Table_Name_NN_CK NOT NULL,
  Action_Name VARCHAR(10) CONSTRAINT DB_Actions_Action_Name_NN_CK NOT NULL,
  User_Name   VARCHAR(50) CONSTRAINT DB_Actions_User_Name_NN_CK NOT NULL,
  Done_On     DATETIME    CONSTRAINT DB_Actions_Done_On_NN_CK NOT NULL,
  Record_Id   NUMERIC(10)  CONSTRAINT DB_Actions_Table_Name_NN_CK NOT NULL,
  CONSTRAINT DB_Actions_PK
   PRIMARY KEY (Id)
);


