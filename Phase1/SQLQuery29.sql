-- Ex 29

CREATE PROC Q29 AS
BEGIN
    SELECT E.*
      FROM Employee_Details E
     WHERE E.Emp_Id Not In (  SELECT Emp_Id
                                FROM Salary);
END;