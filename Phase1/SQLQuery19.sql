-- Ex 19

CREATE PROC Q19 @LOWER_SALARY FLOAT,@UPPER_SALARY FLOAT AS
BEGIN
    SELECT E.Emp_First_Name,
           E.Emp_Last_Name,
	       E.Emp_Middle_Name,
	       C.Country_Name,
	       D.Desig_Name,
	       HL.Emp_Salary AS "Highest Salary"
      FROM Employee_Details E,
           Country C,
	       Designation D,
	       (  SELECT L.Emp_Id,Max(L.Emp_Salary) Emp_Salary 
	            FROM Salary L
			   WHERE L.Emp_Salary BETWEEN @LOWER_SALARY AND @UPPER_SALARY
		    GROUP BY L.Emp_Id) HL
     WHERE E.Emp_Country_Id = C.Country_Id AND
           D.Desig_Id = E.Desig_Id AND
	       HL.Emp_Id = E.Emp_Id;
END;