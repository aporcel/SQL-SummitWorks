-- Ex 12

CREATE PROC Q12 AS
BEGIN
    SELECT E.*
      FROM Employee_Details E
  ORDER BY (  SELECT C.Country_Name 
                FROM Country C 
               WHERE C.Country_Id = E.Emp_Country_Id) ASC
END;