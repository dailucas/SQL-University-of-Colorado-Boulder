Lab 2 SELECT queries using the WHERE clause

-Q1) List the customerid, companyname, and country for all customers NOT in the U.S.A.

SELECT
	customerid,
	companyname,
	country
FROM "alanparadise/nw"."customers"
WHERE country <> 'USA';


-Q2) For all products in the Northwinds database, list the productname, unitprice, unitsinstock,  and the total value of the inventory of that product as “Total Value” for all products with a Total Value greater than $100. 

SELECT
	productname,
	unitprice,
	unitsinstock,
	(unitsinstock * unitprice) as "Total Value"
FROM "alanparadise/nw"."products"
WHERE (unitsinstock * unitprice) > 100;


-Q3) List the productid, productname, and quantityperunit for all products that come in bottles.

SELECT
	productid,
	productname,
	quantityperunit
FROM "alanparadise/nw"."products"
WHERE quantityperunit like '%bottle%';


-Q4) List the productid, productname, and unitprice for all products whose categoryid is an ODD number.

SELECT
	productid,
	productname,
	unitprice,
FROM "alanparadise/nw"."products"
WHERE categoryid in (1, 3, 5, 7, 9);


-Q5) List the orderid,  customerid, and shippeddate for orders that shipped to Canada  in December 1996 through the end of  January 1997.

SELECT
	orderid,
	customerid,
	shippeddate
FROM "alanparadise/nw"."orders"
WHERE shipcountry = 'Canada' and
	shippeddate between '1996-12-01' and '1997-01-31';
