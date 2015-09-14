
---- Create tables
CREATE TABLE [dbo].[User] (
    [UserID]   INT        IDENTITY (1, 1) NOT NULL,
	[UserName]           NVARCHAR (50)		not NULL,   
    [Password] NVARCHAR (50) NOT NULL,
    [Email]    NVARCHAR (50) NOT NULL,
	PRIMARY KEY CLUSTERED ([UserID] ASC)
);


CREATE TABLE [dbo].[Build] (
    [Build] NVARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([Build] ASC)
);

CREATE TABLE [dbo].[EyeColor] (
    [EyeColor] NVARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([EyeColor] ASC)
);

CREATE TABLE [dbo].[Gender] (
    [Gender] NVARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([Gender] ASC)
);


CREATE TABLE [dbo].[HairColor] (
    [HairColor] NVARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([HairColor] ASC)
);


CREATE TABLE [dbo].[Height] (
    [Height] NVARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([Height] ASC)
);


   CREATE TABLE [dbo].[Hobbies] (
    [HobbyID]   INT           IDENTITY (1, 1) NOT NULL,
    [HobbyName] NVARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([HobbyID] ASC)
);



CREATE TABLE [dbo].[SexualOrientation] (
    [Orientation] NVARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([Orientation] ASC)
);


CREATE TABLE [dbo].[RelationshipStatus] (
    [Status] NVARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([Status] ASC)
);

CREATE TABLE [dbo].[Ethnicity] (
    [Ethnicity] NVARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([Ethnicity] ASC)
);

CREATE TABLE [dbo].[UserInformation] (
    [UserID]             INT     NOT NULL,
    [Location]           NVARCHAR (50)  NULL    ,
	[Age]           int  NULL,
    [Profession]         NVARCHAR (50)  NULL,
    [EyeColor]          NVARCHAR (50)  NULL,
    [HairColor]         NVARCHAR (50)  NULL,
    [Ethnicity]         NVARCHAR  (50)  NULL,
	[Status]            NVARCHAR  (50) NULL,
    [Gender]             NVARCHAR (50)  NULL,
    [SexualOrientation]  NVARCHAR (50)  NULL,
    [Build]              NVARCHAR (50)  NULL,
	[Height]             NVARCHAR (50)  NULL,
    [ProfilePicturePath] NVARCHAR (MAX) NULL,
	PRIMARY KEY CLUSTERED ([UserID] ASC),
    FOREIGN KEY ([Build]) REFERENCES [dbo].[Build] ([Build]),
	FOREIGN KEY ([Ethnicity]) REFERENCES [dbo].[Ethnicity] ([Ethnicity]),
    FOREIGN KEY ([Status]) REFERENCES [dbo].[RelationshipStatus] ([Status]),
    FOREIGN KEY ([EyeColor]) REFERENCES [dbo].[EyeColor] ([EyeColor]),
    FOREIGN KEY ([Gender]) REFERENCES [dbo].[Gender] ([Gender]),
    FOREIGN KEY ([HairColor]) REFERENCES [dbo].[HairColor] ([HairColor]),
    FOREIGN KEY ([SexualOrientation]) REFERENCES [dbo].[SexualOrientation] ([Orientation]),
    FOREIGN KEY ([Height]) REFERENCES [dbo].[Height] ([Height]),
	FOREIGN KEY ([UserID]) REFERENCES [dbo].[User]([UserID])
	);

	CREATE TABLE [dbo].[UserHobbies] (
    [UserID]  INT NOT NULL,
    [HobbyID] INT NOT NULL,
    PRIMARY KEY CLUSTERED ([HobbyID] ASC, [UserId] ASC),
    FOREIGN KEY ([HobbyID]) REFERENCES [dbo].[Hobbies] ([HobbyID]),
    FOREIGN KEY ([UserID]) REFERENCES [dbo].[UserInformation] ([UserID])
);

ALTER TABLE [User]
ADD UNIQUE (UserName)

-----Insert data into tables


INSERT INTO [dbo].[Build] ([Build]) VALUES (N'Athletic  ')
INSERT INTO [dbo].[Build] ([Build]) VALUES (N'Average   ')
INSERT INTO [dbo].[Build] ([Build]) VALUES (N'Large')
INSERT INTO [dbo].[Build] ([Build]) VALUES (N'Muscular  ')
INSERT INTO [dbo].[Build] ([Build]) VALUES (N'Slim      ')

INSERT INTO [dbo].[EyeColor] ([EyeColor]) VALUES (N'Blue      ')
INSERT INTO [dbo].[EyeColor] ([EyeColor]) VALUES (N'Brown     ')
INSERT INTO [dbo].[EyeColor] ([EyeColor]) VALUES (N'Green     ')
INSERT INTO [dbo].[EyeColor] ([EyeColor]) VALUES (N'Grey      ')
INSERT INTO [dbo].[EyeColor] ([EyeColor]) VALUES (N'Hazel')

INSERT INTO [dbo].[Gender] ([Gender]) VALUES (N'Bigender  ')
INSERT INTO [dbo].[Gender] ([Gender]) VALUES (N'Female    ')
INSERT INTO [dbo].[Gender] ([Gender]) VALUES (N'Genderfluid ')
INSERT INTO [dbo].[Gender] ([Gender]) VALUES (N'Male      ')
INSERT INTO [dbo].[Gender] ([Gender]) VALUES (N'Transgender')

INSERT INTO [dbo].[HairColor] ([HairColor]) VALUES (N'Bald      ')
INSERT INTO [dbo].[HairColor] ([HairColor]) VALUES (N'Black     ')
INSERT INTO [dbo].[HairColor] ([HairColor]) VALUES (N'Blonde    ')
INSERT INTO [dbo].[HairColor] ([HairColor]) VALUES (N'Brown     ')
INSERT INTO [dbo].[HairColor] ([HairColor]) VALUES (N'Grey      ')
INSERT INTO [dbo].[HairColor] ([HairColor]) VALUES (N'Red       ')




SET IDENTITY_INSERT [dbo].[Hobbies] ON
INSERT INTO [dbo].[Hobbies] ([HobbyID], [HobbyName]) VALUES (1, N'Horseriding')
INSERT INTO [dbo].[Hobbies] ([HobbyID], [HobbyName]) VALUES (2, N'Cycling')
INSERT INTO [dbo].[Hobbies] ([HobbyID], [HobbyName]) VALUES (3, N'Swimming')
INSERT INTO [dbo].[Hobbies] ([HobbyID], [HobbyName]) VALUES (4, N'Reading')
INSERT INTO [dbo].[Hobbies] ([HobbyID], [HobbyName]) VALUES (5, N'Baking')
INSERT INTO [dbo].[Hobbies] ([HobbyID], [HobbyName]) VALUES (6, N'Listening to Music')
INSERT INTO [dbo].[Hobbies] ([HobbyID], [HobbyName]) VALUES (7, N'Walking')
INSERT INTO [dbo].[Hobbies] ([HobbyID], [HobbyName]) VALUES (8, N'Running')
INSERT INTO [dbo].[Hobbies] ([HobbyID], [HobbyName]) VALUES (9, N'Gym')
INSERT INTO [dbo].[Hobbies] ([HobbyID], [HobbyName]) VALUES (10, N'Watersports')
INSERT INTO [dbo].[Hobbies] ([HobbyID], [HobbyName]) VALUES (11, N'Hiking')
INSERT INTO [dbo].[Hobbies] ([HobbyID], [HobbyName]) VALUES (12, N'Gardening')
INSERT INTO [dbo].[Hobbies] ([HobbyID], [HobbyName]) VALUES (13, N'Knitting')
INSERT INTO [dbo].[Hobbies] ([HobbyID], [HobbyName]) VALUES (14, N'Socialising')
INSERT INTO [dbo].[Hobbies] ([HobbyID], [HobbyName]) VALUES (15, N'Football')
INSERT INTO [dbo].[Hobbies] ([HobbyID], [HobbyName]) VALUES (16, N'Tennis')
SET IDENTITY_INSERT [dbo].[Hobbies] OFF



INSERT INTO [dbo].[SexualOrientation] ([Orientation]) VALUES (N'Bisexual')
INSERT INTO [dbo].[SexualOrientation] ([Orientation]) VALUES (N'Gay       ')
INSERT INTO [dbo].[SexualOrientation] ([Orientation]) VALUES (N'Straight  ')



---- stored procedures

--- Stored procedure to add new user - returns new identity parameter- UserID

CREATE PROCEDURE uspAddNewUser
@UserName varchar(50),
@Password varchar (50),
@Email varchar(50),
@id int output

AS
BEGIN
    SET NOCOUNT ON;
    INSERT dbo.[User](UserName,Password,Email) VALUES (@UserName,@Password,@Email)
    SET @id=SCOPE_IDENTITY()
       RETURN @id
END
GO


DECLARE @id INT;
EXEC dbo.uspAddNewUser @UserName = 'Roger', @Password = 'Password',@Email='roger@hotmail.com', @id = @id OUTPUT;
PRINT @id;

---- procedure to add user details - input:userid, profession, location etc...

CREATE PROCEDURE uspAddUserDetails
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




EXEC uspAddUserDetails 1,'Teacher','Dublin','Male','Straight',25,'White','Never Married','Brown','Blue','<4.7','Slim','/images/roger.jpg'


---- Stored Procedure to enter all User Details at once
DROP PROCEDURE uspAddNewUserAndDetails

CREATE PROCEDURE uspAddNewUserAndDetails
@UserName varchar(50),
@Password varchar (50),
@Email varchar(50),
@profession varchar(50),
@ethnicity varchar (50),
@status varchar(50),
@location varchar (50),
@gender varchar(50),
@orientation varchar (50),
@age int,
@haircolour varchar(50),
@eyecolour varchar(50),
@height varchar (50),
@build varchar(50),
@profilepic varchar(max),
@id int output

   

AS
BEGIN
    SET NOCOUNT ON;



   
    INSERT dbo.[User](UserName,Password,Email) VALUES (@UserName,@Password,@Email)

	SELECT @id = SCOPE_IDENTITY()


    INSERT INTO UserInformation(UserID,
						   Location,
						   Profession,
						   Gender,
						   SexualOrientation,
						   Status,
						   Ethnicity,
						   Age,
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
						   @status,
						   @ethnicity,
						   @age,
						   @haircolour,
						   @eyecolour,
						   @height,
						   @build,
						   @profilepic)
						     		 
			

       RETURN @id

END
GO

DECLARE @id INT;
EXEC uspAddNewUserAndDetails 'Sarah','password','maryb@gmail.com','Nurse','White','Never Married','Dublin','Female','Straight',26,'Brown','Blue','<4.7','Slim','/images/mary.jpg',@id = @id OUTPUT;
PRINT @id;

ALTER TABLE [User]
ADD UNIQUE (UserName)

------ View to view all attribute and values 

CREATE VIEW [ViewAllAttributeValues]
AS 
Select
	'EyeColor' as Attribute,
	EyeColor as  Attribute_Value
	FROM 
	EyeColor

UNION

SELECT
  'SexualOrientation',
   Orientation
FROM
    SexualOrientation 

UNION

SELECT
  'Relationship Status',
   Status
FROM
   RelationshipStatus

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
  'HairColor',
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
  'HobbyName',
	HobbyName
FROM
    Hobbies

UNION

SELECT
  'Ethnicity',
	Ethnicity
FROM
    Ethnicity

SELECT * FROM ViewAllAttributeValues

----- Procedure to view UserProfile- input:username

CREATE PROCEDURE uspUserProfile_UserName
@Name NVarChar(50)
AS  
SELECT
	UserInformation.UserId,
	[User].UserName,
	[User].Email,
	UserInformation.Location,
	UserInformation.Profession,
	UserInformation.Gender,
	UserInformation.Age,
	UserInformation.Ethnicity,
	UserInformation.Status,
	UserInformation.SexualOrientation,
	UserInformation.EyeColor,
	UserInformation.HairColor,
	UserInformation.Height,
	UserInformation.Build,
	UserInformation.ProfilePicturePath

FROM [User]
Inner Join UserInformation

ON [User].UserID = UserInformation.UserID
WHERE UserName=@Name


exec uspUserProfile_UserName 'Roger'




--- Procedure to verify user login details- input:username and password, output message:true or false

CREATE PROCEDURE dbo.uspUserLogin
@username nvarchar(50),
@password nvarchar(50)

AS
BEGIN

SET NOCOUNT ON

IF EXISTS(SELECT * FROM [User] WHERE UserName = @username OR
		Email=@username AND Password = @password)
    SELECT 'true' AS UserExists
ELSE
    SELECT 'false' AS UserExists

END

EXEC uspUserLogin 'Roger' ,'password'


CREATE TABLE [dbo].[RelationshipStatus] (
    [Status] NVARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([Status] ASC)
);

CREATE TABLE [dbo].[Ethnicity] (
    [Ethnicity] NVARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([Ethnicity] ASC)
);


