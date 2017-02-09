DROP TABLE Olympic_host;
CREATE TABLE Olympic_host(
Year   VARCHAR(4) PRIMARY KEY,
City   VARCHAR(100),
NCode VARCHAR(3)
);

INSERT INTO Olympic_host VALUES ('1896', 'Athens', 'GRE'); 
INSERT INTO Olympic_host VALUES ('1900', 'Paris', 'FRA'); 
INSERT INTO Olympic_host VALUES ('1904', 'St. Louis', 'USA'); 
INSERT INTO Olympic_host VALUES ('1908', 'London', 'ENG'); 
INSERT INTO Olympic_host VALUES ('1912', 'Stockholm', 'SWE'); 
INSERT INTO Olympic_host VALUES ('1920', 'Antwerp', 'BEL'); 
INSERT INTO Olympic_host VALUES ('1924', 'Paris', 'FRA'); 
INSERT INTO Olympic_host VALUES ('1928', 'Amsterdam', 'NED'); 
INSERT INTO Olympic_host VALUES ('1932', 'Los Angeles', 'USA'); 
INSERT INTO Olympic_host VALUES ('1936', 'Berlin', 'GER'); 
INSERT INTO Olympic_host VALUES ('1948', 'London', 'ENG'); 
INSERT INTO Olympic_host VALUES ('1952', 'Helsinki', 'FIN'); 
INSERT INTO Olympic_host VALUES ('1956', 'Melbourne', 'AUS'); 
INSERT INTO Olympic_host VALUES ('1960', 'Rome', 'ITA'); 
INSERT INTO Olympic_host VALUES ('1964', 'Tokyo', 'JPN'); 
INSERT INTO Olympic_host VALUES ('1968', 'Mexico City', 'MEX'); 
INSERT INTO Olympic_host VALUES ('1972', 'Munich', 'GER'); 
INSERT INTO Olympic_host VALUES ('1976', 'Montreal', 'CAN'); 
INSERT INTO Olympic_host VALUES ('1980', 'Moscow', 'RUS'); 
INSERT INTO Olympic_host VALUES ('1984', 'Los Angeles', 'USA'); 
INSERT INTO Olympic_host VALUES ('1988', 'Seoul', 'KOR'); 
INSERT INTO Olympic_host VALUES ('1992', 'Barcelona', 'ESP'); 
INSERT INTO Olympic_host VALUES ('1996', 'Atlanta', 'USA'); 
INSERT INTO Olympic_host VALUES ('2000', 'Sydney', 'AUS'); 
INSERT INTO Olympic_host VALUES ('2004', 'Athens', 'GRE'); 
INSERT INTO Olympic_host VALUES ('2008', 'Beijing', 'CHN'); 
INSERT INTO Olympic_host VALUES ('2012', 'London', 'ENG'); 
INSERT INTO Olympic_host VALUES ('2016', 'Rio de Janeiro', 'BRA'); 
