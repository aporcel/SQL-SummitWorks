-- Ex 13

CREATE PROC Q13 AS
BEGIN
    SELECT * 
      FROM (  SELECT E1.* 
	            FROM (  SELECT ROW_NUMBER() OVER (ORDER BY Emp_ID ASC) AS ROWNUMBER,
	                           E.*
                          FROM Employee_Details E) E1
			   WHERE E1.ROWNUMBER <= 10) E2
  ORDER BY E2.Emp_First_Name;
END;