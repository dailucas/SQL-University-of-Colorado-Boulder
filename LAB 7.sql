LAB 7 Practice Outer JOINS

- Q1) Are there any Northwinds employees that have no orders?	- No

SELECT
	lastname,
	firstname,
	count(orderid) as "Order Total"
FROM
	"alanparadise/nw"."employees" E
		LEFT OUTER JOIN
			"alanparadise/nw"."orders" O
			ON E.employeeid = O.employeeid
GROUP BY
	lastname,
	firstname
Order By
	3 desc;


- Q2) Are there any Northwinds customers that have no orders?	- Yes

SELECT
	C.customerid,
	count(orderid) as "Orders Total"
FROM
	"alanparadise/nw"."customers" C 
  		LEFT OUTER JOIN
			"alanparadise/nw"."orders" O
			ON C.customerid = O.customerid
GROUP BY
	C.customerid
HAVING
	count(orderid) = 0


- Q3) Are there any Northwinds orders that have bad (not on file) customer numbers?	- Yes

SELECT
	DISTINCT O.customerid,
	count(orderid)
FROM
	"alanparadise/nw"."orders" O
		LEFT OUTER JOIN
			"alanparadise/nw"."customers" C 
			ON C.customerid = O.customerid
WHERE
	C.customerid is Null
GROUP BY
	O.customerid;


- Q4) Are there any Shippers that have shipped no Northwinds orders?	- No

SELECT
	S.shipperid,
	count(orderid)
FROM
	"alanparadise/nw"."shippers" S
		LEFT OUTER JOIN
			"alanparadise/nw"."orders" O
			ON S.shipperid = O.shipvia
GROUP BY
	S.shipperid






 







