-- Ex 23

CREATE PROC Q23 AS
BEGIN
    SELECT *
      FROM Employee_Details
     WHERE Year(Emp_JoinDate) = 2014;
END;