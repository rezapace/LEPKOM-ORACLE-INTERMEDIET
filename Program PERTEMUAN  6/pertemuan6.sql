sqlplus

system
rezah
SELECT * FROM PEGAWAI;



1. Tampilkan data nama pegawai dan tanggal mulai bekerja untuk semua pegawai yang bekerja di 
department yang sama dengan pegawai bernama ‘BLAKE’. Untuk pegawai BLAKE tidak perlu ditampilkan 
pada output. (POIN=20)

SELECT ename, hiredate FROM emp
WHERE job IN(SELECT job FROM emp WHERE ename = 'BLAKE')
and ename <> 'BLAKE';

2. Tampilkan nama dan tanggal mulai bekerja pegawai yang memiliki gaji lebih besar daripada pegawai 
dengan nomor pegawai 7698. Untuk pegawai 7698 tidak perlu ditampilkan pada output. (POIN=20)

select ename, hiredate from emp
where sal >(select sal from emp where empno = 7698)
and empno <> 7698;

3. Tampilkan nomor dan nama pegawai untuk semua pegawai yang gajinya lebih besar dari gaji ratarata. Tampilkan secara menurun berdasarkan besar gaji. (POIN=20)

select empno, ename from emp
where sal >(select avg (sal) from emp )
ORDER BY sal DESC;

4. Tampilkan nama pegawai, nomor department dan pekerjaan untuk semua pegawai yang department 
tempatnya bekerja berlokasi di kota ‘DALLAS’ . (POIN=20)

select emp.ename, emp.deptno, emp.job FROM emp,dept where emp.deptno = dept.deptno and dept.loc = 'DALLAS';

5. Tampilkan nomor dan nama pegawai untuk semua pegawai yang bekerja di department yang sama 
dengan pegawai yang memiliki nama yang mengandung huruf ‘T’, dan gaji yang dimiliki lebih besar 
daripada ratarata gaji. (POIN=20)

SELECT empno, ename FROM emp
WHERE deptno IN(SELECT deptno FROM emp WHERE ename LIKE '%T%')
and sal >(select avg (sal) from emp );






scrip di bawah buat yang ngak bisa munculin data nya ya

untuk data awal sebener nya udah ada cuma kalo data nya eror maka pake program di bawah ini tinggal di paste aja ngab

drop table emp;
drop table dept;
drop table salgrade;

CREATE TABLE EMP
       (EMPNO NUMBER(4) NOT NULL,
        ENAME VARCHAR2(10),
        JOB VARCHAR2(9),
        MGR NUMBER(4),
        HIREDATE DATE,
        SAL NUMBER(7, 2),
        COMM NUMBER(7, 2),
        DEPTNO NUMBER(2));

INSERT INTO EMP VALUES
        (7369, 'SMITH',  'CLERK',     7902,
        TO_DATE('17-DEC-1980', 'DD-MON-YYYY'),  800, NULL, 20);
INSERT INTO EMP VALUES
        (7499, 'ALLEN',  'SALESMAN',  7698,
        TO_DATE('20-FEB-1981', 'DD-MON-YYYY'), 1600,  300, 30);
INSERT INTO EMP VALUES
        (7521, 'WARD',   'SALESMAN',  7698,
        TO_DATE('22-FEB-1981', 'DD-MON-YYYY'), 1250,  500, 30);
INSERT INTO EMP VALUES
        (7566, 'JONES',  'MANAGER',   7839,
        TO_DATE('2-APR-1981', 'DD-MON-YYYY'),  2975, NULL, 20);
INSERT INTO EMP VALUES
        (7654, 'MARTIN', 'SALESMAN',  7698,
        TO_DATE('28-SEP-1981', 'DD-MON-YYYY'), 1250, 1400, 30);
INSERT INTO EMP VALUES
        (7698, 'BLAKE',  'MANAGER',   7839,
        TO_DATE('1-MAY-1981', 'DD-MON-YYYY'),  2850, NULL, 30);
INSERT INTO EMP VALUES
        (7782, 'CLARK',  'MANAGER',   7839,
        TO_DATE('9-JUN-1981', 'DD-MON-YYYY'),  2450, NULL, 10);
INSERT INTO EMP VALUES
        (7788, 'SCOTT',  'ANALYST',   7566,
        TO_DATE('09-DEC-1982', 'DD-MON-YYYY'), 3000, NULL, 20);
INSERT INTO EMP VALUES
        (7839, 'KING',   'PRESIDENT', NULL,
        TO_DATE('17-NOV-1981', 'DD-MON-YYYY'), 5000, NULL, 10);
INSERT INTO EMP VALUES
        (7844, 'TURNER', 'SALESMAN',  7698,
        TO_DATE('8-SEP-1981', 'DD-MON-YYYY'),  1500, NULL, 30);
INSERT INTO EMP VALUES
        (7876, 'ADAMS',  'CLERK',     7788,
        TO_DATE('12-JAN-1983', 'DD-MON-YYYY'), 1100, NULL, 20);
INSERT INTO EMP VALUES
        (7900, 'JAMES',  'CLERK',     7698,
        TO_DATE('3-DEC-1981', 'DD-MON-YYYY'),   950, NULL, 30);
INSERT INTO EMP VALUES
        (7902, 'FORD',   'ANALYST',   7566,
        TO_DATE('3-DEC-1981', 'DD-MON-YYYY'),  3000, NULL, 20);
INSERT INTO EMP VALUES
        (7934, 'MILLER', 'CLERK',     7782,
        TO_DATE('23-JAN-1982', 'DD-MON-YYYY'), 1300, NULL, 10);

CREATE TABLE DEPT
       (DEPTNO NUMBER(2),
        DNAME VARCHAR2(14),
        LOC VARCHAR2(13) );

INSERT INTO DEPT VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO DEPT VALUES (20, 'RESEARCH',   'DALLAS');
INSERT INTO DEPT VALUES (30, 'SALES',      'CHICAGO');
INSERT INTO DEPT VALUES (40, 'OPERATIONS', 'BOSTON');

CREATE TABLE SALGRADE
        (GRADE NUMBER,
         LOSAL NUMBER,
         HISAL NUMBER);

INSERT INTO SALGRADE VALUES (1,  700, 1200);
INSERT INTO SALGRADE VALUES (2, 1201, 1400);
INSERT INTO SALGRADE VALUES (3, 1401, 2000);
INSERT INTO SALGRADE VALUES (4, 2001, 3000);
INSERT INTO SALGRADE VALUES (5, 3001, 9999);

COMMIT;

alter table emp add constraint emp_pk primary key (empno);
alter table dept add constraint dept_pk primary key (deptno);
alter table emp add constraint emp_fk foreign key (deptno) references dept (deptno);