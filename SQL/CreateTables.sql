
Drop Table UserHobbies
Drop Table UserInformation
Drop Table [dbo].[Users] 
Drop Table AgeRange
Drop Table Build
Drop Table EyeColor
Drop Table Gender
Drop Table HairColor
Drop Table Height
Drop Table SexualOrientation
Drop Table Hobbies

-----------------------------------------------------------------------------

---- Create tables
CREATE TABLE [dbo].[AgeRange] (
    [AgeRange] NVARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([AgeRange] ASC)
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

-----------------------------------------------------------------------------
CREATE TABLE [dbo].[Users] (
    [UserID]   INT IDENTITY (1, 1) NOT NULL,
	[UserName] NVARCHAR (50)	UNIQUE	not NULL,   
    [Password] NVARCHAR (50) NOT NULL,
    [Email]    NVARCHAR (50) NOT NULL,
	PRIMARY KEY CLUSTERED ([UserID] ASC)
);
-----------------------------------------------------------------------------

CREATE TABLE [dbo].[UserInformation] (
    [UserID]             INT     NOT NULL,
    [Location]           NVARCHAR (50)  NULL,
    [Profession]         NVARCHAR (50)  NULL,
    [EyeColor]          NVARCHAR (50)  NULL,
    [HairColor]         NVARCHAR (50)  NULL,
	[Age]	INT NULL,
    [AgeRange]           NVARCHAR (50)  NULL,
    [Gender]             NVARCHAR (50)  NULL,
    [SexualOrientation]  NVARCHAR (50)  NULL,
    [Build]              NVARCHAR (50)  NULL,
	[Height]             NVARCHAR (50)  NULL,
    [ProfilePicturePath] NVARCHAR (MAX) NULL,
	PRIMARY KEY CLUSTERED ([UserID] ASC),
    FOREIGN KEY ([AgeRange]) REFERENCES [dbo].[AgeRange] ([AgeRange]),
    FOREIGN KEY ([Build]) REFERENCES [dbo].[Build] ([Build]),
    FOREIGN KEY ([EyeColor]) REFERENCES [dbo].[EyeColor] ([EyeColor]),
    FOREIGN KEY ([Gender]) REFERENCES [dbo].[Gender] ([Gender]),
    FOREIGN KEY ([HairColor]) REFERENCES [dbo].[HairColor] ([HairColor]),
    FOREIGN KEY ([SexualOrientation]) REFERENCES [dbo].[SexualOrientation] ([Orientation]),
    FOREIGN KEY ([Height]) REFERENCES [dbo].[Height] ([Height]),
	FOREIGN KEY ([UserID]) REFERENCES [dbo].[Users]([UserID])
	);
-----------------------------------------------------------------------------
	CREATE TABLE [dbo].[UserHobbies] (
    [UserID]  INT NOT NULL,
    [HobbyID] INT NOT NULL,
    PRIMARY KEY CLUSTERED ([HobbyID] ASC, [UserId] ASC),
    FOREIGN KEY ([HobbyID]) REFERENCES [dbo].[Hobbies] ([HobbyID]),
    FOREIGN KEY ([UserID]) REFERENCES [dbo].[UserInformation] ([UserID])
	);

--------------------------------------------------------------------------------

-----Insert data into tables

INSERT INTO [dbo].[AgeRange] ([AgeRange]) VALUES 
(N'18-25     '),
(N'26-32     '),
(N'33-39     '),
(N'40+')

INSERT INTO [dbo].[Build] ([Build]) VALUES
(N'Athletic  '),
(N'Average   '),
(N'Large'),
(N'Muscular  '),
(N'Slim      ')

INSERT INTO [dbo].[EyeColor] ([EyeColor]) VALUES
(N'Blue      '),
(N'Brown     '),
(N'Green     '),
(N'Grey      '),
(N'Hazel')

INSERT INTO [dbo].[Gender] ([Gender]) VALUES 
(N'Bigender  '),
(N'Female    '),
(N'Genderfluid '),
(N'Male      '),
(N'Transgender')

INSERT INTO [dbo].[HairColor] ([HairColor]) VALUES 
(N'Bald      '),
(N'Black     '),
(N'Blonde    '),
(N'Brown     '),
(N'Grey      '),
(N'Red       ')


INSERT INTO [dbo].[Height] ([Height]) VALUES 
(N'Average   '),
(N'Small     '),
(N'Tall      ')

INSERT INTO [dbo].[SexualOrientation] ([Orientation]) VALUES 
(N'Bisexual'),
(N'Gay       '),
(N'Straight  ')

SET IDENTITY_INSERT [dbo].[Hobbies] ON
INSERT INTO [dbo].[Hobbies] ([HobbyID], [HobbyName]) VALUES
(1, N'Horseriding'),
(2, N'Cycling'),
(3, N'Swimming'),
(4, N'Reading'),
(5, N'Baking'),
(6, N'Listening to Music'),
(7, N'Walking'),
(8, N'Running'),
(9, N'Gym'),
(10, N'Watersports'),
(11, N'Hiking'),
(12, N'Gardening'),
(13, N'Knitting'),
(14, N'Socialising'),
(15, N'Football'),
(16, N'Tennis')
SET IDENTITY_INSERT [dbo].[Hobbies] OFF

--------------------------------------------------------------------------------
INSERT INTO [dbo].[Users] ([UserName], [Password], [Email]) VALUES 
(N'jsmith', N'qwerty', N'jsmith@gmail.com'),
(N'mbloggs', N'rex17', N'mbloggs@gmail.com'),
(N'jmurphy', N'bloggs', N'jmurphy@gmail.com'),
(N'aoconnor', N'221185', N'aoconnor@gmail.com'),
(N'sparkles', N'azerty', N'sparkles@gmail.com'),
(N'kingkong', N'udjsns', N'kingkong@gmail.com'),
(N'musiclover', N'efawsfg', N'musiclover@gmail.com'),
(N'beets', N'dogs', N'beets@gmail.com'),
(N'bears', N'stapler', N'bears@gmail.com'),
(N'battlestargalactica', N'zoom', N'battle@gmail.com'),
(N'marry', N'1234', N'marry@gmail.com'),
(N'catlady', N'c@tlyfe', N'catlady@gmail.com'),
(N'jkyle', N'wordpass', N'jkyle@gmail.com'),
(N'hippo', N'nooooo', N'hippo@gmail.com'),
(N'maryhowdoiturnthison', N'1ireland1', N'janice@gmail.com')
--------------------------------------------------------------------------------
INSERT INTO [dbo].[UserInformation] ([UserId], [Location], [Profession], [EyeColor], [HairColor], [AgeRange], [Gender], [SexualOrientation], [Build], [ProfilePicturePath], [Height], [Age]) 
VALUES 
(1,  N'Dublin', N'Accountant', N'Brown', N'Black', N'18-25', N'Male', N'Straight', N'Average', N'/images/johnny1/.jpg', N'Average', 18),
(2,  N'Dublin', N'Teacher', N'Brown', N'Black', N'18-25', N'Female', N'Straight', N'Average', N'/images/maria13.jpg', N'Average', 19),
(6,  N'Dublin', N'Engineer', N'Green', N'Brown', N'18-25', N'Male', N'Straight', N'Slim', N'/images/paulydee', N'Small', 21),
(7,  N'Dublin', N'Chef', N'Hazel', N'Red', N'26-32', N'Male', N'Gay', N'Large', N'/images/bradpitt.jpg', N'Tall', 27),
(10, N'Dublin', N'Nurse', N'Grey', N'Grey', N'40+', N'Female', N'Bisexual', N'Slim', N'/images/marybyrne.jpg', N'Average', 42),
(11, N'Dublin', N'Doctor', N'Green', N'Bald', N'40+', N'Male', N'Straight', N'Muscular', N'/images/robert12.jpg', N'Tall', 50),
(12, N'Dublin', N'Butcher', N'Blue', N'Blonde', N'33-39', N'Male', N'Gay', N'Slim', N'/images/roger1.jpg', N'Small', 34),
(13, N'Dublin', N'Baker', N'Brown', N'Black', N'33-39', N'Male', N'Gay', N'Large', N'/images/carlos13.jpg', N'Small', 37),
(14, N'Dublin', N'Fashion Designer', N'Blue', N'Blonde', N'26-32', N'Female', N'Straight', N'Slim', N'/images/sarahg.jpg', N'Average', 26)
--------------------------------------------------------------------------------

INSERT INTO [dbo].[UserHobbies] ([UserId], [HobbyID]) VALUES 
(1, 1),
(7, 1),
(10, 2),
(1, 3),
(6, 3),
(10, 3),
(1, 5),
(2, 5),
(6, 6),
(7, 12)

