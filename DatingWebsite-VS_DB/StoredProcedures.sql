------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------ USER PROCEDURES ----------------------------------------------------------- 
------------------------------------------------------------------------------------------------------------------------------------------

--- Stored procedure to add new user - returns new identity parameter- UserID

DROP PROCEDURE uspAddNewUser
GO
CREATE PROCEDURE uspAddNewUser
@username varchar(50),
@Password varchar (50),
@Email varchar(50)
AS
BEGIN
    SET NOCOUNT ON;
	DECLARE @IdInserted TABLE(IdValue INTEGER);	
    INSERT dbo.[Users](Username,Password,Email) 
	OUTPUT inserted.UserID INTO @IdInserted
	VALUES (@username,@Password,@Email)
	SELECT IdValue FROM @IdInserted
END
GO

--- Update User attributes - all params are optional except user id
DROP  PROCEDURE uspUpdateUserDetails
GO
CREATE  PROCEDURE uspUpdateUserDetails
@userid int,
@age int = NULL,
@ageRange varchar(50) = NULL,
@build varchar(50) = NULL,
@county varchar(50) = NULL,
@ethnicity varchar(50) = NULL,
@eyecolor varchar(50) = NULL,
@gender varchar(50) = NULL,
@haircolor varchar(50) = NULL,
@height varchar (50) = NULL,
@hobbies XML = NULL,
@idealdate varchar (50) = NULL,
@profession varchar(50) = NULL,
@relationshipstatus varchar (50) = NULL,
@sexualorientation varchar (50) = NULL,
@town varchar (50) = NULL,
@profilepic varchar(max)

AS
BEGIN
    SET NOCOUNT ON;
	IF(@age IS NOT NULL) Begin UPDATE dbo.UserInformation SET Age = @age WHERE dbo.UserInformation.UserID = @userid END
	IF(@ageRange IS NOT NULL) Begin UPDATE dbo.UserInformation SET AgeRange = @ageRange WHERE dbo.UserInformation.UserID = @userid END
	IF(@build IS NOT NULL) Begin UPDATE dbo.UserInformation SET Build = @build WHERE dbo.UserInformation.UserID = @userid END
	IF(@county IS NOT NULL) Begin UPDATE dbo.UserInformation SET County = @county WHERE dbo.UserInformation.UserID = @userid END
	IF(@ethnicity IS NOT NULL) Begin UPDATE dbo.UserInformation SET Ethnicity = @ethnicity WHERE dbo.UserInformation.UserID = @userid END
	IF(@eyecolor IS NOT NULL) Begin UPDATE dbo.UserInformation SET EyeColor = @eyecolor WHERE dbo.UserInformation.UserID = @userid END	
	IF(@gender IS NOT NULL) Begin UPDATE dbo.UserInformation SET Gender = @gender WHERE dbo.UserInformation.UserID = @userid END
	IF(@haircolor IS NOT NULL) Begin UPDATE dbo.UserInformation SET HairColor = @haircolor WHERE dbo.UserInformation.UserID = @userid END
	IF(@height IS NOT NULL) Begin UPDATE dbo.UserInformation SET Height = @height WHERE dbo.UserInformation.UserID = @userid END
	IF(@hobbies IS NOT NULL) Begin UPDATE dbo.UserInformation SET Hobbies = @hobbies WHERE dbo.UserInformation.UserID = @userid END
	IF(@idealdate IS NOT NULL) Begin UPDATE dbo.UserInformation SET IdealDate = @idealdate WHERE dbo.UserInformation.UserID = @userid END	
	IF(@profession IS NOT NULL) Begin UPDATE dbo.UserInformation SET Profession = @profession WHERE dbo.UserInformation.UserID = @userid END
	IF(@relationshipstatus IS NOT NULL) Begin UPDATE dbo.UserInformation SET RelationshipStatus = @relationshipstatus WHERE dbo.UserInformation.UserID = @userid END
	IF(@sexualorientation IS NOT NULL) Begin UPDATE dbo.UserInformation SET SexualOrientation = @sexualorientation WHERE dbo.UserInformation.UserID = @userid END
	IF(@town IS NOT NULL) Begin UPDATE dbo.UserInformation SET Town = @town WHERE dbo.UserInformation.UserID = @userid END
	IF(@profilepic IS NOT NULL) Begin UPDATE dbo.UserInformation SET ProfilePicturePath = @profilepic WHERE dbo.UserInformation.UserID = @userid END
END
GO

--------- Login Proc returns UserId if successful
DROP  PROCEDURE dbo.uspUserLogin
GO
CREATE  PROCEDURE dbo.uspUserLogin
@username nvarchar(50),
@password nvarchar(50)
AS
BEGIN
	SET NOCOUNT ON

	SELECT 		UserID
	FROM 		dbo.[Users]
	WHERE		Username=@username OR Email=@username
		AND		Password=@password
END
GO

--- Procedure to verify username is available input:username, output message:true or false

DROP  PROCEDURE dbo.uspCheckUsernameExists
GO
CREATE  PROCEDURE dbo.uspCheckUsernameExists
@username nvarchar(50)
AS
BEGIN
SET NOCOUNT ON
	IF EXISTS(SELECT * FROM [Users] WHERE Username = @username)
		SELECT 'true' AS UsernameAvailable
	ELSE
		SELECT 'false' AS UsernameAvailable
END
GO

----- Procedure to view UserProfile- input:username

DROP  PROCEDURE uspUserProfile_Username
GO
CREATE  PROCEDURE uspUserProfile_Username
@username NVarChar(50)
AS  
SELECT
	Users.UserId,
	Users.Email,
	UserInformation.Age,
	UserInformation.AgeRange,
	UserInformation.Build,
	UserInformation.County,
	UserInformation.Ethnicity,
	UserInformation.EyeColor,
	UserInformation.Gender,
	UserInformation.HairColor,
	UserInformation.Height,
	UserInformation.Hobbies,
	UserInformation.IdealDate,
	UserInformation.RelationshipStatus,
	UserInformation.Profession,
	UserInformation.SexualOrientation,
	UserInformation.Town,
	UserInformation.ProfilePicturePath
FROM [Users]
Inner Join UserInformation
ON [Users].UserID = UserInformation.UserID
WHERE Username=@username
GO

----- Procedure to view UserProfile- input:id

DROP  PROCEDURE uspUserProfile_UserID
GO
CREATE  PROCEDURE uspUserProfile_UserID
@userID int
AS  
SELECT
	Users.Username,
	Users.Email,
	UserInformation.Age,
	UserInformation.AgeRange,
	UserInformation.Build,
	UserInformation.County,
	UserInformation.Ethnicity,
	UserInformation.EyeColor,
	UserInformation.Gender,
	UserInformation.HairColor,
	UserInformation.Height,
	UserInformation.Hobbies,
	UserInformation.IdealDate,
	UserInformation.RelationshipStatus,
	UserInformation.Profession,
	UserInformation.SexualOrientation,
	UserInformation.Town,
	UserInformation.ProfilePicturePath
FROM [Users]
Inner Join UserInformation
ON [Users].UserID  = UserInformation.UserID
WHERE [Users].UserID=@userID
GO

------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------ ATTRIBUTE PROCEDURES ----------------------------------------------------------- 
------------------------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------ MESSAGE PROCEDURES ----------------------------------------------------------- 
------------------------------------------------------------------------------------------------------------------------------------------

DROP PROCEDURE uspAllMessages
GO

CREATE PROCEDURE uspAllMessages
@userID INT
AS  
SELECT
	Messages.MessageID,
	Messages.SenderID,
	Messages.ReceiverID,
	Sender.Username AS SenderName,
	Receiver.Username AS ReceiverName,
	Messages.Timestamp,
	Messages.Content
FROM [Messages]
	Inner Join Users AS Receiver
	ON 
		(
			Messages.ReceiverID = Receiver.UserID 
		)
	Inner Join Users AS Sender
	ON 
		(
			Messages.SenderID = Sender.UserID 
		)
WHERE 
	Messages.SenderID = @userID
	OR
	Messages.ReceiverID = @userID
GO

EXEC uspAllMessages '1'

GO


------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------ TESTING PROCEDURES ----------------------------------------------------------- 
------------------------------------------------------------------------------------------------------------------------------------------

--exec dbo.uspAddNewUser 'nics','1234','dee@aol.com'
--exec dbo.uspAddNewUser 'jbloggs','1234','joe@gmail.com'
--exec dbo.uspAddNewUser 'msmith','1234','marry@mail.ie'

--EXEC dbo.uspAddNewUser @username = 'GoHomeRoger', @Password = 'Password',@Email='ghroger@hotmail.com' 
--GO

--EXEC uspAddAllUserDetails 1,'Teacher','Dublin','Male','Straight','18-25','Brown','Blue','Small','Slim','/images/roger.jpg'
--GO

--DECLARE @id INT;
--EXEC uspAddNewUserAndDetails 'Sarah6','password','maryb@gmail.com','Nurse','Dublin','Female','Straight','18-25','Brown','Blue','Small','Slim','/images/mary.jpg',@id = @id OUTPUT;
--PRINT @id;
--GO

--exec uspUserProfile_Username 'Sarah6'
--GO

--EXEC uspUserLogin 'Ro3ger' ,'3password3'
--GO
--EXEC uspUserLogin 'Sarah6' ,'3password3'
--GO