-- Ex 01
CREATE PROC Q01 AS
BEGIN
  SELECT E.Emp_First_Name,
         E.Emp_Last_Name,
         E.Emp_Address1,
         C.Country_Name,
         S.State_Name,
         Y.City_Name,
         E.Emp_Mobile,
         D.Desig_Name
    FROM EMPLOYEE_DETAILS E,
         COUNTRY          C,
         "STATE"          S,
         CITY             Y,
         DESIGNATION      D
   WHERE E.Emp_Country_Id = C.Country_Id AND
         E.Emp_State_Id   = S.State_Id   AND
         E.Emp_City_Id    = Y.City_Id    AND
         E.Desig_Id       = D.Desig_Id; 
END; -- QC1
	    