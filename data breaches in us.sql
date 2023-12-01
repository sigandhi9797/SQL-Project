USE Project1;
# create a table that will contain whole data
CREATE TABLE breach_report(
ID int PRIMARY KEY,
name_of_covered_entity VARCHAR(200),
state VARCHAR(100),
type_of_entity VARCHAR(200),
affected_population int,
breach_submission_date CHAR(50),
type_of_breach VARCHAR(100),
location VARCHAR(100),
business_associate_present VARCHAR(50),
web_description VARCHAR(200)
);

# to check whole dataset
SELECT * FROM breach_report;

# # Top 10 rows
SELECT * FROM breach_report LIMIT 10;

# Dropping Unnecessary columns
ALTER TABLE breach_report 
DROP COLUMN web_description;

# # as breach_submission_date is in string lets convert it into date
UPDATE breach_report SET  breach_submission_date = str_to_date(breach_submission_date,"%m/%d/%y");
SELECT * FROM breach_report LIMIT 10;

# to find  column has null value or empty
SELECT * FROM breach_report WHERE type_of_entity  IS NULL OR
type_of_entity  = ' ';

# lets analyzed the data by answering few questions:

# to get structure of data
DESCRIBE breach_report;

# to find number of columns
SHOW COLUMNS FROM breach_report;
SELECT COUNT(*) AS total_columns FROM information_schema.columns WHERE table_name = 'breach_report' ;

# #Questions:

# 1. How many total records were affected by the data breach?
SELECT COUNT(*) AS total_rows FROM breach_report;

## Therefore, there are 8 columns and 1002 rows in this dataset.

# 2. How many individuals were impacted by the breach?
SELECT SUM(affected_population) AS total_individuals_affected FROM breach_report;

# 3. Which organizations were impacted by data breach?
SELECT DISTINCT name_of_covered_entity FROM breach_report;

# 4. Which states  were impacted by data breaches?
SELECT DISTINCT state FROM breach_report;


# 5. Which different types of entities got affected?
SELECT DISTINCT type_of_entity FROM breach_report;

# 6. When did the maximum breaches occured?
SELECT breach_submission_date AS BreachDate, COUNT(*) AS NumBreaches
FROM breach_report
GROUP BY BreachDate
ORDER BY NumBreaches DESC
LIMIT 1;

# 7. When did the minimum breaches occured?
SELECT breach_submission_date AS BreachDate, COUNT(*) AS NumBreaches
FROM breach_report
GROUP BY BreachDate
ORDER BY NumBreaches ASC
LIMIT 1;


# 8. What is the total number of data breaches by state?
SELECT state, COUNT(*) FROM breach_report GROUP BY state;


# 9. What is the total number of data breaches by type of entity?
SELECT type_of_entity, COUNT(*) FROM breach_report GROUP BY type_of_entity;

# 10. What type of breaches happened so far?
SELECT DISTINCT type_of_breach FROM breach_report;

# 11. What is the total number of affected populations by type of breach?
SELECT type_of_breach, SUM(affected_population)AS 'total_affected_population' FROM breach_report GROUP BY type_of_breach;

# 12. Which locations are affected mostely by data breaches?
SELECT DISTINCT location FROM breach_report;

# 13. How many breaches occurred in a specific location?
SELECT location, COUNT(*) AS 'number_of_breaches_by_location' FROM breach_report GROUP BY location;

# 14. Which organizations had business associates present during the data breach?
SELECT name_of_covered_entity FROM  breach_report WHERE business_associate_present = 'Yes';

# 15. What is the average number of affected populations from data breaches with business associates absent?
SELECT AVG(affected_population)
FROM breach_report
WHERE business_associate_present = 'No';

# 16. How many data breaches occurred in each year?
SELECT YEAR(breach_submission_date) AS year, COUNT(*) AS 'total_data_breaches'
FROM breach_report
GROUP BY year;

# 17. Which organizations had the highest number of data breaches in a certain state?
SELECT name_of_covered_entity, COUNT(*) AS NumBreaches
FROM breach_report
WHERE State = 'TX'
GROUP BY name_of_covered_entity
ORDER BY NumBreaches DESC
LIMIT 1;

# 18. What types of entities have the highest number of data breaches?
SELECT name_of_covered_entity, COUNT(*) AS NumBreaches
FROM breach_report
GROUP BY name_of_covered_entity
ORDER BY NumBreaches DESC
LIMIT 10;

# 19. How many breaches have occurred in the 2016?
SELECT COUNT(*) AS NumBreaches
FROM breach_report
WHERE breach_submission_date >= '2016-01-01' AND breach_submission_date <= '2016-12-31';

# 20. Which organizations had the highest number of affected populations in a specific type of breach?
SELECT name_of_covered_entity, type_of_breach, SUM(affected_population) AS TotalAffected
FROM breach_report
GROUP BY name_of_covered_entity, type_of_breach
ORDER BY TotalAffected DESC
LIMIT 10;


