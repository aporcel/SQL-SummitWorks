USE [EMPLOYEE-ALEJANDRO]
GO
-- Ex 02

CREATE TRIGGER Employee_Details_AFT_ER_INS_UPD_DEL_TRG ON Employee_Details 
AFTER INSERT,UPDATE,DELETE AS
BEGIN
  DECLARE @Action VARCHAR(10),@Emp_Id NUMERIC(10);
  -- INSERTING
  IF EXISTS(Select * FROM INSERTED) AND NOT EXISTS(Select * FROM DELETED)  
  BEGIN
     SET @Action = 'INSERT'
	 SELECT @Emp_ID = E.Emp_Id
	   FROM inserted E;
  END;
  -- UPDATING
  IF EXISTS(Select * FROM INSERTED) AND EXISTS(Select * FROM DELETED)  
  BEGIN
     SET @Action = 'UPDATE'
	 SELECT @Emp_ID = E.Emp_Id
	   FROM inserted E;
  END;
  -- DELETING
  IF NOT EXISTS(Select * FROM INSERTED) AND EXISTS(Select * FROM DELETED) 
  BEGIN
     SET @Action = 'UPDATE'
	 SELECT @Emp_ID = E.Emp_Id
	   FROM deleted E;
  END;

  INSERT INTO DB_Actions(Table_Name,Action_Name,User_Name,Done_On,Record_Id)
                  VALUES('Employee_Details',@Action,SYSTEM_USER,GETDATE(),@Emp_Id);
END;