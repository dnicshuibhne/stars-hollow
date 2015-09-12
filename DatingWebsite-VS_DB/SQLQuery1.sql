
DROP PROCedure uspAddNewUserAndDetails
drop procedure uspAddUserDetails
drop procedure uspUpdateUserDetails
drop procedure uspUserProfile_Username

drop procedure uspUserProfile_UserID

CREATE  PROCEDURE uspAddNewUserAndDetails
@username varchar(50),
@Password varchar (50),
@Email varchar(50),
@profession varchar(50),
@town varchar (50),
@county varchar (50),
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
						   Town,
						   County,
						   Age,
						   Profession,
						   EyeColor,
						   HairColor,
						   Ethnicity,
						  RelationshipStatus,
						   Gender,
						   SexualOrientation,
						   Build,
						   Height,
						   ProfilePicturePath,
						   IdealDate,
						   Comments)
				Values
				
						  (@id,
						@town,
						@county,
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

CREATE PROCEDURE uspAddUserDetails
@userid int,
@profession varchar(50),
@town varchar (50),
@county varchar (50),
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
@profilepic varchar(max)



AS
BEGIN
    SET NOCOUNT ON;

	 Insert dbo.UserInformation(
							UserID,
						   Town,
						   County,
						   Profession,
						   Gender,
						   SexualOrientation,
						   RelationshipStatus,
						   Age,
						   HairColor,
						   Ethnicity,
						   EyeColor,
						   Height,
						   Build,
						   ProfilePicturePath,
						   IdealDate,
						   Comments)
				Values
				
						  (@userid,
						  @town,
						  @county,
						   @profession,
						   @gender,
						   @orientation,
						   @status,
						   @age,
						   @haircolor,
						   @ethnicity,
						   @eyecolor,
						   @height,
						   @build,
						   @profilepic,
						   @idealdate,
						   @comments)

	END

	
CREATE  PROCEDURE uspUpdateUserDetails
@userid int,
@profession varchar(50) = NULL,
@town varchar (50) = NULL,
@county varchar (50) = NULL,
@gender varchar(50) = NULL,
@status varchar(50) =NULL,
@ethnicity varchar(50) =NULL,
@orientation varchar (50) = NULL,
@age int = NULL,
@haircolor varchar(50) = NULL,
@eyecolor varchar(50) = NULL,
@height varchar (50) = NULL,
@build varchar(50) = NULL,
@idealdate varchar(max),
@comments varchar (max)

AS
BEGIN
    SET NOCOUNT ON;
	IF(@profession IS NOT NULL) Begin UPDATE dbo.UserInformation SET Profession = @profession WHERE dbo.UserInformation.UserID = @userid END
	IF(@town IS NOT NULL) Begin UPDATE dbo.UserInformation SET Town = @town WHERE dbo.UserInformation.UserID = @userid END
    IF(@county IS NOT NULL) Begin UPDATE dbo.UserInformation SET County = @county WHERE dbo.UserInformation.UserID = @userid END
	IF(@gender IS NOT NULL) Begin UPDATE dbo.UserInformation SET Gender = @gender WHERE dbo.UserInformation.UserID = @userid END
    IF(@status IS NOT NULL) Begin UPDATE dbo.UserInformation SET RelationshipStatus = @status WHERE dbo.UserInformation.UserID = @userid END
    IF(@ethnicity IS NOT NULL) Begin UPDATE dbo.UserInformation SET Ethnicity = @ethnicity WHERE dbo.UserInformation.UserID = @userid END
	IF(@orientation IS NOT NULL) Begin UPDATE dbo.UserInformation SET SexualOrientation = @orientation WHERE dbo.UserInformation.UserID = @userid END
	IF(@age IS NOT NULL) Begin UPDATE dbo.UserInformation SET Age = @age WHERE dbo.UserInformation.UserID = @userid END
	IF(@haircolor IS NOT NULL) Begin UPDATE dbo.UserInformation SET HairColor = @haircolor WHERE dbo.UserInformation.UserID = @userid END
	IF(@eyecolor IS NOT NULL) Begin UPDATE dbo.UserInformation SET EyeColor = @eyecolor WHERE dbo.UserInformation.UserID = @userid END
	IF(@height IS NOT NULL) Begin UPDATE dbo.UserInformation SET Height = @height WHERE dbo.UserInformation.UserID = @userid END
    IF(@comments IS NOT NULL) Begin UPDATE dbo.UserInformation SET Comments = @comments WHERE dbo.UserInformation.UserID = @userid END
    IF(@idealdate IS NOT NULL) Begin UPDATE dbo.UserInformation SET IdealDate = @idealdate WHERE dbo.UserInformation.UserID = @userid END
	IF(@build IS NOT NULL) Begin UPDATE dbo.UserInformation SET Build = @build WHERE dbo.UserInformation.UserID = @userid END
	END
	
CREATE  PROCEDURE uspUserProfile_Username
@username NVarChar(50)
AS  
SELECT
	UserInformation.UserId,
	[User].Email,
	UserInformation.Town,
	UserInformation.County,
	UserInformation.Profession,
	UserInformation.Ethnicity,
	UserInformation.RelationshipStatus,
	UserInformation.EyeColor,
	UserInformation.HairColor,
	UserInformation.Age,
	UserInformation.Gender,
	UserInformation.SexualOrientation,
	UserInformation.Build,
	UserInformation.Height,
	UserInformation.ProfilePicturePath,
	UserInformation.IdealDate,
	UserInformation.Comments
FROM [User]
Inner Join UserInformation
ON [User].UserID = UserInformation.UserID
WHERE UserName=@username 


CREATE  PROCEDURE dbo.uspUserLogin
@username nvarchar(20),
@password nvarchar(50)
AS
BEGIN
	SET NOCOUNT ON

	SELECT 		UserID
	FROM 		dbo.[User]
	WHERE		UserName=@username OR Email=@username
		AND		Password=@password
END



INSERT INTO [dbo].[RelationshipStatus] ([RelationshipStatus]) VALUES (N'Divorced')
INSERT INTO [dbo].[RelationshipStatus] ([RelationshipStatus]) VALUES (N'Never Married')
INSERT INTO [dbo].[RelationshipStatus] ([RelationshipStatus]) VALUES (N'Seperated')
INSERT INTO [dbo].[RelationshipStatus] ([RelationshipStatus]) VALUES (N'Widowed')


INSERT INTO [dbo].[UserInformation] ([UserID], [Town], [County], [Age], [Profession], [EyeColor], [HairColor], [Ethnicity], [RelationshipStatus], [Gender], [SexualOrientation], [Build], [Height], [ProfilePicturePath], [IdealDate], [Comments]) VALUES (1, N'Dundalk', N'Louth', 24, N'Nurse', N'Blue', N'Brown', N'White', N'Never Married', N'Female', N'Straight', N'Slim', N'<4.7', N'/images/mary.jpg', N'Picnic in the park', N'loves animals')
INSERT INTO [dbo].[UserInformation] ([UserID], [Town], [County], [Age], [Profession], [EyeColor], [HairColor], [Ethnicity], [RelationshipStatus], [Gender], [SexualOrientation], [Build], [Height], [ProfilePicturePath], [IdealDate], [Comments]) VALUES (2, N'Tralee', N'Kerry', 54, N'Teacher', N'Blue', N'Bald', N'White', N'Never Married', N'Male', N'Straight', N'Slim', N'<4.7', N'/images/bradpitt.jpg', N'Dinner and Drinks', N'Amateur actor in freetime')
INSERT INTO [dbo].[UserInformation] ([UserID], [Town], [County], [Age], [Profession], [EyeColor], [HairColor], [Ethnicity], [RelationshipStatus], [Gender], [SexualOrientation], [Build], [Height], [ProfilePicturePath], [IdealDate], [Comments]) VALUES (3, N'Sligo', N'Sligo', 40, N'Solicitor', N'Brown', N'Black', N'White', N'Divorced', N'Female', N'Bisexual', N'Slim', N'<4.7', N'/images/angiejolie.jpg', N'A long walk on the beach', N'Does a lot of charity work in spare time')
INSERT INTO [dbo].[UserInformation] ([UserID], [Town], [County], [Age], [Profession], [EyeColor], [HairColor], [Ethnicity], [RelationshipStatus], [Gender], [SexualOrientation], [Build], [Height], [ProfilePicturePath], [IdealDate], [Comments]) VALUES (4, NULL, NULL, 42, N'Dentist', N'Blue', N'Blonde', N'White', N'Divorced', N'Female', N'Straight', N'Athletic', N'<4.7', N'/images/jennyaniston.jpg', N'Hiking', N'loves animals')
SET IDENTITY_INSERT [dbo].[User] ON
INSERT INTO [dbo].[User] ([UserID], [UserName], [Password], [Email]) VALUES (1, N'Sarah', N'password', N'maryb@gmail.com')
INSERT INTO [dbo].[User] ([UserID], [UserName], [Password], [Email]) VALUES (2, N'BradPitt', N'password', N'bradpitt@gmail.com')
INSERT INTO [dbo].[User] ([UserID], [UserName], [Password], [Email]) VALUES (3, N'AngieJolie', N'password', N'angiej@gmail.com')
INSERT INTO [dbo].[User] ([UserID], [UserName], [Password], [Email]) VALUES (4, N'JennyAniston', N'password', N'jennya@gmail.com')
INSERT INTO [dbo].[User] ([UserID], [UserName], [Password], [Email]) VALUES (11, N'LeoCaprio', N'password', N'leocaprio@gmail.com')
INSERT INTO [dbo].[User] ([UserID], [UserName], [Password], [Email]) VALUES (12, N'claire', N'password', N'claire@gmail.com')
SET IDENTITY_INSERT [dbo].[User] OFF


CREATE  PROCEDURE uspUserProfile_UserID
@userID int
AS  
SELECT
	[User].Username,
	[User].Email,
	UserInformation.Town,
	UserInformation.County,
	UserInformation.Profession,
	UserInformation.Ethnicity,
	UserInformation.RelationshipStatus,
	UserInformation.EyeColor,
	UserInformation.HairColor,
	UserInformation.Age,
	UserInformation.Gender,
	UserInformation.SexualOrientation,
	UserInformation.Build,
	UserInformation.Height,
	UserInformation.ProfilePicturePath,
	UserInformation.IdealDate,
	UserInformation.Comments
FROM [User]
Inner Join UserInformation
ON [User].UserID  = UserInformation.UserID
WHERE [User].UserID=@userID




EXEC uspUserProfile_UserID 1