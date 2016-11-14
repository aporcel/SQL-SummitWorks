-- Ex 4


USE [EMPLOYEE-ALEJANDRO];
GO

DROP PROC LIST_EMPLOYEE_LEVEL;
GO

CREATE PROC LIST_EMPLOYEE_LEVEL AS
BEGIN
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
    SELECT E.Emp_First_Name + ' ' + E.Emp_Last_Name AS "Employee Name",
	       E.Emp_Address1 AS "Adress",
		   D.Desig_Name AS "Designation",
		   C.Country_Name AS "Country Name",
		   S.State_Name AS "State Name",
		   Y.City_Name AS "City Name",
		   E.Emp_JoinDate AS "Join Date",
		   ISNULL(L.Current_Salary,0.0) AS "Current Salary",
		   CASE 
		     WHEN ISNULL(L.Current_Salary,0.0) > 95000 THEN 'Level1'
			 WHEN ISNULL(L.Current_Salary,0.0) > 50000 AND ISNULL(L.Current_Salary,0.0) < 95000 THEN 'Level2'
			 WHEN ISNULL(L.Current_Salary,0.0) < 50000 THEN 'Level3'
		   END AS "Level"
      FROM Employee_Details E 
	       JOIN Designation D ON
		   E.Desig_Id = D.Desig_Id 
		   JOIN Country C ON
		   E.Emp_Country_Id = C.Country_Id
		   JOIN "State" S ON
		   E.Emp_State_Id = S.State_Id
		   JOIN City Y ON
		   E.Emp_City_Id = Y.City_Id
		   LEFT OUTER JOIN #CurrentSalary L ON
		   E.Emp_Id = L.Emp_Id;
END;


EXEC LIST_EMPLOYEE_LEVEL;