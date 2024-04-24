USE [Alarmas]
GO

/****** Object:  StoredProcedure [dbo].[spSaveAlarm]    Script Date: 24/4/2024 17:27:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSaveAlarm]
	@name VARCHAR(50),
	@hour VARCHAR(250),
	@days VARCHAR(50),
	@active VARCHAR(150)
AS
BEGIN

	INSERT	 INTO [dbo].[TAlarms]([name],[hour],[days],[active])
	values (@name,@hour,@days,@active)
end
GO


