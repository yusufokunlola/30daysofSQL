/* SQL Alias
Aliases are the temporary names given to tables or columns for the purpose of a particular SQL query. 

It is used when the name of a column or table is used other than its original name, but the modified name is only temporary.
Aliases are created to make table or column names more readable.
The renaming is just a temporary change and the table name does not change in the original database.
Aliases are useful when table or column names are big or not very readable.
These are preferred when there is more than one table involved in a query.
*/

/* Syntax for Column Alias 
SELECT column as alias_name FROM table_name; 

To fetch surname from the adventureworks_customers table using lastname as an alias name. */
SELECT firstname, lastname AS surname
FROM adventureworks_customers
select *
FROM adventureworks_customers



/* Syntax for Table Alias
SELECT column FROM table_name as alias_name;

To fetch the firstname and orderquantity from the database with maritalstatus = 'S'.*/

SELECT awc.firstname, aws2015.orderquantity
FROM adventureworks_customers AS awc
JOIN adventureworks_sales_2015 AS aws2015
ON awc.customerkey = aws2015.customerkey
WHERE awc.maritalstatus= 'S'; 


/*  -- SET Operations
UNION		: used to combine two separate select statements and produce the result set as a union of both select statements.
UNION ALL	: used to fetch the duplicate values instead of just UNION.
INTERSECT	: used to provide the result of the intersection of two select statements. 
EXCEPT		: contains all the rows that are returned by the first SELECT operation, and not returned by the second SELECT operation. 
*/

-- To fetch distinct customerkey from adventureworks_customers and adventureworks_sales_2015 table.
SELECT customerkey 
FROM adventureworks_customers 
UNION
SELECT customerkey 
FROM adventureworks_sales_2015; 

-- Note: the result gave 18148 rows


-- To fetch customerkey from adventureworks_customers and adventureworks_sales_2015 table including duplicate values.
SELECT customerkey
FROM adventureworks_customers 
UNION ALL
SELECT customerkey 
FROM adventureworks_sales_2015;

-- Note: the result gave 20778 rows

/* Note: The column names in both the select statements can be different but the data type must be same.
And in the result set the name of column used in the first select statement will appear. */

/* SQL Join (Inner, Left, Right, Full, Natural and Self Joins)
SQL Join statement is used to combine data or rows from two or more tables based on a common field between them and it includes: 
INNER JOIN 		: selects all rows from both the tables as long as the condition is satisfied.
LEFT JOIN		: returns all the rows of the table on the left side of the join and matches rows for the table on the right side of the join. 
RIGHT JOIN		: returns all the rows of the table on the right side of the join and matching rows for the table on the left side of the join.
FULL JOIN		: creates the result-set by combining results of both LEFT JOIN and RIGHT JOIN.
NATURAL JOIN 	: returns all rows by matching values in common columns having same name and data type of columns present in both tables.
SELF JOIN		: it is a join between two copies of the same table.
*/

/* INNER JOIN
Note: We can also write JOIN instead of INNER JOIN. JOIN is same as INNER JOIN.  */
SELECT *
FROM adventureworks_customers AS awc
INNER JOIN adventureworks_sales_2015 AS aws2015
ON awc.customerkey = aws2015.customerkey

/* LEFT JOIN
For the rows for which there is no matching row on the right side, the result-set will contain null. 
LEFT JOIN is also known as LEFT OUTER JOIN. */
SELECT *
FROM adventureworks_customers AS awc
LEFT JOIN adventureworks_sales_2015 AS aws2015
ON awc.customerkey = aws2015.customerkey

/* RIGHT JOIN
For the rows for which there is no matching row on the left side, the result-set will contain null. 
RIGHT JOIN is also known as RIGHT OUTER JOIN. */

SELECT *
FROM adventureworks_customers AS awc
RIGHT JOIN adventureworks_sales_2015 AS aws2015
ON awc.customerkey = aws2015.customerkey

/* FULL JOIN
The result-set will contain all the rows from both tables. 
For the rows for which there is no matching, the result-set will contain NULL values. */

SELECT *
FROM adventureworks_customers AS awc
FULL JOIN adventureworks_sales_2015 AS aws2015
ON awc.customerkey = aws2015.customerkey

-- NATURAL JOIN
SELECT *
FROM adventureworks_customers AS awc
NATURAL JOIN adventureworks_sales_2015 AS aws2015


-- SELF JOIN
SELECT *
FROM adventureworks_customers AS awc, adventureworks_sales_2015 AS aws2015
WHERE awc.customerkey = aws2015.customerkey




/* USING Clause
USING Clause is used to match only one column when more than one column matches.
NATURAL JOIN and USING Clause are mutually exclusive.
It should not have a qualifier (table name or Alias) in the referenced columns.
NATURAL JOIN uses all the columns with matching names and datatypes to join the tables. 
*/

SELECT awc.firstname, awc.lastname, awc.birthdate, aws2015.ordernumber, aws2015.productkey
FROM adventureworks_customers AS awc
JOIN adventureworks_sales_2015 AS aws2015
USING(customerkey);


/* Joining three or more tables in SQL
Approach 1: Using joins in sql to join the table */

SELECT awc.firstname, awc.lastname, aws2015.orderdate, aws2015.stockdate, aws2015.ordernumber, aws2015.orderquantity, 
		awr.returndate, awr.returnquantity
FROM adventureworks_customers AS awc
INNER JOIN adventureworks_sales_2015 AS aws2015
ON awc.customerkey = aws2015.customerkey
INNER JOIN adventureworks_returns AS awr
ON awr.territorykey = aws2015.territorykey


-- Approach 2. Using parent-child relationship

SELECT awc.firstname, awc.lastname, aws2015.orderdate, aws2015.stockdate, aws2015.ordernumber, aws2015.orderquantity
FROM adventureworks_customers AS awc, 
	adventureworks_sales_2015 AS aws2015, 
	adventureworks_sales_2016 AS aws2016
WHERE awc.customerkey = aws2015.customerkey AND 
		aws2015.customerkey = aws2016.customerkey







