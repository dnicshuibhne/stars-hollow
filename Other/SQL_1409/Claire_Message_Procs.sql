
drop procedure uspConversationBetweenUsers

CREATE PROCEDURE uspConversationBetweenUsers
	@user1 int,
	@user2 int

As
SELECT 
[User].UserName,
[Messages].Contents,
[Messages].MessageID,
[Messages].ReceiverID,
[Messages].SenderID,
[Messages].DateTime

FROM Messages
Inner Join [User]
ON [User].UserID  = [Messages].SenderID

WHERE 

([Messages].SenderID =@user1  AND [Messages].ReceiverID=@user2)

OR

([Messages].SenderID=@user2 AND [Messages].ReceiverID=@user1)

ORDER BY
Messages.MessageID

exec uspConversationBetweenUsers 1,4

------------------
CREATE PROCEDURE uspReceivedMessages
	@user1 int

As
SELECT 
[User].UserName,
[Messages].MessageID,
[Messages].Contents,
[Messages].SenderID,
[Messages].DateTime

FROM [Messages]

Inner Join [User]
ON [User].UserID  = [Messages].SenderID


WHERE 
[Messages].ReceiverID =@user1 

ORDER BY
[Messages].MessageID



-------------
CREATE PROCEDURE uspSentMessages
	@user1 int

As
SELECT 
[User].UserName,
[Messages].MessageID,
[Messages].Contents,
[Messages].ReceiverID,
[Messages].DateTime

FROM [Messages]

Inner Join [User]
ON [User].UserID  = [Messages].ReceiverID


WHERE 
[Messages].SenderID =@user1 

ORDER BY
[Messages].MessageID




