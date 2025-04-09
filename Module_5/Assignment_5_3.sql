#1

SELECT Customers.State AS STATE, COUNT(*) AS PRODUCT_SALES
FROM Customers INNER JOIN Orders 
ON Customers.CustomerID = Orders.CustomerID
GROUP BY STATE
ORDER BY PRODUCT_SALES DESC;
+----------------+---------------+
| STATE          | PRODUCT_SALES |
+----------------+---------------+
| Massachusetts  |           982 |
| Arkansas       |           854 |
| West Virginia  |           843 |
| Oregon         |           842 |
| Alabama        |           838 |
| Idaho          |           838 |
| Mississippi    |           834 |
| Tennessee      |           831 |
| Connecticut    |           830 |
| Delaware       |           824 |
| Wisconsin      |           822 |
| Montana        |           820 |
| Kentucky       |           819 |
| New Mexico     |           818 |
| Iowa           |           814 |
| Indiana        |           811 |
| Pennsylvania   |           811 |
| South Dakota   |           807 |
| Minnesota      |           801 |
| Louisiana      |           800 |
| Wyoming        |           795 |
| Vermont        |           793 |
| Hawaii         |           792 |
| Washington     |           791 |
| New York       |           791 |
| North Carolina |           785 |
| Arizona        |           784 |
| Missouri       |           782 |
| Maryland       |           777 |
| North Dakota   |           776 |
| Rhode Island   |           773 |
| Florida        |           772 |
| New Hampshire  |           771 |
| California     |           770 |
| Michigan       |           760 |
| Maine          |           759 |
| Utah           |           759 |
| Illinois       |           758 |
| Texas          |           757 |
| Oklahoma       |           756 |
| Nevada         |           755 |
| Ohio           |           746 |
| Kansas         |           732 |
| Nebraska       |           731 |
| Colorado       |           728 |
| New Jersey     |           725 |
| Georgia        |           724 |
| South Carolina |           713 |
| NY             |             1 |
| NC             |             1 |
| FL             |             1 |
| CA             |             1 |
+----------------+---------------+
52 rows in set (0.11 sec)

/*Query for Top 5*/
SELECT Customers.State AS STATE, COUNT(*) AS PRODUCT_SALES
FROM Customers INNER JOIN Orders 
ON Customers.CustomerID = Orders.CustomerID
GROUP BY STATE
ORDER BY PRODUCT_SALES DESC
LIMIT 5;
+---------------+---------------+
| STATE         | PRODUCT_SALES |
+---------------+---------------+
| Massachusetts |           982 |
| Arkansas      |           854 |
| West Virginia |           843 |
| Oregon        |           842 |
| Alabama       |           838 |
+---------------+---------------+
5 rows in set (0.11 sec)

/*Query for Bottom 5*/
SELECT Customers.State AS STATE, COUNT(*) AS PRODUCT_SALES
FROM Customers INNER JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
GROUP BY STATE
ORDER BY PRODUCT_SALES ASC
LIMIT 5;
+----------------+---------------+
| STATE          | PRODUCT_SALES |
+----------------+---------------+
| FL             |             1 |
| CA             |             1 |
| NY             |             1 |
| NC             |             1 |
| South Carolina |           713 |
+----------------+---------------+
5 rows in set (0.10 sec)

**********************************************
#2
SELECT Orders.SKU, Orders.Description, COUNT(*) AS TotalOrders
FROM Orders
GROUP BY SKU, Description
ORDER BY TotalOrders DESC;
+------------+----------------------------------------------------+-------------+
| SKU        | Description                                        | TotalOrders |
+------------+----------------------------------------------------+-------------+
| BAS-48-1 C | Basic Switch 10/100/1000 BaseT 48 port             |        8385 |
| ENT-48-40F | Enterprise Switch 40GigE SFP+ 48 port              |        6186 |
| ENT-48-10F | Enterprise Switch 10GigE SFP+ 48 port              |        4329 |
| BAS-08-1 C | Basic Switch  10/100/1000 BaseT 8 port             |        4285 |
| ENT-24-10F | Enterprise Switch 10GigE SFP+ 24 Port              |        4275 |
| ADV-24-10C | Advanced Switch 10GigE Copper 24 port              |        4178 |
| ADV-48-10F | Advanced Switch 10 GigE Copper/Fiber 44 port coppe |        4173 |
| ENT-24-40F | Enterprise Switch 40GigE SFP+ 24 port              |        2152 |
| BAS-24-1 C | Basic Switch 10/100/1000 BaseT 24 port             |          34 |
| ADV-48-10F | Advanced Switch 10 GigE Copper/Fiber 44            |           1 |
+------------+----------------------------------------------------+-------------+
10 rows in set (0.07 sec)

/* Analyze the data to determine the top three products sold in the United States.*/
SELECT Orders.SKU, Orders.Description, COUNT(*) AS TotalOrders
FROM Orders
GROUP BY SKU, Description
ORDER BY TotalOrders DESC
LIMIT 3;
+------------+----------------------------------------+-------------+
| SKU        | Description                            | TotalOrders |
+------------+----------------------------------------+-------------+
| BAS-48-1 C | Basic Switch 10/100/1000 BaseT 48 port |        8385 |
| ENT-48-40F | Enterprise Switch 40GigE SFP+ 48 port  |        6186 |
| ENT-48-10F | Enterprise Switch 10GigE SFP+ 48 port  |        4329 |
+------------+----------------------------------------+-------------+

*************************************************************************
#3
/*iii.	Analyze the data to determine the top three products sold in the southeastern region of the United States.
	Southeastern states to include in your analysis: Virginia, North Carolina, South Carolina, and Georgia
*/
SELECT Orders.SKU AS PRODUCT_SKU, Orders.Description, COUNT(*) AS PRODUCT_SALES_NUMBER
FROM Orders INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE UPPER (State) IN ('VIRGINIA','NORTH CAROLINA','SOUTH CAROLINA','GEORGIA')
GROUP BY PRODUCT_SKU, Description
ORDER BY PRODUCT_SALES_NUMBER DESC;
+-------------+----------------------------------------------------+----------------------+
| PRODUCT_SKU | Description                                        | PRODUCT_SALES_NUMBER |
+-------------+----------------------------------------------------+----------------------+
| BAS-48-1 C  | Basic Switch 10/100/1000 BaseT 48 port             |                  504 |
| ENT-48-40F  | Enterprise Switch 40GigE SFP+ 48 port              |                  337 |
| BAS-08-1 C  | Basic Switch  10/100/1000 BaseT 8 port             |                  257 |
| ADV-48-10F  | Advanced Switch 10 GigE Copper/Fiber 44 port coppe |                  255 |
| ENT-48-10F  | Enterprise Switch 10GigE SFP+ 48 port              |                  247 |
| ADV-24-10C  | Advanced Switch 10GigE Copper 24 port              |                  243 |
| ENT-24-10F  | Enterprise Switch 10GigE SFP+ 24 Port              |                  235 |
| ENT-24-40F  | Enterprise Switch 40GigE SFP+ 24 port              |                  143 |
| BAS-24-1 C  | Basic Switch 10/100/1000 BaseT 24 port             |                    1 |
+-------------+----------------------------------------------------+----------------------+

************************************************************
#4
/*i.	Analyze the data to determine the top three products returned in the United States.*/
SELECT COUNT(*) AS Return_Number, Orders.SKU AS SKU
FROM Orders
INNER JOIN RMA ON Orders.OrderID = RMA.OrderID
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
GROUP BY SKU
ORDER BY Return_Number DESC;
+---------------+------------+
| Return_Number | SKU        |
+---------------+------------+
|          8282 | BAS-48-1 C |
|          6118 | ENT-48-40F |
|          4287 | ENT-48-10F |
|          4248 | BAS-08-1 C |
|          4231 | ENT-24-10F |
|          4124 | ADV-48-10F |
|          4122 | ADV-24-10C |
|          2121 | ENT-24-40F |
|            33 | BAS-24-1 C |
+---------------+------------+
9 rows in set (0.17 sec)

********************************************************************
#5
/*ii.	Analyze the data to determine the top three products returned in the northwestern region of the United States.
	Northwestern states to include in your analysis: Washington, Oregon, Idaho, and Montana
*/
SELECT COUNT(*) AS Return_Number, Orders.SKU AS SKU
FROM Orders
INNER JOIN RMA ON Orders.OrderID = RMA.OrderID
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE UPPER (State) IN ('WASHINGTON','OREGON','IDAHO','MONTANA')
GROUP BY SKU
ORDER BY Return_Number DESC;
+---------------+------------+
| Return_Number | SKU        |
+---------------+------------+
|           697 | BAS-48-1 C |
|           534 | ENT-48-40F |
|           379 | BAS-08-1 C |
|           374 | ENT-24-10F |
|           362 | ENT-48-10F |
|           357 | ADV-48-10F |
|           350 | ADV-24-10C |
|           198 | ENT-24-40F |
+---------------+------------+
8 rows in set (0.17 sec)

*******************************************************************



