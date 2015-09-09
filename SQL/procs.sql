---- stored procedures

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
    INSERT dbo.[Users](UserName,Password,Email) 
	OUTPUT inserted.UserID INTO @IdInserted
	VALUES (@username,@Password,@Email)
	SELECT IdValue FROM @IdInserted
END
GO

---- procedure to add user details - input:userid, profession, location etc...

DROP  PROCEDURE uspAddAllUserDetails
GO
CREATE  PROCEDURE uspAddAllUserDetails
@userid int,
@profession varchar(50),
@location varchar (50),
@gender varchar(50),
@orientation varchar (50),
@age varchar(50),
@haircolor varchar(50),
@eyecolor varchar(50),
@height varchar (50),
@build varchar(50),
@profilepic varchar(max)

AS
BEGIN
    SET NOCOUNT ON;

	 Insert dbo.UserInformation(
							UserID,
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
				
						  (@userid,
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
    INSERT dbo.[Users](UserName,Password,Email) 
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

----- Procedure to view UserProfile- input:username

DROP  PROCEDURE uspUserProfile_UserName
GO
CREATE  PROCEDURE uspUserProfile_UserName
@Name NVarChar(50)
AS  
SELECT
	UserInformation.UserId,
	[Users].UserName,
	[Users].Email,
	UserInformation.Location,
	UserInformation.Profession,
	UserInformation.Gender,
	UserInformation.AgeRange,
	UserInformation.SexualOrientation,
	UserInformation.EyeColor,
	UserInformation.HairColor,
	UserInformation.Height,
	UserInformation.Build,
	UserInformation.ProfilePicturePath

FROM [Users]
Inner Join UserInformation

ON [Users].UserID = UserInformation.UserID
WHERE UserName=@Name
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

IF EXISTS(SELECT * FROM [Users] WHERE UserName = @username OR
		Email=@username AND Password = @password)
    SELECT 'true' AS UserExists
ELSE
    SELECT 'false' AS UserExists

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

--exec uspUserProfile_UserName 'Sarah6'
--GO

--EXEC uspUserLogin 'Ro3ger' ,'3password3'
--GO
--EXEC uspUserLogin 'Sarah6' ,'3password3'
--GO