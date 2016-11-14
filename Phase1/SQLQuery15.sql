-- Ex 15

CREATE PROC Q15 AS
BEGIN
    Select E.*
      From Employee_Details E
     WHERE E.Emp_City_Id IN (  SELECT Y.City_ID
                                 FROM CITY Y
		                        WHERE SUBSTRING(Y.City_Name,1,1) BETWEEN 'A' AND 'D');
END;
