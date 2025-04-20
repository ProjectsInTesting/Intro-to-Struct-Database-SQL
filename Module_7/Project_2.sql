#1
mysql> SELECT Collaborators.State AS State, COUNT(*) AS Product_Returns
    -> FROM RMA
    -> INNER JOIN Orders ON Orders.OrderID = RMA.OrderID
    -> INNER JOIN Collaborators ON Collaborators.CollaboratorID = Orders.CollaboratorID 
    -> GROUP BY State
    -> ORDER BY Product_Returns DESC
    -> LIMIT 10;
+---------------+-----------------+
| State         | Product_Returns |
+---------------+-----------------+
| Massachusetts |             972 |
| Arkansas      |             844 |
| Oregon        |             840 |
| West Virginia |             837 |
| Alabama       |             836 |
| Idaho         |             822 |
| Connecticut   |             822 |
| Mississippi   |             821 |
| Tennessee     |             819 |
| Delaware      |             811 |
+---------------+-----------------+
10 rows in set (0.15 sec)

***************************************************************
#2  
mysql> SELECT Collaborators.State AS State, COUNT(*) AS Product_Returns
    -> FROM RMA
    -> INNER JOIN Orders ON Orders.OrderID = RMA.OrderID
    -> INNER JOIN Collaborators ON Collaborators.CollaboratorID = Orders.CollaboratorID 
    -> GROUP BY State
    -> ORDER BY Product_Returns ASC
    -> LIMIT 10;
+----------------+-----------------+
| State          | Product_Returns |
+----------------+-----------------+
| South Carolina |             702 |
| New Jersey     |             711 |
| Colorado       |             718 |
| Georgia        |             719 |
| Nebraska       |             723 |
| Kansas         |             725 |
| Ohio           |             735 |
| Michigan       |             744 |
| Nevada         |             745 |
| Illinois       |             747 |
+----------------+-----------------+
10 rows in set (0.16 sec)

****************************************************************
#3 

mysql> SHOW DATABASES;
+----------------------+
| Database             |
+----------------------+
| DAD220               |
| QuantigrationRMA     |
| QuantigrationUpdates |
| classicmodels        |
| codio                |
| errafii              |
| information_schema   |
| mysql                |
| performance_schema   |
| practice             |
| sys                  |
+----------------------+
11 rows in set (0.01 sec)

mysql> USE QuantigrationUpdates;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> SHOW TABLES;
+--------------------------------+
| Tables_in_QuantigrationUpdates |
+--------------------------------+
| Collaborators                  |
| Orders                         |
| RMA                            |
+--------------------------------+
3 rows in set (0.00 sec)

mysql> DESCRIBE Collaborators;
+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| CollaboratorID | int         | NO   | PRI | NULL    |       |
| FirstName      | varchar(25) | YES  |     | NULL    |       |
| LastName       | varchar(25) | YES  |     | NULL    |       |
| Street         | varchar(50) | YES  |     | NULL    |       |
| City           | varchar(50) | YES  |     | NULL    |       |
| State          | varchar(25) | YES  |     | NULL    |       |
| ZipCode        | varchar(10) | YES  |     | NULL    |       |
| Telephone      | varchar(15) | YES  |     | NULL    |       |
+----------------+-------------+------+-----+---------+-------+
8 rows in set (0.00 sec)

mysql> SECRIBE Orders;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'SECRIBE Orders' at line 1
mysql> 
mysql> 
mysql> 
mysql> 
mysql> SHOW DATABASES;
+----------------------+
| Database             |
+----------------------+
| DAD220               |
| QuantigrationRMA     |
| QuantigrationUpdates |
| classicmodels        |
| codio                |
| errafii              |
| information_schema   |
| mysql                |
| performance_schema   |
| practice             |
| sys                  |
+----------------------+
11 rows in set (0.00 sec)

mysql> USE QuantigrationUpdates;
Database changed
mysql> SHOW TABLES;
+--------------------------------+
| Tables_in_QuantigrationUpdates |
+--------------------------------+
| Collaborators                  |
| Orders                         |
| RMA                            |
+--------------------------------+
3 rows in set (0.00 sec)

mysql> DESCRIBE Collaborators;
+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| CollaboratorID | int         | NO   | PRI | NULL    |       |
| FirstName      | varchar(25) | YES  |     | NULL    |       |
| LastName       | varchar(25) | YES  |     | NULL    |       |
| Street         | varchar(50) | YES  |     | NULL    |       |
| City           | varchar(50) | YES  |     | NULL    |       |
| State          | varchar(25) | YES  |     | NULL    |       |
| ZipCode        | varchar(10) | YES  |     | NULL    |       |
| Telephone      | varchar(15) | YES  |     | NULL    |       |
+----------------+-------------+------+-----+---------+-------+
8 rows in set (0.00 sec)

mysql> DESCRIBE Orders;
+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| OrderID        | int         | NO   | PRI | NULL    |       |
| CollaboratorID | int         | YES  | MUL | NULL    |       |
| SKU            | varchar(20) | YES  |     | NULL    |       |
| Description    | varchar(50) | YES  |     | NULL    |       |
+----------------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> DESCRIBE RMA;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| RMAID   | int         | NO   | PRI | NULL    |       |
| OrderID | int         | NO   | MUL | NULL    |       |
| Step    | varchar(50) | YES  |     | NULL    |       |
| Status  | varchar(15) | YES  |     | NULL    |       |
| Reason  | varchar(15) | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

***************************************************************************
 
mysql> SELECT Collaborators.State AS State, COUNT(*) AS Product_Returns
    -> FROM RMA
    -> INNER JOIN Orders ON RMA.OrderID = Orders.OrderID
    -> INNER JOIN Collaborators ON Orders.CollaboratorID = Collaborators.CollaboratorID
    -> GROUP BY State
    -> ORDER BY Product_Returns DESC;
+----------------+-----------------+
| State          | Product_Returns |
+----------------+-----------------+
| Massachusetts  |             972 |
| Arkansas       |             844 |
| Oregon         |             840 |
| West Virginia  |             837 |
| Alabama        |             836 |
| Idaho          |             822 |
| Connecticut    |             822 |
| Mississippi    |             821 |
| Tennessee      |             819 |
| Delaware       |             811 |
| Kentucky       |             809 |
| Montana        |             808 |
| Wisconsin      |             807 |
| New Mexico     |             807 |
| Iowa           |             804 |
| Pennsylvania   |             802 |
| Indiana        |             802 |
| South Dakota   |             797 |
| Louisiana      |             794 |
| Minnesota      |             794 |
| Wyoming        |             786 |
| Vermont        |             785 |
| Hawaii         |             783 |
| New York       |             782 |
| Washington     |             781 |
| Missouri       |             777 |
| Arizona        |             775 |
| North Dakota   |             774 |
| North Carolina |             773 |
| Maryland       |             767 |
| Florida        |             765 |
| Rhode Island   |             764 |
| California     |             764 |
| New Hampshire  |             764 |
| Utah           |             755 |
| Texas          |             755 |
| Oklahoma       |             751 |
| Maine          |             748 |
| Illinois       |             747 |
| Nevada         |             745 |
| Michigan       |             744 |
| Ohio           |             735 |
| Kansas         |             725 |
| Nebraska       |             723 |
| Georgia        |             719 |
| Colorado       |             718 |
| New Jersey     |             711 |
| South Carolina |             702 |
+----------------+-----------------+
48 rows in set (1.09 sec)
**********************************************************************

mysql> SELECT Collaborators.State AS State, COUNT(*) AS Product_Returns
    -> FROM RMA
    -> INNER JOIN Orders ON Orders.OrderID = RMA.OrderID
    -> INNER JOIN Collaborators ON Collaborators.CollaboratorID = Orders.CollaboratorID 
    -> GROUP BY State
    -> ORDER BY Product_Returns DESC;
+----------------+-----------------+
| State          | Product_Returns |
+----------------+-----------------+
| Massachusetts  |             972 |
| Arkansas       |             844 |
| Oregon         |             840 |
| West Virginia  |             837 |
| Alabama        |             836 |
| Idaho          |             822 |
| Connecticut    |             822 |
| Mississippi    |             821 |
| Tennessee      |             819 |
| Delaware       |             811 |
| Kentucky       |             809 |
| Montana        |             808 |
| Wisconsin      |             807 |
| New Mexico     |             807 |
| Iowa           |             804 |
| Pennsylvania   |             802 |
| Indiana        |             802 |
| South Dakota   |             797 |
| Louisiana      |             794 |
| Minnesota      |             794 |
| Wyoming        |             786 |
| Vermont        |             785 |
| Hawaii         |             783 |
| New York       |             782 |
| Washington     |             781 |
| Missouri       |             777 |
| Arizona        |             775 |
| North Dakota   |             774 |
| North Carolina |             773 |
| Maryland       |             767 |
| Florida        |             765 |
| Rhode Island   |             764 |
| California     |             764 |
| New Hampshire  |             764 |
| Utah           |             755 |
| Texas          |             755 |
| Oklahoma       |             751 |
| Maine          |             748 |
| Illinois       |             747 |
| Nevada         |             745 |
| Michigan       |             744 |
| Ohio           |             735 |
| Kansas         |             725 |
| Nebraska       |             723 |
| Georgia        |             719 |
| Colorado       |             718 |
| New Jersey     |             711 |
| South Carolina |             702 |
+----------------+-----------------+
48 rows in set (0.15 sec)

mysql> SELECT Collaborators.State AS State, COUNT(*) AS Product_Returns
    -> FROM RMA
    -> INNER JOIN Orders ON Orders.OrderID = RMA.OrderID
    -> INNER JOIN Collaborators ON Collaborators.CollaboratorID = Orders.CollaboratorID 
    -> GROUP BY State
    -> ORDER BY Product_Returns DESC
    -> LIMIT BY 10;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'BY 10' at line 7
mysql> SELECT Collaborators.State AS State, COUNT(*) AS Product_Returns
    -> FROM RMA
    -> INNER JOIN Orders ON Orders.OrderID = RMA.OrderID
    -> INNER JOIN Collaborators ON Collaborators.CollaboratorID = Orders.CollaboratorID 
    -> GROUP BY State
    -> ORDER BY Product_Returns DESC
    -> LIMIT 10;
+---------------+-----------------+
| State         | Product_Returns |
+---------------+-----------------+
| Massachusetts |             972 |
| Arkansas      |             844 |
| Oregon        |             840 |
| West Virginia |             837 |
| Alabama       |             836 |
| Idaho         |             822 |
| Connecticut   |             822 |
| Mississippi   |             821 |
| Tennessee     |             819 |
| Delaware      |             811 |
+---------------+-----------------+
10 rows in set (0.15 sec)

*****************************************************************
 
mysql> SELECT Collaborators.State AS State, COUNT(*) AS Product_Returns
    -> FROM RMA
    -> INNER JOIN Orders ON Orders.OrderID = RMA.OrderID
    -> INNER JOIN Collaborators ON Collaborators.CollaboratorID = Orders.CollaboratorID 
    -> GROUP BY State
    -> ORDER BY Product_Returns ASC
    -> LIMIT 10;
+----------------+-----------------+
| State          | Product_Returns |
+----------------+-----------------+
| South Carolina |             702 |
| New Jersey     |             711 |
| Colorado       |             718 |
| Georgia        |             719 |
| Nebraska       |             723 |
| Kansas         |             725 |
| Ohio           |             735 |
| Michigan       |             744 |
| Nevada         |             745 |
| Illinois       |             747 |
+----------------+-----------------+
10 rows in set (0.16 sec)

********************************************************************

mysql> SELECT COUNT(*) AS PRODUCT_SALES_NUMBER, 
    ->        Orders.SKU AS PRODUCT_SKU, 
    ->        Orders.Description AS PRODUCT_DESCRIPTION
    -> FROM Orders
    -> GROUP BY PRODUCT_SKU, PRODUCT_DESCRIPTION
    -> ORDER BY PRODUCT_SALES_NUMBER DESC
    -> LIMIT 10;
+----------------------+-------------+----------------------------------------------------+
| PRODUCT_SALES_NUMBER | PRODUCT_SKU | PRODUCT_DESCRIPTION                                |
+----------------------+-------------+----------------------------------------------------+
|                 8385 | BAS-48-1 C  | Basic Switch 10/100/1000 BaseT 48 port             |
|                 6186 | ENT-48-40F  | Enterprise Switch 40GigE SFP+ 48 port              |
|                 4329 | ENT-48-10F  | Enterprise Switch 10GigE SFP+ 48 port              |
|                 4285 | BAS-08-1 C  | Basic Switch  10/100/1000 BaseT 8 port             |
|                 4275 | ENT-24-10F  | Enterprise Switch 10GigE SFP+ 24 Port              |
|                 4178 | ADV-24-10C  | Advanced Switch 10GigE Copper 24 port              |
|                 4173 | ADV-48-10F  | Advanced Switch 10 GigE Copper/Fiber 44 port coppe |
|                 2152 | ENT-24-40F  | Enterprise Switch 40GigE SFP+ 24 port              |
|                   34 | BAS-24-1 C  | Basic Switch 10/100/1000 BaseT 24 port             |
|                    1 | ADV-48-10F  | Advanced Switch 10 GigE Copper/Fiber 44            |
+----------------------+-------------+----------------------------------------------------+
10 rows in set (0.07 sec)

*****************************************************************
mysql> show tables
    -> ;
+--------------------------------+
| Tables_in_QuantigrationUpdates |
+--------------------------------+
| Collaborators                  |
| Orders                         |
| RMA                            |
+--------------------------------+
3 rows in set (0.00 sec)

mysql> SELECT 
    ->     (SELECT COUNT(*) FROM Orders) AS NUMBER_OF_ORDERS,
    ->     COUNT(*) AS NUMBER_OF_RETURNS,
    ->     COUNT(*) / (SELECT COUNT(*) FROM Orders) * 100 AS Percentage_Of_Orders_Returned
    -> FROM Collaborators
    -> INNER JOIN Orders ON Collaborators.CollaboratorID = Orders.CollaboratorID
    -> INNER JOIN RMA ON Orders.OrderID = RMA.OrderID
    -> WHERE UPPER(RMA.Status) = 'COMPLETE';
+------------------+-------------------+-------------------------------+
| NUMBER_OF_ORDERS | NUMBER_OF_RETURNS | Percentage_Of_Orders_Returned |
+------------------+-------------------+-------------------------------+
|            37998 |             33653 |                       88.5652 |
+------------------+-------------------+-------------------------------+
1 row in set (0.16 sec)

*****************************************************************
mysql> SELECT COUNT(*) AS PRODUCT_SALES_NUMBER, 
    ->        Orders.SKU AS PRODUCT_SKU, 
    ->        Orders.Description AS PRODUCT_DESCRIPTION
    -> FROM Orders
    -> GROUP BY PRODUCT_SKU, PRODUCT_DESCRIPTION
    -> ORDER BY PRODUCT_SALES_NUMBER DESC
    -> LIMIT 10;
+----------------------+-------------+----------------------------------------------------+
| PRODUCT_SALES_NUMBER | PRODUCT_SKU | PRODUCT_DESCRIPTION                                |
+----------------------+-------------+----------------------------------------------------+
|                 8385 | BAS-48-1 C  | Basic Switch 10/100/1000 BaseT 48 port             |
|                 6186 | ENT-48-40F  | Enterprise Switch 40GigE SFP+ 48 port              |
|                 4329 | ENT-48-10F  | Enterprise Switch 10GigE SFP+ 48 port              |
|                 4285 | BAS-08-1 C  | Basic Switch  10/100/1000 BaseT 8 port             |
|                 4275 | ENT-24-10F  | Enterprise Switch 10GigE SFP+ 24 Port              |
|                 4178 | ADV-24-10C  | Advanced Switch 10GigE Copper 24 port              |
|                 4173 | ADV-48-10F  | Advanced Switch 10 GigE Copper/Fiber 44 port coppe |
|                 2152 | ENT-24-40F  | Enterprise Switch 40GigE SFP+ 24 port              |
|                   34 | BAS-24-1 C  | Basic Switch 10/100/1000 BaseT 24 port             |
|                    1 | ADV-48-10F  | Advanced Switch 10 GigE Copper/Fiber 44            |
+----------------------+-------------+----------------------------------------------------+
10 rows in set (0.06 sec)

mysql> SELECT COUNT(*) AS PRODUCT_SALES_NUMBER,
    -> Orders.SKU AS PRODUCT_SKU, Orders.Description AS PRODUCT_DESCRIPTION
    -> FROM Orders
    -> GROUP BY PRODUCT_SKU, PRODUCT_DESCRIPTION
    -> ORDER BY PRODUCT_SALES_NUMBER DESC
    -> LIMIT 10;
+----------------------+-------------+----------------------------------------------------+
| PRODUCT_SALES_NUMBER | PRODUCT_SKU | PRODUCT_DESCRIPTION                                |
+----------------------+-------------+----------------------------------------------------+
|                 8385 | BAS-48-1 C  | Basic Switch 10/100/1000 BaseT 48 port             |
|                 6186 | ENT-48-40F  | Enterprise Switch 40GigE SFP+ 48 port              |
|                 4329 | ENT-48-10F  | Enterprise Switch 10GigE SFP+ 48 port              |
|                 4285 | BAS-08-1 C  | Basic Switch  10/100/1000 BaseT 8 port             |
|                 4275 | ENT-24-10F  | Enterprise Switch 10GigE SFP+ 24 Port              |
|                 4178 | ADV-24-10C  | Advanced Switch 10GigE Copper 24 port              |
|                 4173 | ADV-48-10F  | Advanced Switch 10 GigE Copper/Fiber 44 port coppe |
|                 2152 | ENT-24-40F  | Enterprise Switch 40GigE SFP+ 24 port              |
|                   34 | BAS-24-1 C  | Basic Switch 10/100/1000 BaseT 24 port             |
|                    1 | ADV-48-10F  | Advanced Switch 10 GigE Copper/Fiber 44            |
+----------------------+-------------+----------------------------------------------------+
10 rows in set (0.06 sec)

**************************************************************************
mysql> SELECT 
    ->     (SELECT COUNT(*) FROM Orders) AS NUMBER_OF_ORDERS,
    ->     COUNT(*) AS NUMBER_OF_RETURNS,
    ->     COUNT(*) / (SELECT COUNT(*) FROM Orders) * 100 AS Percentage_Of_Orders_Returned
    -> FROM Collaborators
    -> INNER JOIN Orders ON Collaborators.CollaboratorID = Orders.CollaboratorID
    -> INNER JOIN RMA ON Orders.OrderID = RMA.OrderID
    -> WHERE UPPER(RMA.Status) = 'COMPLETE';
+------------------+-------------------+-------------------------------+
| NUMBER_OF_ORDERS | NUMBER_OF_RETURNS | Percentage_Of_Orders_Returned |
+------------------+-------------------+-------------------------------+
|            37998 |             33653 |                       88.5652 |
+------------------+-------------------+-------------------------------+
1 row in set (0.13 sec)

mysql> SELECT (SELECT COUNT(*) FROM Orders) AS NUMBER_OF_ORDERS,
    -> COUNT(*) AS NUMBER_OF_RETURNS,
    -> COUNT(*) / (SELECT COUNT(*) FROM Orders) * 100 AS Percentage_Of_Orders_Returned
    -> FROM Collaborators
    -> INNER JOIN Orders ON Collaborators.CollaboratorID = Orders.CollaboratorID
    -> INNER JOIN RMA ON Orders.OrderID = RMA.OrderID
    -> WHERE UPPER(RMA.Status) = 'COMPLETE';
+------------------+-------------------+-------------------------------+
| NUMBER_OF_ORDERS | NUMBER_OF_RETURNS | Percentage_Of_Orders_Returned |
+------------------+-------------------+-------------------------------+
|            37998 |             33653 |                       88.5652 |
+------------------+-------------------+-------------------------------+
1 row in set (0.13 sec)

***********************************************************************
 
mysql> SELECT 
    ->     SKU,
    ->     Description,
    ->     COUNT(DISTINCT Purchases.OrderID) AS Orders,
    ->     COUNT(DISTINCT Returns.OrderID) AS Returns,
    ->     (COUNT(DISTINCT Returns.OrderID) / COUNT(DISTINCT Purchases.OrderID) * 100) AS ReturnPercentage
    -> FROM Purchases
    -> LEFT JOIN Returns ON Returns.OrderID = Purchases.OrderID
    -> GROUP BY SKU, Description
    -> ORDER BY Orders DESC;
******************************************
mysql> SELECT 
    ->     Orders.SKU,
    ->     Orders.Description,
    ->     COUNT(DISTINCT Orders.OrderID) AS Orders,
    ->     COUNT(DISTINCT RMA.OrderID) AS Returns,
    ->     (COUNT(DISTINCT RMA.OrderID) / COUNT(DISTINCT Orders.OrderID) * 100) AS ReturnPercentage
    -> FROM Orders
    -> LEFT JOIN RMA ON RMA.OrderID = Orders.OrderID
    -> GROUP BY Orders.SKU, Orders.Description
    -> ORDER BY Orders DESC;
+------------+----------------------------------------------------+--------+---------+------------------+
| SKU        | Description                                        | Orders | Returns | ReturnPercentage |
+------------+----------------------------------------------------+--------+---------+------------------+
| BAS-48-1 C | Basic Switch 10/100/1000 BaseT 48 port             |   8385 |    8245 |          98.3304 |
| ENT-48-40F | Enterprise Switch 40GigE SFP+ 48 port              |   6186 |    6092 |          98.4804 |
| ENT-48-10F | Enterprise Switch 10GigE SFP+ 48 port              |   4329 |    4270 |          98.6371 |
| BAS-08-1 C | Basic Switch  10/100/1000 BaseT 8 port             |   4285 |    4225 |          98.5998 |
| ENT-24-10F | Enterprise Switch 10GigE SFP+ 24 Port              |   4275 |    4210 |          98.4795 |
| ADV-24-10C | Advanced Switch 10GigE Copper 24 port              |   4178 |    4111 |          98.3964 |
| ADV-48-10F | Advanced Switch 10 GigE Copper/Fiber 44 port coppe |   4173 |    4100 |          98.2507 |
| ENT-24-40F | Enterprise Switch 40GigE SFP+ 24 port              |   2152 |    2114 |          98.2342 |
| BAS-24-1 C | Basic Switch 10/100/1000 BaseT 24 port             |     34 |      33 |          97.0588 |
| ADV-48-10F | Advanced Switch 10 GigE Copper/Fiber 44            |      1 |       0 |           0.0000 |
+------------+----------------------------------------------------+--------+---------+------------------+
10 rows in set (0.28 sec)

mysql> SELECT Orders.SKU, Orders.Description,
    -> COUNT(DISTINCT Orders.OrderID) AS Orders,
    -> COUNT(DISTINCT RMA.OrderID) AS Returns,
    -> (COUNT(DISTINCT RMA.OrderID) / COUNT(DISTINCT Orders.OrderID) * 100) AS ReturnPercentage
    -> FROM Orders
    -> LEFT JOIN RMA ON RMA.OrderID = Orders.OrderID
    -> GROUP BY Orders.SKU, Orders.Description
    -> ORDER BY Orders DESC;
+------------+----------------------------------------------------+--------+---------+------------------+
| SKU        | Description                                        | Orders | Returns | ReturnPercentage |
+------------+----------------------------------------------------+--------+---------+------------------+
| BAS-48-1 C | Basic Switch 10/100/1000 BaseT 48 port             |   8385 |    8245 |          98.3304 |
| ENT-48-40F | Enterprise Switch 40GigE SFP+ 48 port              |   6186 |    6092 |          98.4804 |
| ENT-48-10F | Enterprise Switch 10GigE SFP+ 48 port              |   4329 |    4270 |          98.6371 |
| BAS-08-1 C | Basic Switch  10/100/1000 BaseT 8 port             |   4285 |    4225 |          98.5998 |
| ENT-24-10F | Enterprise Switch 10GigE SFP+ 24 Port              |   4275 |    4210 |          98.4795 |
| ADV-24-10C | Advanced Switch 10GigE Copper 24 port              |   4178 |    4111 |          98.3964 |
| ADV-48-10F | Advanced Switch 10 GigE Copper/Fiber 44 port coppe |   4173 |    4100 |          98.2507 |
| ENT-24-40F | Enterprise Switch 40GigE SFP+ 24 port              |   2152 |    2114 |          98.2342 |
| BAS-24-1 C | Basic Switch 10/100/1000 BaseT 24 port             |     34 |      33 |          97.0588 |
| ADV-48-10F | Advanced Switch 10 GigE Copper/Fiber 44            |      1 |       0 |           0.0000 |
+------------+----------------------------------------------------+--------+---------+------------------+
10 rows in set (0.27 sec)

*********************************************************************
mysql> SELECT 
    ->     RMA.Reason AS RETURN_REASON,
    ->     COUNT(*) AS NUMBER_OF_RETURNS,
    ->     COUNT(*) / (
    ->         SELECT COUNT(*) 
    ->         FROM RMA 
    ->         WHERE UPPER(Status) = 'COMPLETE'
    ->     ) * 100 AS PERCENTAGE
    -> FROM RMA
    -> WHERE UPPER(Status) = 'COMPLETE'
    -> GROUP BY RMA.Reason
    -> ORDER BY NUMBER_OF_RETURNS DESC;
+---------------+-------------------+------------+
| RETURN_REASON | NUMBER_OF_RETURNS | PERCENTAGE |
+---------------+-------------------+------------+
| Incorrect     |             13116 |    38.9742 |
| Defective     |             12609 |    37.4677 |
| Other         |              7928 |    23.5581 |
+---------------+-------------------+------------+
3 rows in set (0.12 sec)

mysql> SELECT RMA.Reason AS RETURN_REASON, COUNT(*) AS NUMBER_OF_RETURNS,
    ->  COUNT(*) / (SELECT COUNT(*)
    -> FROM RMA
    -> WHERE UPPER(Status) = 'COMPLETE') * 100 AS PERCENTAGE
    -> FROM RMA
    -> WHERE UPPER(Status) = 'COMPLETE'
    -> GROUP BY RMA.Reason
    -> ORDER BY NUMBER_OF_RETURNS DESC;
+---------------+-------------------+------------+
| RETURN_REASON | NUMBER_OF_RETURNS | PERCENTAGE |
+---------------+-------------------+------------+
| Incorrect     |             13116 |    38.9742 |
| Defective     |             12609 |    37.4677 |
| Other         |              7928 |    23.5581 |
+---------------+-------------------+------------+
3 rows in set (0.10 sec)
*******************************************************
mysql> SELECT Collaborators.City AS City, COUNT(*) AS Returns
    -> FROM RMA
    -> INNER JOIN Orders ON Orders.OrderID = RMA.OrderID
    -> INNER JOIN Collaborators ON Orders.CollaboratorID = Collaborators.CollaboratorID
    -> GROUP BY City
    -> ORDER BY Returns DESC
    -> LIMIT 10;
+-------------+---------+
| City        | Returns |
+-------------+---------+
| Columbus    |     771 |
| Arlington   |     753 |
| Framingham  |     499 |
| New Orleans |     423 |
| Anaheim     |     413 |
| Baton Rouge |     412 |
| Lubbock     |     407 |
| Louisville  |     407 |
| Riverside   |     404 |
| Milwaukee   |     402 |
+-------------+---------+
10 rows in set (0.17 sec)

*************************************************************

mysql> SELECT Collaborators.City AS City, COUNT(*) AS Returns
    -> FROM RMA
    -> INNER JOIN Orders ON Orders.OrderID = RMA.OrderID
    -> INNER JOIN Collaborators ON Orders.CollaboratorID = Collaborators.CollaboratorID
    -> GROUP BY City
    -> ORDER BY Returns ASC
    -> LIMIT 10;
+----------------+---------+
| City           | Returns |
+----------------+---------+
| Providence     |       5 |
| Woonsocket     |       7 |
| Warwick        |      10 |
| San Diego      |     340 |
| St. Louis      |     340 |
| Pittsburgh     |     343 |
| Albuquerque    |     346 |
| St. Petersburg |     347 |
| Colorado       |     348 |
| Boston         |     354 |
+----------------+---------+
10 rows in set (0.16 sec)

*************************************************************
mysql> SELECT Collaborators.State,
    -> COUNT(DISTINCT RMA.OrderID) / COUNT(DISTINCT Orders.OrderID) * 100 AS Return_Rate
    -> FROM Collaborators
    -> JOIN Orders ON Collaborators.CollaboratorID = Orders.CollaboratorID
    -> LEFT JOIN RMA ON Orders.OrderID = RMA.OrderID
    -> GROUP BY Collaborators.State
    -> ORDER BY Return_Rate DESC
    -> LIMIT 10;
+--------------+-------------+
| State        | Return_Rate |
+--------------+-------------+
| North Dakota |     99.3557 |
| Texas        |     99.0753 |
| Oklahoma     |     99.0741 |
| Alabama      |     98.9260 |
| Georgia      |     98.8950 |
| Indiana      |     98.8903 |
| Minnesota    |     98.8764 |
| Louisiana    |     98.8750 |
| Missouri     |     98.8491 |
| California   |     98.8327 |
+--------------+-------------+

*************************************************************

mysql> SELECT RMA.Step, COUNT(*) AS Other_Count
    -> FROM RMA
    -> WHERE Reason = 'Other'
    -> GROUP BY Step
    -> ORDER BY Other_Count DESC;
+-------------------------------------------------+-------------+
| Step                                            | Other_Count |
+-------------------------------------------------+-------------+
| Product replacement or account refund processed |        7928 |
| Awaiting customer Documentation                 |        2418 |
| Received returned equipment                     |        1495 |
+-------------------------------------------------+-------------+
3 rows in set (0.06 sec)

**************************************************************


