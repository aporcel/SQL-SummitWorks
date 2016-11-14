-- Ex 34

CREATE PROC Q34 AS
BEGIN
    SELECT E.*,
           CL.Emp_Salary AS "Current Salary"
      FROM Employee_Details E,
           (  select e1.emp_id,isnull(l.Emp_Salary,0) Emp_Salary 
                from employee_details e1
                     left outer join salary l on
                     e1.Emp_Id = l.Emp_Id
               where l.emp_salary = (  SELECT S.Emp_Salary
                                         FROM (  SELECT ROW_NUMBER() OVER (ORDER BY L.Emp_Salary DESC) AS SALARYORDER, 
                                                        L.Emp_Salary
                                                   FROM SALARY L
                                                  WHERE L.Emp_Salary_Change_Year = (  SELECT MAX(L1.Emp_Salary_Change_Year)
                                                                                        FROM SALARY L1
                                                                                       WHERE L1.Emp_Id = L.Emp_Id AND
                                                                                             L1.Emp_Salary_Change_Year < GETDATE())) AS S
                                        WHERE S.SALARYORDER = 3) ) AS CL
     WHERE CL.Emp_Id = E.Emp_Id;
END;