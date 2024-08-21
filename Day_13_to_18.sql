/* Aggregate Functions
An aggregate function is a function where the values of multiple rows are 
grouped together as input on certain criteria to form a single value of more significant meaning.

1) Count()  : returns the number of records
2) Sum()    : returns the Sum value of the specified column
3) Avg()    : returns the Average value of the specified column
4) Min()    : returns the Minimum value of the specified column
5) Max()    : returns the Maximum value of the specified column
*/

-- Retrieve the aggregate values of the 'annualincome' column
SELECT COUNT(AnnualIncome) AS no_of_rows,
		SUM(AnnualIncome) AS sum_of_annualincome,
		AVG(AnnualIncome::numeric) AS avg_annualincome,
		MAX(AnnualIncome) AS max_of_annualincome, 
		MIN(AnnualIncome) AS min_of_annualincome
FROM adventureworks_customers;


/* DISTINCT Clause
The distinct keyword is used in conjunction with the select keyword. 
It is helpful when there is a need to avoid duplicate values present in any specific columns/table. 
When we use distinct keywords only the unique values are fetched. */

-- Distinct values for maritalstatus
SELECT DISTINCT maritalstatus
FROM adventureworks_customers;

-- Distinct values for gender
SELECT DISTINCT gender
FROM adventureworks_customers;

-- Distinct values for totalchildren
SELECT DISTINCT totalchildren
FROM adventureworks_customers;

-- Distinct values for educationlevel
SELECT DISTINCT educationlevel
FROM adventureworks_customers;

-- Distinct values for occupation
SELECT DISTINCT occupation
FROM adventureworks_customers;

-- Distinct values for homeowner
SELECT DISTINCT homeowner
FROM adventureworks_customers;

-- Distinct values for AnnualIncome
SELECT DISTINCT AnnualIncome
FROM adventureworks_customers;

/* Using Distinct Clause with COUNT() Function
Here, we will check the COUNT() function with a DISTINCT clause, 
which will give the total number of students by using the COUNT() function. */

SELECT COUNT(DISTINCT maritalstatus) as count_of_marital_status, 
		COUNT(DISTINCT gender) as count_of_gender,
		COUNT(DISTINCT totalchildren) as count_of_totalchildren,
		COUNT(DISTINCT educationlevel) as count_of_educationlevel,
		COUNT(DISTINCT occupation) as count_of_occupation,
		COUNT(DISTINCT homeowner) as count_of_homeowner,
		COUNT(DISTINCT AnnualIncome) as count_of_AnnualIncome
FROM adventureworks_customers;

/* ORDER BY Statement
This is used to sort the fetched data in either ascending or descending according to one or more columns. 
By default ORDER BY sorts the data in ascending order.
Keywords:
ASC: to sort the data in ascending order.
DESC: to sort the data in descending order. */

/* Sort According To a Single Column
Fetch all data from the adventureworks_customers table and sort the result in ascending order 
according to the AnnualIncome column. */
SELECT * 
FROM adventureworks_customers
ORDER BY AnnualIncome ASC

-- This query gives the same result as the query above because by default ORDER BY sorts the data in ascending order
SELECT * 
FROM adventureworks_customers
ORDER BY AnnualIncome

/* Fetch all data from the adventureworks_customers table and sort the result in descending order 
according to the AnnualIncome column. */
SELECT * 
FROM adventureworks_customers
ORDER BY AnnualIncome DESC

/* Sort According To Multiple Columns
Fetch all data from the adventureworks_customers table and then sort the result 
in ascending order first according to the column totalchildren and then 
in descending order according to the column AnnualIncome. */

SELECT * 
FROM adventureworks_customers
ORDER BY totalchildren ASC, AnnualIncome DESC
			
			
/* Sorting By Column Number (instead of name)
An integer that identifies the number of the column in the Select Items in the underlying query of the SELECT statement. 
Column number must be greater than 0 and not greater than the number of columns in the result table. 
In other words, if we want to order by a column, that column must be specified in the SELECT list. */

-- Sort a database table according to column 4 i.e totalchildren
SELECT firstname, lastname, educationlevel, totalchildren, AnnualIncome
FROM adventureworks_customers
ORDER BY 4 DESC

/* GROUP BY Statement
This is used to arrange identical data into groups with the help of some functions. 
i.e. if a particular column has the same values in different rows then it will arrange these rows in a group.

Features:
GROUP BY clause is used with the SELECT statement.
In the query, the GROUP BY clause is placed after the WHERE clause.
In the query, the GROUP BY clause is placed before the ORDER BY clause if used.
In the query, the Group BY clause is placed before the Having clause.			  
 */
 
-- Group By single column 
SELECT lastname, SUM(AnnualIncome)
FROM adventureworks_customers
GROUP BY lastname;

-- Group By Multiple Columns
-- This query informs us about customers with more than one record in the table
SELECT firstName, lastName, Count(*) as frequency
FROM adventureworks_customers
GROUP BY firstName, lastName
ORDER BY frequency DESC;

/* HAVING Clause in GROUP BY Clause
The HAVING Clause is used to place conditions on groups
The result set returns the only group where sum of AnnualIncome is greater than $120000. */

SELECT firstName, lastName, SUM(AnnualIncome)
FROM adventureworks_customers
GROUP BY firstName, lastName
HAVING SUM(AnnualIncome) > '$120000'


select *
FROM adventureworks_products

SELECT distinct(modelName) 
FROM adventureworks_products
WHERE TRUE;
 
