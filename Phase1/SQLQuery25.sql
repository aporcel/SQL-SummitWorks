-- Ex 25

CREATE PROC Q25 AS
BEGIN
    SELECT D.Desig_Name,
           SUM(CL.Emp_Salary) AS "Total Salary"
      FROM Employee_Details E,
           Country C,
           Designation D,
           (  select e1.emp_id,isnull(l.Emp_Salary,0) Emp_Salary 
                from employee_details e1
                     left outer join salary l on
                     e1.Emp_Id = l.Emp_Id
               where l.emp_salary_change_year is null or
                     l.emp_salary_change_year = (  select max(l1.emp_salary_change_year)
                                                     from salary l1
                                                    where l1.emp_id = l.emp_id and
                                                          l1.emp_salary_change_year <= GETDATE()) ) CL
     WHERE E.Emp_Country_Id = C.Country_Id AND
           D.Desig_Id = E.Desig_Id AND
           CL.Emp_Id = E.Emp_Id
  GROUP BY D.Desig_Name;
END;
