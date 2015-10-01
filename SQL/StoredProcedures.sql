------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------ USER PROCEDURES ----------------------------------------------------------- 
------------------------------------------------------------------------------------------------------------------------------------------

---- ADD NEW USER TO USERS AND USERINFORMATION - returns new identity parameter- UserID
DROP PROCEDURE uspAddNewUser
GO
CREATE PROCEDURE uspAddNewUser
@username varchar(50),
@Password varchar (50),
@Email varchar(50)
AS
BEGIN
    SET NOCOUNT ON;
	DECLARE @ID int;
	DECLARE @IDInserted TABLE(IDValue INTEGER);	
	
    INSERT dbo.[Users](Username,Password,Email) 
	OUTPUT inserted.UserID INTO @IDInserted
	VALUES (@username,@Password,@Email)
	
	SELECT @ID = IDValue FROM @IDInserted 
	
	INSERT dbo.UserInformation(UserID) VALUES (@ID)
	
	SELECT @ID AS UserID
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
--@hobbies XML = NULL,
@idealdate varchar (50) = NULL,
@profession varchar(50) = NULL,
@relationshipstatus varchar (50) = NULL,
@sexualorientation varchar (50) = NULL,
@town varchar (50) = NULL,
@comments varchar (50) = NULL,
@profilepic varchar(max) = NULL

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
	--IF(@hobbies IS NOT NULL) Begin UPDATE dbo.UserInformation SET Hobbies = @hobbies WHERE dbo.UserInformation.UserID = @userid END
	IF(@idealdate IS NOT NULL) Begin UPDATE dbo.UserInformation SET IdealDate = @idealdate WHERE dbo.UserInformation.UserID = @userid END	
	IF(@profession IS NOT NULL) Begin UPDATE dbo.UserInformation SET Profession = @profession WHERE dbo.UserInformation.UserID = @userid END
	IF(@relationshipstatus IS NOT NULL) Begin UPDATE dbo.UserInformation SET RelationshipStatus = @relationshipstatus WHERE dbo.UserInformation.UserID = @userid END
	IF(@sexualorientation IS NOT NULL) Begin UPDATE dbo.UserInformation SET SexualOrientation = @sexualorientation WHERE dbo.UserInformation.UserID = @userid END
	IF(@town IS NOT NULL) Begin UPDATE dbo.UserInformation SET Town = @town WHERE dbo.UserInformation.UserID = @userid END
	IF(@comments IS NOT NULL) Begin UPDATE dbo.UserInformation SET Comments = @comments WHERE dbo.UserInformation.UserID = @userid END
	IF(@profilepic IS NOT NULL) Begin UPDATE dbo.UserInformation SET ProfilePicturePath = @profilepic WHERE dbo.UserInformation.UserID = @userid END
END
GO

--- Update User Account Details - all params are optional except user id
DROP  PROCEDURE uspUpdateUserAccount
GO
CREATE  PROCEDURE uspUpdateUserAccount
@userid int,
@username varchar(50) = NULL,
@password varchar(50) = NULL,
@email varchar(50) = NULL

AS
BEGIN
    SET NOCOUNT ON;
	IF(@username IS NOT NULL) Begin UPDATE dbo.Users SET Username = @username WHERE dbo.Users.UserID = @userid END
	IF(@password IS NOT NULL) Begin UPDATE dbo.Users SET Password = @password WHERE dbo.Users.UserID = @userid END
	IF(@email IS NOT NULL) Begin UPDATE dbo.Users SET Email = @email WHERE dbo.Users.UserID = @userid END
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
	UserInformation.IdealDate,
	UserInformation.RelationshipStatus,
	UserInformation.Profession,
	UserInformation.SexualOrientation,
	UserInformation.Town,
	UserInformation.ProfilePicturePath,
	UserInformation.Comments
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
	UserInformation.IdealDate,
	UserInformation.RelationshipStatus,
	UserInformation.Profession,
	UserInformation.SexualOrientation,
	UserInformation.Town,
	UserInformation.ProfilePicturePath,
	UserInformation.Comments
FROM [Users]
Inner Join UserInformation
ON [Users].UserID  = UserInformation.UserID
WHERE [Users].UserID=@userID
GO

-- Get All Users
DROP PROCEDURE uspGetAllUsers
GO
CREATE PROCEDURE uspGetAllUsers
AS
BEGIN
    SELECT Users.UserID, Users.Username, Age, AgeRange, Build, County, Ethnicity, EyeColor, Gender, HairColor, Height, IdealDate, RelationshipStatus, Profession, SexualOrientation, Town, ProfilePicturePath, Comments 
	FROM UserInformation
	INNER JOIN dbo.Users
	ON UserInformation.UserID = Users.UserID
	
END
GO

-- Get All Hobbies For A User
DROP PROCEDURE uspGetUserHobbies
GO
CREATE PROCEDURE uspGetUserHobbies
@userid int
AS
BEGIN
    SELECT Hobbies.HobbyID, HobbyName
	FROM Hobbies
	INNER JOIN dbo.UserHobbies
	ON Hobbies.HobbyID = UserHobbies.HobbyID	
	WHERE UserHobbies.UserID = @userid
END
GO

-- Get All Images for a User
DROP PROCEDURE uspGetUserImages
GO
CREATE PROCEDURE uspGetUserImages
@userid int
AS
BEGIN
    SELECT ImageID, ImageFile
	FROM UserImages	
	WHERE UserImages.UserID = @userid
END
GO

-- Add an Image for a User
DROP PROCEDURE uspAddUserImages
GO
CREATE PROCEDURE uspAddUserImages
@userid int,
@imagefile image
AS
BEGIN
    INSERT INTO UserImages 
	VALUES(@userid, @imagefile)
END
GO

------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------ ATTRIBUTE PROCEDURES ----------------------------------------------------------- 
------------------------------------------------------------------------------------------------------------------------------------------
-- Get All Users
DROP PROCEDURE uspGetHobbies
GO
CREATE PROCEDURE uspGetHobbies
AS
BEGIN
    SELECT *
	FROM Hobbies
END
GO

------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------ MESSAGE PROCEDURES ----------------------------------------------------------- 
------------------------------------------------------------------------------------------------------------------------------------------

-- Get All Messages --
DROP PROCEDURE uspAllMessages
GO


CREATE PROCEDURE uspAllMessages
@userID INT
AS  
SELECT
	Conversation.ConversationID,
	Conversation.ParticipantA_ID,
	Conversation.ParticipantB_ID,
	ParticipantA.Username AS ParticipantA_Name,
	ParticipantB.Username AS ParticipantB_Name,
	Conversation.MessageContent
FROM [Conversation]
	Inner Join Users AS ParticipantA
	ON 
		(
			Conversation.ParticipantA_ID = ParticipantA.UserID 
		)
	Inner Join Users AS ParticipantB
	ON 
		(
			Conversation.ParticipantB_ID = ParticipantB.UserID 
		)
WHERE 
	Conversation.ParticipantA_ID = @userID
	OR
	Conversation.ParticipantB_ID= @userID
GO

-- Get a Single Conversation By ConversationID --
DROP PROCEDURE uspGetConversationByID
GO
CREATE PROCEDURE uspGetConversationByID
@convoID INT
AS  
SELECT
	Conversation.ConversationID,
	Conversation.ParticipantA_ID,
	Conversation.ParticipantB_ID,
	ParticipantA.Username AS ParticipantA_Name,
	ParticipantB.Username AS ParticipantB_Name,
	Conversation.MessageContent
FROM [Conversation]
	Inner Join Users AS ParticipantB
	ON 
		(
			Conversation.ParticipantB_ID = ParticipantB.UserID 
		)
	Inner Join Users AS ParticipantA
	ON 
		(
			Conversation.ParticipantA_ID = ParticipantA.UserID 
		)
WHERE 
	Conversation.ConversationID = @convoID
GO

-- Updating a Conversation record by ConversationID
DROP PROCEDURE [dbo].uspUpdateConversation
GO
CREATE PROCEDURE [dbo].uspUpdateConversation
	@convoID int,
	@MessageContent xml
AS
BEGIN
	SET NOCOUNT ON
	UPDATE dbo.Conversation 
		SET MessageContent = @MessageContent 
	WHERE 
		dbo.Conversation.ConversationID = @convoID
END
GO

-- Adding a new record to Conversation
Drop PROCEDURE [dbo].[uspAddNewConversation]
GO
CREATE PROCEDURE [dbo].[uspAddNewConversation]
	@partA_ID int,
	@partB_ID int,
	@MessageContent xml
AS
BEGIN
	INSERT INTO Conversation
	(
		ParticipantA_ID,
		ParticipantB_ID,
		MessageContent
	)
	VALUES
	(
		@partA_ID,
		@partB_ID,
		@MessageContent
	)
END
GO



------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------ TESTING PROCEDURES ----------------------------------------------------------- 
------------------------------------------------------------------------------------------------------------------------------------------

--exec dbo.uspAddNewUser 'dnics','12345678','dee@aol.com'
--select * from UserInformation where UserID = 29

--exec dbo.uspAddNewUser 'jbloggs','12345678','joe@gmail.com'
--exec dbo.uspAddNewUser 'msmith','12345678','marry@mail.ie'

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


--EXEC uspAllMessages '1'
--GO


--exec uspSearchForUserAny @county='Dublin', @sexualorientation='straight'
--GO