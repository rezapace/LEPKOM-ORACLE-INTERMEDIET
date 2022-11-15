Microsoft Windows [Version 10.0.19042.685]
(c) 2020 Microsoft Corporation. All rights reserved.

C:\Windows\system32>sqlplus

SQL*Plus: Release 10.2.0.3.0 - Production on Wed Oct 26 16:56:17 2022

Copyright (c) 1982, 2006, Oracle.  All Rights Reserved.

Enter user-name: system
Enter password:

Connected to:
Oracle Database 10g Enterprise Edition Release 10.2.0.3.0 - Production
With the Partitioning, OLAP and Data Mining options

SQL>     create sequence dept_50420900_seq
  2      increment by 10
  3      start with 60
  4      maxvalue 500
  5      nocache
  6      nocycle;

Sequence created.

SQL> select sequence_name, max_value, increment_by, last_number from user_sequences where sequence_name = 'DEPT_50420900_SEQ';

SEQUENCE_NAME                   MAX_VALUE INCREMENT_BY LAST_NUMBER
------------------------------ ---------- ------------ -----------
DEPT_50420900_SEQ                     500           10          60


SQL>     alter sequence dept_50420900_seq
  2      increment by 5
  3      maxvalue 600
  4      nocache
  5      nocycle;

Sequence altered.

SQL>     CREATE TABLE dept
  2      (
  3          dept_id NUMBER(2) PRIMARY KEY,
  4          dept_name VARCHAR2(20),
  5          location VARCHAR2(20)
  6      );

Table created.

SQL>     INSERT INTO dept(dept_id, dept_name, location)
  2      VALUES (dept_50420900_seq.nextval, 'IT', 'INDONESIA');

1 row created.

SQL> SELECT * FROM dept;

   DEPT_ID DEPT_NAME            LOCATION
---------- -------------------- --------------------
        55 IT                   INDONESIA

SQL> create index dept_id_idx on dept(deptno, dname);
create index dept_id_idx on dept(deptno, dname)
                                         *
ERROR at line 1:
ORA-00904: "DNAME": invalid identifier


SQL> create index dept_id_idx on dept(dept_id, dept_name);

Index created.

SQL>