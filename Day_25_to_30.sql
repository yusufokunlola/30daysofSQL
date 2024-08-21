/* SQL Views
Views in SQL are kind of virtual tables. A view also has rows and columns as they are in a real table in the database. 
We can create a view by selecting fields from one or more tables present in the database. */

-- Create a View named HighValueCustomers from the table adventureworks_customers.
CREATE VIEW HighValueCustomers AS
SELECT *
FROM adventureworks_customers
WHERE annualincome >= '$150000'
AND educationlevel = 'Graduate Degree';

-- To see the data in the View, we can query the view in the same manner as we query a table.
SELECT *
FROM HighValueCustomers

-- Deleting a View
DROP VIEW HighValueCustomers;


/* Mathematical functions 

SQRT(): it takes any numeric values and returns the square root value of that number.
PI(): There are calculations which require use of pi. 	
ROUND() function is used to round a value to the nearest specified decimal place.
CEILING(): is used to find the next highest value (integer).
FLOOR():  returns the next lowest value (integer).
power(a, b): returns a raised to the power of b.

To learn more, consult the PostgreSQL Documentation: https://www.postgresql.org/docs/16/functions-math.html
*/

SELECT SQRT(100), PI(), ROUND(54.2638, 2), CEILING(54.2638),  FLOOR(54.2638), power(4, 2);

/* Date functions
DATE		format: YYYY-MM-DD
DATETIME 	format: YYYY-MM-DD HH:MI: SS
TIMESTAMP 	format: YYYY-MM-DD HH:MI: SS
YEAR 		format: YYYY or YY

NOW(): Returns the current date and time. 
CURRENT_DATE: Returns the current date

CURRENT_TIME and CURRENT_TIMESTAMP deliver values with time zone; LOCALTIME and LOCALTIMESTAMP deliver values without time zone.

To learn more, consult the PostgreSQL Documentation: https://www.postgresql.org/docs/16/functions-datetime.html
*/

SELECT NOW(), CURRENT_DATE, CURRENT_TIME, CURRENT_TIMESTAMP, LOCALTIME, LOCALTIMESTAMP;

-- Query to extract date values
SELECT firstname, lastname, birthdate, EXTRACT (DAY FROM birthdate) as birth_day, EXTRACT (MONTH FROM birthdate) as birth_month
FROM adventureworks_customers;


-- Conditional Expressions
-- 1. The CASE Expression: Let you use IF-THEN-ELSE statements without having to invoke procedures.

-- Recode the value of birth_month to quarter of the year
SELECT firstname, lastname, birthdate, 
	EXTRACT (DAY FROM birthdate) as birth_day, 
	EXTRACT (MONTH FROM birthdate) as birth_month,
	EXTRACT (QUARTER FROM birthdate) as birth_quarter_int,
    CASE
        WHEN EXTRACT(MONTH FROM birthdate) BETWEEN 1 AND 3 THEN 'Quarter 1'
        WHEN EXTRACT(MONTH FROM birthdate) BETWEEN 4 AND 6 THEN 'Quarter 2'
        WHEN EXTRACT(MONTH FROM birthdate) BETWEEN 7 AND 9 THEN 'Quarter 3'
        WHEN EXTRACT(MONTH FROM birthdate) BETWEEN 10 AND 12 THEN 'Quarter 4'
    END AS birth_quarter_text
FROM adventureworks_customers;


-- 2. GREATEST: Returns the largest value from a list of any number of expressions. 
SELECT GREATEST(25, 6, 7, 10, 20, 54);  --  returns 54

-- 3. LEAST: Returns the smallest value from a list of any number of expressions.
SELECT LEAST(25, 6, 7, 10, 20, 54);  --  returns 6

SELECT LEAST(25, 6, 7, 10, 20, 54), GREATEST(25, 6, 7, 10, 20, 54);


-- String Functions

-- Combine the firstname and lastname together as full_name
SELECT
  firstname,
  lastname,
  CONCAT(firstname, ' ', lastname) AS full_name,
  birthdate
FROM adventureworks_customers;

-- Find the total length of characters
SELECT CHARACTER_LENGTH('Yusuf Okunlola');  -- Returns 14

-- Finds the location of 'f' in my name
SELECT POSITION('f' IN 'Yusuf Okunlola');  -- Returns 5

-- Converts my name to upper case
SELECT UPPER('Yusuf Okunlola'); -- YUSUF OKUNLOLA





