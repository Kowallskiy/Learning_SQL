## Learning SQL
____
In this project, I needed to ensure an understanding of fundamental SQL techniques for data manipulation. The data analysis took place within an SQLite database, focusing on fuel price-related data:
```SQL
--Verify the row count within the table--
SELECT COUNT(*) AS UniqueValues
FROM fuel;

--Examine the data for any instances of missing values--
ALTER TABLE fuel RENAME COLUMN open TO open_;

SELECT COUNT(*) AS MissingValues
FROM fuel
WHERE ticker IS NULL OR commodity IS NULL OR date IS NULL OR open_ IS NULL
OR high IS NULL OR low IS NULL OR close IS NULL OR volume IS NULL;

--Examine the first five rows of the data to gain a clearer understanding--
SELECT * FROM fuel LIMIT 5;

--Determine the frequency of instances where the opening price exceeded 50--
SELECT COUNT(*)
FROM fuel
WHERE open_ > 50;

--Investigate the commodities within this dataset--
SELECT DISTINCT commodity
FROM fuel;

--Calculate the occurrences of opening prices exceeding 50 for each individual commodity--
SELECT commodity, COUNT(1) AS value
FROM fuel
WHERE open_ > 50
GROUP BY commodity
ORDER BY value DESC;
--Only three commodities exhibited opening prices surpassing 50--

--Let's identify the maximum price for each commodity starting from the year 2010--
SELECT commodity, strftime('%Y', date) AS year, MAX(high) AS highest_price
FROM fuel
WHERE year > '2009'
GROUP BY commodity, year;

--Apply the Common Table Expressions (CTE) method to enhance comprehension of its functioning--
WITH cte AS (
  SELECT commodity, date, MAX(volume) AS max_volume
  FROM fuel
  GROUP BY commodity
)
SELECT *
FROM cte
WHERE strftime('%Y', date) > '2017'
ORDER BY max_volume DESC

--Converting the "Date" column from the TEXT data type to the DATE data type--
ALTER TABLE fuel
ADD COLUMN date_ DATE;

UPDATE fuel
SET date_ = DATE(date);

--Calculate the cumulative volume of each commodity throughout the specified timeframe--
SELECT commodity, SUM(volume) AS total_volume
FROM fuel
GROUP BY commodity
ORDER BY total_volume DESC;
