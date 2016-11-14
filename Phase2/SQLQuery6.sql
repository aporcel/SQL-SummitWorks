-- Ex 6
-- Exec 4
USE [EMPLOYEE-ALEJANDRO];
GO

DROP PROC TRANSACT_PROC2;
GO

CREATE PROC TRANSACT_PROC2 @EmpFirst_Name  NVARCHAR(50),
                          @EmpMiddle_Name NVARCHAR(50) = NULL,
                          @EmpLast_Name   NVARCHAR(50),
                          @EmpAddress1    NVARCHAR(100),
                          @EmpAddress2    NVARCHAR(100) = NULL,
                          @EmpCountry_Id  NUMERIC(10),
                          @EmpState_Id    NUMERIC(10),
                          @EmpCity_Id     NUMERIC(10),
                          @EmpZip         NUMERIC(5),
                          @EmpMobile      NUMERIC(10),
                          @EmpGender      BIT,
                          @DesigId        NUMERIC(10),
                          @EmpDOB         DATETIME,
                          @EmpJoinDate    DATETIME,
                          @EmpActive      BIT
AS 
BEGIN
  DECLARE @EmpId NUMERIC(10);
  BEGIN TRY
    BEGIN TRANSACTION
      EXEC dbo.COMBINED_PROC @Flag = 1,
                             @Emp_First_Name = @EmpFirst_Name,
                             @Emp_Middle_Name = @EmpMiddle_Name,
                             @Emp_Last_Name = @EmpLast_Name,
                             @Emp_Address1 = @EmpAddress1,
                             @Emp_Address2 = @EmpAddress2,
                             @Emp_Country_Id = @EmpCountry_Id,
                             @Emp_State_Id = @EmpState_Id,
                             @Emp_City_Id = @EmpCity_Id,
                             @Emp_Zip = @EmpZip,
                             @Emp_Mobile = @EmpMobile,
                             @Emp_Gender = @EmpGender,
                             @Desig_Id = @DesigId,
                             @Emp_DOB = @EmpDOB,
                             @Emp_JoinDate = @EmpJoinDate,
                             @Emp_Active = @EmpActive;
        SELECT @EmpId = Max(Emp_Id)
          FROM Employee_Details;
      INSERT INTO Employee_Documents(Emp_Id,Emp_Doc_Name) VALUES (@EmpId,@EmpFirst_Name + ' ' + @EmpLast_Name);
    COMMIT
  END TRY
  BEGIN CATCH
    SELECT 
	  ERROR_NUMBER() as ErrorNumber,
	  ERROR_MESSAGE() as ErrorMessage;
	INSERT INTO Error_Log(ErrorNum,ErrorMsg,Table_Name,Action_Name,CurrentTime)
	               VALUES(ERROR_NUMBER(),ERROR_MESSAGE(),'Employee_Details','INSERT',GETDATE());
	THROW;
  END CATCH;
END;