-- Ex 11

--- If returns is better a Function

 CREATE FUNCTION GETSUMSALARIES() RETURNS FLOAT AS
 BEGIN

   DECLARE Active_Emp_Cursor CURSOR FOR (  SELECT E.Emp_Id,ISNULL(S.Emp_Salary,0.0) AS Emp_Salary
                                             FROM Employee_Details E
	                                              LEFT OUTER JOIN Salary S ON
                                                  E.Emp_Id = S.Emp_Id
	                                        WHERE E.Emp_Active = 1 AND
	                                              (S.Emp_Salary_Change_Year IS NULL OR
                                                   S.Emp_Salary_Change_Year = (  SELECT Max(S1.Emp_Salary_Change_Year)
	                                                                              FROM Salary S1
										                                         WHERE S1.Emp_Id = S.Emp_Id)));
	DECLARE @EmpId NUMERIC(10),@EmpSalary FLOAT;
	DECLARE @TOTAL FLOAT;
	OPEN Active_Emp_Cursor;
	FETCH NEXT FROM Active_Emp_Cursor
	INTO @EmpId,@EmpSalary;
	SET @TOTAL = 0.0;
	WHILE @@FETCH_STATUS = 0
	BEGIN
      SET @TOTAL = @TOTAL + @EmpSalary;
	  FETCH NEXT FROM Active_Emp_Cursor
	  INTO @EmpId,@EmpSalary;
	END;
	CLOSE Active_Emp_Cursor;
	DEALLOCATE ActiveEmp_Cursor;
	RETURN @TOTAL
END;