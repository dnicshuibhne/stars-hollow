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
  'RelationshipStatus',
	RelationshipStatus
FROM
    RelationshipStatus
	

SELECT * FROM ViewAllAttributeValues
GO