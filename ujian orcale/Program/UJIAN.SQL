-- SEBELUM MENGERJAKAN SOAL DIBAWAH INI, SILAHKAN TAMPILKAN TABEL 
-- EMP, DEPT DAN SALGRADE DENGAN MENGGUNAKAN PERINTAH SELECT

create table emp_50420900 as select * from emp;
select * from dept;

create table dept_50420900 as select * from dept;
select * from emp;

create table salgrade_50420900 as select * from salgrade;
select * from salgrade;


-- 1. TAMPILKAN ENAME SEBAGAI NAMA, DNAME SEBAGAI DEPARTEMEN, 
-- SAL SEBAGAI GAJI, GRADE SEBAGAI GOLONGAN . (10 Point ) 
--  DARI TABEL EMP, DEPT DAN SALGRADE 
--  DIMANA DNAME ADALAH RESEARCH 
--  SAL BERADA DIANTARA NILAI HISAL DAN LOSAL YANG ADA 
-- DITABEL SALGRADE
select emp_50420900.ename nama, dept_50420900.dname departemen, emp_50420900.sal gaji,salgrade_50420900.grade golongan
from emp_50420900, dept_50420900, salgrade_50420900
where emp_50420900.sal between salgrade_50420900.losal and salgrade_50420900.hisal
and dept_50420900.dname = 'RESEARCH';


-- 2. DENGAN MENGGUNAKAN SUBQUERY, TAMPILKAN EMPNO SEBAGAI 
-- NOMER PEGAWAI, ENAME SEBAGAI NAMA, DEPTNO SEBAGAI NOMER 
-- DEPARTEMEN. (10 Point ) 
--  DARI TABEL EMP 
--  DIMANA PEGAWAI TERSEBUT BERADA DALAM DEPTNO YANG 
-- MEMILIKI ENAME MENGANDUNG HURUF O 
--  UNTUK NAMA FORD TIDAK DITAMPILKAN 
--  DIURUTKAN BERDASARKAN ENAME
select empno, ename, deptno
from emp_50420900
where deptno in(select deptno from emp_50420900 where ename like '%O%')
and ename <> 'FORD'
order by ename desc;



-- 3. TAMPILKAN ENAME SEBAGAI NAMA, JOB SEBAGAI PEKERJAAN, 
-- HIREDATE SEBAGAI TGL MASUK, DAN SAL SEBAGAI GAJI DARI TABEL 
-- EMP DIMANA SAL LEBIH BESAR DARI 2500 DAN DIURUTKAN 
-- BERDASARKAN ENAME. (10 Point )
select emp_50420900.ename nama, emp_50420900.job pekerjaan, emp_50420900.hiredate tgl_masuk,
emp_50420900.sal gaji
from emp_50420900
where emp_50420900.sal > 2500
order by emp_50420900.ename asc;


-- start
set serveroutput on
ed reza.sql
start reza.sql

-- program
set serveroutput on
declare
nama varchar(50);
jenis varchar(10);
jumlah number;
diskon number(5);
total number(10);
begin
nama := '&nama';
jenis := '&jenis';
jumlah := &jumlah;
if (jenis = 'buku') then
total := jumlah * 5000;
elsif (jenis = 'makanan') then
total := jumlah * 10000;
elsif (jenis = 'minuman') then
total := jumlah * 8500;
else
dbms_output.put_line('Input Salah');
end if;
if (jumlah < 100) then
diskon := 0;
elsif (jumlah > 100) then
total :=total -(total * 0.15);
diskon := 15;
elsif (jumlah > 200) then
total :=total -(total * 0.20);
diskon := 20;
elsif (jumlah > 350) then
total :=total -(total* 0.30);
diskon := 30;
else
dbms_output.put_line('Diskon Error');
end if;
dbms_output.put_line('======================================');
dbms_output.put_line(' NAMA			: '||nama);
dbms_output.put_line(' Barang Yang Dibeli	: '||jenis);
dbms_output.put_line(' Jumlah Barang		: '||jumlah);
dbms_output.put_line(' Diskon			: '||diskon||'%');
dbms_output.put_line(' Total Pembayaran	: '||total);
dbms_output.put_line('======================================');
end;
/
