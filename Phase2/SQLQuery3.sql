--Exec 3
USE [EMPLOYEE-ALEJANDRO]
GO
/****** Object:  StoredProcedure [dbo].[COMBINED_PROC]    Script Date: 11/7/2016 1:26:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[COMBINED_PROC] @Flag            BIT,
                          @Emp_Id          NUMERIC(10) = NULL,
                          @Emp_First_Name  NVARCHAR(50) = NULL,
                          @Emp_Middle_Name NVARCHAR(50) = NULL,
                          @Emp_Last_Name   NVARCHAR(50) = NULL,
                          @Emp_Address1    NVARCHAR(100) = NULL,
                          @Emp_Address2    NVARCHAR(100) = NULL,
                          @Emp_Country_Id  NUMERIC(10) = NULL,
                          @Emp_State_Id    NUMERIC(10) = NULL,
                          @Emp_City_Id     NUMERIC(10) = NULL,
                          @Emp_Zip         NUMERIC(5) = NULL,
                          @Emp_Mobile      NUMERIC(10) = NULL,
                          @Emp_Gender      BIT = NULL,
                          @Desig_Id        NUMERIC(10) = NULL,
                          @Emp_DOB         DATETIME = NULL,
                          @Emp_JoinDate    DATETIME = NULL,
                          @Emp_Active      BIT = NULL  
AS
BEGIN
  DECLARE @SQLCommand NVARCHAR(2000);
  DECLARE @SQLColumns NVARCHAR(1000);
  DECLARE @SQLValues  NVARCHAR(1000);
  DECLARE @UPDATE_Count NUMERIC(2);
  IF @Flag = 1 -- INSERTION
  BEGIN
    SET @SQLColumns = 'Emp_First_Name,';
    SET @SQLValues = '''' + @Emp_First_Name + ''',''';
    IF @Emp_Middle_Name IS NOT NULL
	BEGIN
	  SET @SQLColumns = @SQLColumns + 'Emp_Middle_Name,';
      SET @SQLValues = @SQLValues + ',''' + @Emp_Middle_Name + ''',''';
    END 
    SET @SQLColumns = @SQLColumns + 'Emp_Last_Name,Emp_Address1,';
    SET @SQLValues = @SQLValues + @Emp_Last_Name + ''',''' + @Emp_Address1 + ''',';
    IF @Emp_Address2 IS NOT NULL
	BEGIN
      SET @SQLColumns = @SQLColumns + 'Emp_Address2,';
      SET @SQLValues = @SQLValues + '''' +  @Emp_Address2 + ''',';
    END
    SET @SQLColumns = @SQLColumns + 'Emp_Country_Id,Emp_State_Id,Emp_City_Id,Emp_Zip,Emp_Mobile,Emp_Gender,Desig_Id,Emp_DOB,Emp_JoinDate,Emp_Active';
    SET @SQLValues = @SQLValues + STR(@Emp_Country_Id) + ',' + STR(@Emp_State_Id) + ',' + STR(@Emp_City_Id) + ',' + STR(@Emp_Zip) + ',' + STR(@Emp_Mobile) + ',' + STR(@Emp_Gender) + ',' + STR(@Desig_Id) + ',''' + SUBSTRING(CONVERT(VARCHAR(20),@Emp_DOB,20),1,10) + ''',''' + SUBSTRING(CONVERT(VARCHAR(20),@Emp_JoinDate,20),1,10) +''',' + STR(@Emp_Active);
    SET @SQLCommand = 'INSERT INTO Employee_Details(' + @SQLColumns + ') VALUES(' + @SqlValues + ');'
    EXEC (@SQLCommand);
  END
  ELSE
    IF @Flag = 2 -- UPDATE
    BEGIN
      SET @SQLColumns = '';
      SET @UPDATE_Count = 0;
      IF @Emp_First_Name IS NOT NULL
	  BEGIN
        SET @SQLColumns = @SQLColumns + 'Emp_First_Name = ''' + @Emp_First_Name + '''';
        SET @UPDATE_Count = @UPDATE_Count + 1;
      END 
      IF @Emp_Middle_Name IS NOT NULL
	  BEGIN
        SET @SQLColumns = @SQLColumns + ',Emp_Middle_Name = ''' + @Emp_Middle_Name + '''';
        SET @UPDATE_Count = @UPDATE_Count + 1;
      END
      IF @Emp_Last_Name IS NOT NULL
	  BEGIN
        SET @SQLColumns = @SQLColumns + ',Emp_Last_Name = ''' + @Emp_Last_Name + '''';
        SET @UPDATE_Count = @UPDATE_Count + 1;
      END; 
      IF @Emp_Address1 IS NOT NULL
	  BEGIN
        SET @SQLColumns = @SQLColumns + ',Emp_Address1 = ''' + @Emp_Address1 + '''';
        SET @UPDATE_Count = @UPDATE_Count + 1;
      END; 
      IF @Emp_Address2 IS NOT NULL
	  BEGIN
        SET @SQLColumns = @SQLColumns + ',Emp_Address2 = ''' + @Emp_Address2 + '''';
        SET @UPDATE_Count = @UPDATE_Count + 1;
      END; 
      IF @Emp_Country_Id IS NOT NULL
	  BEGIN
        SET @SQLColumns = @SQLColumns + ',Emp_Country_Id = ' + @Emp_Country_Id;
        SET @UPDATE_Count = @UPDATE_Count + 1;
      END; 
      IF @Emp_State_Id IS NOT NULL
	  BEGIN
        SET @SQLColumns = @SQLColumns + ',Emp_State_Id = ' + @Emp_State_Id;
        SET @UPDATE_Count = @UPDATE_Count + 1;
      END; 
      IF @Emp_City_Id IS NOT NULL
	  BEGIN
        SET @SQLColumns = @SQLColumns + ',Emp_City_Id = ' + STR(@Emp_City_Id);
        SET @UPDATE_Count = @UPDATE_Count + 1;
      END; 
      IF @Emp_Zip IS NOT NULL
	  BEGIN
        SET @SQLColumns = @SQLColumns + ',Emp_Zip = ' + STR(@Emp_Zip);
        SET @UPDATE_Count = @UPDATE_Count + 1;
      END; 
      IF @Emp_Mobile IS NOT NULL
	  BEGIN
        SET @SQLColumns = @SQLColumns + ',Emp_Mobile = ' + STR(@Emp_Mobile);
        SET @UPDATE_Count = @UPDATE_Count + 1;
      END; 
      IF @Emp_Gender IS NOT NULL
	  BEGIN
        SET @SQLColumns = @SQLColumns + ',Emp_Gender = ' + STR(@Emp_Gender);
        SET @UPDATE_Count = @UPDATE_Count + 1;
      END; 
      IF @Desig_Id IS NOT NULL
	  BEGIN
        SET @SQLColumns = @SQLColumns + ',Desig_Id = ' + STR(@Desig_Id);
        SET @UPDATE_Count = @UPDATE_Count + 1;
      END; 
      IF @Emp_DOB IS NOT NULL
	  BEGIN
        SET @SQLColumns = @SQLColumns + ',Emp_DOB = ''' + SUBSTRING(CONVERT(VARCHAR(20),@Emp_DOB,20),1,10) + '''';
        SET @UPDATE_Count = @UPDATE_Count + 1;
      END; 
      IF @Emp_JoinDate IS NOT NULL
	  BEGIN
        SET @SQLColumns = @SQLColumns + ',Emp_JoinDate = ' + SUBSTRING(CONVERT(VARCHAR(20),@Emp_JoinDate,20),1,10) + '''';
        SET @UPDATE_Count = @UPDATE_Count + 1;
      END; 
      IF @Emp_Active IS NOT NULL
	  BEGIN
        SET @SQLColumns = @SQLColumns + ',Emp_Active = ' + STR(@Emp_Active);
        SET @UPDATE_Count = @UPDATE_Count + 1;
      END; 
      IF @UPDATE_Count > 0
	  BEGIN
        IF SUBSTRING(@SQLColumns,1,1) = ','
          SET @SQLColumns = SUBSTRING(@SqlColumns,2,LEN(@SQLColumns));
        SET @SQLCommand = 'UPDATE Employee_Details SET ' + @SQLColumns + ' WHERE Emp_Id = ' + @Emp_Id + ';'
        EXEC (@SQLCommand);
	  END;
    END
    ELSE
	  IF @Flag = 3 -- DELETION
      BEGIN
        DELETE Employee_Details
         WHERE Emp_Id = @Emp_Id;
      END;
END;