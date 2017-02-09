DROP TABLE Position_name;


CREATE TABLE Position_name(
Pos   VARCHAR(5) PRIMARY KEY,
Pos_Name   VARCHAR(10)
);

INSERT INTO Position_name VALUES('F', 'Forward');
INSERT INTO Position_name VALUES('G', 'Goalkeeper');
INSERT INTO Position_name VALUES('D', 'Defender');
INSERT INTO Position_name VALUES('M', 'Midfielder');
