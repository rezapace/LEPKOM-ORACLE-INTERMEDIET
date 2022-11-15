sqlplus

system
rezah

mengapus TABLE
DROP TABLE supplier_reza_50420900;
DROP TABLE barangreza50420900;
--1

CREATE TABLE supplier_reza_50420900(
    kodesupp number(4),
    namasupp varchar2(30) not null,
    alamat varchar2(50) not null,
    telephone number(12) not null,
    constraint supplier_kodesupp_pk primary key(kodesupp));

DESC supplier_reza_50420900;

INSERT all
    into supplier_reza_50420900 values(10,'PT. arfinisa','Jl. matahari no.2 bekasi','0218201234')
    into supplier_reza_50420900 values(20,'PT. arfa reza','Jl. bulan no.4 jakarta','02183893030')
    into supplier_reza_50420900 values(30,'PT. arfiginung','Jl. bintang no.6 bandung','0324909088')
    into supplier_reza_50420900 values(40,'PT. leo','Jl. meteor no.8 ambon','0351122334')
    select * from dual;

SELECT * FROM supplier_reza_50420900;

--2
CREATE TABLE barangreza50420900(
    kodebrg number(4),
    namabrg varchar2(50),
    Jenisbrg varchar2(50),
    harga number(6) not null,
    kodesupp number(4),
    constraint barangreza50420900_kodebrg_pk primary key(kodebrg),
    constraint barangreza50420900_namabrg_uk unique(namabrg),
    constraint barangreza50420900_jenisbrg_ck check(Jenisbrg in ('makanan','minuman','mainan','alat tulis')),
    constraint barangreza50420900_kodesupp_fk foreign key(kodesupp) references supplier_reza_50420900(kodesupp));

desc barangreza50420900;

INSERT all
    into barangreza50420900 values(1001,'aqua 1500ml','minuman',1500,10)
    into barangreza50420900 values(1002,'indomie kari ayam','makanan',1200,10)
    into barangreza50420900 values(1003,'buku tulis sidu 38','alat tulis',2000,20)
    into barangreza50420900 values(1004,'boneka barbie','mainan',10000,40)
    SELECT * FROM dual;

SELECT * FROM barangreza50420900;


