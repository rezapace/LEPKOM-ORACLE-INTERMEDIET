SET serveroutput ON
declare
cursor cur_emp(sal_param number) is
select ename, sal
from emp
where sal > sal_param
order by sal desc;
namaku emp.ename%type;
gajiku emp.sal%type;
begin
open cur_emp(2501);
loop
fetch cur_emp into namaku, gajiku;
exit when cur_emp%notfound;
dbms_output.put_line(namaku||'memiliki gaji :'||gajiku);
end loop;
close cur_emp;
end;
/


declare
cursor cur_emp_del(emp_id varchar2) is
select empno
from emp
where empno = emp_id
for update;
id emp.empno%type;
begin
open cur_emp_del('7788');
fetch cur_emp_del into id;
if cur_emp_del%found then
delete from emp 
where current of cur_emp_del;
dbms_output.put_line('emphidayat');
dbms_output.put_line('data sukses dihapus');
commit;
else
dbms_output.put_line('data not found');
end if;
close cur_emp_del;
end;
/

SET serveroutput ON
declare
cursor cur_emp_update(comp_emp_id number) is
select sal from emp
where empno = comp_emp_id
for update of sal;
id emp.empno%type;
begin
open cur_emp_update(7900);
fetch cur_emp_update into id;
if sql%notfound then
dbms_output.put_line('karyawan tidak di temukan');
else
update emp
set sal = sal * 2
where current of cur_emp_update;
dbms_output.put_line('berhasil di update');
end if;
close cur_emp_update;
end;
/
