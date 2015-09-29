-- DROP TABLES --
Drop Table UserHobbies
Drop Table UserImages
Drop Table UserInformation
Drop Table Messages
Drop Table [dbo].[Users] 

Drop Table AgeRange
Drop Table Build
Drop Table County
Drop Table Ethnicity
Drop Table EyeColor
Drop Table Gender
Drop Table HairColor
Drop Table Height
Drop Table Hobbies
Drop Table RelationshipStatus
Drop Table MaritalStatus
Drop Table SexualOrientation

------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------ ATTRIBUTE TABLES ----------------------------------------------------------- 
------------------------------------------------------------------------------------------------------------------------------------------


---- Create tables
CREATE TABLE [dbo].[AgeRange] (
    [AgeRange] NVARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([AgeRange] ASC)
);
CREATE TABLE [dbo].[Build] (
    [Build] NVARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([Build] ASC)
);

CREATE TABLE [dbo].[County] (
    [County] NVARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([County] ASC)
);

CREATE TABLE [dbo].[Ethnicity] (
    [Ethnicity] NVARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([Ethnicity] ASC)
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

CREATE TABLE [dbo].[RelationshipStatus] (
    [RelationshipStatus] NVARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([RelationshipStatus] ASC)
);

CREATE TABLE [dbo].[MaritalStatus] (
    [MaritalStatus] NVARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([MaritalStatus] ASC)
);

CREATE TABLE [dbo].[SexualOrientation] (
    [SexualOrientation] NVARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([SexualOrientation] ASC)
);

------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------ USER TABLES ----------------------------------------------------------- 
------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE [dbo].[Users] (
    [UserID]   INT IDENTITY (1, 1) NOT NULL,
	[Username] NVARCHAR (50)	UNIQUE	not NULL,   
    [Password] NVARCHAR (50) NOT NULL,
    [Email]    NVARCHAR (50) NOT NULL,
	PRIMARY KEY CLUSTERED ([UserID] ASC)
);
-----------------------------------------------------------------------------

CREATE TABLE [dbo].[UserInformation] (
    [UserID]             INT     NOT NULL,
	[Age]           int  NULL,
    [Build]              NVARCHAR (50)  NULL,
    [AgeRange]              NVARCHAR (50)  NULL,
    [County]              NVARCHAR (50)  NULL,
    [Ethnicity]         NVARCHAR  (50)  NULL,
    [EyeColor]          NVARCHAR (50)  NULL,
    [Gender]             NVARCHAR (50)  NULL,
    [HairColor]         NVARCHAR (50)  NULL,
	[Height]             NVARCHAR (50)  NULL,
	--[Hobbies]             XML  NULL,
	[IdealDate] NVARCHAR (MAX) NULL,
    [Profession]         NVARCHAR (50)  NULL,
	[RelationshipStatus]            NVARCHAR  (50) NULL,
    [SexualOrientation]  NVARCHAR (50)  NULL,
    [Town]  NVARCHAR (50)  NULL,
    [ProfilePicturePath] NVARCHAR (MAX) NULL,
    [Comments] NVARCHAR (50) NULL,
	PRIMARY KEY CLUSTERED ([UserID] ASC),
	FOREIGN KEY ([UserID]) REFERENCES [dbo].[Users]([UserID]),
    FOREIGN KEY ([Build]) REFERENCES [dbo].[Build] ([Build]),
    FOREIGN KEY ([County]) REFERENCES [dbo].[County] ([County]),
	FOREIGN KEY ([Ethnicity]) REFERENCES [dbo].[Ethnicity] ([Ethnicity]),
    FOREIGN KEY ([EyeColor]) REFERENCES [dbo].[EyeColor] ([EyeColor]),
    FOREIGN KEY ([Gender]) REFERENCES [dbo].[Gender] ([Gender]),
    FOREIGN KEY ([HairColor]) REFERENCES [dbo].[HairColor] ([HairColor]),
    FOREIGN KEY ([Height]) REFERENCES [dbo].[Height] ([Height]),	
    FOREIGN KEY ([RelationshipStatus]) REFERENCES [dbo].[RelationshipStatus] ([RelationshipStatus]),
    FOREIGN KEY ([SexualOrientation]) REFERENCES [dbo].[SexualOrientation] ([SexualOrientation])
	);
-----------------------------------------------------------------------------
	CREATE TABLE [dbo].[UserHobbies] (
    [UserID]  INT NOT NULL,
    [HobbyID] INT NOT NULL,
    PRIMARY KEY CLUSTERED ([HobbyID] ASC, [UserId] ASC),
    FOREIGN KEY ([HobbyID]) REFERENCES [dbo].[Hobbies] ([HobbyID]),
    FOREIGN KEY ([UserID]) REFERENCES [dbo].[Users] ([UserID])
	);

--------------------------------------------------------------------------------

--CREATE TABLE [dbo].[UserImages] (
--    [UserID]  INT NOT NULL,
--    [ImageID] INT NOT NULL,
--    PRIMARY KEY CLUSTERED ([ImageID] ASC, [UserId] ASC),
--    FOREIGN KEY ([UserID]) REFERENCES [dbo].[Users] ([UserID])
--);
CREATE TABLE [dbo].[UserImages]
(
	[ImageID] INT IDENTITY (1, 1) NOT NULL PRIMARY KEY, 
    [UserID] INT NOT NULL, 
    [ImageFile] IMAGE NOT NULL, 
    CONSTRAINT [FK_UserID_Users] FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------ MESSAGE TABLE ----------------------------------------------------------- 
------------------------------------------------------------------------------------------------------------------------------------------


CREATE TABLE [dbo].[Messages] (
    [MessageID]  INT  IDENTITY (1, 1) NOT NULL,
    [SenderID] INT NOT NULL,
	[ReceiverID] INT NOT NULL,
	[Timestamp] DATETIME NOT NULL,
	[Content] NVarChar (MAX) NULL,
    PRIMARY KEY CLUSTERED ([MessageID] ASC),
    FOREIGN KEY ([SenderID]) REFERENCES [dbo].[Users] ([UserID]),
	 FOREIGN KEY ([ReceiverID]) REFERENCES [dbo].[Users] ([UserID])
);
--------------------------------------------------------------------------------


