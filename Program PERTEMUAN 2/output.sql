Microsoft Windows [Version 10.0.19042.685]
(c) 2020 Microsoft Corporation. All rights reserved.

C:\Windows\system32>sqlplus

SQL*Plus: Release 10.2.0.3.0 - Production on Wed Oct 26 05:41:47 2022

Copyright (c) 1982, 2006, Oracle.  All Rights Reserved.

Enter user-name: system
Enter password:

Connected to:
Oracle Database 10g Enterprise Edition Release 10.2.0.3.0 - Production
With the Partitioning, OLAP and Data Mining options

SQL> CREATE TABLE supplier_reza_50420900(
  2      kodesupp number(4),
  3      namasupp varchar2(30) not null,
  4      alamat varchar2(50) not null,
  5      telephone number(12) not null,
  6      constraint supplier_kodesupp_pk primary key(kodesupp));

Table created.

SQL> DESC supplier_reza_50420900;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 KODESUPP                                  NOT NULL NUMBER(4)
 NAMASUPP                                  NOT NULL VARCHAR2(30)
 ALAMAT                                    NOT NULL VARCHAR2(50)
 TELEPHONE                                 NOT NULL NUMBER(12)

SQL> INSERT all
  2      into supplier_reza_50420900 values(10,'PT. arfinisa','Jl. matahari no.2 bekasi','0218201234')
  3      into supplier_reza_50420900 values(20,'PT. arfa reza','Jl. bulan no.4 jakarta','02183893030')
  4      into supplier_reza_50420900 values(30,'PT. arfiginung','Jl. bintang no.6 bandung','0324909088')
  5      into supplier_reza_50420900 values(40,'PT. leo','Jl. meteor no.8 ambon','0351122334')
  6      select * from dual;

4 rows created.

SQL> SELECT * FROM supplier_reza_50420900;

  KODESUPP NAMASUPP
---------- ------------------------------
ALAMAT                                              TELEPHONE
-------------------------------------------------- ----------
        10 PT. arfinisa
Jl. matahari no.2 bekasi                            218201234

        20 PT. arfa reza
Jl. bulan no.4 jakarta                             2183893030

        30 PT. arfiginung
Jl. bintang no.6 bandung                            324909088


  KODESUPP NAMASUPP
---------- ------------------------------
ALAMAT                                              TELEPHONE
-------------------------------------------------- ----------
        40 PT. leo
Jl. meteor no.8 ambon                               351122334


SQL> CREATE TABLE barangreza50420900(
  2      kodebrg number(4),
  3      namabrg varchar2(50),
  4      Jenisbrg varchar2(50),
  5      harga number(6) not null,
  6      kodesupp number(4),
  7      constraint barangreza50420900_kodebrg_pk primary key(kodebrg),
  8      constraint barangreza50420900_namabrg_uk unique(namabrg),
  9      constraint barangreza50420900_jenisbrg_ck check(Jenisbrg in ('makanan','minuman','mainan','alat tulis')),
 10      constraint barangreza50420900_kodesupp_fk foreign key(kodesupp) references supplier_reza_50420900(kodesupp));

Table created.

SQL> desc barangreza50420900;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 KODEBRG                                   NOT NULL NUMBER(4)
 NAMABRG                                            VARCHAR2(50)
 JENISBRG                                           VARCHAR2(50)
 HARGA                                     NOT NULL NUMBER(6)
 KODESUPP                                           NUMBER(4)

SQL> INSERT all
  2      into barangreza50420900 values(1001,'aqua 1500ml','minuman',1500,10)
  3      into barangreza50420900 values(1002,'indomie kari ayam','makanan',1200,10)
  4      into barangreza50420900 values(1003,'buku tulis sidu 38','alat tulis',2000,20)
  5      into barangreza50420900 values(1004,'boneka barbie','mainan',10000,40)
  6      SELECT * FROM dual;

4 rows created.

SQL> SELECT * FROM barangreza50420900;

   KODEBRG NAMABRG
---------- --------------------------------------------------
JENISBRG                                                HARGA   KODESUPP
-------------------------------------------------- ---------- ----------
      1001 aqua 1500ml
minuman                                                  1500         10

      1002 indomie kari ayam
makanan                                                  1200         10

      1003 buku tulis sidu 38
alat tulis                                               2000         20


   KODEBRG NAMABRG
---------- --------------------------------------------------
JENISBRG                                                HARGA   KODESUPP
-------------------------------------------------- ---------- ----------
      1004 boneka barbie
mainan                                                  10000         40


SQL>