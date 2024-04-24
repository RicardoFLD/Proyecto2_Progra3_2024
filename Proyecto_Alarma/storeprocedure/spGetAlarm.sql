USE [Alarmas]
GO

/****** Object:  StoredProcedure [dbo].[spGetAlarm]    Script Date: 24/4/2024 17:27:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spGetAlarm]

AS
BEGIN
	
	SELECT * from TAlarms
END
GO


