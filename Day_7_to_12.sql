-- LIMIT
-- The LIMIT clause is used to restrict the number of rows returned in a query result set
-- This query retrieves the first 10 rows for all columns in the table
SELECT * 
FROM adventureworks_customers
LIMIT 10;


-- FETCH
-- The FETCH argument is used to return a set of number of rows
-- FETCH can’t be used itself, it is used in conjunction with OFFSET
-- This query retrieves the first 10 rows for all columns in the table
SELECT * 
FROM adventureworks_customers
FETCH FIRST 10 ROWS ONLY


-- OFFSET-FETCH Clause
-- The OFFSET argument is used to identify the starting point to return rows from a result set
-- Basically, it exclude the first set of records

-- This query retrieves the first 20 rows for all columns in the table, excluding the first 10 rows
SELECT * 
FROM adventureworks_customers
OFFSET 10 ROWS
FETCH FIRST 20 ROWS ONLY;

-- OFFSET-FETCH and ORDER BY Clause
-- This query retrieves the first 20 rows for all columns in the table, 
-- excluding the first 10 rows and, arranged in ascending order based on the 'totalchildren' column
SELECT * 
FROM adventureworks_customers
ORDER BY totalchildren 
OFFSET 10 ROWS
FETCH FIRST 20 ROWS ONLY;


-- Data Cleaning

-- Fetch records of the 'adventureworks_customers' table
SELECT * 
FROM adventureworks_customers


/* NOTE
All the columns and their corresponding datatypes are okay except the 'AnnualIncome' column.
Hence, cleaning of the 'AnnualIncome' column is required for further analysis. 
i.e. the datatype will be changed from `string` to `money`. 
*/

-- ALTER TABLE – ADD, DROP, MODIFY
-- The ALTER TABLE statement in SQL is used to add, remove, or modify columns in an existing table. 

-- Create a new column named 'formatted_annualincome' and set the datatype to money
ALTER TABLE adventureworks_customers
ADD COLUMN formatted_annualincome money;


-- Check to see that the 'formatted_annualincome' has been added
SELECT * 
FROM adventureworks_customers


-- UPDATE statement
-- The UPDATE statement in SQL is used to update the data of an existing table in the database.

-- Fill the 'formatted_annualincome' by converting the existing 'AnnualIncome' values to 'money' datatype
UPDATE adventureworks_customers
SET formatted_annualincome = CAST(annualincome AS money)


-- Check to see that the 'formatted_annualincome' has been updated
SELECT * 
FROM adventureworks_customers


-- Drop the original 'AnnualIncome' column
ALTER TABLE adventureworks_customers
DROP COLUMN annualincome;

-- Rename the new column 'formatted_annualincome' to 'AnnualIncome'
ALTER TABLE adventureworks_customers
RENAME COLUMN formatted_annualincome TO AnnualIncome;

-- fetch all records in the modified table
SELECT *
FROM adventureworks_customers


-- retrieve the columns stated below and order in descending order using the annualincome column
SELECT firstname, lastname, AnnualIncome
FROM adventureworks_customers
ORDER BY AnnualIncome DESC;


/* Arithmetic Operators

+           [Addition]
-           [Subtraction]
/           [Division]
*           [Multiplication]
%           [Modulus]
*/

-- Addition (+): used to perform addition operation on the data items, 
-- items include either single column or multiple columns

-- Here, I will be adding $1000 to each customers annual income 
SELECT firstname, lastname, AnnualIncome, AnnualIncome + 1000::money AS "AnnualIncome + 1000"
FROM adventureworks_customers;

-- Subtraction (-): used to perform subtraction operation on the data items, 
-- items include either single column or multiple column

-- Here, I will be subtracting $1000 from each customers annual income 
SELECT firstname, lastname, AnnualIncome, AnnualIncome - 1000::money AS "AnnualIncome - 1000"
FROM adventureworks_customers;

-- Multiplication (*): used to perform multiplication of data items.

-- Consider the annual income of the customers has been raised by say 200% i.e. 2, we would multiply by 2

SELECT firstname, lastname, AnnualIncome, (AnnualIncome::numeric * 2)::money AS "AnnualIncome * 2"
FROM adventureworks_customers;


/* WILDCARD Operators
Wildcard operators are used with the LIKE statement, which is generally used 
to search the data in the database and there are four basic operators %, _, -, [range_of_characters].

% [Modulus] 			: used in substitute of zero or more characters
_ [Underscore] 			: used as a substitute for one character
- [Hyphen]			 	: used to substitute a range characters
[range_of_characters]   : used to fetch a matching set or range of characters specified inside the brackets
*/

-- Using the % Wildcard
-- To fetch records of Customers whose firstname starts with the pattern 'SA'
SELECT firstname, lastname, birthdate, maritalstatus, educationlevel
FROM adventureworks_customers
WHERE firstname LIKE 'SA%';


-- To fetch records of Customers whose firstname ends with the pattern 'AS'
SELECT firstname, lastname, birthdate, maritalstatus, educationlevel
FROM adventureworks_customers
WHERE firstname LIKE '%AS';


-- To fetch records of Customers whose firstname contains the pattern 'AT'
SELECT firstname, lastname, birthdate, maritalstatus, educationlevel
FROM adventureworks_customers
WHERE firstname LIKE '%AT%';

-- Using the _ Wildcard
-- To fetch records of Customers whose firstname starts with the pattern 'TH' but ends with any letter
SELECT firstname, lastname, birthdate, maritalstatus, educationlevel
FROM adventureworks_customers
WHERE firstname LIKE 'TH____';


-- To fetch records of Customers whose firstname contains a total of 7 characters
SELECT firstname, lastname, birthdate, maritalstatus, educationlevel
FROM adventureworks_customers
WHERE firstname LIKE '_______';


/* Using the [Charlist] wildcard
Note: In PostgreSQL:
The ~ operator performs a case-sensitive regular expression match
The ~* operator performs a case-insensitive regular expression match
*/

-- To fetch records of Customers whose firstname contains letters 'g', 'h' or 'i'
SELECT firstname, lastname, birthdate, maritalstatus, educationlevel
FROM adventureworks_customers
WHERE firstname ~ '[G-I]';

-- To fetch records of Customers whose firstname does not contains letters 'g', 'h' or 'i'
SELECT firstname, lastname, birthdate, maritalstatus, educationlevel
FROM adventureworks_customers
WHERE firstname !~ '[G-I]';


-- Using both % and _ wildcard
-- To fetch records of Customers whose firstname has a 'F' in the 1st position and a 'N' in the 3rd position
SELECT firstname, lastname, birthdate, maritalstatus, educationlevel
FROM adventureworks_customers
WHERE firstname LIKE 'F__N%';


/* WITH Clause
This gived a sub-query block a name (a process also called sub-query refactoring), 
which can be referenced in several places within the main SQL query. 
*/

WITH highvaluecustomers AS
    (SELECT *
    FROM adventureworks_customers
	WHERE AnnualIncome > '$100000' AND totalchildren > 3)
SELECT firstname, lastname, birthdate, maritalstatus, educationlevel, occupation, homeowner 
FROM highvaluecustomers 
WHERE AnnualIncome = '$110000';

/* CASE Statement
The CASE statement is SQL’s way of handling if/then logic. 
It is particularly useful for transforming data or generating custom calculated fields 
within the result set, enhancing the flexibility and readability of SQL queries.
*/
WITH highvaluecustomers(firstName, lastName, AnnualIncome, maritalstatus) AS 
	(SELECT firstname, lastname, AnnualIncome,
		(CASE
			WHEN maritalstatus = 'S' THEN 'Single'
		 	WHEN maritalstatus = 'M' THEN 'Married'
		 	ELSE 'Unknown'
		 END) maritalstatus
	FROM adventureworks_customers)
SELECT * 
FROM highvaluecustomers
WHERE AnnualIncome > '$100000';


/* EXISTS Statement
Used to check whether the result of a correlated nested query is empty (contains no tuples) or not. 
The result of EXISTS is a boolean value True or False. 
It can be used in a SELECT, UPDATE, INSERT or DELETE statement. 
*/

-- Using EXISTS condition with SELECT statement 
-- To fetch the details of the customers who bought products in 2015
SELECT firstname, lastname, AnnualIncome
FROM adventureworks_customers awc
WHERE EXISTS (SELECT * 
              FROM adventureworks_sales_2015 aws2015
              WHERE awc.customerkey = aws2015.customerkey);
			  
-- Using NOT with EXISTS 
-- To fetch the details of the customers who did not buy products in 2015
SELECT firstname, lastname, AnnualIncome
FROM adventureworks_customers awc
WHERE NOT EXISTS (SELECT * 
              FROM adventureworks_sales_2015 aws2015
              WHERE awc.customerkey = aws2015.customerkey);