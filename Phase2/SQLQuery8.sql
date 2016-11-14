-- Ex 8
USE [EMPLOYEE-ALEJANDRO];
GO

DROP FUNCTION GETBONUS;
GO

CREATE FUNCTION GETBONUS(@Emp_Id NUMERIC(10)) RETURNS FLOAT AS
BEGIN
  DECLARE @Bonus FLOAT;
    SELECT @Bonus = S.Emp_Salary * 0.1
      FROM Salary S
     WHERE S.Emp_Id = @Emp_Id AND
	       S.Emp_Salary_Change_Year = (  SELECT MAX(S1.Emp_Salary_Change_Year)
                                           FROM Salary S1
                                          WHERE S1.Emp_Id = S.Emp_Id);
  RETURN ISNULL(@Bonus,0.0)
END;