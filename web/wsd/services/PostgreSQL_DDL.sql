DROP TABLE IF EXISTS constants;
DROP TABLE IF EXISTS team;
DROP TABLE IF EXISTS swimmer;
DROP TABLE IF EXISTS event;
DROP TABLE IF EXISTS result;
DROP TABLE IF EXISTS meet;

--	PostgreSQL

--	TABLE:  swimmer
DROP TABLE IF EXISTS swimmer;
CREATE TABLE swimmer(
id CHAR(32) NOT NULL,
firstname VARCHAR(30) NOT NULL,
lastname VARCHAR(30) NOT NULL,
team CHAR(32) NOT NULL,
age int,
ageGroup CHAR(32),
gender CHAR(32),
createdby VARCHAR(30) NOT NULL,
createddate TIMESTAMP NOT NULL,
modifiedby VARCHAR(30) DEFAULT NULL,
modifieddate TIMESTAMP DEFAULT NULL,
PRIMARY KEY(id));

--	TABLE:  meet
DROP TABLE IF EXISTS meet;
CREATE TABLE meet(
id CHAR(32) NOT NULL,
home CHAR(32) NOT NULL,
away CHAR(32),
day VARCHAR(10) NOT NULL,
type CHAR(64) NOT NULL,
homeScore float(2),
awayScore float(2),
createdby VARCHAR(30) NOT NULL,
createddate TIMESTAMP NOT NULL,
modifiedby VARCHAR(30) DEFAULT NULL,
modifieddate TIMESTAMP DEFAULT NULL,
PRIMARY KEY(id)
);

--	TABLE:  result
DROP TABLE IF EXISTS result;
CREATE TABLE result(
id CHAR(32) NOT NULL,
swimmer CHAR(32) NOT NULL,
event CHAR(32) NOT NULL,
meet CHAR(32), 
time VARCHAR(10),
createdby VARCHAR(30) NOT NULL,
createddate TIMESTAMP NOT NULL,
modifiedby VARCHAR(30) DEFAULT NULL,
modifieddate TIMESTAMP DEFAULT NULL,
PRIMARY KEY(id)
);

--	TABLE:  event
CREATE TABLE event(
id CHAR(32) NOT NULL,
event VARCHAR(20) NOT NULL,
agegroup CHAR(64) NOT NULL,
gender CHAR(64) NOT NULL,
distance CHAR(64) NOT NULL,
discipline CHAR(64) NOT NULL,
createdby VARCHAR(30) NOT NULL,
createddate TIMESTAMP NOT NULL,
modifiedby VARCHAR(30) DEFAULT NULL,
modifieddate TIMESTAMP DEFAULT NULL,
PRIMARY KEY(id));

--	TABLE:  team
CREATE TABLE team(
id CHAR(32) NOT NULL,
team VARCHAR(50) NOT NULL,
mascot VARCHAR(20) NOT NULL,
abbr VARCHAR(10),
city VARCHAR(30),
conference CHAR(64) NOT NULL,
createdby VARCHAR(30) NOT NULL,
createddate TIMESTAMP NOT NULL,
modifiedby VARCHAR(30) DEFAULT NULL,
modifieddate TIMESTAMP DEFAULT NULL,
PRIMARY KEY(id));

--	TABLE:  constants
drop table constants;
CREATE TABLE constants(
id CHAR(64) NOT NULL,
type varCHAR(32) NOT NULL,
value VARCHAR(50) NOT NULL,
sequence int NOT NULL,
createdby VARCHAR(30) NOT NULL,
createddate TIMESTAMP NOT NULL,
modifiedby VARCHAR(30) DEFAULT NULL,
modifieddate TIMESTAMP DEFAULT NULL,
PRIMARY KEY(id)
);

--	Returns a CHAR(32) ID from UUID
CREATE OR REPLACE FUNCTION getRecordId()
RETURNS CHAR(32)
AS $$
DECLARE
	cRecId CHAR(32);
	cUuid CHAR(36);
BEGIN
	cUuid := uuid_generate_v1();
	SELECT REPLACE(cUuid, '-', '') INTO cRecId;
	RETURN cRecId;
END; $$
LANGUAGE PLPGSQL;

--	Returns the ID of a team
CREATE OR REPLACE FUNCTION getTeamId(IN p_team VARCHAR(20))
RETURNS CHAR(32)
AS $$
	SELECT id FROM team WHERE team = p_team;
$$
LANGUAGE SQL ;

--	CONSTANTS TABLE data
INSERT INTO constants(id,type,value,sequence,createdby,createddate) 
VALUES('AGE_GROUP_6_UNDER','AGE_GROUP','6 and Unders',1,USER,CURRENT_TIMESTAMP),
('AGE_GROUP_7_8','AGE_GROUP','7 - 8',2,USER,CURRENT_TIMESTAMP),
('AGE_GROUP_9_10','AGE_GROUP','9 - 10',3,USER,CURRENT_TIMESTAMP),
('AGE_GROUP_11_12','AGE_GROUP','11 - 12',4,USER,CURRENT_TIMESTAMP),
('AGE_GROUP_13_14','AGE_GROUP','13 - 14',5,USER,CURRENT_TIMESTAMP),
('AGE_GROUP_15_UP','AGE_GROUP','15 and Up',6,USER,CURRENT_TIMESTAMP),
('CONF_COMSTOCK','CONFERENCE','Comstock',1,USER,CURRENT_TIMESTAMP),
('CONF_GOLDRUSH','CONFERENCE','Gold Rush',2,USER,CURRENT_TIMESTAMP),
('CONF_EUREKA','CONFERENCE','Eureka',3,USER,CURRENT_TIMESTAMP),
('CONF_MOTHERLODE','CONFERENCE','Mother Lode',4,USER,CURRENT_TIMESTAMP),
('CONF_NUGGET','CONFERENCE','Nugget',5,USER,CURRENT_TIMESTAMP),
('DISCIPLINE_MEDLEY_RELAY','DISCIPLINE','Medley Relay',1,USER,CURRENT_TIMESTAMP),
('DISCIPLINE_INDIVIDUAL_MEDLEY','DISCIPLINE','Individual Medley',2,USER,CURRENT_TIMESTAMP),
('DISCIPLINE_FREESTYLE','DISCIPLINE','Freestyle',3,USER,CURRENT_TIMESTAMP),
('DISCIPLINE_BACKSTROKE','DISCIPLINE','Backstroke',4,USER,CURRENT_TIMESTAMP),
('DISCIPLINE_BREASTSTROKE','DISCIPLINE','Breaststroke',5,USER,CURRENT_TIMESTAMP),
('DISCIPLINE_BUTTERFLY','DISCIPLINE','Butterfly',6,USER,CURRENT_TIMESTAMP),
('DISCIPLINE_FREESTYLE_RELAY','DISCIPLINE','Freestyle Relay',7,USER,CURRENT_TIMESTAMP),
('DISTANCE_25_YARD','DISTANCE','25 Yard',1,USER,CURRENT_TIMESTAMP),
('DISTANCE_50_YARD','DISTANCE','50 Yard',2,USER,CURRENT_TIMESTAMP),
('DISTANCE_100_YARD','DISTANCE','100 Yard',3,USER,CURRENT_TIMESTAMP),
('DISTANCE_200_YARD','DISTANCE','200 Yard',4,USER,CURRENT_TIMESTAMP),
('GENDER_MIXED','GENDER','Mixed',1,USER,CURRENT_TIMESTAMP),
('GENDER_FEMALE','GENDER','Girls',2,USER,CURRENT_TIMESTAMP),
('GENDER_MALE','GENDER','Boys',3,USER,CURRENT_TIMESTAMP),
('MEET_TYPE_TIME_TRIALS','MEET_TYPE','Time Trials',1,USER,CURRENT_TIMESTAMP),
('MEET_TYPE_INVITATIONAL','MEET_TYPE','Invitational',2,USER,CURRENT_TIMESTAMP),
('MEET_TYPE_DUAL_TEAM','MEET_TYPE','Dual Team',3,USER,CURRENT_TIMESTAMP),
('MEET_TYPE_TRI_TEAM','MEET_TYPE','Tri Team',4,USER,CURRENT_TIMESTAMP),
('MEET_TYPE_CONFERENCE_CHAMPS','MEET_TYPE','Conference Championship',5,USER,CURRENT_TIMESTAMP),
('MEET_TYPE_MOC','MEET_TYPE','Meet of Champions',6,USER,CURRENT_TIMESTAMP),
('TEAM_TIME_TRIALS','TEAM_PLACEHOLDER','Time Trials',1,USER, CURRENT_TIMESTAMP),
('TEAM_INV_SPRING','TEAM_PLACEHOLDER','Spring Invitational',2,USER, CURRENT_TIMESTAMP),
('TEAM_INV_SUMMER','TEAM_PLACEHOLDER','Summer Invitational',3,USER, CURRENT_TIMESTAMP),
('TEAM_CONF_CHAMPS','TEAM_PLACEHOLDER','Conference Championships',4,USER, CURRENT_TIMESTAMP),
('TEAM_MOC','TEAM_PLACEHOLDER','Meet of Champions',5,USER, CURRENT_TIMESTAMP);

--	TEAM TABLE data
INSERT INTO team(conference, team, mascot, abbr, city, id, createdBy, createdDate)
VALUES('CONF_COMSTOCK','Arden Hills','Otters','AH','Sacramento',getRecordId(),USER,CURRENT_TIMESTAMP),
('CONF_COMSTOCK','Elk Grove','Piranhas','EG','Elk Grove',getRecordId(),USER,CURRENT_TIMESTAMP),
('CONF_COMSTOCK','Glen Oaks','Sea Lions','GO','Carmichael',getRecordId(),USER,CURRENT_TIMESTAMP),
('CONF_COMSTOCK','Johnson Ranch','Barracudas','JRSC','Roseville',getRecordId(),USER,CURRENT_TIMESTAMP),
('CONF_COMSTOCK','Rio Del Oro','Rapids','RDO','Sacramento',getRecordId(),USER,CURRENT_TIMESTAMP),
('CONF_GOLDRUSH','West Sac','Dolphins','WS','West Sacramento',getRecordId(),USER,CURRENT_TIMESTAMP),
('CONF_GOLDRUSH','Del Norte','Dolphins','DN','Sacramento',getRecordId(),USER,CURRENT_TIMESTAMP),
('CONF_GOLDRUSH','Gold River','Stingrays','GR','Sacramento',getRecordId(),USER,CURRENT_TIMESTAMP),
('CONF_GOLDRUSH','Rocklin','Wave','ROC','Rocklin',getRecordId(),USER,CURRENT_TIMESTAMP),
('CONF_GOLDRUSH','Rollingwood','Rockets','RR','Orangevale',getRecordId(),USER,CURRENT_TIMESTAMP),
('CONF_EUREKA','Arden Park','Dolphins','AP','Sacramento',getRecordId(),USER,CURRENT_TIMESTAMP),
('CONF_EUREKA','Dixon','Dolphins','DIX','Dixon',getRecordId(),USER,CURRENT_TIMESTAMP),
('CONF_EUREKA','Galt','Gators','GG','Galt',getRecordId(),USER,CURRENT_TIMESTAMP),
('CONF_EUREKA','Sunrise','Sharks','SUN','Citrus Heights',getRecordId(),USER,CURRENT_TIMESTAMP),
('CONF_EUREKA','Woodcreek','Sea Wolves','WSW','Roseville',getRecordId(),USER,CURRENT_TIMESTAMP),
('CONF_MOTHERLODE','Amador','Polar Bears','APB','Amador',getRecordId(),USER,CURRENT_TIMESTAMP),
('CONF_MOTHERLODE','Fulton-El Camino','Stingrays','FEC','Sacramento',getRecordId(),USER,CURRENT_TIMESTAMP),
('CONF_MOTHERLODE','Fair Oaks','Dolphins','FOD','Fair Oaks',getRecordId(),USER,CURRENT_TIMESTAMP),
('CONF_MOTHERLODE','Laguna Creek','Gators','LCG','Elk Grove',getRecordId(),USER,CURRENT_TIMESTAMP),
('CONF_MOTHERLODE','Sac Town','Tsunami','SACT','Sacramento',getRecordId(),USER,CURRENT_TIMESTAMP),
('CONF_NUGGET','Carmichael','Beavers','CB','Carmichael',getRecordId(),USER,CURRENT_TIMESTAMP),
('CONF_NUGGET','Highlander','Dolphins','HDST','North Highlands',getRecordId(),USER,CURRENT_TIMESTAMP),
('CONF_NUGGET','Rio Linda','Aqua Knights','RLE','Rio Linda',getRecordId(),USER,CURRENT_TIMESTAMP),
('CONF_NUGGET','Rio Vista','Sharks','RVS','Rio Vista',getRecordId(),USER,CURRENT_TIMESTAMP);

--	EVENT TABLE data
INSERT INTO event(id,event,gender,agegroup,distance,discipline,createdBy,createdDate)
VALUES (getRecordId(),'Event 1','GENDER_MIXED','AGE_GROUP_6_UNDER','DISTANCE_100_YARD','DISCIPLINE_FREESTYLE_RELAY',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 2','GENDER_FEMALE','AGE_GROUP_7_8','DISTANCE_100_YARD','DISCIPLINE_MEDLEY_RELAY',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 3','GENDER_MALE','AGE_GROUP_7_8','DISTANCE_100_YARD','DISCIPLINE_MEDLEY_RELAY',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 4','GENDER_FEMALE','AGE_GROUP_9_10','DISTANCE_100_YARD','DISCIPLINE_MEDLEY_RELAY',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 5','GENDER_MALE','AGE_GROUP_9_10','DISTANCE_100_YARD','DISCIPLINE_MEDLEY_RELAY',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 6','GENDER_FEMALE','AGE_GROUP_11_12','DISTANCE_200_YARD','DISCIPLINE_MEDLEY_RELAY',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 7','GENDER_MALE','AGE_GROUP_11_12','DISTANCE_200_YARD','DISCIPLINE_MEDLEY_RELAY',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 8','GENDER_FEMALE','AGE_GROUP_13_14','DISTANCE_200_YARD','DISCIPLINE_MEDLEY_RELAY',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 9','GENDER_MALE','AGE_GROUP_13_14','DISTANCE_200_YARD','DISCIPLINE_MEDLEY_RELAY',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 10','GENDER_FEMALE','AGE_GROUP_15_UP','DISTANCE_200_YARD','DISCIPLINE_MEDLEY_RELAY',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 11','GENDER_MALE','AGE_GROUP_15_UP','DISTANCE_200_YARD','DISCIPLINE_MEDLEY_RELAY',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 12','GENDER_FEMALE','AGE_GROUP_9_10','DISTANCE_100_YARD','DISCIPLINE_INDIVIDUAL_MEDLEY',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 13','GENDER_MALE','AGE_GROUP_9_10','DISTANCE_100_YARD','DISCIPLINE_INDIVIDUAL_MEDLEY',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 14','GENDER_FEMALE','AGE_GROUP_11_12','DISTANCE_100_YARD','DISCIPLINE_INDIVIDUAL_MEDLEY',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 15','GENDER_MALE','AGE_GROUP_11_12','DISTANCE_100_YARD','DISCIPLINE_INDIVIDUAL_MEDLEY',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 16','GENDER_FEMALE','AGE_GROUP_13_14','DISTANCE_100_YARD','DISCIPLINE_INDIVIDUAL_MEDLEY',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 17','GENDER_MALE','AGE_GROUP_13_14','DISTANCE_100_YARD','DISCIPLINE_INDIVIDUAL_MEDLEY',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 18','GENDER_FEMALE','AGE_GROUP_15_UP','DISTANCE_100_YARD','DISCIPLINE_INDIVIDUAL_MEDLEY',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 19','GENDER_MALE','AGE_GROUP_15_UP','DISTANCE_100_YARD','DISCIPLINE_INDIVIDUAL_MEDLEY',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 20','GENDER_FEMALE','AGE_GROUP_6_UNDER','DISTANCE_25_YARD','DISCIPLINE_FREESTYLE',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 21','GENDER_MALE','AGE_GROUP_6_UNDER','DISTANCE_25_YARD','DISCIPLINE_FREESTYLE',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 22','GENDER_FEMALE','AGE_GROUP_7_8','DISTANCE_25_YARD','DISCIPLINE_FREESTYLE',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 23','GENDER_MALE','AGE_GROUP_7_8','DISTANCE_25_YARD','DISCIPLINE_FREESTYLE',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 24','GENDER_FEMALE','AGE_GROUP_9_10','DISTANCE_25_YARD','DISCIPLINE_FREESTYLE',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 25','GENDER_MALE','AGE_GROUP_9_10','DISTANCE_25_YARD','DISCIPLINE_FREESTYLE',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 26','GENDER_FEMALE','AGE_GROUP_11_12','DISTANCE_50_YARD','DISCIPLINE_FREESTYLE',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 27','GENDER_MALE','AGE_GROUP_11_12','DISTANCE_50_YARD','DISCIPLINE_FREESTYLE',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 28','GENDER_FEMALE','AGE_GROUP_13_14','DISTANCE_50_YARD','DISCIPLINE_FREESTYLE',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 29','GENDER_MALE','AGE_GROUP_13_14','DISTANCE_50_YARD','DISCIPLINE_FREESTYLE',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 30','GENDER_FEMALE','AGE_GROUP_15_UP','DISTANCE_50_YARD','DISCIPLINE_FREESTYLE',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 31','GENDER_MALE','AGE_GROUP_15_UP','DISTANCE_50_YARD','DISCIPLINE_FREESTYLE',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 32','GENDER_FEMALE','AGE_GROUP_6_UNDER','DISTANCE_25_YARD','DISCIPLINE_BACKSTROKE',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 33','GENDER_MALE','AGE_GROUP_6_UNDER','DISTANCE_25_YARD','DISCIPLINE_BACKSTROKE',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 34','GENDER_FEMALE','AGE_GROUP_7_8','DISTANCE_25_YARD','DISCIPLINE_BACKSTROKE',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 35','GENDER_MALE','AGE_GROUP_7_8','DISTANCE_25_YARD','DISCIPLINE_BACKSTROKE',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 36','GENDER_FEMALE','AGE_GROUP_9_10','DISTANCE_25_YARD','DISCIPLINE_BACKSTROKE',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 37','GENDER_MALE','AGE_GROUP_9_10','DISTANCE_25_YARD','DISCIPLINE_BACKSTROKE',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 38','GENDER_FEMALE','AGE_GROUP_11_12','DISTANCE_50_YARD','DISCIPLINE_BACKSTROKE',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 39','GENDER_MALE','AGE_GROUP_11_12','DISTANCE_50_YARD','DISCIPLINE_BACKSTROKE',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 40','GENDER_FEMALE','AGE_GROUP_13_14','DISTANCE_50_YARD','DISCIPLINE_BACKSTROKE',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 41','GENDER_MALE','AGE_GROUP_13_14','DISTANCE_50_YARD','DISCIPLINE_BACKSTROKE',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 42','GENDER_FEMALE','AGE_GROUP_15_UP','DISTANCE_100_YARD','DISCIPLINE_BACKSTROKE',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 43','GENDER_MALE','AGE_GROUP_15_UP','DISTANCE_100_YARD','DISCIPLINE_BACKSTROKE',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 44','GENDER_FEMALE','AGE_GROUP_7_8','DISTANCE_50_YARD','DISCIPLINE_FREESTYLE',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 45','GENDER_MALE','AGE_GROUP_7_8','DISTANCE_50_YARD','DISCIPLINE_FREESTYLE',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 46','GENDER_FEMALE','AGE_GROUP_9_10','DISTANCE_50_YARD','DISCIPLINE_FREESTYLE',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 47','GENDER_MALE','AGE_GROUP_9_10','DISTANCE_50_YARD','DISCIPLINE_FREESTYLE',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 48','GENDER_FEMALE','AGE_GROUP_11_12','DISTANCE_100_YARD','DISCIPLINE_FREESTYLE',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 49','GENDER_MALE','AGE_GROUP_11_12','DISTANCE_100_YARD','DISCIPLINE_FREESTYLE',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 50','GENDER_FEMALE','AGE_GROUP_13_14','DISTANCE_100_YARD','DISCIPLINE_FREESTYLE',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 51','GENDER_MALE','AGE_GROUP_13_14','DISTANCE_100_YARD','DISCIPLINE_FREESTYLE',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 52','GENDER_FEMALE','AGE_GROUP_15_UP','DISTANCE_100_YARD','DISCIPLINE_FREESTYLE',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 53','GENDER_MALE','AGE_GROUP_15_UP','DISTANCE_100_YARD','DISCIPLINE_FREESTYLE',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 54','GENDER_FEMALE','AGE_GROUP_7_8','DISTANCE_25_YARD','DISCIPLINE_BREASTSTROKE',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 55','GENDER_MALE','AGE_GROUP_7_8','DISTANCE_25_YARD','DISCIPLINE_BREASTSTROKE',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 56','GENDER_FEMALE','AGE_GROUP_9_10','DISTANCE_25_YARD','DISCIPLINE_BREASTSTROKE',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 57','GENDER_MALE','AGE_GROUP_9_10','DISTANCE_25_YARD','DISCIPLINE_BREASTSTROKE',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 58','GENDER_FEMALE','AGE_GROUP_11_12','DISTANCE_50_YARD','DISCIPLINE_BREASTSTROKE',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 59','GENDER_MALE','AGE_GROUP_11_12','DISTANCE_50_YARD','DISCIPLINE_BREASTSTROKE',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 60','GENDER_FEMALE','AGE_GROUP_13_14','DISTANCE_50_YARD','DISCIPLINE_BREASTSTROKE',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 61','GENDER_MALE','AGE_GROUP_13_14','DISTANCE_50_YARD','DISCIPLINE_BREASTSTROKE',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 62','GENDER_FEMALE','AGE_GROUP_15_UP','DISTANCE_100_YARD','DISCIPLINE_BREASTSTROKE',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 63','GENDER_MALE','AGE_GROUP_15_UP','DISTANCE_100_YARD','DISCIPLINE_BREASTSTROKE',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 64','GENDER_FEMALE','AGE_GROUP_7_8','DISTANCE_25_YARD','DISCIPLINE_BUTTERFLY',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 65','GENDER_MALE','AGE_GROUP_7_8','DISTANCE_25_YARD','DISCIPLINE_BUTTERFLY',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 66','GENDER_FEMALE','AGE_GROUP_9_10','DISTANCE_25_YARD','DISCIPLINE_BUTTERFLY',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 67','GENDER_MALE','AGE_GROUP_9_10','DISTANCE_25_YARD','DISCIPLINE_BUTTERFLY',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 68','GENDER_FEMALE','AGE_GROUP_11_12','DISTANCE_50_YARD','DISCIPLINE_BUTTERFLY',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 69','GENDER_MALE','AGE_GROUP_11_12','DISTANCE_50_YARD','DISCIPLINE_BUTTERFLY',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 70','GENDER_FEMALE','AGE_GROUP_13_14','DISTANCE_50_YARD','DISCIPLINE_BUTTERFLY',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 71','GENDER_MALE','AGE_GROUP_13_14','DISTANCE_50_YARD','DISCIPLINE_BUTTERFLY',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 72','GENDER_FEMALE','AGE_GROUP_15_UP','DISTANCE_50_YARD','DISCIPLINE_BUTTERFLY',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 73','GENDER_MALE','AGE_GROUP_15_UP','DISTANCE_50_YARD','DISCIPLINE_BUTTERFLY',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 74','GENDER_FEMALE','AGE_GROUP_7_8','DISTANCE_100_YARD','DISCIPLINE_FREESTYLE_RELAY',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 75','GENDER_MALE','AGE_GROUP_7_8','DISTANCE_100_YARD','DISCIPLINE_FREESTYLE_RELAY',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 76','GENDER_FEMALE','AGE_GROUP_9_10','DISTANCE_100_YARD','DISCIPLINE_FREESTYLE_RELAY',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 77','GENDER_MALE','AGE_GROUP_9_10','DISTANCE_100_YARD','DISCIPLINE_FREESTYLE_RELAY',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 78','GENDER_FEMALE','AGE_GROUP_11_12','DISTANCE_200_YARD','DISCIPLINE_FREESTYLE_RELAY',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 79','GENDER_MALE','AGE_GROUP_11_12','DISTANCE_200_YARD','DISCIPLINE_FREESTYLE_RELAY',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 80','GENDER_FEMALE','AGE_GROUP_13_14','DISTANCE_200_YARD','DISCIPLINE_FREESTYLE_RELAY',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 81','GENDER_MALE','AGE_GROUP_13_14','DISTANCE_200_YARD','DISCIPLINE_FREESTYLE_RELAY',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 82','GENDER_FEMALE','AGE_GROUP_15_UP','DISTANCE_200_YARD','DISCIPLINE_FREESTYLE_RELAY',USER,CURRENT_TIMESTAMP),
(getRecordId(),'Event 83','GENDER_MALE','AGE_GROUP_15_UP','DISTANCE_200_YARD','DISCIPLINE_FREESTYLE_RELAY',USER,CURRENT_TIMESTAMP);

--	MEET TABLE data
INSERT INTO meet(id,home,away,day,type,homeScore,awayScore,createdby,createddate)
VALUES(getRecordId(),getTeamId('Gold River'),NULL,'05/05/2019','MEET_TYPE_TIME_TRIALS',829.00,0.00,USER,CURRENT_TIMESTAMP),
(getRecordId(),getTeamId('West Sac'),NULL,'05/11/2019','MEET_TYPE_TIME_TRIALS',829.00,0.00,USER,CURRENT_TIMESTAMP),
(getRecordId(),getTeamId('Del Norte'),NULL,'05/11/2019','MEET_TYPE_TIME_TRIALS',829.00,0.00,USER,CURRENT_TIMESTAMP),
(getRecordId(),getTeamId('Rocklin'),getTeamId('Gold River'),'05/18/2019','MEET_TYPE_DUAL_TEAM',297.00,531.00,USER,CURRENT_TIMESTAMP),
(getRecordId(),getTeamId('Glen Oaks'),getTeamId('Del Norte'),'05/18/2019','MEET_TYPE_DUAL_TEAM',403.00,425.00,USER,CURRENT_TIMESTAMP),
(getRecordId(),getTeamId('Rio Del Oro'),getTeamId('Rollingwood'),'05/18/2019','MEET_TYPE_DUAL_TEAM',526.00,298.00,USER,CURRENT_TIMESTAMP),
(getRecordId(),getTeamId('West Sac'),getTeamId('Arden Hills'),'05/25/2019','MEET_TYPE_DUAL_TEAM',408.50,410.50,USER,CURRENT_TIMESTAMP),
(getRecordId(),getTeamId('West Sac'),getTeamId('Rollingwood'),'06/01/2019','MEET_TYPE_DUAL_TEAM',517.00,309.00,USER,CURRENT_TIMESTAMP),
(getRecordId(),getTeamId('Arden Hills'),getTeamId('Gold River'),'06/01/2019','MEET_TYPE_DUAL_TEAM',442.00,380.00,USER,CURRENT_TIMESTAMP),
(getRecordId(),getTeamId('Del Norte'),getTeamId('Rocklin'),'06/01/2019','MEET_TYPE_DUAL_TEAM',546.00,283.00,USER,CURRENT_TIMESTAMP),
(getRecordId(),getTeamId('Fulton-El Camino'),getTeamId('Del Norte'),'06/08/2019','MEET_TYPE_DUAL_TEAM',317.00,509.00,USER,CURRENT_TIMESTAMP),
(getRecordId(),getTeamId('Rocklin'),getTeamId('West Sac'),'06/08/2019','MEET_TYPE_DUAL_TEAM',220.00,606.00,USER,CURRENT_TIMESTAMP);


--	Returns a collection of constants from the provided TYPE
CREATE OR REPLACE FUNCTION getConstantsByType(IN p_type CHAR(36))
RETURNS SETOF constants
AS $$
SELECT * FROM constants
	WHERE type = p_type
	ORDER BY sequence;
$$
LANGUAGE SQL;

--	Returns a collection of all teams
CREATE OR REPLACE FUNCTION getTeams()
RETURNS TABLE(
	ID CHAR(32), 
	TEAM VARCHAR(50), 
	MASCOT VARCHAR(20), 
	ABBR VARCHAR(10), 
	CITY VARCHAR(30), 
	CONFERENCE VARCHAR(30))
AS $$
	SELECT t.id AS ID, 
		t.team AS TEAM, 
		t.mascot AS MASCOT, 
		t.abbr AS ABBR, 
		t.city AS CITY, 
		c.value AS CONFERENCE
	FROM team t 
	INNER JOIN constants c ON t.conference = c.id
	ORDER BY c.sequence, t.team;
$$
LANGUAGE SQL;

CREATE OR REPLACE FUNCTION getTeamsByConference(IN p_conference CHAR(64))
RETURNS TABLE(ID CHAR(32), TEAM VARCHAR(20), MASCOT VARCHAR(20), ABBR VARCHAR(5), CITY VARCHAR(20), CONFERENCE VARCHAR(20))
AS $$
SELECT t.id AS ID,
	t.team AS TEAM,
	t.mascot AS MASCOT,
	t.abbr AS ABBR,
	t.city AS CITY,
	c.value AS CONFERENCE
FROM team t
INNER JOIN constants c ON t.conference = c.id
WHERE t.conference = p_conference
ORDER BY t.team;
$$
LANGUAGE SQL;

--	Returns a collection of ALL events
CREATE OR REPLACE FUNCTION getEvents()
RETURNS TABLE(
	ID CHAR(36), 
	EVENT VARCHAR(20), 
	GENDER VARCHAR(20), 
	AGEGROUP VARCHAR(20), 
	DISTANCE VARCHAR(20), 
	DISCIPLINE VARCHAR(20))
AS $$
	SELECT e.id as ID, 
		e.event as EVENT, 
		g.value as GENDER, 
		ag.value as AGEGROUP, 
		ds.value as DISTANCE, 
		dc.value as DISCIPLINE
	FROM event e 
	INNER JOIN constants g ON e.gender = g.id
	INNER JOIN constants ag ON e.agegroup = ag.id
	INNER JOIN constants ds ON e.distance = ds.id
	INNER JOIN constants dc ON e.discipline = dc.id
	ORDER BY e.id; 
$$
LANGUAGE SQL;

--	Returns a schedule of meets
CREATE OR REPLACE FUNCTION getReadableMeets()
RETURNS TABLE(
	ID CHAR(32), 
	AWAYTEAM VARCHAR(20), 
	AT CHAR(4), 
	HOMETEAM VARCHAR(20),
	DAY VARCHAR(10))
AS $$
	SELECT m.id AS ID, 
		a.team AS AWAYTEAM, 
		' at ' AS AT, 
		h.team AS HOMETEAM, 
		m.day AS DAY
	FROM meet m 
	INNER JOIN team a ON m.away = a.id
	INNER JOIN team h ON m.home = h.id
	ORDER BY m.day;
$$
LANGUAGE SQL;

--	Returns a schedule of meets with scores for already completed meets.
DROP FUNCTION IF EXISTS getReadableMeetsScores;
CREATE OR REPLACE FUNCTION getReadableMeetsScores()
RETURNS TABLE(
	ID CHAR(32), 
	AWAYTEAM VARCHAR(20), 
	AWAYSCORE real, 
	AT CHAR(4), 
	HOMETEAM VARCHAR(20), 
	HOMESCORE real, day VARCHAR(10))
AS $$
	SELECT m.id AS ID, 
		a.team AS AWAYTEAM, 
		awayScore AS AWAYSCORE, 
		' at ' AS AT, 
		h.team AS HOMETEAM, 
		homeScore AS HOMESCORE, 
		m.day AS DAY
	FROM meet m 
	INNER JOIN team a ON m.away = a.id
	INNER JOIN team h ON m.home = h.id
	ORDER BY m.day;
$$
LANGUAGE SQL;

--	Returns a schedule of meets with scores for already completed meets.
DROP FUNCTION IF EXISTS getMeetsMarginOfVictory;
CREATE OR REPLACE FUNCTION getMeetsMarginOfVictory()
RETURNS TABLE(
	ID CHAR(32), 
	AWAYTEAM VARCHAR(20), 
	AWAYSCORE real, 
	AT CHAR(4), 
	HOMETEAM VARCHAR(20), 
	HOMESCORE real, 
	day VARCHAR(10),
	MARGIN real)
AS $$
	SELECT m.id AS ID, 
		a.team AS AWAYTEAM, 
		awayScore AS AWAYSCORE, 
		' at ' AS AT, 
		h.team AS HOMETEAM, 
		homeScore AS HOMESCORE, 
		m.day AS DAY,
		ABS(awayScore - homeScore) AS MARGIN
	FROM meet m 
	INNER JOIN team a ON m.away = a.id
	INNER JOIN team h ON m.home = h.id
	ORDER BY MARGIN desc, m.day;
$$
LANGUAGE SQL;

DROP FUNCTION IF EXISTS getMeets;
CREATE OR REPLACE FUNCTION getMeets()
RETURNS TABLE(
	ID CHAR(32), 
	HOMEID CHAR(32), 
	AWAYID CHAR(32), 
	DAY VARCHAR(10), 
	TYPE CHAR(64), 
	HOME VARCHAR(20), 
	AWAY VARCHAR(20))
AS $$
	SELECT m.id AS ID, 
		m.home AS HOMEID, 
		m.away AS AWAYID, 
		m.day AS DAY, 
		m.type AS TYPE, 
		tHome.team AS HOME, 
		tAway.team AS AWAY
	FROM meet m INNER JOIN team tHome ON m.home = tHome.id
	INNER JOIN team tAway ON m.away = tAway.id
	UNION
	SELECT mm.id AS ID, 
		mm.home AS HOMEID, 
		mm.type AS AWAYID, 
		mm.day AS DAY, 
		mm.type AS TYPE,
		tHome.team AS HOME, 
		c.value AS AWAY
	FROM meet mm INNER JOIN team tHome ON mm.home = tHome.id
	INNER JOIN constants c ON mm.type = c.id
	WHERE mm.away IS NULL
	ORDER BY DAY;
$$
LANGUAGE SQL;

CREATE OR REPLACE FUNCTION getSwimmersFromTeams(IN p_meetId CHAR(32))
RETURNS SETOF swimmer
AS $$
	SELECT s.* FROM swimmer s
	INNER JOIN meet m ON m.away = s.team OR m.home = s.team
	WHERE m.id = p_meetId
	ORDER BY s.team, s.lastname;
$$
LANGUAGE SQL;

CREATE OR REPLACE FUNCTION getAgeGroup(IN p_age INT)
RETURNS CHAR(36)
AS $$
DECLARE
	cAgeGroup CHAR(64);
BEGIN
	IF p_age BETWEEN 6 AND 15 THEN
		SELECT id INTO cAgeGroup 
		FROM constants 
		WHERE id LIKE CONCAT('%',p_age,'%');
	ELSE
		IF p_age <= 6 THEN
			SELECT id INTO cAgeGroup 
			FROM constants 
			WHERE id LIKE CONCAT('%',6,'%');
		ELSE
			SELECT id INTO cAgeGroup 
			FROM constants 
			WHERE id LIKE CONCAT('%',15,'%');
		END IF;
	END IF;

	RETURN cAgeGroup;
END; $$
LANGUAGE PLPGSQL;

CREATE OR REPLACE FUNCTION insertSwimmer(
	IN p_first VARCHAR(20), 
	IN p_last VARCHAR(20), 
	IN p_team CHAR(36), 
	IN p_age INT, 
	IN p_gender CHAR(64))
RETURNS CHAR(36)
AS $$
DECLARE
	cSwimmerId CHAR(32);
	cAgeGroup CHAR(64);
BEGIN
	cSwimmerId := getRecordId();
	cAgeGroup := getAgeGroup(p_age);

	INSERT INTO swimmer(id, firstname, lastname, team, age, agegroup, gender, createdby, createddate)
	VALUES (cSwimmerId, p_first, p_last, p_team, p_age, cAgeGroup, p_gender, USER, CURRENT_TIMESTAMP);

	RETURN cSwimmerId;
END; $$
LANGUAGE PLPGSQL;

CREATE OR REPLACE FUNCTION getSwimmerId(
	IN p_name VARCHAR(40), 
	IN p_team VARCHAR(30), 
	IN p_age INT, 
	IN p_gender CHAR(64))
RETURNS CHAR(32)
AS $$
DECLARE 
	cSwimmerId CHAR(32);
	cFirst VARCHAR(20);
	cLast VARCHAR(20);
	cTeam CHAR(32);
BEGIN
	cFirst := split_part(p_name, ' ', 1);
	cLast := split_part(p_name, ' ', 2);
	cTeam := getTeamId(p_team);
	
	SELECT id INTO cSwimmerId 
	FROM swimmer 
	WHERE firstname = cFirst 
	AND lastname = cLast 
	AND team = cTeam;

	IF cSwimmerId IS NULL THEN
		cSwimmerId := insertSwimmer(cFirst, cLast, cTeam, p_age, p_gender);
	END IF;

	RETURN cSwimmerId;
END; $$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION getConstantFromValue(IN p_value VARCHAR(30))
RETURNS CHAR(64)
AS $$
DECLARE
	cConstantId CHAR(64);
BEGIN
	SELECT id INTO cConstantId 
	FROM constants
	WHERE value LIKE CONCAT('%',p_value,'%');
	RETURN cConstantId;
END; $$
LANGUAGE plpgsql;

--	Insert MEET functions
--	Insert meet with no score and using names instead of IDs
CREATE OR REPLACE FUNCTION insertMeet(
	IN p_home VARCHAR(30), 
	IN p_away VARCHAR(30), 
	IN p_day VARCHAR(10), 
	IN p_type VARCHAR(30))
RETURNS CHAR(32)
AS $$
DECLARE
	cHomeId CHAR(32);
	cAwayId CHAR(32);
	cMeetTypeId CHAR(64);
	cRecId CHAR(32);
BEGIN
	cHomeId := getTeamId(p_home);
	cAwayId := getTeamId(p_away);
	cMeetTypeId := getConstantFromValue(p_type);
	cRecId := getRecordId();
	INSERT INTO meet (id, home, away, day, type, homescore, awayscore, createdBy, createdDate)
	VALUES (cRecId, cHomeId, cAwayId, p_day, cMeetTypeId, 0.00, 0.00, USER, CURRENT_TIMESTAMP);
	RETURN cRecId;
END; $$
LANGUAGE PLPGSQL;


--	Insert meet with scores and using names instead of IDs
CREATE OR REPLACE FUNCTION insertMeetScore(
	IN p_home VARCHAR(30), 
	IN p_away VARCHAR(30), 
	IN p_day VARCHAR(10), 
	IN p_type VARCHAR(30), 
	IN p_homeScore FLOAT, 
	IN p_awayScore FLOAT)
RETURNS CHAR(32)
AS $$
DECLARE
	cHomeId CHAR(32);
	cAwayId CHAR(32);
	cMeetTypeId CHAR(64);
	cRecId CHAR(32);
BEGIN
	cHomeId := getTeamId(p_home);
	cAwayId := getTeamId(p_away);
	cMeetTypeId := getConstantFromValue(p_type);
	cRecId := getRecordId();
	INSERT INTO meet (id, home, away, day, type, homescore, awayscore, createdBy, createdDate)
	VALUES (cRecId, cHomeId, cAwayId, p_day, cMeetTypeId, p_homeScore, p_awayScore, USER, CURRENT_TIMESTAMP);
	RETURN cRecId;
END; $$
LANGUAGE PLPGSQL;

--	Insert meet providing IDs and no score
CREATE OR REPLACE FUNCTION insertMeetIds(
	IN p_home CHAR(32), 
	IN p_away CHAR(32), 
	IN p_day VARCHAR(10), 
	IN p_type VARCHAR(64))
RETURNS CHAR(32)
AS $$
DECLARE
	cRecId CHAR(32);
BEGIN
	cRecId := getRecordId();
	INSERT INTO meet (id, home, away, day, type, homescore, awayscore, createdBy, createdDate)
	VALUES (cRecId, p_home, p_away, p_day, p_type, 0.00, 0.00, USER, CURRENT_TIMESTAMP);
	RETURN cRecId;
END; $$
LANGUAGE PLPGSQL;

--	Insert meet providing IDs AND scores
CREATE OR REPLACE FUNCTION insertMeetIdsScore(
	IN p_home CHAR(32), 
	IN p_away CHAR(32), 
	IN p_day VARCHAR(10), 
	IN p_type VARCHAR(64), 
	IN p_homeScore FLOAT, 
	IN p_awayScore FLOAT)
RETURNS CHAR(32)
AS $$
DECLARE
	cRecId CHAR(32);
BEGIN
	cRecId := getRecordId();
	INSERT INTO meet (id, home, away, day, type, homescore, awayscore, createdBy, createdDate)
	VALUES (cRecId, p_home, p_away, p_day, p_type, p_homeScore, p_awayScore, USER, CURRENT_TIMESTAMP);
	RETURN cRecId;
END; $$
LANGUAGE PLPGSQL;














































--	Retrieve non-conference meets
CREATE OR REPLACE FUNCTION getNonConferenceMeets()
RETURNS TABLE(id CHAR(32), 
	visitor VARCHAR(20), 
	vScore REAL, 
	home VARCHAR(20), 
	hScore REAL, 
	day VARCHAR(10))
AS $$
	SELECT m.id AS id,
		v.team AS visitor,
		m.awayScore AS vScore,
		h.team AS home,
		m.homeScore AS hScore,
		m.day AS day
	FROM meet m
	INNER JOIN team AS v ON m.away = v.id
	INNER JOIN team AS h ON m.home = h.id
	WHERE v.conference != h.conference
	ORDER BY m.day;
$$
LANGUAGE SQL;

--	Retrieve team meets for a provided team
CREATE OR REPLACE FUNCTION getMeetsByTeam(IN p_team VARCHAR(20))
RETURNS TABLE(id CHAR(32), 
	visitor VARCHAR(20), 
	vScore REAL, 
	home VARCHAR(20), 
	hScore REAL, 
	day VARCHAR(10))
AS $$
	SELECT m.id AS id,
		v.team AS visitor,
		m.awayScore AS vScore,
		h.team AS home,
		m.homeScore AS hScore,
		m.day AS day
	FROM meet m
	INNER JOIN team AS v ON m.away = v.id
	INNER JOIN team AS h ON m.home = h.id
	WHERE v.id = getTeamId(p_team)
	OR h.id = getTeamId(p_team)
	ORDER BY m.day;
$$
LANGUAGE SQL;


--	Retrieve conference meets for a provided conference
CREATE OR REPLACE FUNCTION getMeetsByConference(IN p_conference VARCHAR(20))
RETURNS TABLE(id CHAR(32), 
	visitor VARCHAR(20), 
	vScore REAL, 
	home VARCHAR(20), 
	hScore REAL, 
	day VARCHAR(10))
AS $$
	SELECT m.id AS id,
		v.team AS visitor,
		m.awayScore AS vScore,
		h.team AS home,
		m.homeScore AS hScore,
		m.day AS day
	FROM meet m
	INNER JOIN team AS v ON m.away = v.id
	INNER JOIN team AS h ON m.home = h.id
	WHERE v.conference = getConstantByValue(p_conference)
	AND h.conference = getConstantByValue(p_conference)
	ORDER BY m.day;
$$
LANGUAGE SQL;

--	Retrieve conference meets for a provided conference
CREATE OR REPLACE FUNCTION getMeetsByConferenceName(IN p_conference VARCHAR(20))
RETURNS TABLE(id CHAR(32), 
	visitor VARCHAR(20), 
	vScore REAL, 
	home VARCHAR(20), 
	hScore REAL, 
	day VARCHAR(10))
AS $$
	SELECT m.id AS id,
		v.team AS visitor,
		m.awayScore AS vScore,
		h.team AS home,
		m.homeScore AS hScore,
		m.day AS day
	FROM meet m
	INNER JOIN team AS v ON m.away = v.id
	INNER JOIN team AS h ON m.home = h.id
	WHERE v.conference = CONCAT('CONF_',p_conference)
	AND h.conference = CONCAT('CONF_',p_conference)
	ORDER BY m.day;
$$
LANGUAGE SQL;

CREATE OR REPLACE FUNCTION getConstants()
RETURNS SETOF constants
AS $$
	SELECT * FROM constants
	ORDER BY type, sequence;
$$
LANGUAGE SQL;


--	#######################################################################################################################	--
DROP FUNCTION IF EXISTS getSeasonPointsFor;
CREATE OR REPLACE FUNCTION getSeasonPointsFor(IN p_team VARCHAR(20))
RETURNS TABLE(HOMEFOR VARCHAR(6), HOMEAGAINST VARCHAR(6), AWAYFOR VARCHAR(6), AWAYAGAINST VARCHAR(6)) 
AS $$
DECLARE
	HOMEFOR VARCHAR(6);
	HOMEAGAINST VARCHAR(6); 
	AWAYFOR VARCHAR(6); 
	AWAYAGAINST VARCHAR(6); 
	TOTALFOR VARCHAR(6); 
	TOTALAGAINST VARCHAR(6);
BEGIN
	SELECT SUM(homeScore) INTO HOMEFOR FROM meet WHERE home = getTeamId('West Sac') AND away IS NOT NULL;
	SELECT SUM(awayScore) INTO HOMEAGAINST FROM meet WHERE home = getTeamId('West Sac') AND away IS NOT NULL;
	SELECT SUM(awayScore) INTO AWAYFOR FROM meet WHERE away = getTeamId('West Sac');
	SELECT SUM(homeScore) INTO AWAYAGAINST FROM meet WHERE away = getTeamId('West Sac');
	RETURN QUERY SELECT(HOMEFOR, HOMEAGAINST, AWAYFOR, AWAYAGAINST);
END; $$
LANGUAGE PLPGSQL;	

select getSeasonPointsFor('West Sac');
--	#######################################################################################################################	--


CREATE OR REPLACE FUNCTION getPoints(IN p_team VARCHAR(20))
RETURNS TABLE(HOMEFOR REAL, HOMEAGAINST REAL, AWAYFOR REAL, AWAYAGAINST REAL, TOTALFOR REAL, TOTALAGAINST REAL)
AS $$
DECLARE
	ttlFor REAL;
	ttlAgainst REAL;
BEGIN
	ttlFor := (getHomePointsFor(p_team) + getAwayPointsFor(p_team));
	ttlAgainst := (getHomePointsAgainst(p_team) + getAwayPointsAgainst(p_team));
	RETURN QUERY SELECT getHomePointsFor(p_team) AS HOMEFOR,
		getHomePOintsAgainst(p_team) AS HOMEAGAINST,
		getAwayPointsFor(p_team) AS AWAYFOR,
		getAwayPointsAgainst(p_team) AS AWAYAGAINST,
		ttlFor AS TOTALFOR,
		ttlAgainst AS TOTALAGAINST;
END; $$
LANGUAGE PLPGSQL;

CREATE OR REPLACE FUNCTION getHomePointsFor(IN p_team VARCHAR(20))
RETURNS REAL
AS $$
DECLARE
	points REAL;
BEGIN
	SELECT SUM(homeScore) INTO points FROM meet WHERE home = getTeamId(p_team) AND away IS NOT NULL;
	
	IF points IS NULL THEN
	points := 0;
	END IF;

	RETURN points;
END; $$
LANGUAGE PLPGSQL;

CREATE OR REPLACE FUNCTION getHomePointsAgainst(IN p_team VARCHAR(20))
RETURNS REAL
AS $$
DECLARE
	points REAL;
BEGIN
	SELECT SUM(awayScore) INTO points FROM meet WHERE home = getTeamId(p_team) AND away IS NOT NULL;
	
	IF points IS NULL THEN
	points := 0;
	END IF;

	RETURN points;
END; $$
LANGUAGE PLPGSQL;

CREATE OR REPLACE FUNCTION getAwayPointsFor(IN p_team VARCHAR(20))
RETURNS REAL
AS $$
DECLARE
	points REAL;
BEGIN
	SELECT SUM(awayScore) INTO points FROM meet WHERE away = getTeamId(p_team);
	
	IF points IS NULL THEN
	points := 0;
	END IF;

	RETURN points;
END; $$
LANGUAGE PLPGSQL;

CREATE OR REPLACE FUNCTION getAwayPointsAgainst(IN p_team VARCHAR(20))
RETURNS REAL
AS $$
DECLARE
	points REAL;
BEGIN
	SELECT SUM(homeScore) INTO points FROM meet WHERE away = getTeamId(p_team);
	
	IF points IS NULL THEN
	points := 0;
	END IF;

	RETURN points;
END; $$
LANGUAGE PLPGSQL;


CREATE OR REPLACE FUNCTION getTeamWinsLosses(IN p_team VARCHAR(20))
RETURNS TABLE(ID CHAR(32), TEAM VARCHAR(20), WINS INT, LOSSES INT)
AS $$
DECLARE
	ID CHAR(32);
	TEAM VARCHAR(20) := p_team;
	W INT;
	L INT;
BEGIN
	ID := getTeamId(p_team);
	W := getTeamWins(p_team);
	L := getTeamLosses(p_team);
	RETURN QUERY SELECT getTeamId(p_team) AS ID, 
		p_team AS TEAM, 
		W AS WINS, 
		L AS LOSSES;
END; $$
LANGUAGE PLPGSQL;


CREATE OR REPLACE FUNCTION getAllData(IN p_team VARCHAR(20))
RETURNS TABLE(id char(32), team varchar(20), wins int, losses int, homefor real, homeagainst real, awayfor real, awayagainst real, totalfor real, totalagainst real)
AS $$
	SELECT * FROM getTeamWinsLosses(p_team) , getPoints(p_team);
$$
LANGUAGE SQL;

CREATE OR REPLACE FUNCTION getAllDataByConference(IN p_conference VARCHAR(64))
RETURNS TABLE(conf varchar(20), id char(32), team varchar(20), wins int, losses int, homefor real, homeagainst real, awayfor real, awayagainst real, totalfor real, totalagainst real)
AS $$
	SELECT conf.value, (getTeamWinsLosses(t.team)).*, (getPoints(t.team)).* FROM team t INNER JOIN constants conf on t.conference = conf.id where conf.id = p_conference;
$$
LANGUAGE SQL;

CREATE OR REPLACE FUNCTION getConstantByValue(IN p_constantValue VARCHAR(255))
RETURNS CHAR(64)
AS $$
DECLARE
	constantId CHAR(64);
BEGIN
	SELECT id INTO constantId
	FROM constants WHERE value LIKE CONCAT('%',p_constantValue,'%');
	RETURN constantId;
END; $$
LANGUAGE PLPGSQL;

CREATE OR REPLACE FUNCTION wholeConfEnchillada(IN p_conference VARCHAR(20))
RETURNS TABLE(conference VARCHAR(20), 
	team VARCHAR(20), 
	wins INT, 
	losses INT, 
	cwins INT, 
	closses INT, 
	chomefor real, 
	chomeagainst real, 
	cawayfor real, 
	cawayagainst real, 
	cttlfor real, 
	cttlagainst real, 
	homefor real, 
	homeagainst real, 
	awayfor real, 
	awayagainst real, 
	totalfor real, 
	totalagainst real)
AS $$
	SELECT conf.value AS CONFERENCE, 
		t.team AS TEAM, 
		getTeamWins(t.team) AS WINS, 
		getTeamLosses(t.team) AS LOSSES, 
		getTeamConferenceWins(t.team) AS CONFWINS, 
		getTeamConferenceLosses(t.team) AS CONFLOSSES, 
		(getConfPoints(t.team)).*, 
		(getPoints(t.team)).*
	FROM team t INNER JOIN constants conf on t.conference = conf.id
	WHERE conf.id = getConstantByValue(p_conference)
	ORDER BY conf.sequence, CONFWINS desc, WINS desc;
$$
LANGUAGE SQL;


CREATE OR REPLACE FUNCTION wholeEnchillada()
RETURNS TABLE(conference VARCHAR(20), 
	team VARCHAR(20), 
	wins INT, 
	losses INT, 
	cwins INT, 
	closses INT, 
	chomefor real, 
	chomeagainst real, 
	cawayfor real, 
	cawayagainst real, 
	cttlfor real, 
	cttlagainst real, 
	homefor real, 
	homeagainst real, 
	awayfor real, 
	awayagainst real, 
	totalfor real, 
	totalagainst real)
AS $$
	SELECT conf.value AS CONFERENCE, 
		t.team AS TEAM, 
		getTeamWins(t.team) AS WINS, 
		getTeamLosses(t.team) AS LOSSES, 
		getTeamConferenceWins(t.team) AS CONFWINS, 
		getTeamConferenceLosses(t.team) AS CONFLOSSES, 
		(getConfPoints(t.team)).*, 
		(getPoints(t.team)).*
	FROM team t INNER JOIN constants conf on t.conference = conf.id
	ORDER BY conf.sequence, CONFWINS desc, WINS desc;
$$
LANGUAGE SQL;

CREATE OR REPLACE FUNCTION wholeSheBang()
RETURNS TABLE(CONFERENCE VARCHAR(20), TEAM VARCHAR(20), OVERALLWINS INT, OVERALLLOSSES INT, CONFWINS INT, CONFLOSSES INT)
AS $$
	SELECT conf.value AS CONFERENCE,
		t.team AS TEAM,
		getTeamWins(t.team) AS OVERALLWINS,
		getTeamLosses(t.team) AS OVERALLLOSSES,
		getTeamConferenceWins(t.team) AS CONFWINS,
		getTeamConferenceLosses(t.team) AS CONFLOSSES
	FROM team t INNER JOIN constants conf ON t.conference = conf.id
	ORDER BY conf.sequence, CONFWINS desc, OVERALLWINS desc, OVERALLLOSSES asc, CONFLOSSES asc;
$$
LANGUAGE SQL;


CREATE OR REPLACE FUNCTION getOverallWinsLossesConference(IN p_conference CHAR(64))
RETURNS TABLE(TEAM VARCHAR(20), CONFWINS INT, CONFLOSSES INT, OVERALLWINS INT, OVERALLLOSSES INT)
AS $$
	SELECT t.team AS TEAM,
		getTeamConferenceWins(t.team) AS CONFWINS,
		getTeamConferenceLosses(t.team) AS CONFLOSSES,
		getTeamWins(t.team) AS OVERALLWINS,
		getTeamLosses(t.team) AS OVERALLLOSSES
	FROM team t INNER JOIN constants conf ON t.conference = conf.id
	WHERE conf.id = p_conference
	ORDER BY OVERALLWINS desc, CONFWINS desc, OVERALLLOSSES asc, CONFLOSSES asc;
$$
LANGUAGE SQL;

CREATE OR REPLACE FUNCTION getOverallWinsLossesTeam(IN p_team VARCHAR(20))
RETURNS TABLE(TEAM VARCHAR(20), CONFWINS INT, CONFLOSSES INT, OVERALLWINS INT, OVERALLLOSSES INT)
AS $$
	SELECT p_team AS TEAM,
		getTeamConferenceWins(p_team) AS CONFWINS,
		getTeamConferenceLosses(p_team) AS CONFLOSSES,
		getTeamWins(p_team) AS OVERALLWINS,
		getTeamLosses(p_team) AS OVERALLLOSSES;
$$
LANGUAGE SQL;

CREATE OR REPLACE FUNCTION getTeamWins(IN p_team VARCHAR(20))
RETURNS INT
AS $$
DECLARE 
	home_wins INT;
	road_wins INT;
BEGIN
	SELECT COUNT(*) INTO home_wins FROM meet m 
	WHERE m.home = getTeamId(p_team) 
	AND m.homeScore > m.awayScore
	AND m.away IS NOT NULL;
	SELECT COUNT(*) INTO road_wins FROM meet m
	WHERE m.away = getTeamId(p_team)
	AND m.awayScore > m.homeScore;
	RETURN (home_wins + road_wins);
END; $$
LANGUAGE PLPGSQL;

CREATE OR REPLACE FUNCTION getTeamLosses(IN p_team VARCHAR(20))
RETURNS INT
AS $$
DECLARE 
	home_losses INT;
	road_losses INT;
BEGIN
	SELECT COUNT(*) INTO home_losses FROM meet m 
	WHERE m.home = getTeamId(p_team) 
	AND m.homeScore < m.awayScore;
	SELECT COUNT(*) INTO road_losses FROM meet m
	WHERE m.away = getTeamId(p_team)
	AND m.awayScore < m.homeScore;
	RETURN (home_losses + road_losses);
END; $$
LANGUAGE PLPGSQL;

CREATE OR REPLACE FUNCTION getTeamConferenceWins(IN p_team VARCHAR(20))
RETURNS INT
AS $$
DECLARE
	wins INT;
BEGIN
	wins := (countCOnferenceHomeWins(p_team) + countConferenceRoadWins(p_team));
	RETURN wins;
END; $$
LANGUAGE PLPGSQL;

CREATE OR REPLACE FUNCTION getTeamConferenceLosses(IN p_team VARCHAR(20))
RETURNS INT
AS $$
DECLARE
	losses INT;
BEGIN
	losses := (countCOnferenceHomeLosses(p_team) + countConferenceRoadLosses(p_team));
	RETURN losses;
END; $$
LANGUAGE PLPGSQL;


CREATE OR REPLACE FUNCTION getConferenceWinsLosses(IN p_conf CHAR(64))
RETURNS TABLE(ID CHAR(32), TEAM VARCHAR(20), WINS INT, LOSSES INT)
AS $$
	SELECT t.id as ID,
		t.team AS TEAM,
		(countConferenceHomeWins(t.team) + countConferenceRoadWins(t.team)) AS WINS,
		(countConferenceHomeLosses(t.team) + countConferenceRoadLosses(t.team)) AS LOSSES
	FROM team t INNER JOIN constants conf on t.conference = conf.id
	WHERE conf.id = p_conf
	ORDER BY 3 desc, 4 asc;
$$
LANGUAGE SQL;

CREATE OR REPLACE FUNCTION getTeamConferenceWinsLosses(IN p_team VARCHAR(20))
RETURNS TABLE(ID CHAR(32), TEAM VARCHAR(20), WINS INT, LOSSES INT)
AS $$
DECLARE
	ID CHAR(32);
	TEAM VARCHAR(20) := p_team;
	CONF_W INT;
	CONF_L INT;
BEGIN
	ID := getTeamId(p_team);
	CONF_W := (countConferenceHomeWins(p_team) + countConferenceRoadWins(p_team));
	CONF_L := (countConferenceHomeLosses(p_team) + countConferenceRoadLosses(p_team));
	RETURN QUERY SELECT getTeamId(p_team) AS ID, 
		p_team AS TEAM, 
		CONF_W AS WINS, 
		CONF_L AS LOSSES;
END; $$
LANGUAGE PLPGSQL;

--	Returns a count of home conference wins
CREATE OR REPLACE FUNCTION countConferenceHomeWins(IN p_team VARCHAR(20))
RETURNS INT
AS $$
DECLARE 
	home_wins INT;
BEGIN
	SELECT COUNT(*) INTO home_wins FROM meet m 
	WHERE (isConferenceMatch(m.home,m.away) = 1) 
	AND (m.home = getTeamId(p_team) 
	AND m.homeScore > m.awayScore);
	RETURN home_wins;
END; $$
LANGUAGE PLPGSQL;

--	Returns a count of road conference wins
CREATE OR REPLACE FUNCTION countConferenceRoadWins(IN p_team VARCHAR(20))
RETURNS INT
AS $$
DECLARE
	road_wins INT;
BEGIN
	SELECT COUNT(*) INTO road_wins FROM meet m 
	WHERE (isConferenceMatch(m.home,m.away) = 1) 
	AND (m.away = getTeamId(p_team) 
	AND awayScore > homeScore);
	RETURN road_wins;
END; $$
LANGUAGE PLPGSQL;

--	Returns a count of home conference losses
CREATE OR REPLACE FUNCTION countConferenceHomeLosses(IN p_team VARCHAR(20))
RETURNS INT
AS $$
DECLARE 
	home_losses INT;
BEGIN
	SELECT COUNT(*) INTO home_losses FROM meet m 
	WHERE (isConferenceMatch(m.home,m.away) = 1) 
	AND (m.home = getTeamId(p_team) 
	AND m.homeScore < m.awayScore);
	RETURN home_losses;
END; $$
LANGUAGE PLPGSQL;

--	Returns a count of road conference losses
CREATE OR REPLACE FUNCTION countConferenceRoadLosses(IN p_team VARCHAR(20))
RETURNS INT
AS $$
DECLARE
	road_losses INT;
BEGIN
	SELECT COUNT(*) INTO road_losses FROM meet m 
	WHERE (isConferenceMatch(m.home,m.away) = 1) 
	AND (m.away = getTeamId(p_team) 
	AND awayScore < homeScore);
	RETURN road_losses;
END; $$
LANGUAGE PLPGSQL;

CREATE OR REPLACE FUNCTION isConferenceMatch(IN p_homeId CHAR(32), IN p_awayId CHAR(32))
RETURNS INT
AS $$
DECLARE
	homeConf CHAR(32);
	awayConf CHAR(32);
	returnValue INT;
BEGIN
	SELECT conference INTO homeConf FROM team WHERE id = p_homeId;
	SELECT conference INTO awayConf FROM team WHERE id = p_awayId;
	IF ( homeConf = awayConf ) THEN
		returnValue := 1;
	ELSE
		returnValue := 0;
	END IF;
	RETURN returnValue;
END; $$
LANGUAGE PLPGSQL;




CREATE OR REPLACE FUNCTION getConfData(IN p_team VARCHAR(20))
RETURNS TABLE(id char(32), team varchar(20), wins int, losses int, homefor real, homeagainst real, awayfor real, awayagainst real, totalfor real, totalagainst real)
AS $$
	SELECT * FROM getTeamConferenceWinsLosses(p_team) , getConfPoints(p_team);
$$
LANGUAGE SQL;


CREATE OR REPLACE FUNCTION getConfHomePointsFor(IN p_team VARCHAR(20))
RETURNS REAL
AS $$
DECLARE
	points REAL;
BEGIN
	SELECT SUM(homeScore) INTO points 
	FROM meet 
	WHERE (isConferenceMatch(home,away) = 1) 
	AND home = getTeamId(p_team) 
	AND away IS NOT NULL;
	
	IF points IS NULL THEN
	points := 0;
	END IF;
	RETURN points;
END; $$
LANGUAGE PLPGSQL;

CREATE OR REPLACE FUNCTION getConfHomePointsAgainst(IN p_team VARCHAR(20))
RETURNS REAL
AS $$
DECLARE
	points REAL;
BEGIN
	SELECT SUM(awayScore) INTO points 
	FROM meet 
	WHERE (isConferenceMatch(home,away) = 1)
	AND home = getTeamId(p_team) 
	AND away IS NOT NULL;
	
	IF points IS NULL THEN
	points := 0;
	END IF;
	RETURN points;
END; $$
LANGUAGE PLPGSQL;

CREATE OR REPLACE FUNCTION getConfAwayPointsFor(IN p_team VARCHAR(20))
RETURNS REAL
AS $$
DECLARE
	points REAL;
BEGIN
	SELECT SUM(awayScore) INTO points 
	FROM meet 
	WHERE (isConferenceMatch(away,home)  = 1)
	AND away IS NOT NULL
	AND away = getTeamId(p_team);
	
	IF points IS NULL THEN
	points := 0;
	END IF;
	RETURN points;
END; $$
LANGUAGE PLPGSQL;

CREATE OR REPLACE FUNCTION getConfAwayPointsAgainst(IN p_team VARCHAR(20))
RETURNS REAL
AS $$
DECLARE
	points REAL;
BEGIN
	SELECT SUM(homeScore) INTO points 
	FROM meet 
	WHERE (isConferenceMatch(away,home) = 1)
	AND away IS NOT NULL
	AND away = getTeamId(p_team);
	
	IF points IS NULL THEN
	points := 0;
	END IF;
	RETURN points;
END; $$
LANGUAGE PLPGSQL;

CREATE OR REPLACE FUNCTION getConfPoints(IN p_team VARCHAR(20))
RETURNS TABLE(HOMEFOR REAL, HOMEAGAINST REAL, AWAYFOR REAL, AWAYAGAINST REAL, TOTALFOR REAL, TOTALAGAINST REAL)
AS $$
DECLARE
	ttlFor REAL;
	ttlAgainst REAL;
BEGIN
	ttlFor := (getConfHomePointsFor(p_team) + getConfAwayPointsFor(p_team));
	ttlAgainst := (getConfHomePointsAgainst(p_team) + getConfAwayPointsAgainst(p_team));
	RETURN QUERY SELECT getConfHomePointsFor(p_team) AS HOMEFOR,
		getConfHomePointsAgainst(p_team) AS HOMEAGAINST,
		getConfAwayPointsFor(p_team) AS AWAYFOR,
		getConfAwayPointsAgainst(p_team) AS AWAYAGAINST,
		ttlFor AS TOTALFOR,
		ttlAgainst AS TOTALAGAINST;
END; $$
LANGUAGE PLPGSQL;
