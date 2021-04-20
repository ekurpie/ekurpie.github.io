



    1.	TimeSlotSetUpdate (@timeSlotSetID, @newTitle, @newDescription, @active) - overwrites all fields with any non-NULL new value

		-- Create a new stored procedure called 'TimeSlotSetUpdate' in schema 'dbo'
-- Drop the stored procedure if it already exists
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'TimeSlotSetUpdate'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.TimeSlotSetUpdate
GO
-- Create the stored procedure in the specified schema

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Evan Kurpiewski
-- Create date: 11/3/2020

-- =============================================


CREATE PROCEDURE dbo.TimeSlotSetUpdate (
    @timeSlotSetID INT,
    @newTitle VARCHAR(50),
    @newDescription VARCHAR(300),
    @active BIT = 1
)
AS
BEGIN

        SET NOCOUNT ON;

    IF (@timeSlotSetID IS NULL) 
    BEGIN
        RAISERROR('invalid value: timeSlotSetID cannot be NULL', 16, 1)
        RETURN -1
    END

    IF (@newTitle IS NULL) 
    BEGIN
        RAISERROR('invalid value: Title cannot be NULL', 16, 1)
        RETURN -1
    END

    IF (@active IS NULL) 
    BEGIN
        RAISERROR('invalid value: active cannot be NULL', 16, 1)
        RETURN -1
    END

    UPDATE  TimeSlotSet
    SET     title = @newTitle,
            [description] = @newDescription,
            active = @active
    WHERE   timeSlotSetID = @timeSlotSetID

RETURN  0

END
GO
EXECUTE dbo.TimeSlotSetUpdate 1,"title 2", "This is the new description",1
GO

    2.	TimeSlotSetDelete (@timeSlotSetID) - should only work if there are no foreign key dependencies - let SQL raise that error



-- Create a new stored procedure called 'TimeSlotSetDelete' in schema 'dbo'
-- Drop the stored procedure if it already exists
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'TimeSlotSetDelete'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.TimeSlotSetDelete
GO
-- Create the stored procedure in the specified schema


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Evan Kurpiewski
-- Create date: 11/3/2020

-- =============================================

CREATE PROCEDURE dbo.TimeSlotSetDelete (
    @timeSlotSetID INT
)
AS
BEGIN

	 SET NOCOUNT ON;

IF (@timeSlotSetID IS NULL) 

       

    BEGIN
        RAISERROR('invalid value: timeSlotSetID cannot be NULL', 16, 1)
        RETURN -1
    END

    DELETE
    FROM   TimeSlotSet
    WHERE  timeSlotSetID = @timeSlotSetID 
Return 0

END
GO
EXECUTE dbo.TimeSlotSetDelete 1
GO

    3.	TimeSlotInsert (@timeSlotSetID, @beginTime, @endTime, @timeSlotID OUTPUT) - should always work with valid values

-- Create a new stored procedure called 'TimeSlotInsert' in schema 'dbo'
-- Drop the stored procedure if it already exists
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'TimeSlotInsert'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.TimeSlotInsert
GO
-- Create the stored procedure in the specified schema

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Evan Kurpiewski
-- Create date: 11/3/2020

-- =============================================


CREATE PROCEDURE dbo.TimeSlotInsert (
    @timeSlotSetID INT,
    @begintime Datetime2,
    @endTime Datetime2,
    @timeSlotID INT = NULL OUTPUT
)
AS
BEGIN

        SET NOCOUNT ON;

    IF (@timeSlotSetID IS NULL) 
    BEGIN
        RAISERROR('invalid value: timeSlotSetID cannot be NULL', 16, 1)
        RETURN -1
    END

    IF (@begintime IS NULL) 
    BEGIN
        RAISERROR('invalid value: beginTime cannot be NULL', 16, 1)
        RETURN -1
    END

    IF (@endTime IS NULL) 
    BEGIN
        RAISERROR('invalid value: endTime cannot be NULL', 16, 1)
        RETURN -1
    END

    INSERT INTO TimeSlot(timeSlotSetID,beginTime,endTime)
    VALUES (@timeSlotSetID,@begintime,@endTime)
    RETURN  0

END
GO

DECLARE @timeSlotOutput INT
DECLARE @timeSlotReturn INT
EXECUTE @timeSlotReturn = dbo.TimeSlotInsert 1,"12-13-14","12-13-14",@timeSlotOutput

GO

    4.	TimeSlotUpdate (@timeSlotID, @newBeginTime, @newEndTime) - should always work with valid values


-- Create a new stored procedure called 'TimeSlotUpdate' in schema 'dbo'
-- Drop the stored procedure if it already exists
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'TimeSlotUpdate'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.TimeSlotUpdate
GO
-- Create the stored procedure in the specified schema


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Evan Kurpiewski
-- Create date: 11/3/2020

-- =============================================


CREATE PROCEDURE dbo.TimeSlotUpdate (
    @timeSlotID INT,
    @newBegintime Datetime2,
    @newEndTime Datetime2
)
AS
BEGIN

        SET NOCOUNT ON;

    IF (@timeSlotID IS NULL) 
    BEGIN
        RAISERROR('invalid value: timeSlotID cannot be NULL', 16, 1)
        RETURN -1
    END

    IF (@newBegintime IS NULL) 
    BEGIN
        RAISERROR('invalid value: beginTime cannot be NULL', 16, 1)
        RETURN -1
    END

    IF (@newEndTime IS NULL) 
    BEGIN
        RAISERROR('invalid value: endTime cannot be NULL', 16, 1)
        RETURN -1
    END

    UPDATE  TimeSlot
    SET     beginTime = @newBegintime,
            endTime = @newEndTime
    WHERE   timeSlotID = @timeSlotID
    
RETURN  0

END
GO


EXECUTE dbo.TimeSlotUpdate 1,"12-13-20","12-13-20"

GO


    5.	TimeSlotDelete (@timeSlotID) - should only work if there are no foreign key dependencies - let SQL raise that error

-- Create a new stored procedure called 'TimeSlotDelete' in schema 'dbo'
-- Drop the stored procedure if it already exists
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'TimeSlotDelete'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.TimeSlotDelete
GO
-- Create the stored procedure in the specified schema


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Evan Kurpiewski
-- Create date: 11/3/2020

-- =============================================

CREATE PROCEDURE dbo.TimeSlotDelete (
    @timeSlotID INT
)
AS
BEGIN

    SET NOCOUNT ON;

IF (@timeSlotID IS NULL) 


    BEGIN
        RAISERROR('invalid value: timeSlotSetID cannot be NULL', 16, 1)
        RETURN -1
    END

    DELETE
    FROM   TimeSlot
    WHERE  timeSlotID = @timeSlotID 

Return 0

END
GO
EXECUTE dbo.TimeSlotDelete 1
GO

    6.	RequesterInsert  (@userID, @timeSlotSetID, @requesterID OUTPUT)

-- Create a new stored procedure called 'RequesterInsert' in schema 'dbo'
-- Drop the stored procedure if it already exists
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'RequesterInsert'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.RequesterInsert
GO
-- Create the stored procedure in the specified schema

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Evan Kurpiewski
-- Create date: 11/3/2020

-- =============================================

CREATE PROCEDURE dbo.RequesterInsert (
    @userID INT,
    @timeSlotSetID INT,
    @requesterID INT = NULL OUTPUT
)
AS
BEGIN

        SET NOCOUNT ON;

    IF (@userID IS NULL) 
    BEGIN
        RAISERROR('invalid value: userID cannot be NULL', 16, 1)
        RETURN -1
    END

    IF (@timeSlotSetID IS NULL) 
    BEGIN
        RAISERROR('invalid value: timeSlowSetID cannot be NULL', 16, 1)
        RETURN -1
    END

    INSERT INTO Requester(userID,timeSlotSetID)
    VALUES (@userID,@timeSlotSetID)
    RETURN  0

END
GO

DECLARE @RequesterOutput INT
DECLARE @RequesterReturn INT
EXECUTE @RequesterReturn = dbo.RequesterInsert 1,1,@RequesterOutput

GO

    7.	RequesterDelete (@requesterID) (note that there is no update - someone is either a requester for a calendar or not)

-- Create a new stored procedure called 'RequesterDelete' in schema 'dbo'
-- Drop the stored procedure if it already exists
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'RequesterDelete'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.RequesterDelete
GO
-- Create the stored procedure in the specified schema

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Evan Kurpiewski
-- Create date: 11/3/2020

-- =============================================

CREATE PROCEDURE dbo.RequesterDelete (
    @requesterID INT 
)
AS
BEGIN

        SET NOCOUNT ON;

    IF (@requesterID IS NULL) 
    BEGIN
        RAISERROR('invalid value: timeSlowSetID cannot be NULL', 16, 1)
        RETURN -1
    END

    DELETE  
    FROM Requester
    WHERE   requesterID = @requesterID

    RETURN  0

END
GO

EXECUTE dbo.RequesterDelete 1

GO

    8.	MeetingInsert (@requesterID, @timeSlotID, @meetingID OUTPUT)


-- Create a new stored procedure called 'MeetingInsert' in schema 'dbo'
-- Drop the stored procedure if it already exists
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'MeetingInsert'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.MeetingInsert
GO
-- Create the stored procedure in the specified schema

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Evan Kurpiewski
-- Create date: 11/3/2020

-- =============================================

CREATE PROCEDURE dbo.MeetingInsert (
    @requesterID INT,
    @timeSlotID INT,
    @meetingID INT = NULL OUTPUT
)
AS
BEGIN

        SET NOCOUNT ON;

    IF (@requesterID IS NULL) 
    BEGIN
        RAISERROR('invalid value: requesterID cannot be NULL', 16, 1)
        RETURN -1
    END

    IF (@timeSlotID IS NULL) 
    BEGIN
        RAISERROR('invalid value: timeSlowID cannot be NULL', 16, 1)
        RETURN -1
    END

    INSERT INTO Meeting(requesterID,timeSlotID)
    VALUES (@requesterID,@timeSlotID)
    RETURN  0

END
GO

DECLARE @MeetingOutput INT
DECLARE @MeetingReturn INT
EXECUTE @MeetingReturn = dbo.MeetingInsert 4,4,@MeetingOutput

GO

    9.	MeetingDelete (@meetingID)

-- Create a new stored procedure called 'MeetingDelete' in schema 'dbo'
-- Drop the stored procedure if it already exists
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'MeetingDelete'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.MeetingDelete
GO
-- Create the stored procedure in the specified schema

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Evan Kurpiewski
-- Create date: 11/3/2020

-- =============================================

CREATE PROCEDURE dbo.MeetingDelete (
    @meetingID INT 
)
AS
BEGIN

        SET NOCOUNT ON;

    IF (@meetingID IS NULL) 
    BEGIN
        RAISERROR('invalid value: meetingID cannot be NULL', 16, 1)
        RETURN -1
    END

    

    DELETE
    FROM Meeting
    WHERE meetingID = @meetingID

    RETURN  0

END
GO

EXECUTE dbo.MeetingDelete 1

GO

    10 - 1.  MeetingSetOccured () (note that the only update that can occur to a meeting is to set that it has occurred)


--- Note that this version does not have parameters and sets all meetings to have occurred!

-- Create a new stored procedure called 'MeetingSetOccured' in schema 'dbo'
-- Drop the stored procedure if it already exists
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'MeetingSetOccured'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.MeetingSetOccured
GO
-- Create the stored procedure in the specified schema

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Evan Kurpiewski
-- Create date: 11/3/2020

-- =============================================

CREATE PROCEDURE dbo.MeetingSetOccured 

AS
BEGIN

        SET NOCOUNT ON;

    UPDATE Meeting
    SET occurred = 1

    RETURN  0

END
GO

EXECUTE dbo.MeetingSetOccured 

GO

    10 - 2.  MeetingSetOccured (@meetingID) (note that the only update that can occur to a meeting is to set that it has occurred)


--- Note that this version takes in the meetingID and only changes the occurred field for that meeting!

-- Create a new stored procedure called 'MeetingSetOccured' in schema 'dbo'
-- Drop the stored procedure if it already exists
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'MeetingSetOccured'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.MeetingSetOccured
GO
-- Create the stored procedure in the specified schema

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Evan Kurpiewski
-- Create date: 11/3/2020

-- =============================================

CREATE PROCEDURE dbo.MeetingSetOccured(
		@meetingID INT
)

AS
BEGIN

        SET NOCOUNT ON;

    UPDATE Meeting
    SET occurred = 1
    WHERE meetingID = @meetingID

    RETURN  0

END
GO

EXECUTE dbo.MeetingSetOccured(1)

GO



  


