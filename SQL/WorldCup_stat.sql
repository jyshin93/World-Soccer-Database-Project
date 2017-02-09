DROP TABLE WorldCup_stat;
CREATE TABLE WorldCup_stat(
Rank   VARCHAR(2) PRIMARY KEY,
Country   VARCHAR(20),
M_played   VARCHAR(3),
Won VARCHAR(3),
Tie VARCHAR(3),
Lost VARCHAR(3),
GF VARCHAR(3),
GA VARCHAR(3),
Points VARCHAR(3),
Participations VARCHAR(3),
Championships VARCHAR(2)
);

INSERT INTO WorldCup_stat VALUES ('1', 'Brazil', '97', '67', '15', '15', '210', '88', '216', '19', '5'); 
INSERT INTO WorldCup_stat VALUES ('2', 'Germany', '99', '60', '19', '20', '206', '117', '199', '17', '3'); 
INSERT INTO WorldCup_stat VALUES ('3', 'Italy', '80', '44', '21', '15', '126', '74', '153', '17', '4'); 
INSERT INTO WorldCup_stat VALUES ('4', 'Argentina', '70', '37', '13', '20', '123', '80', '124', '15', '2'); 
INSERT INTO WorldCup_stat VALUES ('5', 'England', '59', '26', '19', '14', '77', '52', '97', '13', '1'); 
INSERT INTO WorldCup_stat VALUES ('6', 'Spain', '56', '28', '12', '16', '88', '59', '96', '13', '1'); 
INSERT INTO WorldCup_stat VALUES ('7', 'France', '54', '25', '11', '18', '96', '68', '86', '13', '1'); 
INSERT INTO WorldCup_stat VALUES ('8', 'Netherlands', '43', '22', '10', '11', '71', '44', '76', '9', '0'); 
INSERT INTO WorldCup_stat VALUES ('9', 'Uruguay', '47', '18', '12', '17', '76', '65', '66', '11', '2'); 
INSERT INTO WorldCup_stat VALUES ('10', 'Sweden', '46', '16', '13', '17', '74', '69', '61', '11', '0'); 
INSERT INTO WorldCup_stat VALUES ('11', 'Serbia', '43', '17', '8', '18', '64', '59', '59', '11', '0'); 
INSERT INTO WorldCup_stat VALUES ('12', 'Russia', '37', '17', '6', '14', '64', '44', '57', '9', '0'); 
INSERT INTO WorldCup_stat VALUES ('13', 'Poland', '31', '15', '5', '11', '44', '40', '50', '7', '0'); 
INSERT INTO WorldCup_stat VALUES ('14', 'Mexico', '49', '12', '13', '24', '52', '89', '49', '14', '0'); 
INSERT INTO WorldCup_stat VALUES ('15', 'Hungary', '32', '15', '3', '14', '87', '57', '48', '9', '0'); 
INSERT INTO WorldCup_stat VALUES ('16', 'CzechRepublic', '33', '12', '5', '16', '47', '49', '41', '9', '0'); 
INSERT INTO WorldCup_stat VALUES ('17', 'Austria', '29', '12', '4', '13', '43', '47', '40', '7', '0'); 
INSERT INTO WorldCup_stat VALUES ('18', 'Portugal', '23', '12', '3', '8', '39', '22', '39', '5', '0'); 
INSERT INTO WorldCup_stat VALUES ('19', 'Belgium', '36', '10', '9', '17', '46', '63', '39', '11', '0'); 
INSERT INTO WorldCup_stat VALUES ('20', 'Chile', '29', '9', '6', '14', '34', '45', '33', '8', '0'); 
INSERT INTO WorldCup_stat VALUES ('21', 'Switzerland', '29', '9', '6', '14', '38', '52', '33', '9', '0'); 
INSERT INTO WorldCup_stat VALUES ('22', 'Paraguay', '27', '7', '10', '10', '30', '38', '31', '8', '0'); 
INSERT INTO WorldCup_stat VALUES ('23', 'Romania', '21', '8', '5', '8', '30', '32', '29', '7', '0'); 
INSERT INTO WorldCup_stat VALUES ('24', 'Denmark', '16', '8', '2', '6', '27', '24', '26', '4', '0'); 
INSERT INTO WorldCup_stat VALUES ('25', 'UnitedStates', '29', '7', '5', '17', '32', '56', '26', '9', '0'); 
INSERT INTO WorldCup_stat VALUES ('26', 'SouthKorea', '28', '5', '8', '15', '28', '61', '23', '8', '0'); 
INSERT INTO WorldCup_stat VALUES ('27', 'Croatia', '13', '6', '2', '5', '15', '11', '20', '3', '0'); 
INSERT INTO WorldCup_stat VALUES ('28', 'Cameroon', '20', '4', '7', '9', '17', '34', '19', '6', '0'); 
INSERT INTO WorldCup_stat VALUES ('29', 'Scotland', '23', '4', '7', '12', '25', '41', '19', '8', '0'); 
INSERT INTO WorldCup_stat VALUES ('30', 'Bulgaria', '26', '3', '8', '15', '22', '53', '17', '7', '0'); 
INSERT INTO WorldCup_stat VALUES ('31', 'Turkey', '10', '5', '1', '4', '20', '17', '16', '2', '0'); 
INSERT INTO WorldCup_stat VALUES ('32', 'Japan', '14', '4', '3', '7', '12', '16', '15', '4', '0'); 
INSERT INTO WorldCup_stat VALUES ('33', 'Peru', '15', '4', '3', '8', '19', '31', '15', '4', '0'); 
INSERT INTO WorldCup_stat VALUES ('34', 'Ghana', '9', '4', '2', '3', '9', '10', '14', '2', '0'); 
INSERT INTO WorldCup_stat VALUES ('35', 'Ireland', '13', '2', '8', '3', '10', '10', '14', '3', '0'); 
INSERT INTO WorldCup_stat VALUES ('36', 'N.Ireland', '13', '3', '5', '5', '13', '23', '14', '3', '0'); 
INSERT INTO WorldCup_stat VALUES ('37', 'Nigeria', '14', '4', '2', '8', '17', '21', '14', '4', '0'); 
INSERT INTO WorldCup_stat VALUES ('38', 'Colombia', '13', '3', '2', '8', '14', '23', '11', '4', '0'); 
INSERT INTO WorldCup_stat VALUES ('39', 'SouthAfrica', '9', '2', '4', '3', '11', '16', '10', '3', '0'); 
INSERT INTO WorldCup_stat VALUES ('40', 'CostaRica', '10', '3', '1', '6', '12', '21', '10', '3', '0'); 
INSERT INTO WorldCup_stat VALUES ('41', 'Morocco', '13', '2', '4', '7', '12', '18', '10', '4', '0'); 
INSERT INTO WorldCup_stat VALUES ('42', 'Ecuador', '7', '3', '0', '4', '7', '8', '9', '2', '0'); 
INSERT INTO WorldCup_stat VALUES ('43', 'Norway', '8', '2', '3', '3', '7', '8', '9', '3', '0'); 
INSERT INTO WorldCup_stat VALUES ('44', 'Australia', '10', '2', '3', '5', '8', '17', '9', '3', '0'); 
INSERT INTO WorldCup_stat VALUES ('45', 'Senegal', '5', '2', '2', '1', '7', '6', '8', '1', '0'); 
INSERT INTO WorldCup_stat VALUES ('46', 'EastGermany', '6', '2', '2', '2', '5', '5', '8', '1', '0'); 
INSERT INTO WorldCup_stat VALUES ('47', 'Algeria', '9', '2', '2', '5', '6', '12', '8', '3', '0'); 
INSERT INTO WorldCup_stat VALUES ('48', 'SaudiArabia', '13', '2', '2', '9', '9', '32', '8', '4', '0'); 
INSERT INTO WorldCup_stat VALUES ('49', 'Ukraine', '5', '2', '1', '2', '5', '7', '7', '1', '0'); 
INSERT INTO WorldCup_stat VALUES ('50', 'IvoryCoast', '6', '2', '1', '3', '9', '9', '7', '2', '0'); 
INSERT INTO WorldCup_stat VALUES ('51', 'Tunisia', '12', '1', '4', '7', '8', '17', '7', '4', '0'); 
INSERT INTO WorldCup_stat VALUES ('52', 'Wales', '5', '1', '3', '1', '4', '4', '6', '1', '0'); 
INSERT INTO WorldCup_stat VALUES ('53', 'Iran', '9', '1', '2', '6', '6', '18', '5', '3', '0'); 
INSERT INTO WorldCup_stat VALUES ('54', 'Cuba', '3', '1', '1', '1', '5', '12', '4', '1', '0'); 
INSERT INTO WorldCup_stat VALUES ('55', 'Slovakia', '4', '1', '1', '2', '5', '7', '4', '1', '0'); 
INSERT INTO WorldCup_stat VALUES ('56', 'Slovenia', '6', '1', '1', '4', '5', '10', '4', '2', '0'); 
INSERT INTO WorldCup_stat VALUES ('57', 'NorthKorea', '7', '1', '1', '5', '6', '21', '4', '2', '0'); 
INSERT INTO WorldCup_stat VALUES ('58', 'Jamaica', '3', '1', '0', '2', '3', '9', '3', '1', '0'); 
INSERT INTO WorldCup_stat VALUES ('59', 'Honduras', '6', '0', '3', '3', '2', '6', '3', '2', '0'); 
INSERT INTO WorldCup_stat VALUES ('60', 'NewZealand', '6', '0', '3', '3', '4', '14', '3', '2', '0'); 
INSERT INTO WorldCup_stat VALUES ('61', 'Greece', '6', '1', '0', '5', '2', '15', '3', '2', '0'); 
INSERT INTO WorldCup_stat VALUES ('62', 'Angola', '3', '0', '2', '1', '1', '2', '2', '1', '0'); 
INSERT INTO WorldCup_stat VALUES ('63', 'Israel', '3', '0', '2', '1', '1', '3', '2', '1', '0'); 
INSERT INTO WorldCup_stat VALUES ('64', 'Egypt', '4', '0', '2', '2', '3', '6', '2', '2', '0'); 
INSERT INTO WorldCup_stat VALUES ('65', 'Kuwait', '3', '0', '1', '2', '2', '6', '1', '1', '0'); 
INSERT INTO WorldCup_stat VALUES ('66', 'Trinidad/Tob.', '3', '0', '1', '2', '0', '4', '1', '1', '0'); 
INSERT INTO WorldCup_stat VALUES ('67', 'Bolivia', '6', '0', '1', '5', '1', '20', '1', '3', '0'); 
INSERT INTO WorldCup_stat VALUES ('68', 'Indonesia', '1', '0', '0', '1', '0', '6', '0', '1', '0'); 
INSERT INTO WorldCup_stat VALUES ('69', 'Iraq', '3', '0', '0', '3', '1', '4', '0', '1', '0'); 
INSERT INTO WorldCup_stat VALUES ('70', 'Togo', '3', '0', '0', '3', '1', '6', '0', '1', '0'); 
INSERT INTO WorldCup_stat VALUES ('71', 'Canada', '3', '0', '0', '3', '0', '5', '0', '1', '0'); 
INSERT INTO WorldCup_stat VALUES ('72', 'UAEmirates', '3', '0', '0', '3', '2', '11', '0', '1', '0'); 
INSERT INTO WorldCup_stat VALUES ('73', 'China', '3', '0', '0', '3', '0', '9', '0', '1', '0'); 
INSERT INTO WorldCup_stat VALUES ('74', 'Haiti', '3', '0', '0', '3', '2', '14', '0', '1', '0'); 
INSERT INTO WorldCup_stat VALUES ('75', 'CongoDR', '3', '0', '0', '3', '0', '14', '0', '1', '0'); 
INSERT INTO WorldCup_stat VALUES ('76', 'ElSalvador', '6', '0', '0', '6', '1', '22', '0', '2', '0'); 
