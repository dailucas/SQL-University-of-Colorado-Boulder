LAB 4 SELECT queries using GROUP functions and GROUP BY

-Q1) List the total (unitprice * quantity) as “Total Value”  by orderid for the top 5 orders.  (That is, the five orders with the highest Total Value.) 

SELECT
	orderid,
	sum(unitprice * quantity) as "Total Value"
FROM "alanparadise/nw"."orderdetails"
GROUP BY orderid
ORDER BY 2 DESC LIMIT 5;


-Q2) How many products does Northwinds have in inventory?    

SELECT 
	count(productid)
FROM "alanparadise/nw"."products"
WHERE unitsinstock > 0;


-Q3) How many products are out of stock?

SELECT 
	count(productid)
FROM "alanparadise/nw"."products"
WHERE unitsinstock = 0


-Q4) From which supplier(s) does Northwinds carry the fewest products?

SELECT 
	supplierid,
	count(productid)
FROM "alanparadise/nw"."products"
GROUP BY supplierid
ORDER BY 2 asc


-Q5) Which Northwinds employees (just show their employeeid) had over 100 orders ?  

SELECT employeeid
FROM "alanparadise/nw"."orders"
GROUP BY 1
	HAVING count(employeeid) > 100
