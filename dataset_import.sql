/* Instructions
The queries will be used to create 10 tables for the AdventureWorks database.

Step 1: To use the Query Tool Tool, right-click on the Table and select Query Tool.
		Highlight the code below and execute using the play button (F5)  
		`CREATE TABLE AdventureWorks_ (.....
								);`
								
Step 2: Use the Query Tool to check if the table has been created.

Step 3: Each Table has its corresponding PSQL Tool code for easy data import.
		To use the PSQL Tool, right-click on the Table and select PSQL Tool. A command line environment will be displayed.
		The file import format is: `\copy TABLE_NAME FROM 'filepath' csv header;`
		The csv header at the end of the above code identifies the 1st row as the file header
		
		To load data using psql tool, uncomment i.e. remove the `--` then copy the next line into the PSQL tool. 
		NB: Ensure the file path is set correctly.
		
		Example: \copy adventureworks_customers FROM 'C:\Users\AdventureWorks_dataset\adventureworks_customers.csv' csv header;
		
Step 4: Run the query in Step 2 to check the imported data.
*/

------------------------------------

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

-- PSQL Tool
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

------------------------------------


-- Create AdventureWorks_Calendar Table

CREATE TABLE AdventureWorks_Calendar (
	Date date
	);

-- Check the table
SELECT *
FROM AdventureWorks_Calendar;

-- PSQL Tool
-- \copy AdventureWorks_Calendar FROM 'C:\Users\user\workspace\30daysSQL\AdventureWorks_dataset\AdventureWorks_Calendar.csv' csv header;


------------------------------------


-- Create AdventureWorks_Product_Categories Table

CREATE TABLE AdventureWorks_Product_Categories (
	ProductCategoryKey integer,
    CategoryName  bpchar
	);

-- Check the table
SELECT *
FROM AdventureWorks_Product_Categories

-- PSQL Tool
-- \copy AdventureWorks_Product_Categories FROM 'C:\Users\user\workspace\30daysSQL\AdventureWorks_dataset\AdventureWorks_Product_Categories.csv' csv header;


------------------------------------


-- Create AdventureWorks_Product_Subcategories Table

CREATE TABLE AdventureWorks_Product_Subcategories (
	ProductSubcategoryKey integer,
	SubcategoryName bpchar,
	ProductCategoryKey integer
	);

-- Check the table
SELECT *
FROM AdventureWorks_Product_Subcategories

-- PSQL Tool
-- \copy AdventureWorks_Product_Subcategories FROM 'C:\Users\user\workspace\30daysSQL\AdventureWorks_dataset\AdventureWorks_Product_Subcategories.csv' csv header;


------------------------------------


-- Create AdventureWorks_Products Table

CREATE TABLE AdventureWorks_Products (
	ProductKey integer,
	ProductSubcategoryKey integer,
	ProductSKU bpchar,
	ProductName bpchar,
	ModelName bpchar,
	ProductDescription bpchar,
	ProductColor bpchar,
	ProductSize bpchar,
	ProductStyle bpchar,
	ProductCost numeric,
	ProductPrice numeric
	);

-- Check the table
SELECT *
FROM AdventureWorks_Products;

-- PSQL Tool
-- \copy AdventureWorks_Products FROM 'C:\Users\user\workspace\30daysSQL\AdventureWorks_dataset\AdventureWorks_Products.csv' csv header;


------------------------------------


-- Create AdventureWorks_Returns Table

CREATE TABLE AdventureWorks_Returns (
	ReturnDate date,
	TerritoryKey integer,
	ProductKey integer,
	ReturnQuantity integer
	);

-- Check the table
SELECT *
FROM AdventureWorks_Returns;

-- PSQL Tool
-- \copy AdventureWorks_Returns FROM 'C:\Users\user\workspace\30daysSQL\AdventureWorks_dataset\AdventureWorks_Returns.csv' csv header;


------------------------------------


-- Create AdventureWorks_Sales_2015 Table

CREATE TABLE AdventureWorks_Sales_2015 (
	OrderDate DATE,
	StockDate DATE,
	OrderNumber bpchar,
	ProductKey integer,
	CustomerKey integer,
	TerritoryKey integer,
	OrderLineItem integer,
	OrderQuantity integer
	);
	
-- Check the table
SELECT *
FROM AdventureWorks_Sales_2015;

-- PSQL Tool
-- \copy AdventureWorks_Sales_2015 FROM 'C:\Users\user\workspace\30daysSQL\AdventureWorks_dataset\AdventureWorks_Sales_2015.csv' csv header;


------------------------------------


-- Create AdventureWorks_Sales_2016 Table

CREATE TABLE AdventureWorks_Sales_2016 (
	OrderDate DATE,
	StockDate DATE,
	OrderNumber bpchar,
	ProductKey integer,
	CustomerKey integer,
	TerritoryKey integer,
	OrderLineItem integer,
	OrderQuantity integer
	);

-- Check the table
SELECT *
FROM AdventureWorks_Sales_2016;

-- PSQL Tool
-- \copy AdventureWorks_Sales_2016 FROM 'C:\Users\user\workspace\30daysSQL\AdventureWorks_dataset\AdventureWorks_Sales_2016.csv' csv header;


-------------------------------------------


-- Create AdventureWorks_Sales_2017 Table

CREATE TABLE AdventureWorks_Sales_2017 (
	OrderDate DATE,
	StockDate DATE,
	OrderNumber bpchar,
	ProductKey integer,
	CustomerKey integer,
	TerritoryKey integer,
	OrderLineItem integer,
	OrderQuantity integer
	);

-- Check the table
SELECT *
FROM AdventureWorks_Sales_2017;

-- PSQL Tool
-- \copy AdventureWorks_Sales_2017 FROM 'C:\Users\user\workspace\30daysSQL\AdventureWorks_dataset\AdventureWorks_Sales_2017.csv' csv header;


-------------------------------------------


-- Create AdventureWorks_Territories Table

CREATE TABLE AdventureWorks_Territories (
	SalesTerritoryKey integer,
	Region bpchar,
	Country bpchar,
	Continent bpchar
	);

-- Check the table
SELECT *
FROM AdventureWorks_Territories;

-- PSQL Tool
-- \copy AdventureWorks_Territories FROM 'C:\Users\user\workspace\30daysSQL\AdventureWorks_dataset\AdventureWorks_Territories.csv' csv header;
