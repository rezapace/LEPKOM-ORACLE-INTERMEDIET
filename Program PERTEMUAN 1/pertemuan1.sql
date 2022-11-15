SQL> CREATE TABLE PEGAWAI(
  2  ID_PEGAWAI NUMBER(5) NOT NULL,
  3  NAMA_PEGAWAI VARCHAR2(15) NOT NULL,
  4  JABATAN VARCHAR2(10) NOT NULL);

Table created.

SQL> desc PEGAWAI;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 ID_PEGAWAI                                NOT NULL NUMBER(5)
 NAMA_PEGAWAI                              NOT NULL VARCHAR2(15)
 JABATAN                                   NOT NULL VARCHAR2(10)

SQL> ALTER TABLE PEGAWAI ADD( GAJI VARCHAR(25) NOT NULL, KETERANGAN VARCHAR(50) NOT NULL);

Table altered.

SQL> desc PEGAWAI;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 ID_PEGAWAI                                NOT NULL NUMBER(5)
 NAMA_PEGAWAI                              NOT NULL VARCHAR2(15)
 JABATAN                                   NOT NULL VARCHAR2(10)
 GAJI                                      NOT NULL VARCHAR2(25)
 KETERANGAN                                NOT NULL VARCHAR2(50)

SQL> ALTER TABLE PEGAWAI DROP COLUMN KETERANGAN;

Table altered.

SQL> desc PEGAWAI;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 ID_PEGAWAI                                NOT NULL NUMBER(5)
 NAMA_PEGAWAI                              NOT NULL VARCHAR2(15)
 JABATAN                                   NOT NULL VARCHAR2(10)
 GAJI                                      NOT NULL VARCHAR2(25)

SQL> RENAME PEGAWAI TO KETERANGAN;

Table renamed.

SQL> desc KETERANGAN;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 ID_PEGAWAI                                NOT NULL NUMBER(5)
 NAMA_PEGAWAI                              NOT NULL VARCHAR2(15)
 JABATAN                                   NOT NULL VARCHAR2(10)
 GAJI                                      NOT NULL VARCHAR2(25)

SQL> ALTER TABLE KETERANGAN MODIFY GAJI NUMBER(15);

Table altered.

SQL> desc KETERANGAN;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 ID_PEGAWAI                                NOT NULL NUMBER(5)
 NAMA_PEGAWAI                              NOT NULL VARCHAR2(15)
 JABATAN                                   NOT NULL VARCHAR2(10)
 GAJI                                      NOT NULL NUMBER(15)

SQL> TRUNCATE TABLE KETERANGAN;

Table truncated.

SQL> desc KETERANGAN;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 ID_PEGAWAI                                NOT NULL NUMBER(5)
 NAMA_PEGAWAI                              NOT NULL VARCHAR2(15)
 JABATAN                                   NOT NULL VARCHAR2(10)
 GAJI                                      NOT NULL NUMBER(15)

SQL> DROP TABLE KETERANGAN;

Table dropped.

SQL> desc KETERANGAN;
ERROR:
ORA-04043: object KETERANGAN does not exist


SQL>