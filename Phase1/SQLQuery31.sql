--Ex 31

CREATE PROC Q31 AS
BEGIN
    SELECT E1.Emp_ID,
           CASE E1.Emp_ID
	          WHEN 1 THEN 0.1 * ISNULL(L.Emp_Salary,0)
		      WHEN 2 THEN 0.2 * ISNULL(L.Emp_Salary,0)
		      WHEN 3 THEN 0.15 * ISNULL(L.Emp_Salary,0)
		      ELSE 0.3 * ISNULL(L.Emp_Salary,0)
	       END AS SALARY_PCT 
      FROM Employee_Details E1
           LEFT OUTER JOIN SALARY L ON
           L.Emp_Id = E1.Emp_Id
     WHERE L.Emp_Salary_Change_Year IS NULL OR
	       L.Emp_Salary_Change_Year = (  SELECT MAX(L1.Emp_Salary_Change_Year)
	                                       FROM Salary L1
                                          WHERE L1.Emp_Id = L.Emp_Id AND
										        L1.Emp_Salary_Change_Year <= GetDate()) ;
END;