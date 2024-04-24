USE [Alarmas]
GO

/****** Object:  StoredProcedure [dbo].[spUpdateAlar]    Script Date: 24/4/2024 17:27:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spUpdateAlar]
	@id int,
	@name VARCHAR (50),
	@hour VARCHAR (250),
	@days VARCHAR (50),
	@active VARCHAR(150)
AS
BEGIN
	 UPDATE TAlarms
    SET name = @name,
        hour = @hour,
        days = @days,
		active =@active
		
    WHERE id_alar = @id;

END
GO


