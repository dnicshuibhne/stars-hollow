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