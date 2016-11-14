-- Ex 04

CREATE PROC Q04 AS
BEGIN
    SELECT *
      FROM Employee_Details 
     WHERE Emp_First_Name Like 'A%';
END;