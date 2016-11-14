-- Ex 15

USE [EMPLOYEE-ALEJANDRO];
GO

DROP PROC SEARCH_EMP;
GO

CREATE PROC SEARCH_EMP @First_Name   NVARCHAR(50) = NULL,
                       @Last_Name    NVARCHAR(50) = NULL,
                       @Middle_Name  NVARCHAR(50) = NULL,
                       @Desig_Name   NVARCHAR(50) = NULL,
                       @Country_Name NVARCHAR(50) = NULL,
                       @Start_DOB    DATETIME = NULL,
                       @End_DOB      DATETIME = NULL,
                       @Start_DOJ    DATETIME = NULL,
                       @End_DOJ      DATETIME = NULL
AS
BEGIN
  DECLARE @Count INT;
  SET @Count = 0;
  DECLARE @SQLFilter NVARCHAR(MAX);
  DECLARE @SQLCommand   NVARCHAR(MAX);
  SET @SQLFilter = ''
  IF @First_Name IS NOT NULL
  BEGIN
    SET @SQLFilter = @SQLFilter + 'E.Emp_First_Name = ''' + @First_Name + '''';
	SET @Count = @Count + 1
  END;
  IF @Last_Name IS NOT NULL
  BEGIN
    SET @SQLFilter = @SQLFilter + 'AND E.Emp_Last_Name = ''' + @Last_Name + '''';
	SET @Count = @Count + 1
  END;
  IF @Middle_Name IS NOT NULL
  BEGIN
    SET @SQLFilter = @SQLFilter + 'AND E.Emp_Middle_Name = ''' + @Middle_Name + '''';
	SET @Count = @Count + 1
  END;
  IF @Desig_Name IS NOT NULL
  BEGIN
    SET @SQLFilter = @SQLFilter + 'AND D.Desig_Name = ''' + @Desig_Name + '''';
	SET @Count = @Count + 1
  END;
  IF @Country_Name IS NOT NULL
  BEGIN
    SET @SQLFilter = @SQLFilter + 'AND C.Country_Name = ''' + @Country_Name + '''';
	SET @Count = @Count + 1
  END;
  IF @Start_DOB IS NOT NULL AND @End_DOB IS NOT NULL
  BEGIN
    SET @SQLFilter = @SQLFilter + 'AND E.Emp_DOB BETWEEN ' + @Start_DOB + ' AND ' + @End_DOB;
	SET @Count = @Count + 1
  END;
  IF @Start_DOJ IS NOT NULL AND @End_DOJ IS NOT NULL
  BEGIN
    SET @SQLFilter = @SQLFilter + 'AND E.Emp_JoinDate BETWEEN ' + @Start_DOJ + ' AND ' + @End_DOJ;
	SET @Count = @Count + 1
  END
  SET @SQLCommand = 'SELECT E.Emp_First_Name AS "First Name",E.Emp_Middle_Name AS "Middle Name",E.Emp_Last_Name AS "Last Name",C.Country_Name "Country",S.State_Name AS "State" ,Y.City_Name AS "City",D.Desig_Name AS "Designation",E.Emp_DOB AS "DOB",E.Emp_JoinDate AS "DOJ",CASE E.Emp_Gender WHEN 1 THEN ''Male'' WHEN 0 THEN ''Female'' END AS "Gender"'
  SET @SQLCommand = @SQLCommand + ' FROM Employee_Details E Join Country C ON E.Emp_Country_Id = C.Country_Id Join "State" S ON E.Emp_State_Id = S.State_Id JOIN City Y ON E.Emp_City_Id = Y.City_Id JOIN Designation D ON E.Desig_Id = D.Desig_Id'
  IF @Count > 0 
  BEGIN
    IF SUBSTRING(@SqlFilter,1,4) = 'AND '
	  SET @SQLFilter = SUBSTRING(@SQLFilter,5,LEN(@SQLFilter))
	SET @SQLCommand = @SQLCommand + ' WHERE ' + @SQLFilter + ';'
  END;
  EXEC (@SqlCommand)
END;


EXEC SEARCH_EMP @Country_Name = 'Denmark'