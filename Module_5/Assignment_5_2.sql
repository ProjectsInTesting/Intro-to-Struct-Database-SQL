#1 Creating a table
CREATE TABLE parts_maintenance (
vehicle_id VARCHAR(20),
state VARCHAR(2),
repair VARCHAR(50),
reason VARCHAR(50),
year YEAR,
make VARCHAR(20),
body_type VARCHAR(50)
);

#2 Loading Data 
LOAD DATA INFILE '/home/codio/workspace/FleetMaintenanceRecords.csv'
INTO TABLE parts_maintenance
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

#3
SELECT * FROM parts_maintenance LIMIT 10;

+-------------+-------+--------------------------+--------------------------+------+----------------------+-------------------------------------------+
| vehicle_id  | state | repair                   | reason                   | year | make                 | body_type                                 |
+-------------+-------+--------------------------+--------------------------+------+----------------------+-------------------------------------------+
| 15241383936 | AL    | Battery replacement      | Dead battery             | 2016 | RAM                  | "1500 4WD Quad Cab 140.5"" SLT"           |
| 15241383936 | AL    | Dent Repair  Left Fender | Collision                | 2016 | RAM                  | "1500 4WD Quad Cab 140.5"" SLT"           |
| 60965535744 | AL    | Battery replacement      | Dead battery             | 2016 | RAM                  | "1500 4WD Quad Cab 140.5"" SLT"           |
| 60965535744 | AL    | Tire repair              | Flat- reparable          | 2016 | RAM                  | "1500 4WD Quad Cab 140.5"" SLT"           |
| 60965535744 | AL    | Tire replacement         | Flat- hole not reparable | 2016 | RAM                  | "1500 4WD Quad Cab 140.5"" SLT"           |
| 1.37172E+11 | AL    | Battery replacement      | Dead battery             | 2017 | Chevrolet Silverado  | "1500 4WD Double Cab 143.5"" LT w/1LT"    |
| 1.37172E+11 | AL    | Windshield replacement   | Crack                    | 2017 | Chevrolet Silverado  | "1500 4WD Double Cab 143.5"" LT w/1LT"    |
| 2.43862E+11 | AL    | Dent Repair Rear         | Collision                | 2019 | RAM                  | "1500 Classic SLT 4X2 Crew Cab 6'4"" Box" |
| 3.81035E+11 | AR    | Windshield replacement   | Crack                    | 2016 | RAM                  | "1500 4WD Quad Cab 140.5"" SLT"           |
| 5.4869E+11  | AR    | Tire repair              | Flat- reparable          | 2016 | RAM                  | "1500 4WD Quad Cab 140.5"" SLT"           |
+-------------+-------+--------------------------+--------------------------+------+----------------------+-------------------------------------------+
10 rows in set (0.00 sec)

***********************************************************
#4
SELECT repair, COUNT(*) AS repair_count
FROM parts_maintenance
GROUP BY repair
ORDER BY repair_count DESC;

+--------------------------+--------------+
| repair                   | repair_count |
+--------------------------+--------------+
| Fuel tank                |           95 |
| Tire repair              |           74 |
| Tire replacement         |           66 |
| Windshield replacement   |           63 |
| Battery replacement      |           56 |
| Wheel Arch               |           55 |
| Fender replacement       |           54 |
| Rocker Panel             |           53 |
| Brake line replacement   |           52 |
| Struts                   |           51 |
| Cab corner panel         |           49 |
| Shocks                   |           47 |
| Dent Repair  Left Fender |           37 |
| Transmission             |           28 |
| Dent Repair Rear         |           25 |
+--------------------------+--------------+
15 rows in set (0.00 sec)

The part that is being replaced most often is the Fuel tank,
with a total of 95 instances recorded

************************************************************

#5
SELECT "SOUTHWEST" AS region, COUNT(*) AS number_of_repairs
FROM parts_maintenance
WHERE UPPER(state) IN ('AZ','NM','TX','OK')
UNION
SELECT "NORTHEAST" AS region, COUNT(*) AS number_of_repairs
FROM parts_maintenance
WHERE UPPER(state) IN ('PA','NJ','NY','CT','RI','MA','VT','ME','NH')
UNION
SELECT "SOUTHEAST" AS region, COUNT(*) AS number_of_repairs
FROM parts_maintenance
WHERE UPPER(state) IN ('AR','LA','MS','AL','GA','FL','KY','TN','SC',
'NC','VA','WV','DE','MD','DC')
UNION
SELECT "WEST" AS region, COUNT(*) AS number_of_repairs
FROM parts_maintenance
WHERE UPPER(state) IN ('CA','OR','WA','ID','MT','CO','WY','NV','UT')
UNION
SELECT "MIDWEST" AS region, COUNT(*) AS number_of_repairs
FROM parts_maintenance
WHERE UPPER(state) IN ('KS','MO','IA','ND','SD','NE','OH','IN','IL','WI','MI','MN')
ORDER BY number_of_repairs DESC;

+-----------+-------------------+
| region    | number_of_repairs |
+-----------+-------------------+
| MIDWEST   |               260 |
| NORTHEAST |               208 |
| SOUTHEAST |               208 |
| WEST      |                66 |
| SOUTHWEST |                63 |
+-----------+-------------------+
5 rows in set (0.00 sec)

*************************************************************
#6
SELECT repair AS repair_part, COUNT(*) AS number_of_repairs
FROM parts_maintenance
WHERE UPPER(reason) IN ('CORROSION','RUST')
GROUP BY repair_part
ORDER BY number_of_repairs DESC;

+------------------------+-------------------+
| repair_part            | number_of_repairs |
+------------------------+-------------------+
| Wheel Arch             |                55 |
| Fender replacement     |                54 |
| Rocker Panel           |                53 |
| Brake line replacement |                52 |
| Struts                 |                51 |
| Cab corner panel       |                49 |
| Shocks                 |                47 |
| Fuel tank              |                46 |
+------------------------+-------------------+

/* for even more accuracy, we could use*/

SELECT repair AS repair_part, COUNT(*) AS number_of_repairs
FROM parts_maintenance
WHERE UPPER(reason) LIKE '%CORROSION%'
OR UPPER(reason) LIKE '%RUST%'
GROUP BY repair_part
ORDER BY number_of_repairs DESC;

+------------------------+-------------------+
| repair_part            | number_of_repairs |
+------------------------+-------------------+
| Wheel Arch             |                55 |
| Fender replacement     |                54 |
| Rocker Panel           |                53 |
| Brake line replacement |                52 |
| Struts                 |                51 |
| Cab corner panel       |                49 |
| Shocks                 |                47 |
| Fuel tank              |                46 |
+------------------------+-------------------+
8 rows in set (0.00 sec)

**************************************************************
#7

SELECT repair AS repair_part, COUNT(*) AS number_of_repairs
FROM parts_maintenance
WHERE UPPER(reason) LIKE '%FLAT%'
OR UPPER(reason) LIKE '%CRACK%'
GROUP BY repair_part
ORDER BY number_of_repairs DESC;














