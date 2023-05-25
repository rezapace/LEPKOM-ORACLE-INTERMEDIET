Copyright (c) 1982, 2006, Oracle.  All Rights Reserved.

Enter user-name: system
Enter password:

Connected to:
Oracle Database 10g Enterprise Edition Release 10.2.0.3.0 - Production
With the Partitioning, OLAP and Data Mining options

SQL> create table emp_50420900 as select * from emp;

Table created.

SQL> select * from dept;

    DEPTNO DNAME          LOC
---------- -------------- -------------
        10 ACCOUNTING     NEW YORK
        20 RESEARCH       DALLAS
        30 SALES          CHICAGO
        40 OPERATIONS     BOSTON

SQL> create table dept_50420900 as select * from dept;

Table created.

SQL> select * from emp;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM
---------- ---------- --------- ---------- --------- ---------- ----------
    DEPTNO
----------
      7369 SMITH      CLERK           7902 17-DEC-80        800
        20

      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300
        30

      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500
        30


     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM
---------- ---------- --------- ---------- --------- ---------- ----------
    DEPTNO
----------
      7566 JONES      MANAGER         7839 02-APR-81       2975
        20

      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400
        30

      7698 BLAKE      MANAGER         7839 01-MAY-81       2850
        30


     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM
---------- ---------- --------- ---------- --------- ---------- ----------
    DEPTNO
----------
      7782 CLARK      MANAGER         7839 09-JUN-81       2450
        10

      7788 SCOTT      ANALYST         7566 09-DEC-82       3000
        20

      7839 KING       PRESIDENT            17-NOV-81       5000
        10


     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM
---------- ---------- --------- ---------- --------- ---------- ----------
    DEPTNO
----------
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500
        30

      7876 ADAMS      CLERK           7788 12-JAN-83       1100
        20

      7900 JAMES      CLERK           7698 03-DEC-81        950
        30


     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM
---------- ---------- --------- ---------- --------- ---------- ----------
    DEPTNO
----------
      7902 FORD       ANALYST         7566 03-DEC-81       3000
        20

      7934 MILLER     CLERK           7782 23-JAN-82       1300
        10


14 rows selected.

SQL> create table salgrade_50420900 as select * from salgrade;

Table created.

SQL> select * from salgrade;

     GRADE      LOSAL      HISAL
---------- ---------- ----------
         1        700       1200
         2       1201       1400
         3       1401       2000
         4       2001       3000
         5       3001       9999

SQL> select emp_50420900.ename nama, dept_50420900.dname departemen, emp_50420900.sal gaji,salgrade_50420900.grade golongan
  2  from emp_50420900, dept_50420900, salgrade_50420900
  3  where emp_50420900.sal between salgrade_50420900.losal and salgrade_50420900.hisal
  4  and dept_50420900.dname = 'RESEARCH';

NAMA       DEPARTEMEN           GAJI   GOLONGAN
---------- -------------- ---------- ----------
SMITH      RESEARCH              800          1
ADAMS      RESEARCH             1100          1
JAMES      RESEARCH              950          1
WARD       RESEARCH             1250          2
MARTIN     RESEARCH             1250          2
MILLER     RESEARCH             1300          2
ALLEN      RESEARCH             1600          3
TURNER     RESEARCH             1500          3
JONES      RESEARCH             2975          4
BLAKE      RESEARCH             2850          4
CLARK      RESEARCH             2450          4

NAMA       DEPARTEMEN           GAJI   GOLONGAN
---------- -------------- ---------- ----------
SCOTT      RESEARCH             3000          4
FORD       RESEARCH             3000          4
KING       RESEARCH             5000          5

14 rows selected.

SQL> select empno, ename, deptno
  2  from emp_50420900
  3  where deptno in(select deptno from emp_50420900 where ename like '%O%')
  4  and ename <> 'FORD'
  5  order by ename desc;

     EMPNO ENAME          DEPTNO
---------- ---------- ----------
      7369 SMITH              20
      7788 SCOTT              20
      7566 JONES              20
      7876 ADAMS              20

SQL> select emp_50420900.ename nama, emp_50420900.job pekerjaan, emp_50420900.hiredate tgl_masuk,
  2  emp_50420900.sal gaji
  3  from emp_50420900
  4  where emp_50420900.sal > 2500
  5  order by emp_50420900.ename asc;

NAMA       PEKERJAAN TGL_MASUK       GAJI
---------- --------- --------- ----------
BLAKE      MANAGER   01-MAY-81       2850
FORD       ANALYST   03-DEC-81       3000
JONES      MANAGER   02-APR-81       2975
KING       PRESIDENT 17-NOV-81       5000
SCOTT      ANALYST   09-DEC-82       3000

SQL> Muhammad Reza Hidayat 50420900





Microsoft Windows [Version 10.0.19042.685]
(c) 2020 Microsoft Corporation. All rights reserved.

C:\Windows\system32>sqlplus

SQL*Plus: Release 10.2.0.3.0 - Production on Sun Nov 13 17:58:09 2022

Copyright (c) 1982, 2006, Oracle.  All Rights Reserved.

Enter user-name: system
Enter password:

Connected to:
Oracle Database 10g Enterprise Edition Release 10.2.0.3.0 - Production
With the Partitioning, OLAP and Data Mining options

SQL> set serveroutput on
SQL> ed reza.sql

SQL> start reza.sql
Enter value for nama: reza
old   8: nama := '&nama';
new   8: nama := 'reza';
Enter value for jenis: minuman
old   9: jenis := '&jenis';
new   9: jenis := 'minuman';
Enter value for jumlah: 200
old  10: jumlah := &jumlah;
new  10: jumlah := 200;
======================================
NAMA                    : reza
Barang Yang Dibeli      : minuman
Jumlah Barang           : 200
Diskon                  : 15%
Total Pembayaran        : 1445000
======================================

PL/SQL procedure successfully completed.

SQL>