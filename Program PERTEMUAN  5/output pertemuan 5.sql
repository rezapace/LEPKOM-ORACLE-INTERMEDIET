Microsoft Windows [Version 10.0.19042.685]
(c) 2020 Microsoft Corporation. All rights reserved.

C:\Windows\system32>SQLPLUS

SQL*Plus: Release 10.2.0.3.0 - Production on Wed Oct 26 20:56:48 2022

Copyright (c) 1982, 2006, Oracle.  All Rights Reserved.

Enter user-name: system
Enter password:

Connected to:
Oracle Database 10g Enterprise Edition Release 10.2.0.3.0 - Production
With the Partitioning, OLAP and Data Mining options

SQL> select emp.ename, dept.deptno, dept.dname from emp, dept where dept.deptno = emp.deptno;

ENAME          DEPTNO DNAME
---------- ---------- --------------
SMITH              20 RESEARCH
ALLEN              30 SALES
WARD               30 SALES
JONES              20 RESEARCH
MARTIN             30 SALES
BLAKE              30 SALES
CLARK              10 ACCOUNTING
SCOTT              20 RESEARCH
KING               10 ACCOUNTING
TURNER             30 SALES
ADAMS              20 RESEARCH

ENAME          DEPTNO DNAME
---------- ---------- --------------
JAMES              30 SALES
FORD               20 RESEARCH
MILLER             10 ACCOUNTING

14 rows selected.

SQL> select emp.ename, dept.dname from emp, dept where emp.ename like '%A%' and dept.deptno = emp.deptno;

ENAME      DNAME
---------- --------------
ALLEN      SALES
WARD       SALES
MARTIN     SALES
BLAKE      SALES
CLARK      ACCOUNTING
ADAMS      RESEARCH
JAMES      SALES

7 rows selected.

SQL> select emp.ename, emp.job, dept.deptno, dept.dname from emp, dept where dept.loc = 'DALLAS' and dept.deptno = emp.deptno;

ENAME      JOB           DEPTNO DNAME
---------- --------- ---------- --------------
SMITH      CLERK             20 RESEARCH
JONES      MANAGER           20 RESEARCH
SCOTT      ANALYST           20 RESEARCH
ADAMS      CLERK             20 RESEARCH
FORD       ANALYST           20 RESEARCH

SQL> select emp.ename, dept.dname, dept.loc from emp, dept where emp.comm is not null and dept.deptno = emp.deptno;

ENAME      DNAME          LOC
---------- -------------- -------------
MARTIN     SALES          CHICAGO
WARD       SALES          CHICAGO
ALLEN      SALES          CHICAGO

SQL> select distinct emp.job, dept.loc from emp, dept where dept.deptno = 30 and dept.deptno = emp.deptno;

JOB       LOC
--------- -------------
SALESMAN  CHICAGO
MANAGER   CHICAGO
CLERK     CHICAGO

SQL>