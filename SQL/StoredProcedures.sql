------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------ STORED PROCEDURES ----------------------------------------------------------- 
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
@profession varchar(50) = NULL,
@location varchar (50) = NULL,
@gender varchar(50) = NULL,
@orientation varchar (50) = NULL,
@age int = NULL,
@ageRange varchar(50) = NULL,
@haircolor varchar(50) = NULL,
@eyecolor varchar(50) = NULL,
@height varchar (50) = NULL,
@build varchar(50) = NULL

AS
BEGIN
    SET NOCOUNT ON;
	IF(@profession IS NOT NULL) Begin UPDATE dbo.UserInformation SET Profession = @profession WHERE dbo.UserInformation.UserID = @userid END
	IF(@location IS NOT NULL) Begin UPDATE dbo.UserInformation SET Location = @location WHERE dbo.UserInformation.UserID = @userid END
	IF(@gender IS NOT NULL) Begin UPDATE dbo.UserInformation SET Gender = @gender WHERE dbo.UserInformation.UserID = @userid END
	IF(@orientation IS NOT NULL) Begin UPDATE dbo.UserInformation SET SexualOrientation = @orientation WHERE dbo.UserInformation.UserID = @userid END
	IF(@age IS NOT NULL) Begin UPDATE dbo.UserInformation SET Age = @age WHERE dbo.UserInformation.UserID = @userid END
	IF(@ageRange IS NOT NULL) Begin UPDATE dbo.UserInformation SET AgeRange = @ageRange WHERE dbo.UserInformation.UserID = @userid END
	IF(@haircolor IS NOT NULL) Begin UPDATE dbo.UserInformation SET HairColor = @haircolor WHERE dbo.UserInformation.UserID = @userid END
	IF(@eyecolor IS NOT NULL) Begin UPDATE dbo.UserInformation SET EyeColor = @eyecolor WHERE dbo.UserInformation.UserID = @userid END
	IF(@height IS NOT NULL) Begin UPDATE dbo.UserInformation SET Height = @height WHERE dbo.UserInformation.UserID = @userid END
	IF(@build IS NOT NULL) Begin UPDATE dbo.UserInformation SET Build = @build WHERE dbo.UserInformation.UserID = @userid END
END
GO

--------- Login Proc returns UserId if successful
DROP  PROCEDURE dbo.uspUserLogin
GO
CREATE  PROCEDURE dbo.uspUserLogin
@username nvarchar(20),
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
	UserInformation.UserId,
	[Users].Email,
	UserInformation.Location,
	UserInformation.Profession,
	UserInformation.EyeColor,
	UserInformation.HairColor,
	UserInformation.AgeRange,
	UserInformation.Gender,
	UserInformation.SexualOrientation,
	UserInformation.Build,
	UserInformation.Height,
	UserInformation.ProfilePicturePath,
	UserInformation.Age
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
	[Users].Username,
	[Users].Email,
	UserInformation.Location,
	UserInformation.Profession,
	UserInformation.EyeColor,
	UserInformation.HairColor,
	UserInformation.AgeRange,
	UserInformation.Gender,
	UserInformation.SexualOrientation,
	UserInformation.Build,
	UserInformation.Height,
	UserInformation.ProfilePicturePath,
	UserInformation.Age
FROM [Users]
Inner Join UserInformation
ON [Users].UserID  = UserInformation.UserID
WHERE [Users].UserID=@userID
GO

------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------

---- procedure to add user details - input:userid, profession, location etc...

DROP  PROCEDURE uspAddAllUserDetails
GO
CREATE  PROCEDURE uspAddAllUserDetails
@userid int,
@profession varchar(50),
@location varchar (50),
@gender varchar(50),
@orientation varchar (50),
@age int,
@ageRange varchar(50),
@haircolor varchar(50),
@eyecolor varchar(50),
@height varchar (50),
@build varchar(50)

AS
BEGIN
    SET NOCOUNT ON;

	 Insert dbo.UserInformation(
							UserID,
						   Location,
						   Profession,
						   Gender,
						   SexualOrientation,
						   Age,
						   AgeRange,
						   HairColor,
						   EyeColor,
						   Height,
						   Build)
				Values
				
						  (@userid,
						@location,
						@profession,
						   @gender,
						   @orientation,
						   @age,
						   @ageRange,
						   @haircolor,
						   @eyecolor,
						   @height,
						   @build)

	END			
	GO
	
---- Stored Procedure to enter all User Details at once
DROP PROCEDURE uspAddNewUserAndDetails
GO
CREATE  PROCEDURE uspAddNewUserAndDetails
@username varchar(50),
@Password varchar (50),
@Email varchar(50),
@profession varchar(50),
@location varchar (50),
@gender varchar(50),
@orientation varchar (50),
@age varchar(50),
@haircolor varchar(50),
@eyecolor varchar(50),
@height varchar (50),
@build varchar(50),
@profilepic varchar(max),
@id int output

AS
BEGIN
    SET NOCOUNT ON;
   
	DECLARE @IdInserted TABLE(IdValue INTEGER);	
    INSERT dbo.[Users](Username,Password,Email) 
	OUTPUT inserted.UserID INTO @IdInserted
	VALUES (@username,@Password,@Email)
	SELECT @id = IdValue FROM @IdInserted

    INSERT INTO UserInformation(UserID,
						   Location,
						   Profession,
						   Gender,
						   SexualOrientation,
						   AgeRange,
						   HairColor,
						   EyeColor,
						   Height,
						   Build,
						   ProfilePicturePath)
				Values
				
						  (@id,
						@location,
						@profession,
						   @gender,
						   @orientation,
						   @age,
						   @haircolor,
						   @eyecolor,
						   @height,
						   @build,
						   @profilepic)
						     		 
			

       RETURN @id

END
GO

--- Procedure to verify user login details- input:username and password, output message:true or false

DROP  PROCEDURE dbo.uspBooleanUserLogin
GO
CREATE  PROCEDURE dbo.uspBooleanUserLogin
@username nvarchar(50),
@password nvarchar(50)

AS
BEGIN

SET NOCOUNT ON

IF EXISTS(SELECT * FROM [Users] WHERE Username = @username OR
		Email=@username AND Password = @password)
    SELECT 'true' AS UserExists
ELSE
    SELECT 'false' AS UserExists

END
GO


------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------- VIEWS -------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------

----- VIEWS -----

------ View to view all attribute and values 

DROP VIEW [ViewAllAttributeValues]
GO
CREATE VIEW [ViewAllAttributeValues]
AS 
Select
	'Eye Color' as Attribute,
	EyeColor as  Attribute_Value
	FROM 
	EyeColor

UNION

SELECT
  'Sexual Orientation',
   Orientation
FROM
    SexualOrientation 

UNION

SELECT
  'Age Range',
   AgeRange
FROM
   AgeRange 

UNION

SELECT
  'Build',
   Build
FROM
    Build

UNION

SELECT
  'Gender',
	Gender
FROM
    Gender

UNION

SELECT
  'Hair Color',
	HairColor
FROM
    HairColor

UNION

SELECT
  'Height',
	Height
FROM
    Height

UNION

SELECT
  'Hobby Name',
	HobbyName
FROM
    Hobbies
GO


------------------------------------------------------------------------------------------------------------------------------------------
--EXEC dbo.uspAddNewUser @username = 'GoHomeRoger', @Password = 'Password',@Email='ghroger@hotmail.com' 
--GO

--EXEC uspAddAllUserDetails 1,'Teacher','Dublin','Male','Straight','18-25','Brown','Blue','Small','Slim','/images/roger.jpg'
--GO

--DECLARE @id INT;
--EXEC uspAddNewUserAndDetails 'Sarah6','password','maryb@gmail.com','Nurse','Dublin','Female','Straight','18-25','Brown','Blue','Small','Slim','/images/mary.jpg',@id = @id OUTPUT;
--PRINT @id;
--GO

--SELECT * FROM ViewAllAttributeValues
--GO

--exec uspUserProfile_Username 'Sarah6'
--GO

--EXEC uspUserLogin 'Ro3ger' ,'3password3'
--GO
--EXEC uspUserLogin 'Sarah6' ,'3password3'
--GO