CREATE PROCEDURE dbo.spLogin
@username nvarchar(20),
@password nvarchar(50)
AS
BEGIN
	SET NOCOUNT ON

	SELECT 
		* 
	FROM 
		dbo.tblUsers
	WHERE
		Username=@username
	AND
		Password=@password
END
GO

DROP PROCEDURE spLogin
GO
