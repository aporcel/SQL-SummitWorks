-- Ex 14

CREATE PROC Q14 AS
BEGIN
    Select E.*
      From Employee_Details E
     WHERE E.Emp_City_Id IN (  SELECT Y.City_ID
                                 FROM CITY Y
                                WHERE Y.City_Name IN ('Dallas','Algiers'));
END;
