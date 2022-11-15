SQL> declare
  2  name varchar2(100);
  3  salary number;
  4  begin
  5  select ename, sal into name, salary from emp where empno = 7788;
  6  if salary > 4500 then
  7  raise_application_error(-20001, 'salary is too high');
  8  end if;
  9  dbms_output.put_line(name ||' '|| salary);
 10  end;
 11  /

PL/SQL procedure successfully completed.

SQL> declare
  2  name varchar2(100);
  3  salary number;
  4  begin
  5  select ename, sal into name, salary from emp where empno = 7788;
  6  if salary > 4500 then
  7  raise_application_error(-20001, 'salary is too high');
  8  end if;
  9  dbms_output.put_line(name ||' '|| salary);
 10  end;
 11  /

PL/SQL procedure successfully completed.

SQL> declare
  2  name varchar2(100);
  3  salary number;
  4  begin
  5  select ename,sal into name, salary from emp where empno = 7788;
  6  if salary > 2000 then
  7  raise_application_error(-20001, 'salary is too high');
  8  end if;
  9  dbms_output.put_line(name ||' '|| salary);
 10  end;
 11  /
declare
*
ERROR at line 1:
ORA-20001: salary is too high
ORA-06512: at line 7


SQL> MUHAMMAD REZA HIDAYAT