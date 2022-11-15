Microsoft Windows [Version 10.0.19042.685]
(c) 2020 Microsoft Corporation. All rights reserved.

C:\Windows\system32>sqlplus

SQL*Plus: Release 10.2.0.3.0 - Production on Wed Oct 26 16:37:21 2022

Copyright (c) 1982, 2006, Oracle.  All Rights Reserved.

Enter user-name: system
Enter password:

Connected to:
Oracle Database 10g Enterprise Edition Release 10.2.0.3.0 - Production
With the Partitioning, OLAP and Data Mining options

SQL> CREATE TABLE data_mahasiswa(
  2      npm number(15),
  3      nama varchar2(30),
  4      tempat_lahir varchar2(30),
  5      tgl_lahir date,
  6      alamat varchar2(50),
  7      jurusan varchar2(50),
  8      ipk number(3,2));

Table created.

SQL> desc data_mahasiswa;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 NPM                                                NUMBER(15)
 NAMA                                               VARCHAR2(30)
 TEMPAT_LAHIR                                       VARCHAR2(30)
 TGL_LAHIR                                          DATE
 ALAMAT                                             VARCHAR2(50)
 JURUSAN                                            VARCHAR2(50)
 IPK                                                NUMBER(3,2)

SQL> INSERT all
  2      into data_mahasiswa values(53210985, 'dio hari susilo','bogor', '16-aug-1992', 'jl.kenari', 'Teknik Informatika', 2.92)
  3      into data_mahasiswa values(18111525, 'hardi', 'jakarta', '11-july-1993', 'jl.jereng', 'sistem informasi', 3.76)
  4      into data_mahasiswa values(52409380, 'fadel andreza', 'depok', '21-april-1991', 'jl.diuk', 'teknik informatika', 3.15)
  5      into data_mahasiswa values(12111274, 'dwiki arif witoro', 'bandung', '10-dec-1993', 'kampiung pulo', 'sistem informasi', 3.98)
  6      into data_mahasiswa values(36112029, 'rara dwi natasha', 'jakarta', '10-may-1994', 'jl.kapuk', 'managemen informatika', 4.00)
  7      select * from dual;

5 rows created.

SQL> select * from data_mahasiswa;

       NPM NAMA                           TEMPAT_LAHIR
---------- ------------------------------ ------------------------------
TGL_LAHIR ALAMAT
--------- --------------------------------------------------
JURUSAN                                                   IPK
-------------------------------------------------- ----------
  53210985 dio hari susilo                bogor
16-AUG-92 jl.kenari
Teknik Informatika                                       2.92

  18111525 hardi                          jakarta
11-JUL-93 jl.jereng
sistem informasi                                         3.76

       NPM NAMA                           TEMPAT_LAHIR
---------- ------------------------------ ------------------------------
TGL_LAHIR ALAMAT
--------- --------------------------------------------------
JURUSAN                                                   IPK
-------------------------------------------------- ----------

  52409380 fadel andreza                  depok
21-APR-91 jl.diuk
teknik informatika                                       3.15

  12111274 dwiki arif witoro              bandung
10-DEC-93 kampiung pulo

       NPM NAMA                           TEMPAT_LAHIR
---------- ------------------------------ ------------------------------
TGL_LAHIR ALAMAT
--------- --------------------------------------------------
JURUSAN                                                   IPK
-------------------------------------------------- ----------
sistem informasi                                         3.98

  36112029 rara dwi natasha               jakarta
10-MAY-94 jl.kapuk
managemen informatika                                       4


SQL> CREATE view v_data_mahasiswa as
  2      select npm, nama, tempat_lahir, tgl_lahir, alamat, jurusan, ipk from data_mahasiswa where jurusan = 'teknik informatika';

View created.

SQL> SELECT * FROM v_data_mahasiswa;

       NPM NAMA                           TEMPAT_LAHIR
---------- ------------------------------ ------------------------------
TGL_LAHIR ALAMAT
--------- --------------------------------------------------
JURUSAN                                                   IPK
-------------------------------------------------- ----------
  52409380 fadel andreza                  depok
21-APR-91 jl.diuk
teknik informatika                                       3.15


SQL> create or replace view v_data_mahasiswa as
  2      select npm, nama name, tempat_lahir, tgl_lahir, alamat address, jurusan, ipk as gpa from data_mahasiswa;

View created.

SQL> SELECT * FROM v_data_mahasiswa;

       NPM NAME                           TEMPAT_LAHIR
---------- ------------------------------ ------------------------------
TGL_LAHIR ADDRESS
--------- --------------------------------------------------
JURUSAN                                                   GPA
-------------------------------------------------- ----------
  53210985 dio hari susilo                bogor
16-AUG-92 jl.kenari
Teknik Informatika                                       2.92

  18111525 hardi                          jakarta
11-JUL-93 jl.jereng
sistem informasi                                         3.76

       NPM NAME                           TEMPAT_LAHIR
---------- ------------------------------ ------------------------------
TGL_LAHIR ADDRESS
--------- --------------------------------------------------
JURUSAN                                                   GPA
-------------------------------------------------- ----------

  52409380 fadel andreza                  depok
21-APR-91 jl.diuk
teknik informatika                                       3.15

  12111274 dwiki arif witoro              bandung
10-DEC-93 kampiung pulo

       NPM NAME                           TEMPAT_LAHIR
---------- ------------------------------ ------------------------------
TGL_LAHIR ADDRESS
--------- --------------------------------------------------
JURUSAN                                                   GPA
-------------------------------------------------- ----------
sistem informasi                                         3.98

  36112029 rara dwi natasha               jakarta
10-MAY-94 jl.kapuk
managemen informatika                                       4


SQL> desc v_data_mahasiswa;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 NPM                                                NUMBER(15)
 NAME                                               VARCHAR2(30)
 TEMPAT_LAHIR                                       VARCHAR2(30)
 TGL_LAHIR                                          DATE
 ADDRESS                                            VARCHAR2(50)
 JURUSAN                                            VARCHAR2(50)
 GPA                                                NUMBER(3,2)

SQL> select view_name, view_type, view_type_owner from user_views;

VIEW_NAME                      VIEW_TYPE
------------------------------ ------------------------------
VIEW_TYPE_OWNER
------------------------------
MVIEW_WORKLOAD


MVIEW_FILTER


MVIEW_LOG



VIEW_NAME                      VIEW_TYPE
------------------------------ ------------------------------
VIEW_TYPE_OWNER
------------------------------
MVIEW_FILTERINSTANCE


MVIEW_RECOMMENDATIONS


MVIEW_EVALUATIONS



VIEW_NAME                      VIEW_TYPE
------------------------------ ------------------------------
VIEW_TYPE_OWNER
------------------------------
MVIEW_EXCEPTIONS


AQ$_DEF$_AQCALL_F


AQ$DEF$_AQCALL



VIEW_NAME                      VIEW_TYPE
------------------------------ ------------------------------
VIEW_TYPE_OWNER
------------------------------
AQ$_DEF$_AQERROR_F


AQ$DEF$_AQERROR


PRODUCT_PRIVS



VIEW_NAME                      VIEW_TYPE
------------------------------ ------------------------------
VIEW_TYPE_OWNER
------------------------------
V_DATA_MAHASISWA



13 rows selected.

SQL> drop view v_data_mahasiswa;

View dropped.

SQL> SELECT * FROM v_data_mahasiswa;
SELECT * FROM v_data_mahasiswa
              *
ERROR at line 1:
ORA-00942: table or view does not exist


SQL>