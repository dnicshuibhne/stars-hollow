DROP PROCEDURE uspAllMessages
GO

CREATE PROCEDURE uspAllMessages
@userID INT
AS  
SELECT
	Messages.MessageID,
	Messages.SenderID,
	Messages.ReceiverID,
	Sender.Username AS SenderName,
	Receiver.Username AS ReceiverName,
	Messages.[DateTime] AS TimeStamp, --Timestamp
	Messages.Contents AS Content --Content
FROM [Messages]
	Inner Join [User] AS Receiver
	ON 
		(
			Messages.ReceiverID = Receiver.UserID 
		)
	Inner Join [User] AS Sender
	ON 
		(
			Messages.SenderID = Sender.UserID 
		)
WHERE 
	Messages.SenderID = @userID
	OR
	Messages.ReceiverID = @userID
GO

EXEC uspAllMessages '1'

GO


DROP VIEW ViewAllAttributeValues
GO
CREATE VIEW [ViewAllAttributeValues]
AS 
Select
	'AgeRange' as Attribute,
	AgeRange as  Attribute_Value
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
  'County',
	CountyName
FROM
    County

UNION
SELECT
  'Ethnicity',
	Ethnicity
FROM
    Ethnicity
	
UNION
SELECT
	'EyeColor',
	EyeColor
	FROM 
	EyeColor

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
  'RelationshipStatus',
	RelationshipStatus
FROM
    RelationshipStatus

UNION
SELECT
  'SexualOrientation',
   Orientation
FROM
    SexualOrientation 
	GO

SELECT * FROM ViewAllAttributeValues
GO
DROP TABLE [dbo].[UserInformation] 
CREATE TABLE [dbo].[UserInformation] (
    [UserID]             INT            NOT NULL,
    [Age]                INT            NULL,
    [AgeRange]               NVARCHAR (50)  NULL,
    [Build]              NVARCHAR (50)  NULL,
    [County]             NVARCHAR (50)  NULL,
    [Ethnicity]          NVARCHAR (50)  NULL,
    [EyeColor]           NVARCHAR (50)  NULL,
    [Gender]             NVARCHAR (50)  NULL,
    [HairColor]          NVARCHAR (50)  NULL,
    [Height]             NVARCHAR (50)  NULL,
    [Hobbies]            XML  NULL,
    [IdealDate]          NVARCHAR (MAX) NULL,
    [Profession]         NVARCHAR (50)  NULL,
    [RelationshipStatus] NVARCHAR (50)  NULL,
    [SexualOrientation]  NVARCHAR (50)  NULL,
    [Town]               NVARCHAR (50)  NULL,
    [ProfilePicturePath] NVARCHAR (MAX) NULL,	
    PRIMARY KEY CLUSTERED ([UserID] ASC),
    FOREIGN KEY ([UserID]) REFERENCES [dbo].[User] ([UserID]),
    FOREIGN KEY ([AgeRange]) REFERENCES [dbo].[AgeRange] ([AgeRange]),
    FOREIGN KEY ([Build]) REFERENCES [dbo].[Build] ([Build]),
    FOREIGN KEY ([County]) REFERENCES [dbo].[County] ([CountyName]),
    FOREIGN KEY ([Ethnicity]) REFERENCES [dbo].[Ethnicity] ([Ethnicity]),
    FOREIGN KEY ([EyeColor]) REFERENCES [dbo].[EyeColor] ([EyeColor]),
    FOREIGN KEY ([Gender]) REFERENCES [dbo].[Gender] ([Gender]),
    FOREIGN KEY ([HairColor]) REFERENCES [dbo].[HairColor] ([HairColor]),
    FOREIGN KEY ([Height]) REFERENCES [dbo].[Height] ([Height]),
    FOREIGN KEY ([RelationshipStatus]) REFERENCES [dbo].[RelationshipStatus] ([RelationshipStatus]),
    FOREIGN KEY ([SexualOrientation]) REFERENCES [dbo].[SexualOrientation] ([Orientation])
);

DROP TABLE [dbo].[SexualOrientation]
CREATE TABLE [dbo].[SexualOrientation] (
    [SexualOrientation] NVARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([SexualOrientation] ASC)
);




-------------- UNUSED ----------------
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

