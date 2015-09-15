-------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------- VIEWS -------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------

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
	County
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
   SexualOrientation
FROM
    SexualOrientation 
	
GO


	
	
	
	
	
	
	
	
