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
 **********************************************************************
    ->     -> ->UC2 : Ability to create a employee payroll table in the payroll service
    ->     ->       database to manage employee payrolls
    ->     -> **********************************************************************
    -> ^C
mysql>
mysql> create table employee_payroll ( id INT unsigned NOT NULL AUTO_INCREMENT, fName varchar(30), lName(30), start date , salary double,PRIMARY KEY  (id));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '(30), start date , salary double,PRIMARY KEY  (id))' at line 1
mysql> create table employee_payroll ( id INT unsigned NOT NULL AUTO_INCREMENT, fName varchar(30), lName varchar(30), start date , salary double,PRIMARY KEY  (id));
Query OK, 0 rows affected (0.10 sec)

mysql> DESCRIBE employee_payroll
    -> DESCRIBE employee_payroll;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'DESCRIBE employee_payroll' at line 2
mysql> DES employee_payroll;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'DES employee_payroll' at line 1
mysql> DESc employee_payroll;
+--------+--------------+------+-----+---------+----------------+
| Field  | Type         | Null | Key | Default | Extra          |
+--------+--------------+------+-----+---------+----------------+
| id     | int unsigned | NO   | PRI | NULL    | auto_increment |
| fName  | varchar(30)  | YES  |     | NULL    |                |
| lName  | varchar(30)  | YES  |     | NULL    |                |
| start  | date         | YES  |     | NULL    |                |
| salary | double       | YES  |     | NULL    |                |
+--------+--------------+------+-----+---------+----------------+
5 rows in set (0.02 sec)

 ***********************************************************************
    -> ->UC3 : Ability to create employee payroll data in the payroll service
    ->       database as part of CURD Operation - Use payroll_service database
    -> ***********************************************************************
    ->
    -> ^C
mysql> INSERT INTO employee_payroll (fName,lName,start,salary) VALUES('Bill','gate','2018-01-03',1930238),('Terisa','William','2019-11-13',13527982), ('Charlie','gates','2020-05-21',3232267),('jeff','gates','2020-05-20',324343267);
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0
mysql> SELECT * FROM employee_payroll;
+----+---------+---------+------------+-----------+
| id | fName   | lName   | start      | salary    |
+----+---------+---------+------------+-----------+
|  1 | Bill    | gate    | 2018-01-03 |   1930238 |
|  2 | Terisa  | William | 2019-11-13 |  13527982 |
|  3 | Charlie | gates   | 2020-05-21 |   3232267 |
|  4 | jeff    | gates   | 2020-05-20 | 324343267 |
+----+---------+---------+------------+-----------+
4 rows in set (0.00 sec)

 *********************************************************************
  UC4 : Retrive all the data from the employee_payroll table
 *********************************************************************
  
mysql> SELECT * FROM employee_payroll;
+----+---------+---------+------------+-----------+
| id | fName   | lName   | start      | salary    |
+----+---------+---------+------------+-----------+
|  1 | Bill    | gate    | 2018-01-03 |   1930238 |
|  2 | Terisa  | William | 2019-11-13 |  13527982 |
|  3 | Charlie | gates   | 2020-05-21 |   3232267 |
|  4 | jeff    | gates   | 2020-05-20 | 324343267 |
+----+---------+---------+------------+-----------+
4 rows in set (0.00 sec)
 *********************************************************************
    UC5: Ability to retrieve salary data for a particular employee as
    well as all employees who have joined in a particular data range
    from the payroll service database
 *********************************************************************
    
mysql> SELECT salary FROM employee_payroll WHERE name = 'Bill';
ERROR 1054 (42S22): Unknown column 'name' in 'where clause'
mysql> SELECT salary FROM employee_payroll WHERE fname = 'Bill';
+---------+
| salary  |
+---------+
| 1930238 |
+---------+
1 row in set (0.01 sec)

mysql> SELECT * FROM employee_payroll WHERE start BETWEEN CAST('2018-01-01' AS DATE) AND DATE(NOW());
+----+---------+---------+------------+-----------+
| id | fName   | lName   | start      | salary    |
+----+---------+---------+------------+-----------+
|  1 | Bill    | gate    | 2018-01-03 |   1930238 |
|  2 | Terisa  | William | 2019-11-13 |  13527982 |
|  3 | Charlie | gates   | 2020-05-21 |   3232267 |
|  4 | jeff    | gates   | 2020-05-20 | 324343267 |
+----+---------+---------+------------+-----------+
4 rows in set (0.01 sec)

mysql> SELECT * FROM employee_payroll WHERE start BETWEEN CAST('2020-01-01' AS DATE) AND DATE(NOW());
+----+---------+-------+------------+-----------+
| id | fName   | lName | start      | salary    |
+----+---------+-------+------------+-----------+
|  3 | Charlie | gates | 2020-05-21 |   3232267 |
|  4 | jeff    | gates | 2020-05-20 | 324343267 |
+----+---------+-------+------------+-----------+
2 rows in set (0.00 sec)
 *****************************************************************
   UC6 :Ability to add Gender to Employee Payroll Table and Update
     the Rows to reflect the correct Employee Gender
 *****************************************************************
  
mysql> ALTER TABLE employee_payroll ADD gender CHAR(7) AFTER lname;
Query OK, 0 rows affected (0.13 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> describe employee_payroll;
+--------+--------------+------+-----+---------+----------------+
| Field  | Type         | Null | Key | Default | Extra          |
+--------+--------------+------+-----+---------+----------------+
| id     | int unsigned | NO   | PRI | NULL    | auto_increment |
| fName  | varchar(30)  | YES  |     | NULL    |                |
| lName  | varchar(30)  | YES  |     | NULL    |                |
| gender | char(7)      | YES  |     | NULL    |                |
| start  | date         | YES  |     | NULL    |                |
| salary | double       | YES  |     | NULL    |                |
+--------+--------------+------+-----+---------+----------------+
6 rows in set (0.02 sec)

mysql> update employee_payroll set gender = 'Female' WHERE name = 'Terisa';
ERROR 1054 (42S22): Unknown column 'name' in 'where clause'
mysql> update employee_payroll set gender = 'Female' WHERE fname = 'Terisa';
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM employee_payroll;
+----+---------+---------+--------+------------+-----------+
| id | fName   | lName   | gender | start      | salary    |
+----+---------+---------+--------+------------+-----------+
|  1 | Bill    | gate    | NULL   | 2018-01-03 |   1930238 |
|  2 | Terisa  | William | Female | 2019-11-13 |  13527982 |
|  3 | Charlie | gates   | NULL   | 2020-05-21 |   3232267 |
|  4 | jeff    | gates   | NULL   | 2020-05-20 | 324343267 |
+----+---------+---------+--------+------------+-----------+
4 rows in set (0.00 sec)

mysql> update employee_payroll set gender = 'male' WHERE fname = 'jeff';
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employee_payroll set gender = 'male' WHERE fname = 'chalie';
Query OK, 0 rows affected (0.01 sec)
Rows matched: 0  Changed: 0  Warnings: 0

mysql> update employee_payroll set gender = 'male' WHERE fname = 'bill';
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM employee_payroll;
+----+---------+---------+--------+------------+-----------+
| id | fName   | lName   | gender | start      | salary    |
+----+---------+---------+--------+------------+-----------+
|  1 | Bill    | gate    | male   | 2018-01-03 |   1930238 |
|  2 | Terisa  | William | Female | 2019-11-13 |  13527982 |
|  3 | Charlie | gates   | NULL   | 2020-05-21 |   3232267 |
|  4 | jeff    | gates   | male   | 2020-05-20 | 324343267 |
+----+---------+---------+--------+------------+-----------+
4 rows in set (0.00 sec)

mysql> update employee_payroll set gender = 'male' WHERE fname = 'charlie';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM employee_payroll;
+----+---------+---------+--------+------------+-----------+
| id | fName   | lName   | gender | start      | salary    |
+----+---------+---------+--------+------------+-----------+
|  1 | Bill    | gate    | male   | 2018-01-03 |   1930238 |
|  2 | Terisa  | William | Female | 2019-11-13 |  13527982 |
|  3 | Charlie | gates   | male   | 2020-05-21 |   3232267 |
|  4 | jeff    | gates   | male   | 2020-05-20 | 324343267 |
+----+---------+---------+--------+------------+-----------+
4 rows in set (0.00 sec)

mysql> update employee_payroll set salary = '3000000.00' WHERE fname = 'Terisa';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM employee_payroll;
+----+---------+---------+--------+------------+-----------+
| id | fName   | lName   | gender | start      | salary    |
+----+---------+---------+--------+------------+-----------+
|  1 | Bill    | gate    | male   | 2018-01-03 |   1930238 |
|  2 | Terisa  | William | Female | 2019-11-13 |   3000000 |
|  3 | Charlie | gates   | male   | 2020-05-21 |   3232267 |
|  4 | jeff    | gates   | male   | 2020-05-20 | 324343267 |
+----+---------+---------+--------+------------+-----------+
4 rows in set (0.00 sec)

