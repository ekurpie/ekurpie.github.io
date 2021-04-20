 -- 1.  ChangeMeetingTime (@meetingID) (note that the only update that can occur to a meeting is to set that it has occurred)


--- Note that this version does not have parameters and sets all meetings to have occurred!

-- Create a new stored procedure called 'ChangeMeetingTime' in schema 'dbo'
-- Drop the stored procedure if it already exists
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'ChangeMeetingTime'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.ChangeMeetingTime
GO
-- Create the stored procedure in the specified schema

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Evan Kurpiewski
-- Create date: 11/12/2020

-- =============================================

CREATE PROCEDURE dbo.ChangeMeetingTime(
		@meetingID INT,
        @newBeginTime datetime2,
        @newEndTime datetime2
)

AS
BEGIN


    DECLARE @timeslot int
    SET @timeslot = (SELECT TimeSlot.timeSlotID
                     FROM TimeSlot
                     join Meeting on meeting.timeSlotID = TimeSLot.timeSlotID
                     where meetingID = @meetingID)


    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

    BEGIN TRAN
        BEGIN TRY

            UPDATE  TimeSlot
            SET     beginTime = @newBeginTime,
                    endTime = @newEndTime
            WHERE   timeSlotID = @timeslot
            COMMIT TRAN
            RETURN  0
        END TRY

        BEGIN CATCH
            ROLLBACK TRAN
            RETURN -1
        
        END CATCH


END
GO

EXECUTE dbo.ChangeMeetingTime @meetingID = 2, @newBeginTime = '10-11-30', @newEndTime = '10-11-31'

GO


 -- 2.  RemoveTimeSlot(@timeSlotID)- a timeslot is being removed by the owner of the TimeSlotSet. If the time slot has an associated meeting, also delete the meeting.


--- Note that this version does not have parameters and sets all meetings to have occurred!

-- Create a new stored procedure called 'RemoveTimeSlot' in schema 'dbo'
-- Drop the stored procedure if it already exists
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'RemoveTimeSlot'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.RemoveTimeSlot
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

CREATE PROCEDURE dbo.RemoveTimeSlot(
		@timeSlotID int
)

AS
BEGIN

    if (@timeSlotID IS NULL)
        
        BEGIN
            RAISERROR('invalid value: timeSlotSetID cannot be NULL', 16, 1)
            RETURN -1
        END

    DECLARE @meeting int

    SET @meeting = (SELECT meetingID
                    FROM TimeSlot
                    join Meeting on meeting.timeSlotID = TimeSLot.timeSlotID
                    where TimeSlot.timeSlotID = @timeSlotID)


    IF (@meeting IS NULL)
    BEGIN

        SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
        BEGIN TRAN
            BEGIN TRY

                Delete  
                FROM TimeSlot
                WHERE   timeSlotID = @timeSlotID
                COMMIT TRAN
                RETURN  0
            END TRY

            BEGIN CATCH
                ROLLBACK TRAN
                RETURN -1
            
            END CATCH
        END

    IF (@meeting IS NOT NULL)
    BEGIN
        
        SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
        BEGIN TRAN
            BEGIN TRY

                Delete 
                FROM Meeting
                WHERE meetingID = @meeting

                Delete  
                FROM TimeSlot
                WHERE  timeSlotID = @timeSlotID


                COMMIT TRAN
                RETURN  0


            END TRY

            BEGIN CATCH
                ROLLBACK TRAN
                RETURN -1
            
            END CATCH
    END

END
GO

EXECUTE dbo.RemoveTimeSlot 3

GO

 -- 3.  ClearDay(@userID, @date) - all time slots on a given day need to be removed. Any or all of the timeslots to be removed may have meetings associated with them, if so, also delete them. 


--- Note that this version does not have parameters and sets all meetings to have occurred!

-- Create a new stored procedure called 'ClearDay' in schema 'dbo'
-- Drop the stored procedure if it already exists
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'ClearDay'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.ClearDay
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

CREATE PROCEDURE dbo.ClearDay(
		@userID int,
        @date   datetime2
)

AS
BEGIN

    if (@userID IS NULL)
        
        BEGIN
            RAISERROR('invalid value: userID cannot be NULL', 16, 1)
            RETURN -1
        END

    if (@date IS NULL)
        
        BEGIN
            RAISERROR('invalid value: date cannot be NULL', 16, 1)
            RETURN -1
        END
    
  

    BEGIN

        SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
        BEGIN TRAN
            BEGIN TRY

                Delete  
                FROM Meeting
                WHERE meetingID IN (Select Meeting.meetingID
                                    FROM [User]
                                    join TimeSlotSet on [User].UserID = timeSlotSet.ownerUserID
                                    join TimeSlot on timeSlotSet.timeSlotSetID = TimeSlot.timeSlotSetID
                                    join Meeting on TimeSlot.timeSlotID = meeting.timeSlotID
                                    WHERE beginTime = @date AND [User].userID = @userID)

                DELETE 
                FROM TimeSlot
                WHERE timeSlotID IN (Select timeSlot.timeSlotID
                                    FROM [User]
                                    join TimeSlotSet on [User].UserID = timeSlotSet.ownerUserID
                                    join TimeSlot on timeSlotSet.timeSlotSetID = TimeSlot.timeSlotSetID
                                    WHERE beginTime = @date AND [User].userID = @userID)
                COMMIT TRAN
                RETURN 0

            END TRY

            BEGIN CATCH
                ROLLBACK TRAN
                RETURN -1
            
            END CATCH
        END

   

END
GO

EXECUTE dbo.ClearDay 4,"10-11-12"

GO