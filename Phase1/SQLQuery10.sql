-- Ex 10

CREATE PROC Q10 AS
BEGIN
    SELECT Emp_First_Name,
           ISNULL(Emp_Middle_Name,'Not Applicable') AS Emp_Middle_Name,
	       Emp_Last_Name
      FROM Employee_Details;
END;