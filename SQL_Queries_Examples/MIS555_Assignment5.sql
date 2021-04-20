--Evan Kurpiewski
--MIS 555 
--Assignment 5

USE northwind



--1. Give a list of employees and their immediate reportees.

;WITH Bosses(Boss,[First Name of Boss], [Last Name of Boss],Employee) AS
(
    SELECT  Employees.EmployeeID,
            Employees.FirstName,
            Employees.LastName,
            Employees.ReportsTo
    FROM    Employees
)

SELECT          Bosses.[First Name of Boss],
                Bosses.[Last Name of Boss],
                Bosses.Boss as [BossID],
                Employees.FirstName as [Employee First Name],
                Employees.LastName as [Employee Last Name],
                Employees.EmployeeID
FROM            Employees
    LEFT JOIN   Bosses ON Employees.ReportsTo = Bosses.Boss
ORDER BY        Employees.ReportsTo


--2. Give a list of employees and their boss.


;WITH Bosses(Boss,[First Name of Boss], [Last Name of Boss],Employee) AS
(
    SELECT  Employees.EmployeeID,
            Employees.FirstName,
            Employees.LastName,
            Employees.ReportsTo
    FROM    Employees
)

SELECT          Employees.FirstName as [First Name of Employee],
                Employees.LastName as [Last Name of Employee],
                Employees.EmployeeID,
                Bosses.Boss as [Boss ID],
                Bosses.[First Name of Boss],
                Bosses.[Last Name of Boss]
FROM            Employees
    LEFT JOIN   Bosses ON Employees.ReportsTo = Bosses.Boss
ORDER BY        Employees.ReportsTo

--3. Give a list of employees and a count of how many employees report to them.

;WITH Bosses(Boss,[First Name of Boss], [Last Name of Boss],Employee) AS
(
    SELECT  Employees.EmployeeID,
            Employees.FirstName,
            Employees.LastName,
            Employees.ReportsTo
    FROM    Employees
)

SELECT      Bosses.[First Name of Boss],
            Bosses.[Last Name of Boss],
            COUNT(Employees.EmployeeID) as [Number of employees that report to them]
FROM        Employees
    JOIN    Bosses ON Employees.ReportsTo = Bosses.Boss
GROUP BY    Bosses.[First Name of Boss],
            Bosses.[Last Name of Boss]
ORDER BY    Bosses.[First Name of Boss]

--3-2.

;WITH Bosses(Boss,[First Name of Boss], [Last Name of Boss],Employee) AS
(
    SELECT  Employees.EmployeeID,
            Employees.FirstName,
            Employees.LastName,
            Employees.ReportsTo
    FROM    Employees
)

SELECT                  Bosses.[First Name of Boss],
                        Bosses.[Last Name of Boss],
                        COUNT(Employees.EmployeeID) AS [Number of employees that report to them]
FROM                    Employees
    FUll OUTER JOIN     Bosses ON Employees.ReportsTo = Bosses.Boss
GROUP BY                Bosses.[First Name of Boss],
                        Bosses.[Last Name of Boss]
ORDER BY                [Number of employees that report to them] DESC

--4. Give a list of employees, for each employee show every person above them.

;WITH Bosses(EmployeeID, BossID) AS 
(
    SELECT      Employees.EmployeeID,
                Employees.ReportsTo
    FROM        Employees
    WHERE       Employees.ReportsTo IS NULL

    UNION ALL

    SELECT      Employees.EmployeeID,
                Employees.ReportsTo
    FROM        Employees
        JOIN    Bosses as Boss on Employees.ReportsTo = Boss.EmployeeID
)

SELECT          Employee.FirstName as [First Name of Employee],
                Employee.LastName as [Last Name of Employee],
                Bosses.EmployeeID,
                Bosses.BossID,
                Employees.FirstName as [Bosses First Name],
                Employees.LastName as [Bosses Last Name]
FROM            Bosses
    LEFT JOIN   Employees on Bosses.BossID = Employees.EmployeeID
    LEFT JOIN   Employees as Employee on employee.EmployeeID = Bosses.EmployeeID
ORDER BY        Bosses.BossID

--5. Give a list of employees, and for each employee show every person below them.

;WITH Bosses(EmployeeID, BossID) AS 
(
    SELECT      Employees.EmployeeID,
                Employees.ReportsTo
    FROM        Employees
    WHERE       Employees.ReportsTo IS NULL

    UNION ALL

    SELECT      Employees.EmployeeID,
                Employees.ReportsTo
    FROM        Employees
        JOIN    Bosses as Boss on Employees.ReportsTo = Boss.EmployeeID
)

SELECT          Employees.FirstName as [Bosses First Name],
                Employees.LastName as [Bosses Last Name],
                Bosses.BossID,
                Bosses.EmployeeID,
                Employee.FirstName as [First Name of Employee],
                Employee.LastName as [Last Name of Employee]
FROM            Bosses
    LEFT JOIN   Employees on Bosses.BossID = Employees.EmployeeID
    LEFT JOIN   Employees as Employee on employee.EmployeeID = Bosses.EmployeeID
ORDER BY        Bosses.BossID
