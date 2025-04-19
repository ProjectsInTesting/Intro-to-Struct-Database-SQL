mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| DAD220             |
| QuantigrationRMA   |
| classicmodels      |
| codio              |
| errafii            |
| information_schema |
| mysql              |
| performance_schema |
| practice           |
| sys                |
+--------------------+
10 rows in set (0.00 sec)

******************************************************
#1

mysql> CREATE DATABASE QuantigrationUpdates;
Query OK, 1 row affected (0.05 sec)

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

********************************************************
#2
CREATE TABLE Customers (
    -> CustomerID INT NOT NULL,
    -> FirstName VARCHAR(25),
    -> LastName VARCHAR(25),
    -> Street VARCHAR(50),
    -> City VARCHAR(50),
    -> State VARCHAR(25),
    -> ZipCode VARCHAR(10),
    -> Telephone VARCHAR(15),
    -> PRIMARY KEY(CustomerID)
    -> );
Query OK, 0 rows affected (0.22 sec)

mysql> DESCRIBE Customers;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| CustomerID | int         | NO   | PRI | NULL    |       |
| FirstName  | varchar(25) | YES  |     | NULL    |       |
| LastName   | varchar(25) | YES  |     | NULL    |       |
| Street     | varchar(50) | YES  |     | NULL    |       |
| City       | varchar(50) | YES  |     | NULL    |       |
| State      | varchar(25) | YES  |     | NULL    |       |
| ZipCode    | varchar(10) | YES  |     | NULL    |       |
| Telephone  | varchar(15) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
8 rows in set (0.00 sec)

*******************************************************
#3

mysql> CREATE TABLE Orders (
    -> OrderID INT NOT NULL,
    -> CustomerID INT NOT NULL,
    -> SKU VARCHAR(20),
    -> Description VARCHAR(50),
    -> PRIMARY KEY(OrderID)
    -> );
Query OK, 0 rows affected (0.27 sec)

mysql> ALTER TABLE Orders
    -> ADD FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID);
Query OK, 0 rows affected (0.62 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESCRIBE Orders;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| OrderID     | int         | NO   | PRI | NULL    |       |
| CustomerID  | int         | NO   | MUL | NULL    |       |
| SKU         | varchar(20) | YES  |     | NULL    |       |
| Description | varchar(50) | YES  |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

********************************************************
#4
mysql> CREATE TABLE RMA (
    -> RMAID INT NOT NULL,
    -> OrderID INT NOT NULL,
    -> Step VARCHAR(50),
    -> Status VARCHAR(15),
    -> Reason VARCHAR(15),
    -> PRIMARY KEY(RMAID),
    -> FOREIGN KEY(OrderID) REFERENCES Orders(OrderID)
    -> );
Query OK, 0 rows affected (0.28 sec)

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

*******************************************************
#5  
mysql> LOAD DATA INFILE '/home/codio/workspace/customers.csv' 
    -> INTO TABLE Customers FIELDS TERMINATED BY ','
    -> LINES TERMINATED BY '\r\n';
Query OK, 37994 rows affected (2.24 sec)
Records: 37994  Deleted: 0  Skipped: 0  Warnings: 0

mysql> LOAD DATA INFILE '/home/codio/workspace/orders.csv'
    -> INTO TABLE Orders FIELDS TERMINATED BY ','
    -> LINES TERMINATED BY '\r\n';
Query OK, 37994 rows affected (2.90 sec)
Records: 37994  Deleted: 0  Skipped: 0  Warnings: 0

mysql> LOAD DATA INFILE '/home/codio/workspace/rma.csv'
    -> INTO TABLE RMA FIELDS TERMINATED BY ','
    -> LINES TERMINATED BY '\r\n';
Query OK, 38162 rows affected (2.91 sec)
Records: 38162  Deleted: 0  Skipped: 0  Warnings: 0

mysql> SELECT COUNT(*) FROM Customers;
+----------+
| COUNT(*) |
+----------+
|    37994 |
+----------+
1 row in set (0.00 sec)

mysql> SELECT COUNT(*) FROM Orders;
+----------+
| COUNT(*) |
+----------+
|    37994 |
+----------+
1 row in set (0.01 sec)

mysql> SELECT COUNT(*) FROM RMA;
+----------+
| COUNT(*) |
+----------+
|    38162 |
+----------+
1 row in set (0.01 sec)

*******************************************************
#6
mysql> SELECT COUNT(*) FROM Orders
    -> INNER JOIN Customers on Customers.CustomerID = Orders.CustomerID
    -> WHERE UPPER(Customers.city) = 'FRAMINGHAM' AND UPPER(Customers.state) = 'MASSACHUSETTS';
+----------+
| COUNT(*) |
+----------+
|      505 |
+----------+
1 row in set (0.09 sec)

*********************************************************
#7 

mysql> SELECT COUNT(*) FROM Customers
    -> WHERE UPPER(Customers.state) = 'MASSACHUSETTS';
+----------+
| COUNT(*) |
+----------+
|      982 |
+----------+
1 row in set (0.03 sec)

*********************************************************
#8
mysql> INSERT INTO Customers (CustomerID, FirstName, LastName, Street, City, State, ZipCode, Telephone)
    -> VALUES 
    -> (100004, 'Luke', 'Skywalker', '15 Maiden Lane', 'New York', 'New York', '10222', '212-555-1234'),
    -> (100005, 'Winston', 'Smith', '123 Sycamore Street', 'Greensboro', 'North Carolina', '27401', '919-555-6623'),
    -> (100006, 'MaryAnne', 'Jenkins', '1 Coconut Way', 'Jupiter', 'Florida', '33458', '321-555-8907'),
    -> (100007, 'Janet', 'Williams', '55 Redondo Beach Blvd', 'Torrence', 'California', '90501', '310-555-5678');
Query OK, 4 rows affected (0.08 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM Customers 
    -> WHERE CustomerID IN (100004,100005,100006,100007);
+------------+-----------+-----------+-----------------------+------------+----------------+---------+--------------+
| CustomerID | FirstName | LastName  | Street                | City       | State          | ZipCode | Telephone    |
+------------+-----------+-----------+-----------------------+------------+----------------+---------+--------------+
|     100004 | Luke      | Skywalker | 15 Maiden Lane        | New York   | New York       | 10222   | 212-555-1234 |
|     100005 | Winston   | Smith     | 123 Sycamore Street   | Greensboro | North Carolina | 27401   | 919-555-6623 |
|     100006 | MaryAnne  | Jenkins   | 1 Coconut Way         | Jupiter    | Florida        | 33458   | 321-555-8907 |
|     100007 | Janet     | Williams  | 55 Redondo Beach Blvd | Torrence   | California     | 90501   | 310-555-5678 |
+------------+-----------+-----------+-----------------------+------------+----------------+---------+--------------+
4 rows in set (0.00 sec)

********************************************************
#9  

mysql> INSERT INTO Orders (OrderID, CustomerID, SKU, Description)
    -> VALUES 
    -> (1204305, 100004, 'ADV-24-10C', 'Advanced Switch 10GigE Copper 24 port'),
    -> (1204306, 100005, 'ADV-48-10F', 'Advanced Switch 10 GigE Copper/Fiber 44'),
    -> (1204307, 100006, 'ENT-24-10F', 'Enterprise Switch 10GigE SFP+ 24 Port'),
    -> (1204308, 100007, 'ENT-48-10F', 'Enterprise Switch 10GigE SFP+ 48 port');
Query OK, 4 rows affected (0.07 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM Orders 
    -> WHERE OrderID IN (1204305,1204306,1204307,1204308);
+---------+------------+------------+-----------------------------------------+
| OrderID | CustomerID | SKU        | Description                             |
+---------+------------+------------+-----------------------------------------+
| 1204305 |     100004 | ADV-24-10C | Advanced Switch 10GigE Copper 24 port   |
| 1204306 |     100005 | ADV-48-10F | Advanced Switch 10 GigE Copper/Fiber 44 |
| 1204307 |     100006 | ENT-24-10F | Enterprise Switch 10GigE SFP+ 24 Port   |
| 1204308 |     100007 | ENT-48-10F | Enterprise Switch 10GigE SFP+ 48 port   |
+---------+------------+------------+-----------------------------------------+
4 rows in set (0.00 sec)

*******************************************************
#10

mysql> SELECT * FROM Customers
    -> WHERE UPPER(Customers.City) = 'WOONSOCKET'
    -> ND UPPER(Customers.State) = 'RHODE ISLAND';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'ND UPPER(Customers.State) = 'RHODE ISLAND'' at line 3
mysql> SELECT COUNT(*) FROM Customers
    -> WHERE UPPER(Customers.City) = 'WOONSOCKET'
    -> AND UPPER(Customers.State) = 'RHODE ISLAND';
+----------+
| COUNT(*) |
+----------+
|        7 |
+----------+
1 row in set (0.02 sec)

mysql> SELECT * FROM Customers
    -> WHERE UPPER(Customers.City) = 'WOONSOCKET'
    -> AND UPPER(Customers.State) = 'RHODE ISLAND';
+------------+-----------+----------+---------------------------------+------------+--------------+---------+--------------+
| CustomerID | FirstName | LastName | Street                          | City       | State        | ZipCode | Telephone    |
+------------+-----------+----------+---------------------------------+------------+--------------+---------+--------------+
|      63645 | Perry     | Adams    | 414 Milton Blvd.                | Woonsocket | Rhode Island | 12743   | 092335-3806  |
|      76386 | Deborah   | Rogers   | 79 Cowley St.                   | Woonsocket | Rhode Island | 88772   | 885599-8909  |
|      84303 | Amelia    | Morris   | 427 East Second Road            | Woonsocket | Rhode Island | 23834   | 771-472-6523 |
|      84338 | Sherrie   | Nelson   | 59 Green Fabien St.             | Woonsocket | Rhode Island | 24151   | 509180-1668  |
|      85795 | Liza      | Long     | 68 West Rocky Milton Parkway    | Woonsocket | Rhode Island | 52703   | 386-257-0321 |
|      86457 | Jana      | Torres   | 54 First Boulevard              | Woonsocket | Rhode Island | 47278   | 1117277624   |
|      94895 | Kendra    | Bell     | 847 West Rocky Second Boulevard | Woonsocket | Rhode Island | 51941   | 177-7490992  |
+------------+-----------+----------+---------------------------------+------------+--------------+---------+--------------+
7 rows in set (0.04 sec)

********************************************************
#11

mysql> SELECT Status, Step FROM RMA
    -> WHERE OrderID = 5175;
+---------+---------------------------------+
| Status  | Step                            |
+---------+---------------------------------+
| Pending | Awaiting customer Documentation |
+---------+---------------------------------+
1 row in set (0.01 sec)

********************************************************
#12

mysql> UPDATE RMA
    -> SET Status = 'Complete', Step = 'Credit Collaborator Account'
    -> WHERE OrderID = 5175;
Query OK, 1 row affected (0.06 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT Status, Step FROM RMA WHERE OrderID = 5175;
+----------+-----------------------------+
| Status   | Step                        |
+----------+-----------------------------+
| Complete | Credit Collaborator Account |
+----------+-----------------------------+
1 row in set (0.00 sec)

********************************************************
#13 

mysql> DESCRIBE Customers;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| CustomerID | int         | NO   | PRI | NULL    |       |
| FirstName  | varchar(25) | YES  |     | NULL    |       |
| LastName   | varchar(25) | YES  |     | NULL    |       |
| Street     | varchar(50) | YES  |     | NULL    |       |
| City       | varchar(50) | YES  |     | NULL    |       |
| State      | varchar(25) | YES  |     | NULL    |       |
| ZipCode    | varchar(10) | YES  |     | NULL    |       |
| Telephone  | varchar(15) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
8 rows in set (0.00 sec)

mysql> ALTER TABLE Customers RENAME TO Collaborators;
Query OK, 0 rows affected (0.35 sec)

mysql> ALTER TABLE Collaborators CHANGE CustomerID CollaboratorID INT;
Query OK, 0 rows affected (0.14 sec)
Records: 0  Duplicates: 0  Warnings: 0

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

******************************************************
#14
mysql> SELECT COUNT(*) FROM RMA WHERE UPPER(Reason) LIKE '%REJ%';
+----------+
| COUNT(*) |
+----------+
|      596 |
+----------+
1 row in set (0.02 sec)

mysql> DELETE FROM RMA WHERE UPPER(Reason) LIKE '%REJ%';
Query OK, 596 rows affected (0.27 sec)

mysql> SELECT COUNT(*) FROM RMA WHERE UPPER(Reason) LIKE '%REJ%';
+----------+
| COUNT(*) |
+----------+
|        0 |
+----------+
1 row in set (0.03 sec)

*****************************************************
#15

mysql> SELECT * FROM Orders
    -> INTO OUTFILE '/home/codio/workspace/orders2025.csv'
    -> FIELDS TERMINATED BY ',' LINES TERMINATED BY '\r\n';
Query OK, 37998 rows affected (0.38 sec)

*******************************************************

#Test from LaptopA_17in
1
2
3 04/19/2:24PM


*******************************************************
#Test from LaptopB_14in
1    4/14/25 8:45 PM 

2    4/15/25 8:14 PM Created new branch "04/15/Branch01" 2nd practice Pull request.
