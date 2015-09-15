-----Insert data into tables

------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------ ATTRIBUTE TABLES ----------------------------------------------------------- 
------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO [dbo].[AgeRange] ([AgeRange]) VALUES 
(N'18-25'),
(N'26-32'),
(N'33-39'),
(N'40+')

INSERT INTO [dbo].[Build] ([Build]) VALUES
(N'Athletic'),
(N'Average'),
(N'Large'),
(N'Muscular'),
(N'Slim')

INSERT INTO [dbo].[County] ([CountyName]) VALUES 
(N'Antrim'),
(N'Armagh'),
(N'Carlow'),
(N'Cavan'),
(N'Clare'),
(N'Cork'),
(N'Derry'),
(N'Donegal'),
(N'Down'),
(N'Dublin'),
(N'Fermanagh'),
(N'Galway'),
(N'Kerry'),
(N'Kildare'),
(N'Kilkenny'),
(N'Laois'),
(N'Leitrim'),
(N'Limerick'),
(N'Longford'),
(N'Louth'),
(N'Mayo'),
(N'Meath'),
(N'Monaghan'),
(N'Offaly'),
(N'Roscommon'),
(N'Sligo'),
(N'Tipperary'),
(N'Tyrone'),
(N'Waterford'),
(N'Westmeath'),
(N'Wexford'),
(N'Wicklow')

INSERT INTO [dbo].[Ethnicity] ([Ethnicity]) VALUES (N'Asian'),
(N'Black'),
(N'East Indian'),
(N'Latin'),
(N'Middle Eastern'),
(N'Multi-Racial'),
(N'Native Amercian'),
(N'Other'),
(N'Pacific Islander'),
(N'Rather not say'),
(N'White')

INSERT INTO [dbo].[EyeColor] ([EyeColor]) VALUES
(N'Blue'),
(N'Brown'),
(N'Green'),
(N'Grey'),
(N'Hazel')

INSERT INTO [dbo].[Gender] ([Gender]) VALUES 
(N'Female'),
(N'Male'),
(N'Other'),
(N'Rather Not Say')

INSERT INTO [dbo].[HairColor] ([HairColor]) VALUES 
(N'Bald'),
(N'Black'),
(N'Blonde'),
(N'Brown'),
(N'Grey'),
(N'Red')

INSERT INTO [dbo].[Height] ([Height]) VALUES
(N'4.7'),
(N'6''9"'),
(N'4''10"'),
(N'4''11"'),
(N'4''7"'),
(N'4''8"'),
(N'4''9"'),
(N'5''0"'),
(N'5''1"'),
(N'5''10"'),
(N'5''11"'),
(N'5''2"'),
(N'5''3"'),
(N'5''4"'),
(N'5''5"'),
(N'5''6"'),
(N'5''7"'),
(N'5''8"'),
(N'5''9"'),
(N'6''0"'),
(N'6''1"'),
(N'6''2"'),
(N'6''3"'),
(N'6''4"'),
(N'6''5"'),
(N'6''7"'),
(N'6''8"'),
(N'6''9"')


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

INSERT INTO [dbo].[RelationshipStatus] ([RelationshipStatus]) VALUES 
(N'Divorced'),
(N'Never Married'),
(N'Seperated'),
(N'Widowed')

INSERT INTO [dbo].[SexualOrientation] ([Orientation]) VALUES 
(N'Bisexual'),
(N'Gay'),
(N'Straight'),
(N'Other')


------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------ USER TABLES ----------------------------------------------------------- 
------------------------------------------------------------------------------------------------------------------------------------------


--------------------------------------------------------------------------------
INSERT INTO [dbo].[Users] ([Username], [Password], [Email]) VALUES 
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
(N'maryhowdoiturnthison', N'1ireland1', N'janice@gmail.com'),
(N'Sarah', N'password', N'maryb@gmail.com')
(N'BradPitt', N'password', N'bradpitt@gmail.com')
(N'AngieJolie', N'password', N'angiej@gmail.com')
(N'JennyAniston', N'password', N'jennya@gmail.com')
(N'LeoCaprio', N'password', N'leocaprio@gmail.com')
(N'claire', N'password', N'claire@gmail.com')
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

INSERT INTO [dbo].[UserInformation] ([UserID], [Town], [County], [Age], [Profession], [EyeColor], [HairColor], [Ethnicity], [RelationshipStatus], [Gender], [SexualOrientation], [Build], [Height], [ProfilePicturePath], [IdealDate], [Comments]) 
VALUES (1, N'Dundalk', N'Louth', 24, N'Nurse', N'Blue', N'Brown', N'White', N'Never Married', N'Female', N'Straight', N'Slim', N'<4.7', N'/images/mary.jpg', N'Picnic in the park', N'loves animals'),
(2, N'Tralee', N'Kerry', 54, N'Teacher', N'Blue', N'Bald', N'White', N'Never Married', N'Male', N'Straight', N'Slim', N'<4.7', N'/images/bradpitt.jpg', N'Dinner and Drinks', N'Amateur actor in freetime'),
(3, N'Sligo', N'Sligo', 40, N'Solicitor', N'Brown', N'Black', N'White', N'Divorced', N'Female', N'Bisexual', N'Slim', N'<4.7', N'/images/angiejolie.jpg', N'A long walk on the beach', N'Does a lot of charity work in spare time'),
(4, NULL, NULL, 42, N'Dentist', N'Blue', N'Blonde', N'White', N'Divorced', N'Female', N'Straight', N'Athletic', N'<4.7', N'/images/jennyaniston.jpg', N'Hiking', N'loves animals')

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


-----------------------------------------------------------------------------------------
SET IDENTITY_INSERT [dbo].[Messages] ON
INSERT INTO [dbo].[Messages] ([MessageID], [SenderID], [ReceiverID], [DateTime], [Contents]) VALUES (1, 1, 2, N'2015-01-01 00:00:00', N'Hey! What''s up?')
INSERT INTO [dbo].[Messages] ([MessageID], [SenderID], [ReceiverID], [DateTime], [Contents]) VALUES (2, 2, 1, N'2015-01-01 01:00:00', N'Not much :) How''s you?')
INSERT INTO [dbo].[Messages] ([MessageID], [SenderID], [ReceiverID], [DateTime], [Contents]) VALUES (3, 1, 2, N'2015-01-02 00:00:00', N'Pretty cool. Check out this cat gif!')
INSERT INTO [dbo].[Messages] ([MessageID], [SenderID], [ReceiverID], [DateTime], [Contents]) VALUES (4, 2, 1, N'2015-01-02 02:00:00', N'Haha noice!')
SET IDENTITY_INSERT [dbo].[Messages] OFF



--



