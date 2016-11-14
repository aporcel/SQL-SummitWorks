-- Ex 2

CREATE PROC Q02 AS
BEGIN
    SELECT S.State_Name,C.Country_Name
      FROM COUNTRY C,
           "STATE" S
     WHERE C.Country_Id = S.Country_Id
  ORDER BY S.State_Name;
END;