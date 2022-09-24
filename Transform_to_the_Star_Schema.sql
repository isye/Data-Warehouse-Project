-- Create table dimension Rider
CREATE TABLE dimAgency (
    AgencyID INTEGER,
	AgencyName VARCHAR(100),
    AgencyStartDate Date
)
GO;

-- Insert data to dimension Rider from staging_rider table
INSERT INTO dimAgency(AgencyID, AgencyName, AgencyStartDate)
    SELECT a.AgencyID, a.AgencyName, b.AgencyStartDate
    FROM staging_agencymaster a
    JOIN staging_nycpayroll b
    ON a.AgencyID=b.AgencyCode
GO;

SELECT TOP 10 * from dimAgency;


CREATE TABLE dimEmployee (
    EmployeeID INTEGER,
	LastName VARCHAR(100),
	FirstName VARCHAR(100)
)
GO;

-- Insert data to dimension Rider from staging_rider table
INSERT INTO dimEmployee(EmployeeID, LastName, FirstName)
    SELECT EmployeeID, LastName, FirstName
    FROM staging_empmaster
GO;

SELECT TOP 10 * from dimEmployee;

CREATE TABLE dimTitle (
    TitleCode INTEGER,
	TitleDescription VARCHAR(100)
)
GO;

-- Insert data to dimension Rider from staging_rider table
INSERT INTO dimTitle(TitleCode, TitleDescription)
    SELECT TitleCode, TitleDescription
    FROM staging_titlemaster
GO;

SELECT TOP 10 * from dimTitle;

CREATE TABLE factNYCPayroll (
    Id INTEGER,
    FiscalYear INTEGER,
    PayrollNumber INTEGER,
    AgencyCode INTEGER,
    EmployeeID INTEGER,
    WorkLocationBorough VARCHAR(150),
    TitleCode INTEGER,
    LeaveStatusasofJune30 VARCHAR(50),
    BaseSalary Float,
    PayBasis VARCHAR(50),
    RegularHours INTEGER,
    RegularGrossPaid Float,
    OTHours Float,
    TotalOTPaid Float,
    TotalOtherPay Float
)
GO;

-- Insert data to dimension Rider from staging_rider table
INSERT INTO factNYCPayroll(
    Id,
    FiscalYear,
    PayrollNumber,
    AgencyCode,
    EmployeeID,
    WorkLocationBorough,
    TitleCode,
    LeaveStatusasofJune30,
    BaseSalary,
    PayBasis,
    RegularHours,
    RegularGrossPaid,
    OTHours,
    TotalOTPaid,
    TotalOtherPay
)
    SELECT Id,
    FiscalYear,
    PayrollNumber,
    AgencyCode,
    EmployeeID,
    WorkLocationBorough,
    TitleCode,
    LeaveStatusasofJune30,
    BaseSalary,
    PayBasis,
    RegularHours,
    RegularGrossPaid,
    OTHours,
    TotalOTPaid,
    TotalOtherPay
    FROM staging_nycpayroll
GO;
SELECT TOP 10 * from factNYCPayroll;



