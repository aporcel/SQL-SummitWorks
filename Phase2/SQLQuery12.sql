--Ex12

USE [EMPLOYEE-ALEJANDRO];
GO

DROP PROC GET_CURRENTSALARY;
GO

CREATE PROC GET_CURRENTSALARY AS
BEGIN
  WITH Current_Salary AS (SELECT S.Emp_Id,MAX(S.Emp_Salary) AS "CurrentSalary" FROM Salary S WHERE S.Emp_Salary_Change_Year < GETDATE() GROUP BY S.Emp_Id)
    SELECT E.Emp_First_Name,E.Emp_Last_Name,ISNULL(C.CurrentSalary,0.0) CurrentSalary
      FROM Employee_Details E 
           LEFT OUTER JOIN Current_Salary C ON
            E.Emp_Id = C.Emp_Id;
END;
GO

EXEC GET_CURRENTSALARY;
GO