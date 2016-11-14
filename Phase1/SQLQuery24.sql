-- Ex 24

CREATE PROC Q24 AS
BEGIN
    SELECT *
      FROM Employee_Details
     WHERE Emp_JoinDate < '2014-01-01';
END;