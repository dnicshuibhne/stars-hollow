

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


