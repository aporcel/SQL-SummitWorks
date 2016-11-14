-- Ex 03

CREATE PROC Q03 AS
BEGIN
    SELECT C1.Country_Id,C1.Country_Name
      FROM (  SELECT ROW_NUMBER() OVER (ORDER BY Country_Name ASC) AS ROWNUMBER,
                     C.* 
                FROM COUNTRY C) as C1
     WHERE ROWNUMBER <= 3;
END;
