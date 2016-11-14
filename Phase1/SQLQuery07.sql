-- Ex 07

CREATE PROC Q07 AS
BEGIN
    SELECT Emp_First_Name AS "First Name",
           Emp_Middle_Name AS "Middle Name",
	       Emp_Last_Name   AS "Last NAme"
      FROM Employee_Details;
END;