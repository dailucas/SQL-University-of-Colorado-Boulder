LAB 6 Practice Inner JOINS

- Q1) List each order and its Total Value (unitprice * quantity) for all orders shipping into France in descending Total Value order. 

--Implicit

SELECT 
	O.orderid,
	sum(unitprice * quantity) as "Total Value"
FROM 
	"alanparadise/nw"."orders" O,
	"alanparadise/nw"."orderdetails" E
WHERE 
	O.orderid = E.orderid and shipcountry = 'France'
GROUP BY 
	O.orderid
ORDER BY
	2 DESC;

--Explicit

SELECT 
	O.orderID, 
	sum(unitprice * quantity) as "Total Value" 
FROM 
	"alanparadise/nw"."orders" O 
		JOIN 
			"alanparadise/nw"."orderdetails" D 
			ON O.orderid = D.orderid
WHERE 
	shipcountry = 'France'
GROUP BY 
	O.orderid
ORDER BY
	2 DESC;


- Q2) Create a Suppliers List showing Supplier CompanyName, and names of all the products sold by each supplier located in Japan.

--Implicit

SELECT
	companyname,
	O.productname
FROM
	"alanparadise/nw"."suppliers" S,
	"alanparadise/nw"."products" O
WHERE
	S.supplierid = O.supplierid and country = 'Japan';

--Explicit

SELECT
	companyname,
	O.productname
FROM 
	"alanparadise/nw"."suppliers" S
		JOIN 
			"alanparadise/nw"."products" O
			ON S.supplierid = O.supplierid
WHERE
	country = 'Japan';

- Q3) Create a “Low Performers” list showing the employees who have less than $100,000 in total sales.  List the employee’s LastName, FirstName followed by their total sales volume (the total dollar value of their orders.)    

--Implicit

SELECT
	lastname,
	firstname,
	sum(unitprice * quantity) as "Total Sales"
FROM
	"alanparadise/nw"."employees" E,
	"alanparadise/nw"."orders" O,
	"alanparadise/nw"."orderdetails" D
WHERE
	E.employeeid = O.Employeeid and O.orderid = D.orderid
GROUP BY
	lastname,
	firstname
 		HAVING
			sum(unitprice * quantity) < 100000;

--Explicit

SELECT
	lastname,
	firstname,
	sum(unitprice * quantity) as "Total Sales"
FROM
	"alanparadise/nw"."employees" E
		JOIN
              		"alanparadise/nw"."orders" O 
			ON E.employeeid  =  O.employeeid
           	      			JOIN 
                     				"alanparadise/nw"."orderdetails" D 
				       		ON O.orderid  =  D.orderid
GROUP BY
	LastName,
	FirstName
HAVING  sum(unitprice * quantity) < 100000;
      

