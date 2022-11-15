sqlplus

system
rezah

mengapus TABLE
DROP TABLE data_mahasiswa;
DROP view v_data_mahasiswa;
DROP TABLE v_data_mahasiswa;
DROP TABLE barangreza50420900;

1.  a. Buatlah table DATA_MAHASISWA 
    b. Masukkan data pada table DATA_MAHASISWA


CREATE TABLE data_mahasiswa(
    npm number(15),
    nama varchar2(30),
    tempat_lahir varchar2(30),
    tgl_lahir date,
    alamat varchar2(50),
    jurusan varchar2(50),
    ipk number(3,2));

desc data_mahasiswa;

INSERT all
    into data_mahasiswa values(53210985, 'dio hari susilo','bogor', '16-aug-1992', 'jl.kenari', 'teknik informatika', 2.92)
    into data_mahasiswa values(18111525, 'hardi', 'jakarta', '11-july-1993', 'jl.jereng', 'sistem informasi', 3.76)
    into data_mahasiswa values(52409380, 'fadel andreza', 'depok', '21-april-1991', 'jl.diuk', 'teknik informatika', 3.15)
    into data_mahasiswa values(12111274, 'dwiki arif witoro', 'bandung', '10-dec-1993', 'kampiung pulo', 'sistem informasi', 3.98)
    into data_mahasiswa values(36112029, 'rara dwi natasha', 'jakarta', '10-may-1994', 'jl.kapuk', 'managemen informatika', 4.00)
    select * from dual;

select * from data_mahasiswa;

2. Buatlah view dengan nama V_Data_Mahasiswa menggunakan tabel 
    DATA_MAHASISWA

CREATE view v_data_mahasiswa as
    select npm, nama, tempat_lahir, tgl_lahir, alamat, jurusan, ipk from data_mahasiswa where jurusan = 'teknik informatika';

SELECT * FROM v_data_mahasiswa;

3. Buatlah view V_Data_Mahasiswa dengan mengganti struktur pada view dengan 
struktur pada view NPM, NAMA dialiaskan NAME, TEMPAT_LAHIR, 
TGL_LAHIR, ALAMAT dialiaskan ADDRESS, JURUSAN, IPK dialiaskan GPA.

create or replace view v_data_mahasiswa as
    select npm, nama name, tempat_lahir, tgl_lahir, alamat address, jurusan, ipk as gpa from data_mahasiswa;

SELECT * FROM v_data_mahasiswa;


4. Tampilkan struktur view V_Data_Mahasiswa yang baru.
desc v_data_mahasiswa;

select view_name, view_type, view_type_owner from user_views;

5. Hapus view tersebut
drop view v_data_mahasiswa;

SELECT * FROM v_data_mahasiswa;