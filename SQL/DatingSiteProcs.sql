DROP PROCEDURE spUserLogin
GO

CREATE PROCEDURE dbo.spUserLogin
@username nvarchar(20),
@password nvarchar(50)
AS
BEGIN
	SET NOCOUNT ON

	SELECT 
		ID
	FROM 
		dbo.tblUsers
	WHERE
		Username=@username
	OR
		Email=@username
	AND
		Password=@password
END
GO

DROP PROCEDURE spAddUser
GO

CREATE PROCEDURE dbo.spAddUser
@username nvarchar(20),
@password nvarchar(50),
@email nvarchar(50)
AS
BEGIN
	SET NOCOUNT ON

	DECLARE @IdInserted TABLE
	(
		IdValue INTEGER
	);

	INSERT INTO 
		dbo.tblUsers (Username, Password, Email)
	OUTPUT inserted.UserID INTO @IdInserted
	VALUES 
		(@username, @password, @email)

	SELECT IdValue FROM @IdInserted
END
GO

declare @uid int
exec spAddUser 'nics','1234','dee@aol.com'
exec spAddUser 'jbloggs','1234','joe@gmail.com'
exec spAddUser 'msmith','1234','marry@mail.ie'

