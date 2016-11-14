USE [EMPLOYEE-ALEJANDRO];
GO

-- Assuing Nothing is NULL

-- Ex 5
CREATE TABLE Error_Log(
  Error_Id    NUMERIC(18) CONSTRAINT Error_Log_Error_Id_NN_CK NOT NULL IDENTITY(1,1),
  ErrorNum    NUMERIC(18) CONSTRAINT Error_Log_ErrorNum_NN_CK NOT NULL,
  ErrorMsg    NVARCHAR(MAX) CONSTRAINT Error_Log_ErrorMsg_NN_CK NOT NULL,
  Table_Name  NVARCHAR(MAX) CONSTRAINT Error_Log_Table_Name_NN_CK NOT NULL,
  Action_Name NVARCHAR(MAX) CONSTRAINT Error_Log_Action_Name_NN_CK NOT NULL,
  CurrentTime DATETIME  CONSTRAINT Error_Log_CurrentTime_NN_CK NOT NULL,
  CONSTRAINT Error_Log_PK
   PRIMARY KEY (Error_Id));
GO


