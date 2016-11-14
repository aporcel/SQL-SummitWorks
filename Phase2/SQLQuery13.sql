-- Ex 13
USE [EMPLOYEE-ALEJANDRO];
GO

CREATE TYPE Emp_Value AS TABLE
  (Emp_Id  NUMERIC(10),
   Emp_Val NVARCHAR(50));
GO

DROP PROC LIST_EMPLOYEE;
GO

CREATE PROC LIST_EMPLOYEE @EmpDesig Emp_Value READONLY AS
BEGIN
  DECLARE @City_Emp As Emp_Value
  DECLARE @State_Emp AS Emp_Value
  DECLARE @Country_Emp AS Emp_Value
  CREATE TABLE #CurrentSalary(Emp_Id NUMERIC(10),Current_Salary FLOAT);
  INSERT INTO #CurrentSalary
       SELECT E.Emp_Id,ISNULL(S.Emp_Salary,0)
	     FROM Employee_Details E
		      LEFT OUTER JOIN Salary S ON
			  E.Emp_Id = S.Emp_Id
        WHERE S.Emp_Salary_Change_Year IS NULL OR
		      S.Emp_Salary_Change_Year = (  SELECT MAX(S1.Emp_Salary_Change_Year)
			                                  FROM SALARY S1
											 WHERE S1.Emp_Id = S.Emp_Id);
  INSERT INTO @City_Emp 
       SELECT E.Emp_Id,Y.City_Name
	     FROM Employee_Details E,
	          City Y
	    WHERE E.Emp_City_Id = Y.City_Id;
  INSERT INTO @State_Emp 
       SELECT E.Emp_Id,S.State_Name
         FROM Employee_Details E,
		      "STATE" S
	    WHERE E.Emp_State_Id = S.State_Id;
  INSERT INTO @Country_Emp
       SELECT E.Emp_Id,C.Country_Name
         FROM Employee_Details E,
		      Country C
	    WHERE E.Emp_State_Id = C.Country_Id;
    SELECT E.Emp_First_Name + ' ' + E.Emp_Last_Name AS "Employee Name",
	       E.Emp_Address1 AS "Adress",
		   D.Emp_Val AS "Designation",
		   C.Emp_Val AS "Country Name",
		   S.Emp_Val AS "State Name",
		   Y.Emp_Val AS "City Name",
		   E.Emp_JoinDate AS "Join Date",
		   L.Current_Salary AS "Current Salary"
	  FROM Employee_Details E
	       JOIN @EmpDesig D ON
		   E.Emp_Id = D.Emp_Id
		   JOIN @Country_Emp C ON
		   E.Emp_Id = C.Emp_Id
		   JOIN @State_Emp S ON
		   E.Emp_Id = S.Emp_Id
		   JOIN @City_Emp Y ON
		   E.Emp_Id = Y.Emp_Id
		   JOIN #CurrentSalary L ON
		   E.Emp_Id = L.Emp_Id
END;
GO


DECLARE @Emp_Desig AS Emp_Value;
INSERT INTO @Emp_Desig
   SELECT E.Emp_Id,D.Desig_Name
     FROM Employee_Details E 
	      JOIN Designation D ON
		  E.Desig_Id = D.Desig_Id;


EXEC LIST_EMPLOYEE @EmpDesig = @Emp_Desig;