USE [EMPLOYEE-ALEJANDRO];
GO

DROP FUNCTION GETACTIVEEMPLOYEE;
GO
--Ex 9

CREATE FUNCTION GETACTIVEEMPLOYEE(@City_Name NVARCHAR(50)) RETURNS TABLE AS
  RETURN (  SELECT E.Emp_Id
              FROM Employee_Details E,
                   City Y
             WHERE Y.City_Id = E.Emp_City_Id AND
                   E.Emp_Active = 1 AND
                   Y.City_Name = @City_Name);
GO
       