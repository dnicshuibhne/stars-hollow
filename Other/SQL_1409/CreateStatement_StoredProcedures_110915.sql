 /* Delete table after dropping foreign key constraits in user information table */


DROP TABLE AgeRange
DROP TABLE Build
DROP TABLE EyeColor
DROP TABLE  Gender
DROP TABLE HairColor
DROP TABLE Height
DROP TABLE Hobbies
DROP TABLE SexualOrientation
DROP TABLE Table
DROP TABLE  UserHobbies
DROP TABLE UserInformation
DROP TABLE Users

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

ALTER TABLE [User]
ADD UNIQUE (UserName)

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
	[IdealDate] NVARCHAR (MAX) NULL,
	[Comments] NVARCHAR (MAX) NULL
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

CREATE TABLE [dbo].[UserImages] (
    [UserID]  INT NOT NULL,
    [ImageID] INT NOT NULL,
    PRIMARY KEY CLUSTERED ([ImageID] ASC, [UserId] ASC),
    FOREIGN KEY ([UserID]) REFERENCES [dbo].[UserInformation] ([UserID])
);

CREATE TABLE [dbo].[Messages] (
    [MessageID]  INT  IDENTITY (1, 1) NOT NULL,
    [SenderID] INT NOT NULL,
	[ReceiverID] INT NOT NULL,
	[DateTime] DATETIME NOT NULL,
	[Contents] NVarChar (MAX) NULL,
    PRIMARY KEY CLUSTERED ([MessageID] ASC),
    FOREIGN KEY ([SenderID]) REFERENCES [dbo].[UserInformation] ([UserID]),
	 FOREIGN KEY ([ReceiverID]) REFERENCES [dbo].[UserInformation] ([UserID])
);


-----Insert data into tables

INSERT INTO [dbo].[Build] ([Build]) VALUES (N'Athletic')
INSERT INTO [dbo].[Build] ([Build]) VALUES (N'Average')
INSERT INTO [dbo].[Build] ([Build]) VALUES (N'Large')
INSERT INTO [dbo].[Build] ([Build]) VALUES (N'Muscular')
INSERT INTO [dbo].[Build] ([Build]) VALUES (N'Slim')

INSERT INTO [dbo].[EyeColor] ([EyeColor]) VALUES (N'Blue')
INSERT INTO [dbo].[EyeColor] ([EyeColor]) VALUES (N'Brown')
INSERT INTO [dbo].[EyeColor] ([EyeColor]) VALUES (N'Green')
INSERT INTO [dbo].[EyeColor] ([EyeColor]) VALUES (N'Grey')
INSERT INTO [dbo].[EyeColor] ([EyeColor]) VALUES (N'Hazel')

INSERT INTO [dbo].[Ethnicity] ([Ethnicity]) VALUES (N'Asian')
INSERT INTO [dbo].[Ethnicity] ([Ethnicity]) VALUES (N'Black')
INSERT INTO [dbo].[Ethnicity] ([Ethnicity]) VALUES (N'East Indian')
INSERT INTO [dbo].[Ethnicity] ([Ethnicity]) VALUES (N'Latin')
INSERT INTO [dbo].[Ethnicity] ([Ethnicity]) VALUES (N'Middle Eastern')
INSERT INTO [dbo].[Ethnicity] ([Ethnicity]) VALUES (N'Multi-Racial')
INSERT INTO [dbo].[Ethnicity] ([Ethnicity]) VALUES (N'Native Amercian')
INSERT INTO [dbo].[Ethnicity] ([Ethnicity]) VALUES (N'Other')
INSERT INTO [dbo].[Ethnicity] ([Ethnicity]) VALUES (N'Pacific Islander')
INSERT INTO [dbo].[Ethnicity] ([Ethnicity]) VALUES (N'White')
INSERT INTO [dbo].[Ethnicity] ([Ethnicity]) VALUES (N'Rather not say')

INSERT INTO [dbo].[Gender] ([Gender]) VALUES (N'Female')
INSERT INTO [dbo].[Gender] ([Gender]) VALUES (N'Male')
INSERT INTO [dbo].[Gender] ([Gender]) VALUES (N'Other')
INSERT INTO [dbo].[Gender] ([Gender]) VALUES (N'Rather not say')

INSERT INTO [dbo].[HairColor] ([HairColor]) VALUES (N'Bald')
INSERT INTO [dbo].[HairColor] ([HairColor]) VALUES (N'Black')
INSERT INTO [dbo].[HairColor] ([HairColor]) VALUES (N'Blonde')
INSERT INTO [dbo].[HairColor] ([HairColor]) VALUES (N'Brown')
INSERT INTO [dbo].[HairColor] ([HairColor]) VALUES (N'Grey')
INSERT INTO [dbo].[HairColor] ([HairColor]) VALUES (N'Red')
INSERT INTO [dbo].[HairColor] ([HairColor]) VALUES (N'Other')

INSERT INTO [dbo].[Height] ([Height]) VALUES (N'<4.7')
INSERT INTO [dbo].[Height] ([Height]) VALUES (N'4''10"')
INSERT INTO [dbo].[Height] ([Height]) VALUES (N'4''11"')
INSERT INTO [dbo].[Height] ([Height]) VALUES (N'4''7"')
INSERT INTO [dbo].[Height] ([Height]) VALUES (N'4''8"')
INSERT INTO [dbo].[Height] ([Height]) VALUES (N'4''9"')
INSERT INTO [dbo].[Height] ([Height]) VALUES (N'5''0"')
INSERT INTO [dbo].[Height] ([Height]) VALUES (N'5''1"')
INSERT INTO [dbo].[Height] ([Height]) VALUES (N'5''2"')
INSERT INTO [dbo].[Height] ([Height]) VALUES (N'5''3"')
INSERT INTO [dbo].[Height] ([Height]) VALUES (N'5''4"')
INSERT INTO [dbo].[Height] ([Height]) VALUES (N'5''5"')
INSERT INTO [dbo].[Height] ([Height]) VALUES (N'5''6"')
INSERT INTO [dbo].[Height] ([Height]) VALUES (N'5''7"')
INSERT INTO [dbo].[Height] ([Height]) VALUES (N'5''8"')
INSERT INTO [dbo].[Height] ([Height]) VALUES (N'5''9"')
INSERT INTO [dbo].[Height] ([Height]) VALUES (N'5''10"')
INSERT INTO [dbo].[Height] ([Height]) VALUES (N'5''11"')
INSERT INTO [dbo].[Height] ([Height]) VALUES (N'6''0"')
INSERT INTO [dbo].[Height] ([Height]) VALUES (N'6''1"')
INSERT INTO [dbo].[Height] ([Height]) VALUES (N'6''2"')
INSERT INTO [dbo].[Height] ([Height]) VALUES (N'6''3"')
INSERT INTO [dbo].[Height] ([Height]) VALUES (N'6''4"')
INSERT INTO [dbo].[Height] ([Height]) VALUES (N'6''5"')
INSERT INTO [dbo].[Height] ([Height]) VALUES (N'6''7"')
INSERT INTO [dbo].[Height] ([Height]) VALUES (N'6''8"')
INSERT INTO [dbo].[Height] ([Height]) VALUES (N'6''9"')
INSERT INTO [dbo].[Height] ([Height]) VALUES (N'>6''9"')

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

INSERT INTO [dbo].[RelationshipStatus] ([Status]) VALUES (N'Divorced')
INSERT INTO [dbo].[RelationshipStatus] ([Status]) VALUES (N'Never Married')
INSERT INTO [dbo].[RelationshipStatus] ([Status]) VALUES (N'Seperated')
INSERT INTO [dbo].[RelationshipStatus] ([Status]) VALUES (N'Widowed')

INSERT INTO [dbo].[SexualOrientation] ([Orientation]) VALUES (N'Bisexual')
INSERT INTO [dbo].[SexualOrientation] ([Orientation]) VALUES (N'Gay')
INSERT INTO [dbo].[SexualOrientation] ([Orientation]) VALUES (N'Straight')
INSERT INTO [dbo].[SexualOrientation] ([Orientation]) VALUES (N'Other')

DECLARE @id INT;
EXEC uspAddNewUserAndDetails 'Sarah','password','maryb@gmail.com','Nurse','White','Never Married','Dublin','Female','Straight',26,'Brown','Blue','<4.7','Slim','/images/mary.jpg',@id = @id OUTPUT;
PRINT @id;



--- Edited stored procedure to reflect database changes

DROP PROCedure uspAddNewUserAndDetails

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


