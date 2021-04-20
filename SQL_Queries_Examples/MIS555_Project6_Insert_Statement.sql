-- Insert rows into table 'Person' in schema '[dbo]'
INSERT INTO [dbo].[Person]
( -- Columns to insert data into
  FirstName, LastName,MiddleInitial,Email,PhoneNumber,LocalAddress,AddressZIP,AddressCity,AddressState,LinkedIn
)
VALUES
( -- First row: values for the columns in the list above
  'Evan','Kurpiewski','A','Kurpiewskme@gmail.com','412-543-2312','731 lefty boulevard','28412','Wilmington','North Carolina','www.linkedin.com/evan'
)

GO

-- Insert rows into table 'UNCWPerson' in schema '[dbo]'
INSERT INTO [dbo].[UNCWPerson]
( -- Columns to insert data into
PersonID,BannerID, UNCWEmail
)
VALUES
( -- First row: values for the columns in the list above
 1,'850143251','eak3772@uncw.edu'
)
GO

-- Insert rows into table 'UNCWStudent' in schema '[dbo]'
INSERT INTO [dbo].[UNCWStudent]
( -- Columns to insert data into
PersonID,DateOfAcceptance,TermOfAdmission,GMATScore
)
VALUES
( -- First row: values for the columns in the list above
 1,'08-08-2019','08-08-2019',800
)
GO

-- Insert rows into table 'UNCWFaculty' in schema '[dbo]'
INSERT INTO [dbo].[UNCWFaculty]
( -- Columns to insert data into
PersonID,Department,AcademicRank,UNCWOfficeLocation,UNCWPhoneNumber
)
VALUES
( -- First row: values for the columns in the list above
1,'CIS','Teaching Assistant','hoggard 221','412-389-9954'
)
GO