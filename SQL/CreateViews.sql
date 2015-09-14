
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


	
	
	
	
	
	
	
	
	
------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------- VIEWS -------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------

----- VIEWS -----

------ View to view all attribute and values 

DROP VIEW [ViewAllAttributeValues]
GO
CREATE VIEW [ViewAllAttributeValues]
AS 
Select
	'Eye Color' as Attribute,
	EyeColor as  Attribute_Value
	FROM 
	EyeColor

UNION

SELECT
  'Sexual Orientation',
   Orientation
FROM
    SexualOrientation 

UNION

SELECT
  'Age Range',
   AgeRange
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
  'Gender',
	Gender
FROM
    Gender

UNION

SELECT
  'Hair Color',
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
  'Hobby Name',
	HobbyName
FROM
    Hobbies
GO


------------------------------------------------------------------------------------------------------------------------------------------

--SELECT * FROM ViewAllAttributeValues
--GO
