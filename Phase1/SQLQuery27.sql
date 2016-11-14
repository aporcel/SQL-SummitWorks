-- Ex 27

CREATE PROC Q27 AS
BEGIN
    SELECT D.Desig_Name,
           AVG(HL.Emp_Salary) AS "Average Salary"
      FROM Employee_Details E,
           Designation D,
           (  SELECT E1.Emp_Id,ISNULL(Max(L.Emp_Salary),0) Emp_Salary 
                FROM Employee_Details E1
                     LEFT OUTER JOIN Salary L ON
                     L.Emp_Id = E1.Emp_Id
            GROUP BY E1.Emp_Id) HL
     WHERE D.Desig_Id = E.Desig_Id AND
           HL.Emp_Id = E.Emp_Id
  GROUP BY D.Desig_NAme
  ORDER BY 2 ASC;
END;
