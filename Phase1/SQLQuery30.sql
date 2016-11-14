-- Ex 30

CREATE PROC Q30 AS
BEGIN
    SELECT E.Emp_First_Name, SL.Salary
      FROM Employee_Details E,
	       (  SELECT E1.Emp_Id,Sum(isnull(L.emp_Salary,0)) Salary
		        FROM Employee_Details E1 
			         Left Outer Join Salary L on
			         E1.Emp_Id = L.Emp_Id
            GROUP BY E1.Emp_Id) SL
     WHERE E.Emp_Id = SL.Emp_Id;
END;