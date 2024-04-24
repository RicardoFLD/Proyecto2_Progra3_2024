USE [Alarmas]
GO

/****** Object:  StoredProcedure [dbo].[spDeleteAlarm]    Script Date: 24/4/2024 17:26:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spDeleteAlarm]
	@alarmid int
AS
BEGIN
	Delete from TAlarms
	where id_alar = @alarmid;

END
GO


