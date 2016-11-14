-- Ex 22

CREATE PROC Q22 AS
BEGIN
    SELECT Emp_First_Name AS "First Name",
           datepart(year,Emp_JoinDate) AS "Year",
           substring(datename(MONTH,Emp_JoinDate),1,3) AS "Month",
           Datepart(day,Emp_JoinDate) AS "Day"
      FROM Employee_Details;
END;