LAB 5 Practice using SUBQUERIES

-Q1) List the productid, productname, unitprice of the lowest priced product Northwinds sells.

SELECT	
	productid,
	productname,
	unitprice
FROM "alanparadise/nw"."products"
WHERE unitprice = 
	(SELECT
		min(unitprice)
	FROM "alanparadise/nw"."products");


-Q2) How many orders in the orders table have a bad customerID (either missing or not on file in the customers table.)

SELECT 
	count(orderid)
FROM "alanparadise/nw"."orders"
WHERE customerid NOT IN (
	SELECT 
		customerID
	FROM "alanparadise/nw"."customers");


-Q3) Use a subquery in a SELECT to list something interesting.

SELECT
	productname,
	(SELECT 
		sum(unitprice * quantity)
	FROM "alanparadise/nw"."orderdetails"
	WHERE "alanparadise/nw"."orderdetails".productid =
	"alanparadise/nw"."products".productid) as "total"
FROM "alanparadise/nw"."products";

-Q4) Use a subquery in a FROM to list something interesting.  

SELECT
	orderid
FROM (
	SELECT orderid, sum(quantity)
	FROM "alanparadise/nw"."orderdetails"
	GROUP BY orderid
	HAVING sum(quantity) < 100) as DetailCount;
