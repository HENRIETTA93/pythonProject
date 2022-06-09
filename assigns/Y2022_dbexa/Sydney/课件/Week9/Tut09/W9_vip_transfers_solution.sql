BEGIN;
DROP TABLE IF EXISTS VipTransfers;

CREATE TABLE VipTransfers (
	destination VARCHAR(20),
	departs		DATE,
	airline		VARCHAR(20),
	gate		INTEGER,
	name		VARCHAR(30),
	contact		VARCHAR(10),
	pickup		INTEGER
);

INSERT INTO VipTransfers VALUES ('Berlin',TO_DATE('11:25 01/06/2012', 'HH24:MI DD/MM/YYYY'),'Lufthansa',3,'Justin Thyme','0413456789',1);
INSERT INTO VipTransfers VALUES ('Madrid',TO_DATE('14:30 01/07/2012', 'HH24:MI DD/MM/YYYY'),'Iberian',4,'Willy Makit','0497699256',2);
INSERT INTO VipTransfers VALUES ('London',TO_DATE('06:10 03/05/2012', 'HH24:MI DD/MM/YYYY'),'British Airways',5,'Hugo First','0433574387',5);
INSERT INTO VipTransfers VALUES ('Moscow',TO_DATE('17:50 01/07/2012', 'HH24:MI DD/MM/YYYY'),'Aeroflot',6,'Rick OhChet','0435647833',7);
INSERT INTO VipTransfers VALUES ('Berlin',TO_DATE('11:25 01/06/2012', 'HH24:MI DD/MM/YYYY'),'Qantas',1,'Dick Taite','0469254233',4);
INSERT INTO VipTransfers VALUES ('Kuala Lumpur',TO_DATE('14:30 01/07/2012', 'HH24:MI DD/MM/YYYY'),'Cathay',7,'Hugo First','0433574387',2);
INSERT INTO VipTransfers VALUES ('Singapore',TO_DATE('06:10 03/05/2012', 'HH24:MI DD/MM/YYYY'),'Qantas',2,'Willy Makit','0497699256',1);
INSERT INTO VipTransfers VALUES ('London',TO_DATE('17:50 01/07/2012', 'HH24:MI DD/MM/YYYY'),'Lufthansa',3,'Justin Thyme','0413456789',4);
COMMIT;

BEGIN;
DROP TABLE IF EXISTS R3;

CREATE TABLE R3 (
    gate INTEGER,
    airline VARCHAR(20)
);
INSERT INTO R3 SELECT DISTINCT gate, airline FROM VipTransfers;
COMMIT;

BEGIN;
DROP TABLE IF EXISTS R4;

CREATE TABLE R4 (
    contact VARCHAR(10),
    name VARCHAR(30)
);
INSERT INTO R4 SELECT DISTINCT contact, name FROM VipTransfers;
COMMIT;


BEGIN;
DROP TABLE IF EXISTS R5;

CREATE TABLE R5 (
    destination VARCHAR(30),
    departs DATE,
    gate INTEGER
);
INSERT INTO R5 SELECT DISTINCT destination, departs, gate FROM VipTransfers;
COMMIT;


BEGIN;
DROP TABLE IF EXISTS R6;

CREATE TABLE R6 (
    departs DATE,
    gate INTEGER,
	contact VARCHAR(10),
    pickup INTEGER

);
INSERT INTO R6 SELECT DISTINCT departs, gate, contact, pickup FROM VipTransfers;
COMMIT;
