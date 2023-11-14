1. Mathematical Functions
1.1 ABS
mysql> select ABS(-100) from dual;
+-----------+
| ABS(-100) |
+-----------+
| 100 |
+-----------+
1.2 FLOOR
mysql> select floor(3.14) from dual;
+-------------+
| floor(3.14) |
+-------------+
| 3 |

1.3 GREATEST
mysql> select greatest (2,3) from dual;
+----------------+
| greatest (2,3) |
+----------------+
| 3 |
+----------------+
1.4 LEAST
mysql> select least(6,3,6,3,7,1) from dual;
+--------------------+
| least(6,3,6,3,7,1) |
+--------------------+
| 1 |
+--------------------+
1.5 LENGTH
mysql> select length('adishankara college') from dual;
+-------------------------------+
| length('adishankara college') |
+-------------------------------+
| 19 |
+-------------------------------+

mysql> select length (123456) from dual;
+-----------------+
| length (123456) |
+-----------------+
| 6 |
+-----------------+
1.6 SQRT
mysql> select sqrt(25) from dual;
+----------+
| sqrt(25) |
+----------+
| 5 |
1.7 POWER
mysql> select power(5,2) from dual;
+------------+
| power(5,2) |
+------------+
| 25 |
+------------+
1.8 ROUND
mysql> select round(3.5) from dual;
+------------+
| round(3.5) |
+------------+
| 4 |
+------------+
mysql> select round(3.4) from dual;
+------------+
| round(3.4) |
+------------+
| 3 |
1.9 SIN, COS, TAN
mysql> select sin(90) from dual;
+--------------------+
| sin(90) |
+--------------------+
| 0.8939966636005579 |
+--------------------+
mysql> select cos(90) from dual;
+---------------------+
| cos(90) |
+---------------------+
| -0.4480736161291701 |
+---------------------+
mysql> select tan(90) from dual;
+--------------------+
| tan(90) |
+--------------------+
| -1.995200412208242 |
+--------------------+
1.10 LN, LOG
mysql> select ln(2) from dual;
+--------------------+
| ln(2) |
+--------------------+
| 0.6931471805599453 |
+--------------------+
mysql> select log(2) from dual;
+--------------------+
| log(2) |
+--------------------+
| 0.6931471805599453 |
+--------------------+
1.11 MOD
mysql> select mod(4,3) from dual;
+----------+
| mod(4,3) |
+----------+
| 1 |
+----------+
1 row in set (0.00 sec)
mysql> select mod(4,2) from dual;
+----------+
| mod(4,2) |
+----------+
| 0 |
+----------+
1.10 EXP
mysql> select exp(2) from dual;
+------------------+
| exp(2) |
+------------------+
| 7.38905609893065 |
+------------------+
mysql> select exp(-2) from dual;
+--------------------+
| exp(-2) |
+--------------------+
| 0.1353352832366127 |
+--------------------+
mysql> select exp(0) from dual;
+--------+
| exp(0) |
+--------+
| 1 |
+--------+
mysql> select exp(0) from dual;
+--------+
| exp(0) |
+--------+
| 1 |
+--------+
mysql> select exp(1) from dual;
+-------------------+
| exp(1) |
+-------------------+
| 2.718281828459045 |
+-------------------+
2.Date Functions
mysql> SELECT CURRENT_DATE FROM DUAL;
+--------------+
| CURRENT_DATE |
+--------------+
| 2022-11-21 |
+--------------+
mysql> SELECT EXTRACT(MONTH FROM
CURRENT_DATE ) FROM DUAL;
+-----------------------------------+
| EXTRACT(MONTH FROM CURRENT_DATE ) |
+-----------------------------------+
| 11 |
+-----------------------------------+
mysql> SELECT EXTRACT(YEAR FROM CURRENT_DATE)
FROM DUAL;
+---------------------------------+
| EXTRACT(YEAR FROM CURRENT_DATE) |
+---------------------------------+
| 2022 |
+---------------------------------+
mysql> SELECT CURRENT_DATE FROM DUAL;
+--------------+
| CURRENT_DATE |
+--------------+
| 2022-11-21 |
+--------------+
mysql> SELECT EXTRACT(YEAR FROM CURRENT_DATE)
FROM DUAL;
+---------------------------------+
| EXTRACT(YEAR FROM CURRENT_DATE) |
+---------------------------------+
| 2022 |
+---------------------------------+
mysql> SELECT EXTRACT(DAY FROM CURRENT_DATE)
FROM DUAL;
+--------------------------------+
| EXTRACT(DAY FROM CURRENT_DATE) |
+--------------------------------+
| 21 |
+--------------------------------+
mysql> SELECT EXTRACT(MONTH FROM CURRENT_DATE)
FROM DUAL;
+----------------------------------+
| EXTRACT(MONTH FROM CURRENT_DATE) |
+----------------------------------+
| 11 |
3. String Functions
mysql> select ascii('t') from dual;
+------------+
| ascii('t') |
+------------+
| 116 |
+------------+
mysql> select ascii('a') from dual;
+------------+
| ascii('a') |
+------------+
| 97 |
+------------+
mysql> select ascii('A') from dual;
+------------+
| ascii('A') |
+------------+
| 65 |
mysql> SELECT lower('ASIET - COLLEGE OF ENGINEERING..')
from dual;
+-------------------------------------------+
| lower('ASIET - COLLEGE OF ENGINEERING..') |
+-------------------------------------------+
| asiet - college of engineering.. |
mysql> SELECT REPLACE('HELLO','H','K') FROM DUAL;
+--------------------------+
| REPLACE('HELLO','H','K') |
+--------------------------+
| KELLO |
+--------------------------+
mysql> SELECT TRIM('A' FROM 'ANACONDA') FROM DUAL;
+---------------------------+
| TRIM('A' FROM 'ANACONDA') |
+---------------------------+
| NACOND |
+------------------------
