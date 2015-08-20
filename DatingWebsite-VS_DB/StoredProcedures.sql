CREATE PROCEDURE uspUserProfile_UserName
@Name NVarChar(50)
AS  
SELECT
	UserInformation.UserId,
	UserInformation.UserName,
	UserInformation.Location,
	UserInformation.Profession,
	UserInformation.Gender,
	UserInformation.AgeRange,
	UserInformation.SexualOrientation,
	UserInformation.EyeColour,
	UserInformation.HairColour,
	UserInformation.Height,
	UserInformation.Build

FROM UserInformation
wHERE UserName=@Name



CREATE PROCEDURE uspSearchByGender_Orientation
@Gender NVarChar(50),
@Orientation NVarChar(50)

AS  
SELECT
	UserInformation.UserId,
	UserInformation.UserName,
	UserInformation.Location,
	UserInformation.Profession,
	UserInformation.Gender,
	UserInformation.AgeRange,
	UserInformation.SexualOrientation,
	UserInformation.EyeColour,
	UserInformation.HairColour,
	UserInformation.Height,
	UserInformation.Build

FROM UserInformation
wHERE Gender= @Gender
And
SexualOrientation=@Orientation

CREATE PROCEDURE uspUserProfile_UserID
@UserId int
AS  
SELECT
	UserInformation.UserId,
	UserInformation.UserName,
	UserInformation.Location,
	UserInformation.Profession,
	UserInformation.Gender,
	UserInformation.AgeRange,
	UserInformation.SexualOrientation,
	UserInformation.EyeColour,
	UserInformation.HairColour,
	UserInformation.Height,
	UserInformation.Build

FROM UserInformation
wHERE UserId=@UserId


CREATE VIEW [UserLogin_W_UserName] AS
SELECT UserInformation.UserName, UserLogin.UserId, UserLogin.Email, UserLogin.Password
FROM UserInformation
Left Join  UserLogin
On UserInformation.UserId = UserLogin.UserId

SElect * From [UserLogin_W_UserName]