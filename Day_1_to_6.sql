-- Create AdventureWorks_Customer Table
CREATE TABLE AdventureWorks_Customers (
	CustomerKey integer,
	Prefix bpchar,
	FirstName bpchar,	
	LastName bpchar,	
	BirthDate DATE,
	MaritalStatus bpchar,
	Gender bpchar,
	EmailAddress bpchar,
	AnnualIncome bpchar,
	TotalChildren integer,
	EducationLevel bpchar,
	Occupation bpchar,
	HomeOwner bpchar
	);
	
-- Check the table
SELECT *
FROM adventureworks_customers;

-- Create a table from an existing table
CREATE TABLE customer_copy AS 
SELECT * 
FROM adventureworks_customers;

-- Check the cloned table
SELECT *
FROM customer_copy;

--Load data using psql tool (uncomment then copy the next line into the PSQL tool; ensure the file path is set correctly)
-- \copy adventureworks_customers FROM 'C:\Users\user\workspace\30daysSQL\AdventureWorks_dataset\adventureworks_customers.csv' csv header;

/* While using the PSQL tool, the datestyle was out of range;

Error Message: 
ERROR:  date/time field value out of range: "5/14/1965"
HINT:  Perhaps you need a different "datestyle" setting.
CONTEXT:  COPY adventureworks_customer , line 2, column time: "5/14/1965"

The error message implies that the date/time format in the CSV file does not match the expected format for PostgreSQL. 
PostgreSQL expects date/time values to be in a specific format, typically in the ISO 8601 format (YYYY-MM-DD HH:MI:SS). 

To resolve this; 
Option A: The date/time format in the CSV file has to be adjusted to match PostgreSQL's expected format (YYYY-MM-DD HH:MI:SS), this would be the simplest solution.
Option B: Set a custom datestyle setting for the session before running the \copy command.

Working with Option B in PSQL tool
Step 1: To reset the datestyle to its default value in PostgreSQL, you can use the RESET command.
RESET datestyle;

Step 2: Set datestyle using PSQL Tool import CSV file	
Our datestyle: "5/14/1965" will be set on SQL to “MM-DD-YYY” format

SET datestyle TO 'ISO, MDY';

Step 3: Run the \copy command
\copy adventureworks_customers FROM 'C:\Users\user\workspace\30daysSQL\AdventureWorks_dataset\adventureworks_customers.csv' csv header;
*/

-- Retrieve the imported dataset
SELECT *
FROM adventureworks_customers;


-- WHERE Statement
-- To fetch records of Customers with a totalchildren greater than 2 
SELECT firstname, lastname, birthdate, maritalstatus, educationlevel
FROM adventureworks_customers
WHERE totalchildren > 2;


-- WHERE Clause with BETWEEN Operator
-- To fetch records of Customers with a totalchildren between the values 2 and 4
SELECT firstname, lastname, birthdate, maritalstatus, educationlevel
FROM adventureworks_customers
WHERE totalchildren BETWEEN 2 AND 4;



-- WHERE Clause with LIKE Operator
-- To fetch records of Customers whose firstname starts with the pattern 'S'
SELECT firstname, lastname, birthdate, maritalstatus, educationlevel
FROM adventureworks_customers
WHERE firstname LIKE 'S%';


-- To fetch records of Customers whose firstname ends with the pattern 'S'
SELECT firstname, lastname, birthdate, maritalstatus, educationlevel
FROM adventureworks_customers
WHERE firstname LIKE '%S';



-- To fetch records of Customers whose firstname contains the pattern 'AM'
SELECT firstname, lastname, birthdate, maritalstatus, educationlevel
FROM adventureworks_customers
WHERE firstname LIKE '%AM%';



-- WHERE Clause with IN Operator
-- To fetch records of Customers where totalchildren is 2 or 4
SELECT firstname, lastname, birthdate, maritalstatus, educationlevel
FROM adventureworks_customers
WHERE totalchildren IN (2, 4);



-- WHERE Clause with AND Operator
-- AND operator is used when all the conditions are true
--  To fetch records of Customers where totalchildren is 2 and firstname contains the pattern 'AM'
SELECT firstname, lastname, birthdate, maritalstatus, educationlevel
FROM adventureworks_customers
WHERE totalchildren = 2 AND firstname LIKE '%AM%';


-- OR operator is used if any one of the conditions are true
--  To fetch records of Customers where totalchildren is 2 or firstname contains the pattern 'AM'
SELECT firstname, lastname, birthdate, maritalstatus, educationlevel
FROM adventureworks_customers
WHERE totalchildren = 2 OR firstname LIKE '%AM%';


-- Combining AND and OR
-- We can combine AND and OR operators in the below manner to write complex queries
--  To fetch records of Customers where totalchildren is 2 and 
--      firstname contains the pattern 'AM' or firstname starts with 'S%'
SELECT firstname, lastname, birthdate, maritalstatus, educationlevel
FROM adventureworks_customers
WHERE totalchildren = 2 AND (firstname LIKE '%AM%' OR firstname LIKE 'S%');


-- NOT operator (<>) is used to select rows that do not match a certain condition
--  To fetch records of Customers where totalchildren is not 2 
SELECT firstname, lastname, birthdate, maritalstatus, educationlevel
FROM adventureworks_customers
WHERE NOT totalchildren = 2;

-- Alternative NOT operator (<>)
SELECT firstname, lastname, birthdate, maritalstatus, educationlevel
FROM adventureworks_customers
WHERE totalchildren <> 2;


-- Combining AND, OR and NOT  operators
--  To fetch records of Customers where totalchildren is not 2 and 
--      firstname contains the pattern 'AM' or firstname starts with 'S%'
SELECT firstname, lastname, birthdate, maritalstatus, educationlevel
FROM adventureworks_customers
WHERE totalchildren <> 2 AND (firstname LIKE '%AM%' OR firstname LIKE 'S%');


/*
SQL DELETE is a basic SQL operation used to delete data in a database
I'll be making used of a cloned table known as "customer_copy" for this task
*/

-- Deleting records where totalchildren is 2 and firstname contains the pattern 'AM'
DELETE FROM customer_copy 
WHERE totalchildren = 2 AND firstname LIKE '%AM%';


-- Delete All of the Records
DELETE FROM customer_copy; 

-- Check the "customer_copy" table, it is now empty
SELECT *
FROM customer_copy 


-- SQL INSERT INTO Statement is used to insert a new row/record in a table
-- This query will insert all the data of the table "adventureworks_customers" in the table "customer_copy".
INSERT INTO customer_copy 
SELECT * FROM adventureworks_customers;


-- DROP is used to delete a whole database or just a table
-- Case 1: To Drop a table
DROP TABLE customer_copy;

-- Case 2: To Drop a database
-- DROP DATABASE database_name;


-- After running the query on line 153, recreate a table from an existing table
CREATE TABLE customer_copy AS 
SELECT * 
FROM adventureworks_customers;

-- TRUNCATE
-- The major difference between TRUNCATE and DROP is that 
-- 		truncate is used to delete the data inside the table not the whole table

-- The data in the "customer_copy" table will be deleted 
-- 		but the structure will remain in the memory for further operations.
TRUNCATE TABLE customer_copy;

-- check table format, notice that all records are deleted
SELECT * 
FROM adventureworks_customers;

/*
Findings: I found out that the queries below ensures that all records in the table are deleted
Case 1: DELETE FROM customer_copy;
Case 2: TRUNCATE TABLE customer_copy;
*/
