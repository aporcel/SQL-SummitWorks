-- Ex 33

CREATE PROC Q33 AS
BEGIN
    SELECT E.*
      FROM SALARY L1,
           SALARY L2,
           Employee_Details E
     WHERE L1.Emp_Id = E.Emp_Id  AND
           L1.Emp_Id = L2.Emp_Id AND
           L1.Emp_Salary_Change_Year = (  SELECT Min(L3.Emp_Salary_Change_Year)
                                           FROM Salary L3
                                          WHERE L3.emp_id = L1.Emp_Id) AND
           L2.Emp_Salary_Change_Year = (  SELECT Max(L4.Emp_Salary_Change_Year)
                                           FROM Salary L4
                                          WHERE L4.emp_id = L2.Emp_Id AND
                                                L4.Emp_Salary_Change_Year <= GetDate()) AND
           L2.Emp_Salary - L1.Emp_Salary = (  SELECT MAX(L6.Emp_Salary - L5.Emp_Salary) AS "Highest Appraisal"
                                                FROM SALARY L5,
                                                     SALARY L6
                                               WHERE L5.Emp_Id = L6.Emp_Id AND
                                                     L5.Emp_Salary_Change_Year = (  SELECT Min(L7.Emp_Salary_Change_Year)
                                                                                      FROM Salary L7
                                                                                     WHERE L7.emp_id = L5.Emp_Id) AND
                                                     L6.Emp_Salary_Change_Year = (  SELECT Max(L8.Emp_Salary_Change_Year)
                                                                                      FROM Salary L8
                                                                                     WHERE L8.emp_id = L6.Emp_Id AND
                                                                                           L8.Emp_Salary_Change_Year <= GetDate()));
END;