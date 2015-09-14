


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