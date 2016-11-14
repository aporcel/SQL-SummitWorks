-- Excersice 28


CREATE PROC Q28 AS
BEGIN 
    SELECT DATEPART(Year,Emp_JoinDate) AS " Joined Year",
           DatePArt(Month,Emp_JoinDate) AS "Joined Month",
           Count(Emp_Id) AS "Number of Employees"
      FROM Employee_Details
  GROUP BY DATEPART(Year,Emp_JoinDate),
           DatePArt(Month,Emp_JoinDate)
  ORDER BY 1,2;
END;