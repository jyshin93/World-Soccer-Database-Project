DROP TABLE WorldCup_host;
CREATE TABLE WorldCup_host(
Year   VARCHAR(4) PRIMARY KEY,
Country   VARCHAR(100),
Continent   VARCHAR(100),
Performance VARCHAR(20)
);

INSERT INTO WorldCup_host VALUES ('1930', 'Uruguay', 'S. Amer.', '1st'); 
INSERT INTO WorldCup_host VALUES ('1934', 'Italy', 'Europe', '1st'); 
INSERT INTO WorldCup_host VALUES ('1938', 'France', 'Europe', 'QF'); 
INSERT INTO WorldCup_host VALUES ('1950', 'Brazil', 'S. Amer.', '2nd'); 
INSERT INTO WorldCup_host VALUES ('1954', 'Switzerland', 'Europe', 'QF'); 
INSERT INTO WorldCup_host VALUES ('1958', 'Sweden', 'Europe', '2nd'); 
INSERT INTO WorldCup_host VALUES ('1962', 'Chile', 'S. Amer.', '3rd'); 
INSERT INTO WorldCup_host VALUES ('1966', 'England', 'Europe', '1st'); 
INSERT INTO WorldCup_host VALUES ('1970', 'Mexico', 'N. Amer.', 'QF'); 
INSERT INTO WorldCup_host VALUES ('1974', 'West Germany', 'Europe', '1st'); 
INSERT INTO WorldCup_host VALUES ('1978', 'Argentina', 'S. Amer.', '1st'); 
INSERT INTO WorldCup_host VALUES ('1982', 'Spain', 'Europe', 'top 12'); 
INSERT INTO WorldCup_host VALUES ('1986', 'Mexico', 'N. Amer.', 'QF'); 
INSERT INTO WorldCup_host VALUES ('1990', 'Italy', 'Europe', '3rd'); 
INSERT INTO WorldCup_host VALUES ('1994', 'United States', 'N. Amer.', 'top 16'); 
INSERT INTO WorldCup_host VALUES ('1998', 'France', 'Europe', '1st'); 
INSERT INTO WorldCup_host VALUES ('2002', 'South Korea & Japan', 'Asia', '4th / top 16'); 
INSERT INTO WorldCup_host VALUES ('2006', 'Germany', 'Europe', '3rd'); 
INSERT INTO WorldCup_host VALUES ('2010', 'South Africa', 'Africa', 'Group'); 
INSERT INTO WorldCup_host VALUES ('2014', 'Brazil', 'S. Amer.', '4th'); 
