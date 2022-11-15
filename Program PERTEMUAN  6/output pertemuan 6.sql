Microsoft Windows [Version 10.0.19042.685]
(c) 2020 Microsoft Corporation. All rights reserved.

C:\Windows\system32>sqlplus

SQL*Plus: Release 10.2.0.3.0 - Production on Wed Oct 26 21:32:35 2022

Copyright (c) 1982, 2006, Oracle.  All Rights Reserved.

Enter user-name: system
Enter password:

Connected to:
Oracle Database 10g Enterprise Edition Release 10.2.0.3.0 - Production
With the Partitioning, OLAP and Data Mining options

SQL> SELECT ename, hiredate FROM emp
  2  WHERE job IN(SELECT job FROM emp WHERE ename = 'BLAKE')
  3  and ename <> 'BLAKE';

ENAME      HIREDATE
---------- ---------
CLARK      09-JUN-81
JONES      02-APR-81

SQL> select ename, hiredate from emp
  2  where sal >(select sal from emp where empno = 7698)
  3  and empno <> 7698;

ENAME      HIREDATE
---------- ---------
JONES      02-APR-81
SCOTT      09-DEC-82
KING       17-NOV-81
FORD       03-DEC-81

SQL> select empno, ename from emp
  2  where sal >(select avg (sal) from emp )
  3  ORDER BY sal DESC;

     EMPNO ENAME
---------- ----------
      7839 KING
      7902 FORD
      7788 SCOTT
      7566 JONES
      7698 BLAKE
      7782 CLARK

6 rows selected.

SQL> select emp.ename, emp.deptno, emp.job FROM emp,dept where emp.deptno = dept.deptno and dept.loc = 'DALLAS';

ENAME          DEPTNO JOB
---------- ---------- ---------
SMITH              20 CLERK
JONES              20 MANAGER
SCOTT              20 ANALYST
ADAMS              20 CLERK
FORD               20 ANALYST

SQL> SELECT empno, ename FROM emp
  2  WHERE deptno IN(SELECT deptno FROM emp WHERE ename LIKE '%T%')
  3  and sal >(select avg (sal) from emp );

     EMPNO ENAME
---------- ----------
      7902 FORD
      7788 SCOTT
      7566 JONES
      7698 BLAKE

SQL>