-- Q21

CREATE PROC Q21 AS
BEGIN
    SELECT REPLACE(Emp_First_Name,'A','$') Emp_First_Name 
      FROM Employee_Details;
END;