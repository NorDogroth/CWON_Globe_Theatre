
INSERT INTO Types (Type, Kind)
VALUES
  (
    'BUILDING_GLOBE_THEATRE', 'KIND_BUILDING'
  );

INSERT INTO Buildings (
  BuildingType, Name, PrereqTech, PrereqCivic,
  Cost, MaxPlayerInstances, MaxWorldInstances,
  Capital, PrereqDistrict, AdjacentDistrict,
  Description, RequiresPlacement,
  RequiresRiver, OuterDefenseHitPoints,
  Housing, Entertainment, AdjacentResource,
  Coast, EnabledByReligion, AllowsHolyCity,
  PurchaseYield, MustPurchase, Maintenance,
  IsWonder, TraitType, OuterDefenseStrength,
  CitizenSlots, MustBeLake, MustNotBeLake,
  RegionalRange, AdjacentToMountain,
  ObsoleteEra, RequiresReligion, GrantFortification,
  DefenseModifier, InternalOnly, RequiresAdjacentRiver,
  Quote, QuoteAudio, MustBeAdjacentLand,
  AdvisorType, AdjacentCapital, AdjacentImprovement,
  CityAdjacentTerrain, UnlocksGovernmentPolicy,
  GovernmentTierRequirement
)
VALUES
  (
    'BUILDING_GLOBE_THEATRE', 'LOC_BUILDING_GLOBE_THEATRE_NAME',
    'TECH_PRINTING', NULL, 820, -1, 1,
    0, NULL, NULL, 'LOC_BUILDING_GLOBE_THEATRE_DESCRIPTION',
    1, 1, NULL, 0, 1, NULL, NULL, 0, 0, NULL,
    0, 0, 1, NULL, 0, NULL, 0, 0, 0, 0, 'NO_ERA',
    0, 0, 0, 0, 0, 'LOC_BUILDING_GLOBE_THEATRE_QUOTE',
    NULL, 0, 'ADVISOR_CULTURE', 0, NULL,
    NULL, 0, NULL
  );


INSERT INTO Building_GreatPersonPoints (BuildingType, GreatPersonClassType, PointsPerTurn)
VALUES ('BUILDING_GLOBE_THEATRE', 'GREAT_PERSON_CLASS_WRITER', '2');


INSERT INTO Building_YieldChanges (
  BuildingType, YieldType, YieldChange
)
VALUES
  (
    'BUILDING_GLOBE_THEATRE', 'YIELD_CULTURE',
    2
  );


INSERT INTO Building_GreatWorks (
  BuildingType, GreatWorkSlotType, NumSlots
)
VALUES
  (
    'BUILDING_GLOBE_THEATRE', 'GREATWORKSLOT_WRITING', 2
  );

INSERT INTO Building_ValidTerrains (BuildingType, TerrainType)
VALUES
  (
    'BUILDING_GLOBE_THEATRE', 'TERRAIN_GRASS'
  ),
  (
    'BUILDING_GLOBE_THEATRE', 'TERRAIN_PLAINS'
  ),
  (
    'BUILDING_GLOBE_THEATRE', 'TERRAIN_TUNDRA'
  );


-- 1 free Great Writer appears near the city where the wonder was built

INSERT INTO Requirements (
  RequirementId, RequirementType
)
VALUES
  (
    'REQUIRES_PLAYER_CAN_EVER_EARN_WRITER',
    'REQUIREMENT_PLAYER_CAN_EVER_EARN_GREAT_PERSON_CLASS'
  );


INSERT INTO RequirementSets (
  RequirementSetId, RequirementSetType
)
VALUES
  (
    'GLOBE_THEATRE_WRITER_REQUIREMENTS',
    'REQUIREMENTSET_TEST_ALL'
  );


INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
VALUES
  (
    'GLOBE_THEATRE_WRITER_REQUIREMENTS',
    'REQUIRES_PLAYER_CAN_EVER_EARN_WRITER'
  );

INSERT INTO RequirementArguments (RequirementId, Name, Value) VALUES ('REQUIRES_PLAYER_CAN_EVER_EARN_WRITER', 'GreatPersonClass', 'GREAT_PERSON_CLASS_WRITER');

INSERT INTO Modifiers (
  ModifierId, ModifierType, RunOnce, Permanent,
  SubjectRequirementSetId
)
VALUES
  (
    'GLOBE_THEATRE_GRANT_WRITER', 'MODIFIER_SINGLE_CITY_GRANT_GREAT_PERSON_CLASS_IN_CITY',
    1, 1,  'GLOBE_THEATRE_WRITER_REQUIREMENTS'
  );

INSERT INTO ModifierArguments (
  ModifierId, Name,  Value
)
VALUES
  (
    'GLOBE_THEATRE_GRANT_WRITER', 'GreatPersonClassType', 'GREAT_PERSON_CLASS_WRITER'
  ),
  (
    'GLOBE_THEATRE_GRANT_WRITER', 'Amount', 1
  );


INSERT INTO BuildingModifiers (BuildingType, ModifierId) VALUES ('BUILDING_GLOBE_THEATRE', 'GLOBE_THEATRE_GRANT_WRITER');


-- +1 Amenities for any City with Amphitheater

INSERT INTO Requirements (RequirementId, RequirementType) VALUES ('REQUIRES_CITY_HAS_AMPHITHEATER_GLOBE', 'REQUIREMENT_CITY_HAS_BUILDING');

INSERT INTO RequirementArguments (RequirementId, Name, Value) VALUES ('REQUIRES_CITY_HAS_AMPHITHEATER_GLOBE', 'BuildingType', 'BUILDING_AMPHITHEATER');

INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('REQUIREMENTS_CITY_HAS_AMPHITHEATER_GLOBE', 'REQUIREMENTSET_TEST_ANY');

INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('REQUIREMENTS_CITY_HAS_AMPHITHEATER_GLOBE', 'REQUIRES_CITY_HAS_AMPHITHEATER_GLOBE');

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
VALUES ('GLOBE_THEATRE_AMPHITHEATER_AMENITY_MODIFIER', 'MODIFIER_PLAYER_CITIES_ADJUST_POLICY_AMENITY', 'REQUIREMENTS_CITY_HAS_AMPHITHEATER_GLOBE');

INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('GLOBE_THEATRE_AMPHITHEATER_AMENITY_MODIFIER', 'Amount', '1');

INSERT INTO BuildingModifiers (BuildingType, ModifierId) VALUES ('BUILDING_GLOBE_THEATRE', 'GLOBE_THEATRE_AMPHITHEATER_AMENITY_MODIFIER');


-- Add Renaissance Great Writers - John Donne, Moliere and Dante.
INSERT INTO Types
			(Type,										Kind)
VALUES		('GREAT_PERSON_INDIVIDUAL_CWON_JOHN_DONNE',	'KIND_GREAT_PERSON_INDIVIDUAL'),
			('GREAT_PERSON_INDIVIDUAL_CWON_MOLIERE',		'KIND_GREAT_PERSON_INDIVIDUAL'),
			('GREAT_PERSON_INDIVIDUAL_CWON_DANTE',	'KIND_GREAT_PERSON_INDIVIDUAL'),
			('GREATWORK_CWON_JOHN_DONNE_1',						'KIND_GREATWORK'),
			('GREATWORK_CWON_JOHN_DONNE_2',						'KIND_GREATWORK'),
			('GREATWORK_CWON_MOLIERE_1',						'KIND_GREATWORK'),
			('GREATWORK_CWON_MOLIERE_2',						'KIND_GREATWORK'),
			('GREATWORK_CWON_DANTE_1',						'KIND_GREATWORK'),
			('GREATWORK_CWON_DANTE_2',						'KIND_GREATWORK');

INSERT INTO GreatPersonIndividuals
			(GreatPersonIndividualType,						Name,													GreatPersonClassType,			EraType,			Gender,	ActionCharges)
VALUES
			('GREAT_PERSON_INDIVIDUAL_CWON_JOHN_DONNE',	'LOC_GREAT_PERSON_INDIVIDUAL_CWON_JOHN_DONNE_NAME',	'GREAT_PERSON_CLASS_WRITER',	'ERA_RENAISSANCE',	'M',	0),
			('GREAT_PERSON_INDIVIDUAL_CWON_MOLIERE',	'LOC_GREAT_PERSON_INDIVIDUAL_CWON_MOLIERE_NAME',	'GREAT_PERSON_CLASS_WRITER',	'ERA_RENAISSANCE',	'M',	0),
			('GREAT_PERSON_INDIVIDUAL_CWON_DANTE',		'LOC_GREAT_PERSON_INDIVIDUAL_CWON_DANTE_NAME',		'GREAT_PERSON_CLASS_WRITER',	'ERA_RENAISSANCE',	'M',	0);

INSERT INTO GreatWorks
			(GreatWorkType,					GreatWorkObjectType,			GreatPersonIndividualType,						Name,											Quote,										Tourism,	Audio)
VALUES		('GREATWORK_CWON_JOHN_DONNE_1',	'GREATWORKOBJECT_WRITING',		'GREAT_PERSON_INDIVIDUAL_CWON_JOHN_DONNE',		'LOC_GREATWORK_CWON_JOHN_DONNE_1_NAME',			'LOC_GREATWORK_CWON_JOHN_DONNE_1_QUOTE',	4,			''),
			('GREATWORK_CWON_JOHN_DONNE_2',	'GREATWORKOBJECT_WRITING',		'GREAT_PERSON_INDIVIDUAL_CWON_JOHN_DONNE',		'LOC_GREATWORK_CWON_JOHN_DONNE_2_NAME',			'LOC_GREATWORK_CWON_JOHN_DONNE_2_QUOTE',	4,			''),
			('GREATWORK_CWON_MOLIERE_1',	'GREATWORKOBJECT_WRITING',		'GREAT_PERSON_INDIVIDUAL_CWON_MOLIERE',	'LOC_GREATWORK_CWON_MOLIERE_1_NAME',	'LOC_GREATWORK_CWON_MOLIERE_1_QUOTE',	4,	''),
			('GREATWORK_CWON_MOLIERE_2',	'GREATWORKOBJECT_WRITING',		'GREAT_PERSON_INDIVIDUAL_CWON_MOLIERE',	'LOC_GREATWORK_CWON_MOLIERE_2_NAME',	'LOC_GREATWORK_CWON_MOLIERE_2_QUOTE',	4,	''),
			('GREATWORK_CWON_DANTE_1',	'GREATWORKOBJECT_WRITING',		'GREAT_PERSON_INDIVIDUAL_CWON_DANTE',		'LOC_GREATWORK_CWON_DANTE_1_NAME',			'LOC_GREATWORK_CWON_DANTE_1_QUOTE',		4,			''),
			('GREATWORK_CWON_DANTE_2',	'GREATWORKOBJECT_WRITING',		'GREAT_PERSON_INDIVIDUAL_CWON_DANTE',		'LOC_GREATWORK_CWON_DANTE_2_NAME',			'LOC_GREATWORK_CWON_DANTE_2_QUOTE',		4,			'');

INSERT INTO GreatWork_YieldChanges
			(GreatWorkType,					YieldType,			YieldChange)
VALUES		
			('GREATWORK_CWON_JOHN_DONNE_1',	'YIELD_CULTURE',	4),
			('GREATWORK_CWON_JOHN_DONNE_2',	'YIELD_CULTURE',	4),
			('GREATWORK_CWON_MOLIERE_1',	'YIELD_CULTURE',	4),
			('GREATWORK_CWON_MOLIERE_2',	'YIELD_CULTURE',	4),
			('GREATWORK_CWON_DANTE_1',	'YIELD_CULTURE',	4),
			('GREATWORK_CWON_DANTE_2',	'YIELD_CULTURE',	4);