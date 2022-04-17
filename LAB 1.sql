Lab 1 Coding your first SELECT statements

-Q1) List all the products in the Northwinds database showing productid, productname, quantity per unit, unitprice, and unitsinstock.

SELECT
	productid,
	productname,
	quantityperunit,	
	unitprice,
	unitsinstock
FROM "alanparadise/nw"."products";


-Q2) For all employees at Northwinds, list the first name and last name concatenated together with a blank space in-between, and the YEAR when they were hired.

SELECT
	concat(firstname, ' ', lastname) as "full name",
	date_part('year', hiredate) as "hire year"
FROM "alanparadise/nw"."employees";


-Q3) For all products in the Northwinds database, list the productname, unitprice, unitsinstock,  and the total value of the inventory of that product as “Total Value”.  (HINT:  total value = unitsinstock * unitprice.) 

SELECT
	productname,
	unitprice,
	unitsinstock,
	(unitsinstock * unitprice) as "total value"
FROM "alanparadise/nw"."products";


-Q4) For all employees at Northwinds, list the first name and last name concatenated together with a blank space in-between with a column header “Name”, and the name of the month (spelled out) for each employee’s birthday.  

SELECT
	concat(firstname, ' ', lastname) as "Name",
	to_char(birthdate, 'month') as "Birthdate"
FROM "alanparadise/nw"."employees";