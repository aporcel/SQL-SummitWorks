USE [EMPLOYEE-ALEJANDRO];
GO

-- Ex 7
CREATE PROC ADDCOL_PROC AS
BEGIN
  ALTER TABLE Employee_Details ADD 
    Emp_Bonus DECIMAL(10,2);
END;