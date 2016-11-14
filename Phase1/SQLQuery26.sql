-- Ex 26

CREATE PROC Q26 AS
BEGIN
    SELECT D.Desig_Name,
           COUNT(E.Emp_Id) "No Employers"
      FROM Employee_Details E,
           Designation D
     WHERE D.Desig_Id = E.Desig_Id
   GROUP BY D.Desig_Name;
END;