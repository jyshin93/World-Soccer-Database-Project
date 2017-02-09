DROP TABLE WorldCup_win;
CREATE TABLE WorldCup_win(
Year   VARCHAR(4) PRIMARY KEY,
Winner   VARCHAR(100),
F_Score    VARCHAR(100),
Runner_Up   VARCHAR(100),
Third    VARCHAR(100),
SF_Score     VARCHAR(100),
Fourth VARCHAR(100),
Total_Team VARCHAR(8)
);

INSERT INTO WorldCup_win VALUES ("1930","Uruguay","4–2","Argentina","United States"," ","Yugoslavia","13");
INSERT INTO WorldCup_win VALUES ("1934","Italy","2–1","Czechoslovakia","Germany","3–2","Austria","16");
INSERT INTO WorldCup_win VALUES ("1938","Italy","4–2","Hungary","Brazil","4–2","Sweden","16/15");
INSERT INTO WorldCup_win VALUES ("1950","Uruguay"," ","Brazil","Sweden"," ","Spain","16/13");
INSERT INTO WorldCup_win VALUES ("1954","West Germany","3–2","Hungary","Austria","3–1","Uruguay","16");
INSERT INTO WorldCup_win VALUES ("1958","Brazil","5–2","Sweden","France","6–3","West Germany","16");
INSERT INTO WorldCup_win VALUES ("1962","Brazil","3–1","Czechoslovakia","Chile","1–0","Yugoslavia","16");
INSERT INTO WorldCup_win VALUES ("1966","England","4–2","West Germany","Portugal","2–1","Soviet Union","16");
INSERT INTO WorldCup_win VALUES ("1970","Brazil","4–1","Italy","West Germany","1–0","Uruguay","16");
INSERT INTO WorldCup_win VALUES ("1974","West Germany","2–1","Netherlands","Poland","1–0","Brazil","16");
INSERT INTO WorldCup_win VALUES ("1978","Argentina","3–1","Netherlands","Brazil","2–1","Italy","16");
INSERT INTO WorldCup_win VALUES ("1982","Italy","3–1","West Germany","Poland","3–2","France","24");
INSERT INTO WorldCup_win VALUES ("1986","Argentina","3–2","West Germany","France","4–2","Belgium","24");
INSERT INTO WorldCup_win VALUES ("1990","West Germany","1–0","Argentina","Italy","2–1","England","24");
INSERT INTO WorldCup_win VALUES ("1994","Brazil","0–0 (3–2p)","Italy","Sweden","4–0","Bulgaria","24");
INSERT INTO WorldCup_win VALUES ("1998","France","3–0","Brazil","Croatia","2–1","Netherlands","32");
INSERT INTO WorldCup_win VALUES ("2002","Brazil","2–0","Germany","Turkey","3–2","South Korea","32");
INSERT INTO WorldCup_win VALUES ("2006","Italy","1–1 (5–3p)","France","Germany","3–1","Portugal","32");
INSERT INTO WorldCup_win VALUES ("2010","Spain","1–0","Netherlands","Germany","3–2","Uruguay","32");
INSERT INTO WorldCup_win VALUES ("2014","Germany","1–0","Argentina","Netherlands","3–0","Brazil","32");
