
Drop Table UserHobbies
Drop Table UserInformation
Drop Table [dbo].[User] 
Drop Table EyeColor
Drop Table HairColor

CREATE TABLE [dbo].[User] (
    [UserID]   INT        IDENTITY (1, 1) NOT NULL,
	[UserName]           NVARCHAR (50)		not NULL UNIQUE,   
    [Password] NVARCHAR (50) NOT NULL,
    [Email]    NVARCHAR (50) NOT NULL,
	PRIMARY KEY CLUSTERED ([UserID] ASC)
);


CREATE TABLE [dbo].[EyeColor] (
    [EyeColor] NVARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([EyeColor] ASC)
);

CREATE TABLE [dbo].[HairColor] (
    [HairColor] NVARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([HairColor] ASC)
);


CREATE TABLE [dbo].[UserInformation] (
    [UserID]             INT     NOT NULL,
    [Location]           NVARCHAR (50)  NULL,
    [Profession]         NVARCHAR (50)  NULL,
    [EyeColor]          NVARCHAR (50)  NULL,
    [HairColor]         NVARCHAR (50)  NULL,
    [AgeRange]           NVARCHAR (50)  NULL,
    [Gender]             NVARCHAR (50)  NULL,
    [SexualOrientation]  NVARCHAR (50)  NULL,
    [Build]              NVARCHAR (50)  NULL,
	[Height]             NVARCHAR (50)  NULL,
    [ProfilePicturePath] NVARCHAR (MAX) NULL,
	[Age]	INT NULL,
	PRIMARY KEY CLUSTERED ([UserID] ASC),
    FOREIGN KEY ([AgeRange]) REFERENCES [dbo].[AgeRange] ([AgeRange]),
    FOREIGN KEY ([Build]) REFERENCES [dbo].[Build] ([Build]),
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



--------------------------------------------------------------------------------

INSERT INTO [dbo].[EyeColor] ([EyeColor]) VALUES (N'Blue      ')
INSERT INTO [dbo].[EyeColor] ([EyeColor]) VALUES (N'Brown     ')
INSERT INTO [dbo].[EyeColor] ([EyeColor]) VALUES (N'Green     ')
INSERT INTO [dbo].[EyeColor] ([EyeColor]) VALUES (N'Grey      ')
INSERT INTO [dbo].[EyeColor] ([EyeColor]) VALUES (N'Hazel')


INSERT INTO [dbo].[HairColor] ([HairColor]) VALUES (N'Bald      ')
INSERT INTO [dbo].[HairColor] ([HairColor]) VALUES (N'Black     ')
INSERT INTO [dbo].[HairColor] ([HairColor]) VALUES (N'Blonde    ')
INSERT INTO [dbo].[HairColor] ([HairColor]) VALUES (N'Brown     ')
INSERT INTO [dbo].[HairColor] ([HairColor]) VALUES (N'Grey      ')
INSERT INTO [dbo].[HairColor] ([HairColor]) VALUES (N'Red       ')
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
INSERT INTO [dbo].[User] ([UserName], [Password], [Email]) VALUES 
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

INSERT INTO [dbo].[UserInformation] ([UserId], [Location], [Profession], [EyeColor], [HairColor], [AgeRange], [Gender], [SexualOrientation], [Build], [ProfilePicturePath], [Height], [Age]) VALUES (1,  N'Dublin', N'Accountant', N'Brown', N'Black', N'18-25', N'Male', N'Straight', N'Average', N'/images/johnny1/.jpg', N'Average', NULL)
INSERT INTO [dbo].[UserInformation] ([UserId], [Location], [Profession], [EyeColor], [HairColor], [AgeRange], [Gender], [SexualOrientation], [Build], [ProfilePicturePath], [Height], [Age]) VALUES (2,  N'Dublin', N'Teacher', N'Brown', N'Black', N'18-25', N'Female', N'Straight', N'Average', N'/images/maria13.jpg', N'Average', NULL)
INSERT INTO [dbo].[UserInformation] ([UserId], [Location], [Profession], [EyeColor], [HairColor], [AgeRange], [Gender], [SexualOrientation], [Build], [ProfilePicturePath], [Height], [Age]) VALUES (6,  N'Dublin', N'Engineer', N'Green', N'Brown', N'18-25', N'Male', N'Straight', N'Slim', N'/images/paulydee', N'Small', NULL)
INSERT INTO [dbo].[UserInformation] ([UserId], [Location], [Profession], [EyeColor], [HairColor], [AgeRange], [Gender], [SexualOrientation], [Build], [ProfilePicturePath], [Height], [Age]) VALUES (7,  N'Dublin', N'Chef', N'Hazel', N'Red', N'26-32', N'Male', N'Gay', N'Large', N'/images/bradpitt.jpg', N'Tall', NULL)
INSERT INTO [dbo].[UserInformation] ([UserId], [Location], [Profession], [EyeColor], [HairColor], [AgeRange], [Gender], [SexualOrientation], [Build], [ProfilePicturePath], [Height], [Age]) VALUES (10, N'Dublin', N'Nurse', N'Grey', N'Grey', N'40+', N'Female', N'Bisexual', N'Slim', N'/images/marybyrne.jpg', N'Average', NULL)
INSERT INTO [dbo].[UserInformation] ([UserId], [Location], [Profession], [EyeColor], [HairColor], [AgeRange], [Gender], [SexualOrientation], [Build], [ProfilePicturePath], [Height], [Age]) VALUES (11, N'Dublin', N'Doctor', N'Green', N'Bald', N'40+', N'Male', N'Straight', N'Muscular', N'/images/robert12.jpg', N'Tall', NULL)
INSERT INTO [dbo].[UserInformation] ([UserId], [Location], [Profession], [EyeColor], [HairColor], [AgeRange], [Gender], [SexualOrientation], [Build], [ProfilePicturePath], [Height], [Age]) VALUES (12, N'Dublin', N'Butcher', N'Blue', N'Blonde', N'33-39', N'Male', N'Gay', N'Slim', N'/images/roger1.jpg', N'Small', NULL)
INSERT INTO [dbo].[UserInformation] ([UserId], [Location], [Profession], [EyeColor], [HairColor], [AgeRange], [Gender], [SexualOrientation], [Build], [ProfilePicturePath], [Height], [Age]) VALUES (13, N'Dublin', N'Baker', N'Brown', N'Black', N'33-39', N'Male', N'Gay', N'Large', N'/images/carlos13.jpg', N'Small', NULL)
INSERT INTO [dbo].[UserInformation] ([UserId], [Location], [Profession], [EyeColor], [HairColor], [AgeRange], [Gender], [SexualOrientation], [Build], [ProfilePicturePath], [Height], [Age]) VALUES (14, N'Dublin', N'Clothes Designer', N'Blue', N'Blonde', N'26-32', N'Female', N'Straight', N'Slim', N'/images/sarahg.jpg', N'Average', NULL)


INSERT INTO [dbo].[UserHobbies] ([UserId], [HobbyID]) VALUES (1, 1)
INSERT INTO [dbo].[UserHobbies] ([UserId], [HobbyID]) VALUES (7, 1)
INSERT INTO [dbo].[UserHobbies] ([UserId], [HobbyID]) VALUES (10, 2)
INSERT INTO [dbo].[UserHobbies] ([UserId], [HobbyID]) VALUES (1, 3)
INSERT INTO [dbo].[UserHobbies] ([UserId], [HobbyID]) VALUES (6, 3)
INSERT INTO [dbo].[UserHobbies] ([UserId], [HobbyID]) VALUES (10, 3)
INSERT INTO [dbo].[UserHobbies] ([UserId], [HobbyID]) VALUES (1, 5)
INSERT INTO [dbo].[UserHobbies] ([UserId], [HobbyID]) VALUES (2, 5)
INSERT INTO [dbo].[UserHobbies] ([UserId], [HobbyID]) VALUES (6, 6)
INSERT INTO [dbo].[UserHobbies] ([UserId], [HobbyID]) VALUES (7, 12)

