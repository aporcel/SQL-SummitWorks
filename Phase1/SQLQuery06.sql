-- Ex 06
CREATE PROC Q06 AS
BEGIN
    SELECT *
      FROM Employee_Details
     WHERE Emp_Active = 0;
END;