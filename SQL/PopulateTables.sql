-----Insert data into tables

------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------ ATTRIBUTE TABLES ----------------------------------------------------------- 
------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO [dbo].[AgeRange] ([AgeRange]) VALUES 
('18-25'),
('26-32'),
('33-39'),
('40+')

INSERT INTO [dbo].[Build] ([Build]) VALUES
('Athletic'),
('Average'),
('Large'),
('Muscular'),
('Slim')

INSERT INTO [dbo].[County] ([County]) VALUES 
('Antrim'),
('Armagh'),
('Carlow'),
('Cavan'),
('Clare'),
('Cork'),
('Derry'),
('Donegal'),
('Down'),
('Dublin'),
('Fermanagh'),
('Galway'),
('Kerry'),
('Kildare'),
('Kilkenny'),
('Laois'),
('Leitrim'),
('Limerick'),
('Longford'),
('Louth'),
('Mayo'),
('Meath'),
('Monaghan'),
('Offaly'),
('Roscommon'),
('Sligo'),
('Tipperary'),
('Tyrone'),
('Waterford'),
('Westmeath'),
('Wexford'),
('Wicklow')

INSERT INTO [dbo].[Ethnicity] ([Ethnicity]) VALUES 
('Asian'),
('Black'),
('East Indian'),
('Latin'),
('Multi-Racial'),
('Native Amercian'),
('Other'),
('Prefer Not To Say'),
('White')

INSERT INTO [dbo].[EyeColor] ([EyeColor]) VALUES
('Blue'),
('Brown'),
('Gree'),
('Grey'),
('Hazel')

INSERT INTO [dbo].[Gender] ([Gender]) VALUES 
('Female'),
('Male'),
('Other'),
('Prefer Not To Say')

INSERT INTO [dbo].[HairColor] ([HairColor]) VALUES 
('Bald'),
('Black'),
('Blonde'),
('Brown'),
('Grey'),
('Red')

INSERT INTO [dbo].[Height] ([Height]) VALUES
('4''10"'),
('4''11"'),
('4''7"'),
('4''8"'),
('4''9"'),
('5''0"'),
('5''1"'),
('5''10"'),
('5''11"'),
('5''2"'),
('5''3"'),
('5''4"'),
('5''5"'),
('5''6"'),
('5''7"'),
('5''8"'),
('5''9"'),
('6''0"'),
('6''1"'),
('6''2"'),
('6''3"'),
('6''4"'),
('6''5"'),
('6''7"'),
('6''8"'),
('6''9"')


SET IDENTITY_INSERT [dbo].[Hobbies] ON
INSERT INTO [dbo].[Hobbies] ([HobbyID], [HobbyName]) VALUES
(1, 'Horseriding'),
(2, 'Cycling'),
(3, 'Swimming'),
(4, 'Reading'),
(5, 'Baking'),
(6, 'Listening to Music'),
(7, 'Walking'),
(8, 'Running'),
(9, 'Gym'),
(10, 'Watersports'),
(11, 'Hiking'),
(12, 'Gardening'),
(13, 'Knitting'),
(14, 'Socialising'),
(15, 'Football'),
(16, 'Tennis')
SET IDENTITY_INSERT [dbo].[Hobbies] OFF

INSERT INTO [dbo].[RelationshipStatus] ([RelationshipStatus]) VALUES 
('Single'),
('In A Relationship'),
('In An Open Relationship'),
('It''s Complicated')

INSERT INTO [dbo].[MaritalStatus] ([MaritalStatus]) VALUES 
('Divorced'),
('Never Married'),
('Seperated'),
('Widowed')

INSERT INTO [dbo].[SexualOrientation] ([SexualOrientation]) VALUES 
('Prefer Not To Say'),
('Gay'),
('Straight'),
('Other')


------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------ USER TABLES ----------------------------------------------------------- 
------------------------------------------------------------------------------------------------------------------------------------------


--------------------------------------------------------------------------------
INSERT INTO [dbo].[Users] ([Username], [Password], [Email]) VALUES 
('Sarah', 'password', 'maryb@gmail.com'),
('BradPitt', 'password', 'bradpitt@gmail.com'),
('AngieJolie', 'password', 'angiej@gmail.com'),
('JennyAniston', 'password', 'jennya@gmail.com'),
('LeoCaprio', 'password', 'leocaprio@gmail.com'),
('jsmith', 'qwerty', 'jsmith@gmail.com'),
('mbloggs', 'rex17', 'mbloggs@gmail.com'),
('jmurphy', 'bloggs', 'jmurphy@gmail.com'),
('aoconnor', '221185', 'aoconnor@gmail.com'),
('sparkles', 'azerty', 'sparkles@gmail.com'),
('kingkong', 'udjsns', 'kingkong@gmail.com'),
('musiclover', 'efawsfg', 'musiclover@gmail.com'),
('beets', 'dogs', 'beets@gmail.com'),
('bears', 'stapler', 'bears@gmail.com'),
('battlestargalactica', 'zoom', 'battle@gmail.com'),
('marry', '1234', 'marry@gmail.com'),
('catlady', 'c@tlyfe', 'catlady@gmail.com'),
('jkyle', 'wordpass', 'jkyle@gmail.com'),
('hippo', 'nooooo', 'hippo@gmail.com'),
('maryhowdoiturnthison', '1ireland1', 'janice@gmail.com'),
('claire', 'password', 'claire@gmail.com')
--------------------------------------------------------------------------------

--INSERT INTO [dbo].[UserInformation] ([UserID],[Age],[Build],[AgeRange],[County],[Ethnicity],[EyeColor],[Gender],[HairColor],[Height],[Hobbies],[IdealDate],[Profession],[RelationshipStatus],[SexualOrientation],[Town],[ProfilePicturePath])
--VALUES
--(1,18,'Athletic','18-25','Dublin','White','Brown','Male','Black','5''2"',null,'Cinema','Accountant','Single','Straight','Rathmines',null),
--(2,19,'Average','18-25','Kildare','Black','Brown','Female','Black','5''3"',null,'Picnic','Teacher','Single','Prefer Not To Say','Cellbridge',null),
--(3,21,'Slim','18-25','Kildare','Prefer Not To Say','Gree','Male','Brown','5''2"',null,'Paris','Engineer','Single','Other','Leixlip',null),
--(4,27,'Large','26-32','Dublin','White','Hazel','Female','Red','5''4"',null,'Sailing','Chef','Single','Gay','Raheny',null),
--(5,42,'Slim','40+','Dublin','East Indian','Grey','Male','Grey','5''5"',null,'Dinner','Nurse','Single','Straight','Donaghmede',null),
--(6,50,'Muscular','40+','Kildare','Asian','Gree','Female','Bald','5''5"',null,'Night I','Doctor','Single','Straight','Newbridge',null),
--(7,34,'Slim','33-39','Dublin','Latin','Blue','Male','Blonde','5''5"',null,'Hiking','Butcher','Single','Straight','Harmonstow',null),
--(8,37,'Large','33-39','Dublin','Other','Brown','Female','Black','5''5"',null,'Hanging with friends','Baker','Single','Straight','Clontarf',null),
--(9,26,'Muscular','26-32','Dublin','Black','Blue','Other','Blonde','5''5"',null,'Coffee','Fashion Designer','Single','Gay','Howth',null),
--(10,24,'Slim','26-32','Louth','White','Blue','Prefer Not To Say','Brown','5''8"',null,'Cinema','Nurse','Single','Gay','Dundalk',null),
--(11,54,'Large','40+','Kerry','White','Brown','Female','Bald','5''7"',null,'Picnic','Teacher','It''s Complicated','Other','Tralee',null),
--(12,40,'Average','40+','Sligo','White','Blue','Male','Black','5''6"',null,'Paris','Solicitor','In An Open Relationship','Straight','Sligo',null),
--(13,42,'Athletic','40+','Cork','White','Blue','Female','Blonde','6''1"',null,'Sailing','Dentist','It''s Complicated','Straight','Ballincollig',null)

INSERT INTO [dbo].[UserInformation] ([UserID],[Age],[Build],[AgeRange],[County],[Ethnicity],[EyeColor],[Gender],[HairColor],[Height],[IdealDate],[Profession],[RelationshipStatus],[SexualOrientation],[Town],[ProfilePicturePath])
VALUES
(1,18,'Athletic','18-25','Dublin','White','Brown','Male','Black','5''2"','Cinema','Accountant','Single','Straight','Rathmines',null),
(2,19,'Average','18-25','Kildare','Black','Brown','Female','Black','5''3"','Picnic','Teacher','Single','Prefer Not To Say','Cellbridge',null),
(3,21,'Slim','18-25','Kildare','Prefer Not To Say','Gree','Male','Brown','5''2"','Paris','Engineer','Single','Other','Leixlip',null),
(4,27,'Large','26-32','Dublin','White','Hazel','Female','Red','5''4"','Sailing','Chef','Single','Gay','Raheny',null),
(5,42,'Slim','40+','Dublin','East Indian','Grey','Male','Grey','5''5"','Dinner','Nurse','Single','Straight','Donaghmede',null),
(6,50,'Muscular','40+','Kildare','Asian','Gree','Female','Bald','5''5"','Night I','Doctor','Single','Straight','Newbridge',null),
(7,34,'Slim','33-39','Dublin','Latin','Blue','Male','Blonde','5''5"','Hiking','Butcher','Single','Straight','Harmonstow',null),
(8,37,'Large','33-39','Dublin','Other','Brown','Female','Black','5''5"','Hanging with friends','Baker','Single','Straight','Clontarf',null),
(9,26,'Muscular','26-32','Dublin','Black','Blue','Other','Blonde','5''5"','Coffee','Fashion Designer','Single','Gay','Howth',null),
(10,24,'Slim','26-32','Louth','White','Blue','Prefer Not To Say','Brown','5''8"','Cinema','Nurse','Single','Gay','Dundalk',null),
(11,54,'Large','40+','Kerry','White','Brown','Female','Bald','5''7"','Picnic','Teacher','It''s Complicated','Other','Tralee',null),
(12,40,'Average','40+','Sligo','White','Blue','Male','Black','5''6"','Paris','Solicitor','In An Open Relationship','Straight','Sligo',null),
(13,42,'Athletic','40+','Cork','White','Blue','Female','Blonde','6''1"','Sailing','Dentist','It''s Complicated','Straight','Ballincollig',null)

--------------------------------------------------------------------------------

INSERT INTO [dbo].[UserHobbies] ([UserId], [HobbyID]) VALUES 
(1, 1),
(7, 1),
(10, 2),
(1, 3),
(6, 3),
(3, 3),
(10, 3),
(1, 5),
(2, 5),
(6, 6),
(7, 12)


--------------------------------------------------------------------------------

SET IDENTITY_INSERT [dbo].[Conversation] ON
INSERT INTO [dbo].[Conversation] ([ConversationID], [ParticipantA_ID], [ParticipantB_ID], [MessageContent]) VALUES (5, 20, 1, N'<Conversation><Message><SenderID>20</SenderID><TimeStamp>29/09/2015 17:59:38</TimeStamp><Content>Hello is this Hugo?</Content></Message><Message><SenderID>20</SenderID><TimeStamp>29/09/2015 17:59:38</TimeStamp><Content>Hugo? Hello Hugo?.</Content></Message><Message><SenderID>1</SenderID><TimeStamp>29/09/2015 17:59:38</TimeStamp><Content>I''m not Hugo</Content></Message><Message><SenderID>20</SenderID><TimeStamp>29/09/2015 17:59:38</TimeStamp><Content>Oh sorry Hugo</Content></Message></Conversation>')
INSERT INTO [dbo].[Conversation] ([ConversationID], [ParticipantA_ID], [ParticipantB_ID], [MessageContent]) VALUES (7, 7, 1, N'<Conversation><Message><SenderID>7</SenderID><TimeStamp>29/09/2015 18:03:36</TimeStamp><Content>Hi, how are you finding the site?</Content></Message><Message><SenderID>1</SenderID><TimeStamp>29/09/2015 18:03:36</TimeStamp><Content>Hey, it''s pretty good. Very well made imo.</Content></Message><Message><SenderID>7</SenderID><TimeStamp>29/09/2015 18:03:36</TimeStamp><Content>I agree.</Content></Message><Message><SenderID>7</SenderID><TimeStamp>29/09/2015 18:03:36</TimeStamp><Content>Master craftsmanship I''d say</Content></Message></Conversation>')
INSERT INTO [dbo].[Conversation] ([ConversationID], [ParticipantA_ID], [ParticipantB_ID], [MessageContent]) VALUES (8, 12, 1, N'<Conversation><Message><SenderID>12</SenderID><TimeStamp>29/09/2015 18:05:40</TimeStamp><Content>How did you get on on Saturday</Content></Message><Message><SenderID>1</SenderID><TimeStamp>29/09/2015 18:05:40</TimeStamp><Content>What was on Saturday?</Content></Message><Message><SenderID>1</SenderID><TimeStamp>29/09/2015 18:05:40</TimeStamp><Content>Wait, oh the cinema. Yeah it was nice. Good movie, highly recommended.</Content></Message><Message><SenderID>12</SenderID><TimeStamp>29/09/2015 18:05:40</TimeStamp><Content>Which film was it again?</Content></Message></Conversation>')
SET IDENTITY_INSERT [dbo].[Conversation] OFF