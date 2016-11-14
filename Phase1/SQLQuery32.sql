-- Ex 32

CREATE PROC Q32 AS
BEGIN
    SELECT E.Emp_Id,
	       datediff(day,E.Emp_JoinDate,GetDate()) AS "Days Working"
      FROM Employee_Details E;
END;