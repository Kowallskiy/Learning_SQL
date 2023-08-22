USE to_learn;

CREATE TABLE fuel (
    Ticker VARCHAR(255) PRIMARY KEY,
    Commodity VARCHAR(255),
    Date DATE,
    Open_price FLOAT,
    Highest_price FLOAT,
    Lowest_price FLOAT,
    Close_price FLOAT,
    Volume INT
);

USE to_learn;
LOAD DATA LOCAL INFILE 'C:\\Users\\Userpc\\Desktop\\Projects\\SQL\\2\\all_fuels_data.csv'
INTO TABLE africa
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\\n'
IGNORE 1 LINES;

USE to_learn;
SELECT * FROM fuel;
