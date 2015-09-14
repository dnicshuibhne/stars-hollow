----- Legacy Procedures ( may not represent current database state) -----

------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------ USER PROCEDURES ----------------------------------------------------------- 
------------------------------------------------------------------------------------------------------------------------------------------

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


