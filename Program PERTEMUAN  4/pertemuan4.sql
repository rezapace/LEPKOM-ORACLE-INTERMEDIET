sqlplus

system
rezah

mengapus TABLE
DROP TABLE dept;
DROP TABLE dept_50420900_seq;


desc dept;
select * from dept_50420900_seq;

1. Membuat sebuah sequence untuk tabel DEPT dengan nama DEPT_ID_SEQ. Sequence 
tersebut dimulai dari 60 dan nilainya selalu bertambah 10 denga nilai maksimum 500. 
(POIN=20) 

    create sequence dept_50420900_seq
    increment by 10 
    start with 60
    maxvalue 500
    nocache
    nocycle;


2. Mengkonfirmasi atau hanya menampilkan sequence_name, min_value, max_value, 
increment_by, dan last_number dari sequence dengan nama DEPT_ID_SEQ. 
(POIN=20) 

    select sequence_name, max_value, increment_by, last_number from user_sequences where sequence_name = 'DEPT_50420900_SEQ';



3. Memodifikasi sequence DEPT_ID_SEQ, dengan mengubah nilai penambahnya 
menjadi lima, dan nilai maksimalnya menjadi 600. (POIN=20) 

    alter sequence dept_50420900_seq
    increment by 5
    maxvalue 600
    nocache
    nocycle;


4. Memasukan sebuah data pada tabel DEPT dengan nomor departemen menggunakan 
sequence DEPT_ID_SEQ, nama departemen adalah IT, dan lokasi nya berada di 
INDONESIA. (POIN=20) 
    CREATE TABLE dept
    (
        dept_id NUMBER(2) PRIMARY KEY,
        dept_name VARCHAR2(20),
        location VARCHAR2(20)
    );

    INSERT INTO dept(dept_id, dept_name, location)
    VALUES (dept_50420900_seq.nextval, 'IT', 'INDONESIA');


    SELECT * FROM dept;


5. Membuat sebuah index untuk kolom DEPTNO dan DNAME pada tabel 
DEPT dengan nama DEPT_ID_IDX. (POIN=20)

    create index dept_id_idx on dept(dept_id, dept_name);