-- Ex 20

CREATE PROC Q20 AS
BEGIN
    SELECT SUBSTRING(E.Emp_First_Name,1,3) Emp_First_Name
      FROM Employee_Details E;
END;
