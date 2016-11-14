-- Ex 05

CREATE PROC Q05 AS
BEGIN
    SELECT *
      FROM Employee_Details 
     WHERE Emp_First_Name Like '%A';
END;