LAB 3 SELECT queries using DATE functions

-Q1) List the employeeid, firstname + lastname concatenated as ‘employee’, and the age of the employee  when they were hired. 

SELECT
	employeeid,
	concat(firstname, ' ', lastname) as "employee",
	cast(age(hiredate, birthdate) as text) as "hire age"
FROM "alanparadise/nw"."employees";


-Q2) Run a query to calculate your age as of today.  

SELECT
	age(now(),to_date('19930528', 'YYYYMMDD'))::text as "my age";


-Q3) List the customerid, companyname and country for all customers whose region is NULL.

SELECT 
	customerid,
	companyname,
	country
FROM "alanparadise/nw"."customers"
WHERE region is NULL;