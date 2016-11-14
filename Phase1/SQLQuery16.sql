-- Ex 16

CREATE PROC Q16 @LOWER_DATE DATETIME, @UPPER_DATE DATETIME AS
BEGIN
    SELECT E.Emp_First_Name,
           E.Emp_Last_Name,
           E.Emp_Middle_Name,
           C.Country_Name,
           D.Desig_Name,
           E.Emp_DOB
      FROM Employee_Details E,
           Country C,
           Designation D
     WHERE E.Emp_Country_Id = C.Country_Id AND
           D.Desig_Id = E.Desig_Id AND
	       E.Emp_DOB BETWEEN @LOWER_DATE AND @UPPER_DATE; --'1984-02-01''1986-03-01'
END;