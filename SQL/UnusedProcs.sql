----- Legacy Procedures ( may not represent current database state) -----

------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------ USER PROCEDURES ----------------------------------------------------------- 
------------------------------------------------------------------------------------------------------------------------------------------



--- Search by User attributes, returns users that match any of the criteria - all params are optional 
DROP  PROCEDURE uspSearchForUserAny
GO
CREATE  PROCEDURE uspSearchForUserAny
@ageRange varchar(50) = NULL,
@build varchar(50) = NULL,
@county varchar(50) = NULL,
@gender varchar(50) = NULL,
@height varchar (50) = NULL,
@profession varchar(50) = NULL,
@relationshipstatus varchar (50) = NULL,
@sexualorientation varchar (50) = NULL,
@town varchar (50) = NULL,
@hobbyname varchar (50) = NULL

AS
BEGIN 
	SELECT DISTINCT(a.UserID), Users.Username, Age, AgeRange, Build, County, Ethnicity, EyeColor, Gender, HairColor, Height, IdealDate, RelationshipStatus, Profession, SexualOrientation, Town, ProfilePicturePath, Comments FROM
	(
	SELECT * FROM dbo.UserInformation WHERE dbo.UserInformation.AgeRange = @ageRange 
	UNION
	SELECT * FROM dbo.UserInformation WHERE Build = @build 
	UNION
	SELECT * FROM dbo.UserInformation WHERE County = @county 
	UNION
	SELECT * FROM dbo.UserInformation WHERE Gender = @gender 
	UNION
	SELECT * FROM dbo.UserInformation WHERE Height = @height 
	UNION
	SELECT * FROM dbo.UserInformation WHERE Profession = @profession 
	UNION
	SELECT * FROM dbo.UserInformation WHERE RelationshipStatus = @relationshipstatus 
	UNION
	SELECT * FROM dbo.UserInformation WHERE SexualOrientation = @sexualorientation 
	UNION
	SELECT * FROM dbo.UserInformation WHERE Town = @town 
	UNION(
	SELECT * FROM dbo.UserInformation 
		INNER JOIN UserHobbies ON UserInformation.UserID = UserHobbies.UserID
		INNER JOIN Hobbies ON UserHobbies.HobbyID = Hobbies.HobbyID
		WHERE Hobbies.HobbyName = @hobbyname
		)
	)
	a
	INNER JOIN dbo.Users
	ON a.UserID = Users.UserID
END
GO


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

-- Add details for an existing user
CREATE PROCEDURE uspAddUserDetails
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
UPDATE UserInformation SET Profession =@profession,
						   Location=@location,
						   Gender=@gender,
						   SexualOrientation=@orientation,
						   AgeRange=@age,
						   HairColor=@haircolor,
						   EyeColor=@eyecolor,
						   Height=@height,
						   Build=@build,
						   ProfilePicturePath=@profilepic
				

WHERE UserId=@userid

exec uspAddUserDetails 16, 'Dublin','Teacher','Female','Straight','18-25','Brown','Green','Tall','Slim','wwwe'


---- procedure to add user details - input:userid, profession, location etc...

DROP  PROCEDURE uspAddAllUserDetails
GO
CREATE  PROCEDURE uspAddAllUserDetails
uspAddUserDetails
@userid int,
@profession varchar(50),
@location varchar (50),
@gender varchar(50),
@orientation varchar (50),
@age int,
@ethnicity varchar (50),
@status varchar(50),
@haircolour varchar(50),
@eyecolour varchar(50),
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
						   Age,
						   Status,
						   Ethnicity,
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
						   @status,
						   @ethnicity,
						   @haircolour,
						   @eyecolour,
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
@status varchar(50),
@age int,
@ethnicity varchar(50),
@haircolor varchar(50),
@eyecolor varchar(50),
@height varchar (50),
@build varchar(50),
@idealdate varchar(max),
@comments varchar (max),
@profilepic varchar(max),
@id int output

AS
BEGIN
    SET NOCOUNT ON;
   
	DECLARE @IdInserted TABLE(IdValue INTEGER);	
    INSERT dbo.[User](Username,Password,Email) 
	OUTPUT inserted.UserID INTO @IdInserted
	VALUES (@username,@Password,@Email)
	SELECT @id = IdValue FROM @IdInserted

    INSERT INTO UserInformation(UserID,
						   Location,
						   Age,
						   Profession,
						   EyeColor,
						   HairColor,
						   Ethnicity,
						   Status,
						   Gender,
						   SexualOrientation,
						   Build,
						   Height,
						   ProfilePicturePath,
						   IdealDate,
						   Comments)
				Values
				
						  (@id,
						@location,
						@age,
						@profession,
						@eyecolor,
						@haircolor,
						@ethnicity,
						@status,
						@gender,
						@orientation,
						@build,
						@height,
						@profilepic,
						@idealdate,
						@comments)
						 

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


-- Search for users by gender & sexual orientation
CREATE PROCEDURE uspSearchByGender_Orientation
@Gender NVarChar(50),
@Orientation NVarChar(50)

AS  
SELECT
	UserInformation.UserId,
	UserInformation.UserName,
	UserInformation.Location,
	UserInformation.Profession,
	UserInformation.Gender,
	UserInformation.AgeRange,
	UserInformation.SexualOrientation,
	UserInformation.EyeColor,
	UserInformation.HairColor,
	UserInformation.Height,
	UserInformation.Build

FROM UserInformation
wHERE Gender= @Gender
And
SexualOrientation=@Orientation

------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------ ATTRIBUTE PROCEDURES ----------------------------------------------------------- 
------------------------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------ MESSAGE PROCEDURES ----------------------------------------------------------- 
------------------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE uspSentMessages
@userID INT
AS  
SELECT
	Messages.MessageID,
	Messages.SenderID,
	Messages.ReceiverID,
	[User].Username as ReceiverName,
	Messages.DateTime, --Timestamp
	Messages.Contents --Content

FROM [Messages]
Inner Join UserInformation
ON 
(
	Messages.ReceiverID = [User].UserID 

	WHERE 
		Messages.SenderID = @userID
)

CREATE PROCEDURE uspReceivedMessages
@userID INT
AS  
SELECT
	Messages.MessageID,
	Messages.SenderID,
	Messages.ReceiverID,
	[User].Username as SenderName,
	Messages.DateTime, --Timestamp
	Messages.Contents --Content

FROM [Messages]
Inner Join UserInformation
ON 
(
	Messages.SenderID = @userID 

	WHERE 
		Messages.ReceiverID = [User].UserID
)



drop procedure uspConversationBetweenUsers

CREATE PROCEDURE uspConversationBetweenUsers
	@user1 int,
	@user2 int

As
SELECT 
[User].UserName,
[Messages].Contents,
[Messages].MessageID,
[Messages].ReceiverID,
[Messages].SenderID,
[Messages].DateTime

FROM Messages
Inner Join [User]
ON [User].UserID  = [Messages].SenderID

WHERE 

([Messages].SenderID =@user1  AND [Messages].ReceiverID=@user2)

OR

([Messages].SenderID=@user2 AND [Messages].ReceiverID=@user1)

ORDER BY
Messages.MessageID

exec uspConversationBetweenUsers 1,4

------------------
CREATE PROCEDURE uspReceivedMessages
	@user1 int

As
SELECT 
[User].UserName,
[Messages].MessageID,
[Messages].Contents,
[Messages].SenderID,
[Messages].DateTime

FROM [Messages]

Inner Join [User]
ON [User].UserID  = [Messages].SenderID


WHERE 
[Messages].ReceiverID =@user1 

ORDER BY
[Messages].MessageID



-------------
CREATE PROCEDURE uspSentMessages
	@user1 int

As
SELECT 
[User].UserName,
[Messages].MessageID,
[Messages].Contents,
[Messages].ReceiverID,
[Messages].DateTime

FROM [Messages]

Inner Join [User]
ON [User].UserID  = [Messages].ReceiverID


WHERE 
[Messages].SenderID =@user1 

ORDER BY
[Messages].MessageID





------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------ VIEWS ----------------------------------------------------------- 
------------------------------------------------------------------------------------------------------------------------------------------


CREATE VIEW [UserLogin_W_UserName] AS
SELECT UserInformation.UserName, UserLogin.UserId, UserLogin.Email, UserLogin.Password
FROM UserInformation
Left Join  UserLogin
On UserInformation.UserId = UserLogin.UserId

SElect * From [UserLogin_W_UserName]
------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------ PROCEDURE TESTING ----------------------------------------------------------- 
------------------------------------------------------------------------------------------------------------------------------------------


DECLARE @id INT;
EXEC uspAddNewUserAndDetails 'Sarah','password','maryb@gmail.com','Nurse','Dublin','Female','Straight','Never Married',24,'White','Brown','Blue','<4.7','Slim','Picnic in the park', 'loves animals','/images/mary.jpg',@id = @id OUTPUT;
PRINT @id;

DECLARE @id INT;
EXEC uspAddNewUserAndDetails 'BradPitt','password','bradpitt@gmail.com','Teacher','Dublin','Male','Straight','Never Married',54,'White','Bald','Blue','<4.7','Slim','Dinner and Drinks', 'Amateur actor in freetime','/images/bradpitt.jpg',@id = @id OUTPUT;
PRINT @id;

DECLARE @id INT;
EXEC uspAddNewUserAndDetails 'AngieJolie','password','angiej@gmail.com','Solicitor','Dublin','Female','Bisexual','Divorced',40,'White','Black','Brown','<4.7','Slim','A long walk on the beach', 'Does a lot of charity work in spare time','/images/angiejolie.jpg',@id = @id OUTPUT;
PRINT @id;

DECLARE @id INT;
EXEC uspAddNewUserAndDetails 'JennyAniston','password','jennya@gmail.com','Dentist','Dublin','Female','Straight','Divorced',42,'White','Blonde','Blue','<4.7','Athletic','Hiking', 'loves animals','/images/jennyaniston.jpg',@id = @id OUTPUT;
PRINT @id;


DECLARE @id INT;
EXEC uspAddNewUserAndDetails 'LeoCaprio','password','leocaprio@gmail.com','Salesman','Dublin','Male','Straight','Never Married',42,'White','Blonde','Blue','<4.7','Large','Sailing', 'Titanic is my favorite movie','/images/leocaprio.jpg',@id = @id OUTPUT;
PRINT @id;


