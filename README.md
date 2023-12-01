# SQL-Project

Analysis of Major US Health Data Breaches - SQL

Data source: https://www.kaggle.com/datasets/thedevastator/major-us-health-data-breaches

Introduction: In this SQL project, I have created a table named "breach_report" that contains data related to various data breaches. I have then answered several questions using SQL queries to gain insights into the data, such as the total number of records and individuals affected, which organizations, states, and types of entities were impacted, when and where the breaches occurred, and the types of breaches that happened, among others.

Objective: The objective of this SQL project is to analyze the data related to various data breaches and answer specific questions to gain insights into the dataset.

SQL commands used:

PRIMARY KEY: To uniquely identify a row of a table.

CREATE TABLE: To create a new table called 'breach_report'.

SELECT: To display the data from the 'breach_report' table.

UPDATE: To convert the 'breach_submission_date' column from string to date format.

WHERE: To filter out the rows where the 'type_of_entity' column is null or empty.

DESCRIBE: To display the structure of the 'breach_report' table.

SHOW: To display the columns in the 'breach_report' table.

DISTINCT: To retrieve unique values from a column.

GROUP BY: To group the rows by a specific column.

ORDER BY: To sort the rows in ascending or descending order.

LIMIT: To limit the number of rows returned in the result set.

YEAR: To extract the year from a date column.

ALTER: To remove a column called 'web_description' from the 'breach_report' table.

DROP: To delete the 'web_description' column structure and related records stored in the table.

SQL Aggregate Function used:

SUM: To calculate the sum of a column.

COUNT: To count the number of rows or columns.

AVG: To calculate the average value of the numeric type.

MAX: To find the maximum value of a certain column.

MIN: To find the minimum value of a certain column.
