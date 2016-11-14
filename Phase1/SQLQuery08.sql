-- Ex 08

CREATE PROC Q08 AS
BEGIN
    Select count(*) "Total Number of Employees"
      FROM Employee_Details;
END;