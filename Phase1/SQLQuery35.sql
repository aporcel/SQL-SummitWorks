-- Ex 35

CREATE FUNCTION QF35(@Emp_Id INT) RETURNS FLOAT AS
BEGIN
  DECLARE @SAL FLOAT;
    SELECT @SAL = AVG(Emp_Salary)
	  FROM Salary
	 WHERE Emp_Id = @Emp_Id;
  RETURN @SAL;
END; 

CREATE PROC Q35 AS
BEGIN
    SELECT E.Emp_First_Name,E.Emp_Last_Name,dbo.QF35(E.Emp_Id) AS "AVG_SALARY"
      FROM Employee_Details E;
END;