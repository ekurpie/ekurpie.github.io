USE MSCSISProgram

DROP TABLE IF EXISTS UNCWFaculty
DROP TABLE IF EXISTS UNCWStudent
DROP TABLE IF EXISTS UNCWPerson
DROP TABLE IF EXISTS Person

-- Create a new table called '[Person]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Person]', 'U') IS NOT NULL
DROP TABLE [dbo].[Person]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Person]
(
    PersonID            INT IDENTITY(1,1) NOT NULL UNIQUE CONSTRAINT PersonID_CK CHECK (PersonID NOT LIKE '%[^0-9]%'),
    FirstName           VARCHAR(30) CONSTRAINT FirstName_CK CHECK (FirstName NOT LIKE '%[^A-Z]%'),
    LastName            VARCHAR(60) NOT NULL CONSTRAINT LastName_CK CHECK (LastName NOT LIKE '%[^A-Z]%'),
    MiddleInitial       CHAR(1) CONSTRAINT MiddleInitial_CK CHECK (MiddleInitial NOT LIKE '%[^A-Z]%'),
    Email               VARCHAR(255) NOT NULL CONSTRAINT Email_CK CHECK (Email NOT LIKE '%[^0-9A-Z@.]%'),
    PhoneNumber         VARCHAR(15) NOT NULL CONSTRAINT PhoneNumber_CK CHECK (PhoneNumber NOT LIKE '%[^-0-9]%'),
    MailingAddress      VARCHAR(50) CONSTRAINT LocalAddress_CK CHECK (MailingAddress NOT LIKE '%[^-0-9A-Z .]%'),
    AddressZIP          CHAR(5) CONSTRAINT ZIP_CK CHECK (AddressZIP NOT LIKE '%[^0-9]%'),
    AddressCIty         VARCHAR(30) CONSTRAINT City_CK CHECK (AddressCity NOT LIKE '%[^A-Z]%'),
    AddressState        VARCHAR(30) CONSTRAINT AddressState_CK CHECK (AddressState NOT LIKE '%[^A-Z] %'),
    LinkedIn            VARCHAR(100) UNIQUE,
    PRIMARY KEY         (PersonID)
);
GO

-- Create a new table called '[UNCWPerson]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[UNCWPerson]', 'U') IS NOT NULL
DROP TABLE [dbo].[UNCWPerson]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[UNCWPerson]
(
    PersonID            INT NOT NULL UNIQUE,
    BannerID            CHAR(9) NOT NULL UNIQUE CONSTRAINT BannerID_CK CHECK (BannerID NOT LIKE '%[^0-9]%'),
    UNCWEmail           VARCHAR(255) NOT NULL UNIQUE CONSTRAINT UNCWEmail_CK CHECK (UNCWEmail NOT LIKE '%[^0-9A-Z@. ]%'),
    PRIMARY KEY         (PersonID),
    CONSTRAINT FK_UNCWPerson FOREIGN KEY (PersonID)
    REFERENCES Person(PersonID)
);
GO


-- Create a new table called '[UNCWStudent]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[UNCWStudent]', 'U') IS NOT NULL
DROP TABLE [dbo].[UNCWStudent]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[UNCWStudent]
(
    PersonID            INT NOT NULL UNIQUE,
    DateOfAcceptance    Date NOT NULL CONSTRAINT DateofAcceptance_CK CHECK (DateofAcceptance NOT LIKE '%[^-0-9]%'),
    TermOfAdmission     Date NOT NULL CONSTRAINT TermOfAdmission_CK CHECK (TermOfAdmission NOT LIKE '%[^-0-9]%'),
    GMATScore           SMALLINT CONSTRAINT GMATScore_CK CHECK (GMATScore NOT LIKE '%[^0-9]%' and GMATScore >= 200 and GMATScore <= 800),
    PRIMARY KEY         (PersonID),
    CONSTRAINT FK_UNCWStudent FOREIGN KEY (PersonID)
    REFERENCES UNCWPerson(PersonID)
);
GO

-- Create a new table called '[UNCWFaculty]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[UNCWFaculty]', 'U') IS NOT NULL
DROP TABLE [dbo].[UNCWFaculty]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[UNCWFaculty]
(
    PersonID                INT NOT NULL UNIQUE,
    Department              VARCHAR(50) CONSTRAINT Department_CK CHECK (Department NOT LIKE '%[^A-Z ]%'),
    AcademicRank            VARCHAR(50) CONSTRAINT AcademicRank_CK CHECK (AcademicRank NOT LIKE '%[^A-Z]% '),
    UNCWOfficeLocation      VARCHAR(15) CONSTRAINT OfficeLocation_CK CHECK (UNCWOFFiceLocation NOT LIKE '%[^0-9A-Z. ]%'),
    UNCWPhoneNumber         VARCHAR(15) NOT NULL CONSTRAINT UNCWPhoneNumber_CK CHECK (UNCWPhoneNumber NOT LIKE '%[^-0-9]%'),
    PRIMARY KEY             (PersonID),
    CONSTRAINT FK_UNCWFaculty FOREIGN KEY (PersonID)
    REFERENCES UNCWPerson(PersonID)
);
GO

