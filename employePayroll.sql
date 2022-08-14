Welcome to Employee pay roll
mysql> **********************************************************************
    -> -> UC1 : Ability to create a payroll service database
    -> **********************************************************************
    -> ^C
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| address_book       |
| addressbook        |
| addressbookservice |
| information_schema |
| mysql              |
| performance_schema |
+--------------------+
6 rows in set (0.01 sec)

mysql> create database EmployeePayroll;
Query OK, 1 row affected (0.02 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| address_book       |
| addressbook        |
| addressbookservice |
| employeepayroll    |
| information_schema |
| mysql              |
| performance_schema |
+--------------------+
7 rows in set (0.00 sec)

mysql> use employeepayroll;
Database changed
mysql> select database();
+-----------------+
| database()      |
+-----------------+
| employeepayroll |
+-----------------+
1 row in set (0.00 sec)

mysql>
