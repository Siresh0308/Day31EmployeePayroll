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

 *****************************************************************
 UC7: Ability to find sum, average, min, max and number of male
       and female employees
 *****************************************************************

mysql> SELECT AVG(salary) FROM employee_payroll WHERE gender = 'Male' GROUP BY gender;
+--------------------+
| AVG(salary)        |
+--------------------+
| 109835257.33333333 |
+--------------------+
1 row in set (0.00 sec)

mysql> SELECT AVG(salary) FROM employee_payroll GROUP BY gender;
+--------------------+
| AVG(salary)        |
+--------------------+
| 109835257.33333333 |
|            3000000 |
+--------------------+
2 rows in set (0.01 sec)

mysql> SELECT gender, COUNT(name) FROM employee_payroll GROUP BY gender;
ERROR 1054 (42S22): Unknown column 'name' in 'field list'
mysql> SELECT gender, COUNT(fname) FROM employee_payroll GROUP BY gender;
+--------+--------------+
| gender | COUNT(fname) |
+--------+--------------+
| male   |            3 |
| Female |            1 |
+--------+--------------+
2 rows in set (0.00 sec)

mysql> SELECT gender, SUM(salary) FROM employee_payroll GROUP BY gender;
+--------+-------------+
| gender | SUM(salary) |
+--------+-------------+
| male   |   329505772 |
| Female |     3000000 |
+--------+-------------+
2 rows in set (0.00 sec)

mysql> SELECT gender, MIN(salary) FROM employee_payroll GROUP BY gender;
+--------+-------------+
| gender | MIN(salary) |
+--------+-------------+
| male   |     1930238 |
| Female |     3000000 |
+--------+-------------+
2 rows in set (0.01 sec)

mysql> SELECT gender, MAX(salary) FROM employee_payroll GROUP BY gender;
+--------+-------------+
| gender | MAX(salary) |
+--------+-------------+
| male   |   324343267 |
| Female |     3000000 |
+--------+-------------+
2 rows in set (0.00 sec)

mysql> Desc employee_payroll;
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
6 rows in set (0.50 sec)
****************************************************************************
UC 8 : Ability to extend employee_payroll data to store employee information
         like employee phone, address and department
   ****************************************************************************
mysql> ALTER TABLE employee_payroll ADD Phone int(13);^C
mysql> ALTER TABLE employee_payroll ADD Phone int(13);
Query OK, 0 rows affected, 1 warning (0.10 sec)
Records: 0  Duplicates: 0  Warnings: 1

mysql> ALTER TABLE employee_payroll ADD Department varchar(250);
Query OK, 0 rows affected (0.07 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table employee_payroll add address varchar(250);
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from employee_payroll;
+----+---------+---------+--------+------------+-----------+-------+------------+---------+
| id | fName   | lName   | gender | start      | salary    | Phone | Department | address |
+----+---------+---------+--------+------------+-----------+-------+------------+---------+
|  1 | Bill    | gate    | male   | 2018-01-03 |   1930238 |  NULL | NULL       | NULL    |
|  2 | Terisa  | William | Female | 2019-11-13 |   3000000 |  NULL | NULL       | NULL    |
|  3 | Charlie | gates   | male   | 2020-05-21 |   3232267 |  NULL | NULL       | NULL    |
|  4 | jeff    | gates   | male   | 2020-05-20 | 324343267 |  NULL | NULL       | NULL    |
+----+---------+---------+--------+------------+-----------+-------+------------+---------+
4 rows in set (0.00 sec)
********************************************************************************
UC 9 : Ability to extend employee_payroll table to have Basic Pay,Deductions,
       Taxable Pay,Income Tax, Net Pay.
********************************************************************************
mysql> alter table employee_payroll add basicPay Double;
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table employ_payroll Add Deduction Double;e
ERROR 1146 (42S02): Table 'employeepayroll.employ_payroll' doesn't exist
    -> alter table employ_payroll Add Deduction Double;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'e
alter table employ_payroll Add Deduction Double' at line 1
mysql> alter table employ_payroll Add Deduction Double;
ERROR 1146 (42S02): Table 'employeepayroll.employ_payroll' doesn't exist
mysql> alter table employee_payroll Add Deduction Double;
Query OK, 0 rows affected (0.06 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table employee_payroll Add TaxablePay Double;
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table employee_payroll Add IncomeTax Double;
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table employee_payroll Add NetPay Double;
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from employee_payroll;
+----+---------+---------+--------+------------+-----------+-------+------------+---------+----------+-----------+------------+-----------+--------+
| id | fName   | lName   | gender | start      | salary    | Phone | Department | address | basicPay | Deduction | TaxablePay | IncomeTax | NetPay |
+----+---------+---------+--------+------------+-----------+-------+------------+---------+----------+-----------+------------+-----------+--------+
|  1 | Bill    | gate    | male   | 2018-01-03 |   1930238 |  NULL | NULL       | NULL    |     NULL |      NULL |       NULL |      NULL |   NULL |
|  2 | Terisa  | William | Female | 2019-11-13 |   3000000 |  NULL | NULL       | NULL    |     NULL |      NULL |       NULL |      NULL |   NULL |
|  3 | Charlie | gates   | male   | 2020-05-21 |   3232267 |  NULL | NULL       | NULL    |     NULL |      NULL |       NULL |      NULL |   NULL |
|  4 | jeff    | gates   | male   | 2020-05-20 | 324343267 |  NULL | NULL       | NULL    |     NULL |      NULL |       NULL |      NULL |   NULL |
+----+---------+---------+--------+------------+-----------+-------+------------+---------+----------+-----------+------------+-----------+--------+
4 rows in set (0.01 sec)
********************************************************************************
UC 9 : Ability to extend employee_payroll table to have Basic Pay,Deductions,
       Taxable Pay,Income Tax, Net Pay.
********************************************************************************
mysql> alter table employee_payroll add basicPay Double;
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table employ_payroll Add Deduction Double;e
ERROR 1146 (42S02): Table 'employeepayroll.employ_payroll' doesn't exist
    -> alter table employ_payroll Add Deduction Double;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'e
alter table employ_payroll Add Deduction Double' at line 1
mysql> alter table employ_payroll Add Deduction Double;
ERROR 1146 (42S02): Table 'employeepayroll.employ_payroll' doesn't exist
mysql> alter table employee_payroll Add Deduction Double;
Query OK, 0 rows affected (0.06 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table employee_payroll Add TaxablePay Double;
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table employee_payroll Add IncomeTax Double;
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table employee_payroll Add NetPay Double;
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from employee_payroll;
+----+---------+---------+--------+------------+-----------+-------+------------+---------+----------+-----------+------------+-----------+--------+
| id | fName   | lName   | gender | start      | salary    | Phone | Department | address | basicPay | Deduction | TaxablePay | IncomeTax | NetPay |
+----+---------+---------+--------+------------+-----------+-------+------------+---------+----------+-----------+------------+-----------+--------+
|  1 | Bill    | gate    | male   | 2018-01-03 |   1930238 |  NULL | NULL       | NULL    |     NULL |      NULL |       NULL |      NULL |   NULL |
|  2 | Terisa  | William | Female | 2019-11-13 |   3000000 |  NULL | NULL       | NULL    |     NULL |      NULL |       NULL |      NULL |   NULL |
|  3 | Charlie | gates   | male   | 2020-05-21 |   3232267 |  NULL | NULL       | NULL    |     NULL |      NULL |       NULL |      NULL |   NULL |
|  4 | jeff    | gates   | male   | 2020-05-20 | 324343267 |  NULL | NULL       | NULL    |     NULL |      NULL |       NULL |      NULL |   NULL |
+----+---------+---------+--------+------------+-----------+-------+------------+---------+----------+-----------+------------+-----------+--------+
4 rows in set (0.01 sec)

mysql> alter table employee_payroll Add deduction  Double;
ERROR 1060 (42S21): Duplicate column name 'deduction'
mysql> INSERT INTO employee_payroll (fname, gender, salary, start, Phone, Department, Address, basicPay, Deduction, TaxablePay, IncomeTax, NetPAy) VALUES ('Terisa', 'F', 3000000.00, '2018-01-03', 985628, 'Marketing', 'Mumbai', 3000000.00, 1000000.00, 2000000.00, 500000.00, 15000000.00);
Query OK, 1 row affected (0.02 sec)

mysql> select * from employee_payroll;
+----+---------+---------+--------+------------+-----------+--------+------------+---------+----------+-----------+------------+-----------+----------+
| id | fName   | lName   | gender | start      | salary    | Phone  | Department | address | basicPay | Deduction | TaxablePay | IncomeTax | NetPay   |
+----+---------+---------+--------+------------+-----------+--------+------------+---------+----------+-----------+------------+-----------+----------+
|  1 | Bill    | gate    | male   | 2018-01-03 |   1930238 |   NULL | NULL       | NULL    |     NULL |      NULL |       NULL |      NULL |     NULL |
|  2 | Terisa  | William | Female | 2019-11-13 |   3000000 |   NULL | NULL       | NULL    |     NULL |      NULL |       NULL |      NULL |     NULL |
|  3 | Charlie | gates   | male   | 2020-05-21 |   3232267 |   NULL | NULL       | NULL    |     NULL |      NULL |       NULL |      NULL |     NULL |
|  4 | jeff    | gates   | male   | 2020-05-20 | 324343267 |   NULL | NULL       | NULL    |     NULL |      NULL |       NULL |      NULL |     NULL |
|  5 | Terisa  | NULL    | F      | 2018-01-03 |   3000000 | 985628 | Marketing  | Mumbai  |  3000000 |   1000000 |    2000000 |    500000 | 15000000 |
+----+---------+---------+--------+------------+-----------+--------+------------+---------+----------+-----------+------------+-----------+----------+
5 rows in set (0.00 sec)

mysql> update employee_payroll set Department = 'Sales' WHERE id = '2';
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from employee_payroll;
+----+---------+---------+--------+------------+-----------+--------+------------+---------+----------+-----------+------------+-----------+----------+
| id | fName   | lName   | gender | start      | salary    | Phone  | Department | address | basicPay | Deduction | TaxablePay | IncomeTax | NetPay   |
+----+---------+---------+--------+------------+-----------+--------+------------+---------+----------+-----------+------------+-----------+----------+
|  1 | Bill    | gate    | male   | 2018-01-03 |   1930238 |   NULL | NULL       | NULL    |     NULL |      NULL |       NULL |      NULL |     NULL |
|  2 | Terisa  | William | Female | 2019-11-13 |   3000000 |   NULL | Sales      | NULL    |     NULL |      NULL |       NULL |      NULL |     NULL |
|  3 | Charlie | gates   | male   | 2020-05-21 |   3232267 |   NULL | NULL       | NULL    |     NULL |      NULL |       NULL |      NULL |     NULL |
|  4 | jeff    | gates   | male   | 2020-05-20 | 324343267 |   NULL | NULL       | NULL    |     NULL |      NULL |       NULL |      NULL |     NULL |
|  5 | Terisa  | NULL    | F      | 2018-01-03 |   3000000 | 985628 | Marketing  | Mumbai  |  3000000 |   1000000 |    2000000 |    500000 | 15000000 |
+----+---------+---------+--------+------------+-----------+--------+------------+---------+----------+-----------+------------+-----------+----------+
5 rows in set (0.00 sec)

mysql> update employee_payroll set Department = 'Sales' WHERE id = '1';
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employee_payroll set Department = 'Marketing' WHERE id = '3';
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employee_payroll set Phone = '777582777' WHERE id = '3';
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employee_payroll set Phone = '827582777' WHERE id = '1' or '2';
Query OK, 5 rows affected (0.02 sec)
Rows matched: 5  Changed: 5  Warnings: 0

mysql> update employee_payroll set Address = 'Mumbai' WHERE id = '1' or '2' or '3' or '4';
Query OK, 4 rows affected (0.02 sec)
Rows matched: 5  Changed: 4  Warnings: 0

mysql> update employee_payroll set basicPay = 3000000.00 WHERE id = '1' or '2' or '3' or '4';
Query OK, 4 rows affected (0.00 sec)
Rows matched: 5  Changed: 4  Warnings: 0

mysql> select * from employee_payroll;
+----+---------+---------+--------+------------+-----------+-----------+------------+---------+----------+-----------+------------+-----------+----------+
| id | fName   | lName   | gender | start      | salary    | Phone     | Department | address | basicPay | Deduction | TaxablePay | IncomeTax | NetPay   |
+----+---------+---------+--------+------------+-----------+-----------+------------+---------+----------+-----------+------------+-----------+----------+
|  1 | Bill    | gate    | male   | 2018-01-03 |   1930238 | 827582777 | Sales      | Mumbai  |  3000000 |      NULL |       NULL |      NULL |     NULL |
|  2 | Terisa  | William | Female | 2019-11-13 |   3000000 | 827582777 | Sales      | Mumbai  |  3000000 |      NULL |       NULL |      NULL |     NULL |
|  3 | Charlie | gates   | male   | 2020-05-21 |   3232267 | 827582777 | Marketing  | Mumbai  |  3000000 |      NULL |       NULL |      NULL |     NULL |
|  4 | jeff    | gates   | male   | 2020-05-20 | 324343267 | 827582777 | NULL       | Mumbai  |  3000000 |      NULL |       NULL |      NULL |     NULL |
|  5 | Terisa  | NULL    | F      | 2018-01-03 |   3000000 | 827582777 | Marketing  | Mumbai  |  3000000 |   1000000 |    2000000 |    500000 | 15000000 |
+----+---------+---------+--------+------------+-----------+-----------+------------+---------+----------+-----------+------------+-----------+----------+
5 rows in set (0.01 sec)

mysql> update employee_payroll set lname = 'william' WHERE id = '5';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from employee_payroll;
+----+---------+---------+--------+------------+-----------+-----------+------------+---------+----------+-----------+------------+-----------+----------+
| id | fName   | lName   | gender | start      | salary    | Phone     | Department | address | basicPay | Deduction | TaxablePay | IncomeTax | NetPay   |
+----+---------+---------+--------+------------+-----------+-----------+------------+---------+----------+-----------+------------+-----------+----------+
|  1 | Bill    | gate    | male   | 2018-01-03 |   1930238 | 827582777 | Sales      | Mumbai  |  3000000 |      NULL |       NULL |      NULL |     NULL |
|  2 | Terisa  | William | Female | 2019-11-13 |   3000000 | 827582777 | Sales      | Mumbai  |  3000000 |      NULL |       NULL |      NULL |     NULL |
|  3 | Charlie | gates   | male   | 2020-05-21 |   3232267 | 827582777 | Marketing  | Mumbai  |  3000000 |      NULL |       NULL |      NULL |     NULL |
|  4 | jeff    | gates   | male   | 2020-05-20 | 324343267 | 827582777 | NULL       | Mumbai  |  3000000 |      NULL |       NULL |      NULL |     NULL |
|  5 | Terisa  | william | F      | 2018-01-03 |   3000000 | 827582777 | Marketing  | Mumbai  |  3000000 |   1000000 |    2000000 |    500000 | 15000000 |
+----+---------+---------+--------+------------+-----------+-----------+------------+---------+----------+-----------+------------+-----------+----------+
5 rows in set (0.00 sec)

mysql> update employee_payroll set gender = 'female' WHERE id = '5';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from employee_payroll;
+----+---------+---------+--------+------------+-----------+-----------+------------+---------+----------+-----------+------------+-----------+----------+
| id | fName   | lName   | gender | start      | salary    | Phone     | Department | address | basicPay | Deduction | TaxablePay | IncomeTax | NetPay   |
+----+---------+---------+--------+------------+-----------+-----------+------------+---------+----------+-----------+------------+-----------+----------+
|  1 | Bill    | gate    | male   | 2018-01-03 |   1930238 | 827582777 | Sales      | Mumbai  |  3000000 |      NULL |       NULL |      NULL |     NULL |
|  2 | Terisa  | William | Female | 2019-11-13 |   3000000 | 827582777 | Sales      | Mumbai  |  3000000 |      NULL |       NULL |      NULL |     NULL |
|  3 | Charlie | gates   | male   | 2020-05-21 |   3232267 | 827582777 | Marketing  | Mumbai  |  3000000 |      NULL |       NULL |      NULL |     NULL |
|  4 | jeff    | gates   | male   | 2020-05-20 | 324343267 | 827582777 | NULL       | Mumbai  |  3000000 |      NULL |       NULL |      NULL |     NULL |
|  5 | Terisa  | william | female | 2018-01-03 |   3000000 | 827582777 | Marketing  | Mumbai  |  3000000 |   1000000 |    2000000 |    500000 | 15000000 |
+----+---------+---------+--------+------------+-----------+-----------+------------+---------+----------+-----------+------------+-----------+----------+
5 rows in set (0.00 sec)

mysql> update employee_payroll set Department = 'Sales' WHERE id = '4';
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from employee_payroll;
+----+---------+---------+--------+------------+-----------+-----------+------------+---------+----------+-----------+------------+-----------+----------+
| id | fName   | lName   | gender | start      | salary    | Phone     | Department | address | basicPay | Deduction | TaxablePay | IncomeTax | NetPay   |
+----+---------+---------+--------+------------+-----------+-----------+------------+---------+----------+-----------+------------+-----------+----------+
|  1 | Bill    | gate    | male   | 2018-01-03 |   1930238 | 827582777 | Sales      | Mumbai  |  3000000 |      NULL |       NULL |      NULL |     NULL |
|  2 | Terisa  | William | Female | 2019-11-13 |   3000000 | 827582777 | Sales      | Mumbai  |  3000000 |      NULL |       NULL |      NULL |     NULL |
|  3 | Charlie | gates   | male   | 2020-05-21 |   3232267 | 827582777 | Marketing  | Mumbai  |  3000000 |      NULL |       NULL |      NULL |     NULL |
|  4 | jeff    | gates   | male   | 2020-05-20 | 324343267 | 827582777 | Sales      | Mumbai  |  3000000 |      NULL |       NULL |      NULL |     NULL |
|  5 | Terisa  | william | female | 2018-01-03 |   3000000 | 827582777 | Marketing  | Mumbai  |  3000000 |   1000000 |    2000000 |    500000 | 15000000 |
+----+---------+---------+--------+------------+-----------+-----------+------------+---------+----------+-----------+------------+-----------+----------+
5 rows in set (0.01 sec)

mysql> update employee_payroll set Phone = '777582777' WHERE id = '3';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employee_payroll set Phone = '777582827' WHERE id = '1';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employee_payroll set Phone = '982582827' WHERE id = '4';
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employee_payroll set Phone = '9825826727' WHERE id = '5';
ERROR 1264 (22003): Out of range value for column 'Phone' at row 1
mysql> update employee_payroll set Phone = '982582672' WHERE id = '5';
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employee_payroll set Deductions = 9000000 WHERE id = '1';
ERROR 1054 (42S22): Unknown column 'Deductions' in 'field list'
mysql> update employee_payroll set Deduction = 9000000 WHERE id = '1';
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employee_payroll set Deduction = 8000000 WHERE id = '2';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employee_payroll set Deduction = 8070000 WHERE id = '3';
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employee_payroll set Deduction = 6070000 WHERE id = '4';
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employee_payroll set Deduction = 4070000 WHERE id = '5';
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employee_payroll set TaxablePay = 2100000 WHERE id = '1';
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employee_payroll set TaxablePay = 2100070 WHERE id = '2';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employee_payroll set TaxablePay = 2104070 WHERE id = '3';
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employee_payroll set TaxablePay = 2404070 WHERE id = '4';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employee_payroll set TaxablePay =1404070 WHERE id = '5';
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employee_payroll set IncomeTax = 500000.00 WHERE id = '1' or '2' or '3' or '4' or '5';
Query OK, 4 rows affected (0.02 sec)
Rows matched: 5  Changed: 4  Warnings: 0

mysql> update employee_payroll set NetPay = 1600000 WHERE id = '1';
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employee_payroll set NetPay = 1700000 WHERE id = '2';
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employee_payroll set NetPay = 1800000 WHERE id = '3';
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employee_payroll set NetPay = 2800000 WHERE id = '4';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employee_payroll set NetPay = 3800000 WHERE id = '5';
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM employee_payroll;
+----+---------+---------+--------+------------+-----------+-----------+------------+---------+----------+-----------+------------+-----------+---------+
| id | fName   | lName   | gender | start      | salary    | Phone     | Department | address | basicPay | Deduction | TaxablePay | IncomeTax | NetPay  |
+----+---------+---------+--------+------------+-----------+-----------+------------+---------+----------+-----------+------------+-----------+---------+
|  1 | Bill    | gate    | male   | 2018-01-03 |   1930238 | 777582827 | Sales      | Mumbai  |  3000000 |   9000000 |    2100000 |    500000 | 1600000 |
|  2 | Terisa  | William | Female | 2019-11-13 |   3000000 | 827582777 | Sales      | Mumbai  |  3000000 |   8000000 |    2100070 |    500000 | 1700000 |
|  3 | Charlie | gates   | male   | 2020-05-21 |   3232267 | 777582777 | Marketing  | Mumbai  |  3000000 |   8070000 |    2104070 |    500000 | 1800000 |
|  4 | jeff    | gates   | male   | 2020-05-20 | 324343267 | 982582827 | Sales      | Mumbai  |  3000000 |   6070000 |    2404070 |    500000 | 2800000 |
|  5 | Terisa  | william | female | 2018-01-03 |   3000000 | 982582672 | Marketing  | Mumbai  |  3000000 |   4070000 |    1404070 |    500000 | 3800000 |
+----+---------+---------+--------+------------+-----------+-----------+------------+---------+----------+-----------+------------+-----------+---------+
5 rows in set (0.00 sec)
********************************************************************************************************************************
UC 10 And 11 : Ability to make Terissa as part of Sales and Marketing Department.

********************************************************************************************************************************

mysql> update employee_payroll set Department = 'Sales' WHERE id = '2';
Query OK, 0 rows affected (0.01 sec)
Rows matched: 1  Changed: 0  Warnings: 0

mysql> CREATE TABLE Department ( department varchar(250) NOT NULL, PRIMARY KEY (department) );
Query OK, 0 rows affected (0.05 sec)

mysql> INSERT INTO Department ( department ) VALUES ('Sales'),('Marketing');
Query OK, 2 rows affected (0.02 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM Department;
+------------+
| department |
+------------+
| Marketing  |
| Sales      |
+------------+
2 rows in set (0.00 sec)

mysql>  CREATE TABLE Employee ( id int, compID int, PhoneNumbe BIGINT(13), Address varchar(25), gender char(1),PRIMARY KEY (id) );
Query OK, 0 rows affected, 1 warning (0.04 sec)

mysql> INSERT INTO Employee (id, compID, PhoneNumbe, Address, gender) VALUES ( 1, 10, 7775827779, 'Mubai', 'F'),(2, 11, 7775828889, 'Mumbai', 'M');
Query OK, 2 rows affected (0.02 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM Employee;
+----+--------+------------+---------+--------+
| id | compID | PhoneNumbe | Address | gender |
+----+--------+------------+---------+--------+
|  1 |     10 | 7775827779 | Mubai   | F      |
|  2 |     11 | 7775828889 | Mumbai  | M      |
+----+--------+------------+---------+--------+
2 rows in set (0.00 sec)

mysql> CREATE TABLE Emp_Department (empID int, Depart varchar(250) NOT NULL, FOREIGN KEY (empID) REFERENCES Employee (id),FOREIGN KEY (Depart) REFERENCES Department (department), PRIMARY KEY (empID, Depart));
Query OK, 0 rows affected (0.06 sec)

mysql> describe Emp_Department;
+--------+--------------+------+-----+---------+-------+
| Field  | Type         | Null | Key | Default | Extra |
+--------+--------------+------+-----+---------+-------+
| empID  | int          | NO   | PRI | NULL    |       |
| Depart | varchar(250) | NO   | PRI | NULL    |       |
+--------+--------------+------+-----+---------+-------+
2 rows in set (0.02 sec)

mysql>  INSERT INTO Emp_Department (empID, Depart) VALUES (1, 'Marketing');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Emp_Department (empID, Depart) VALUES (1, 'Sales');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Emp_Department (empID, Depart) VALUES (2, 'Sales');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Emp_Department (empID, Depart) VALUES (2, 'Marketing');
Query OK, 1 row affected (0.01 sec)

mysql> SELECT * FROM Emp_Department;
+-------+-----------+
| empID | Depart    |
+-------+-----------+
|     1 | Marketing |
|     2 | Marketing |
|     1 | Sales     |
|     2 | Sales     |
+-------+-----------+
4 rows in set (0.00 sec)
