-- Ex 18

CREATE PROC Q18 AS
BEGIN
    SELECT E.Emp_First_Name,
           E.Emp_Last_Name,
    	   E.Emp_Middle_Name,
    	   C.Country_Name,
    	   D.Desig_Name,
    	   CL.Emp_Salary AS "Current Salary"
      FROM Employee_Details E,
           Country C,
    	   Designation D,
    	   (  select l.emp_id,l.Emp_Salary Emp_Salary 
                from salary l
               where l.emp_salary_change_year is null or
                     l.emp_salary_change_year = (  select max(l1.emp_salary_change_year)
                                                     from salary l1
                                                    where l1.emp_id = l.emp_id and
                                                          l1.emp_salary_change_year <= GETDATE()) ) CL
     WHERE E.Emp_Country_Id = C.Country_Id AND
           D.Desig_Id = E.Desig_Id AND
	       CL.Emp_Id = E.Emp_Id;
END;
