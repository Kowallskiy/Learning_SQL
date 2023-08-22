USE to_learn;

SHOW TABLES;

USE to_learn;
LOAD DATA LOCAL INFILE 'C:\\Users\\Userpc\\Desktop\\Projects\\SQL\\2\\Data_Africa.csv'
INTO TABLE africa
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\\n'
IGNORE 1 LINES;

USE to_learn;
SELECT * FROM africa LIMIT 10;

CREATE TABLE africa (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Year INT,
    Country VARCHAR(255),
    Continent VARCHAR(255),
    Population INT,
    GDP FLOAT
);

DROP TABLE africa;