--  Ex 09

CREATE PROC Q09 AS
BEGIN
    Select count(*) "Total Number of Employees which middle name is not null"
      FROM Employee_Details
     where Emp_Middle_Name is not null;
END;