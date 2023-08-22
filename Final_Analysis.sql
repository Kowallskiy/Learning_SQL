CREATE TABLE fuel AS

SELECT * from fuelsd;

**ANALYSIS**

--check the number of rows in the table--
SELECT COUNT(*) as UniqueValues
from fuel;

--check the data for missing values--
ALTER TABLE fuel RENAME COLUMN open TO open_;

SELECT COUNT(*) as MissingValues
From fuel
where ticker is null or commodity is null or date is null or open_ is NULL
or high is null or low is null or close is null or volume is null

--Explore 5 first rows of the data to get a better understanding of it--
SELECT * from fuel limit 5;

--How many times the opening price was higher than 50--
SELECT COUNT(*)
from fuel
where open_ > 50;

--Explore what commodities this dataset contains--
SELECT DISTINCT commodity
from fuel;

--how many times the opening price was higher than 50 for each commodity--
SELECT commodity, COUNT(1) as value
from fuel
where open_ > 50
GROUP by commodity
order by value desc;
--there are only 3 commodities which opening price was higher than 50--

--let's determine the highest price for each commodity since the year 2010--
SELECT commodity, strftime('%Y', date) AS year, MAX(high) AS highest_price
FROM fuel
WHERE year > '2009'
GROUP BY commodity, year;

--explore how CTE works--
WITH cte as (
  SELECT commodity, date, MAX(volume) as max_volume
  from fuel
  GROUP by commodity
)
SELECT *
from cte
where strftime('%Y', date) > '2017'
ORDER by max_volume DESC

--converting Date column from TEXT into DATE data type--
alter table fuel
add COLUMN date_ DATE;

update fuel
set date_ = DATE(date);
--then I can drop the old date column, but I do not want to change this dataset--

--Let's find total volume of each commodity across the period--
select commodity, SUM(volume) as total_volume
FROM fuel
group by commodity
order by total_volume DESC;