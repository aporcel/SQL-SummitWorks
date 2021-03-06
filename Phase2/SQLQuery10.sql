USE [EMPLOYEE-ALEJANDRO]
GO
/****** Object:  StoredProcedure [dbo].[WRITEBONUS]    Script Date: 11/7/2016 12:33:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[WRITEBONUS] @City_Name NVARCHAR(50) AS
BEGIN
  DECLARE City_Emp_Cursor CURSOR FOR (SELECT Emp_Id FROM dbo.GETACTIVEEMPLOYEE(@City_Name));
  DECLARE @CurrEmp_Id NUMERIC(10);
  OPEN City_Emp_Cursor;
  FETCH NEXT FROM City_Emp_Cursor
  INTO @CurrEmp_Id;
  WHILE @@FETCH_STATUS = 0
  BEGIN
    UPDATE Employee_Details
	   SET Emp_Bonus = dbo.GETBONUS(@CurrEmp_Id)
     WHERE Emp_Id = @CurrEmp_Id; 
    FETCH NEXT FROM City_Emp_Cursor
	INTO @CurrEmp_Id;
  END;  
  CLOSE City_Emp_Cursor;
  DEALLOCATE City_Emp_Cursor;
END
