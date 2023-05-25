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