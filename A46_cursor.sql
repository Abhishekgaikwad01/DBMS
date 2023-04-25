/*
	Objective:To study the concept of cursor.
	We have 2 tables employee and employee_copy.
	After the call of procedure proc_copy() it will copy the contents of table employee in the employee_copy table.

*/
delimiter //
create procedure proc_copy(	)
begin
declare l int default 0;
declare i int;
declare emp_name varchar(20);
declare sal int;
	
declare emp_cursor cursor for select * from employee;
declare continue handler for not found set l=1;

open emp_cursor;
getdata:loop
     fetch  emp_cursor into i,emp_name,sal;
     if l=1 then
     leave getdata;
     end if;
    
    insert into employee_copy values(i,emp_name,sal);
    end loop getdata;
    close emp_cursor;
    end;
    //
delimiter ;

/*
OUTPUT....

mysql> desc employee;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| eid   | int         | YES  |     | NULL    |       |
| ename | varchar(20) | YES  |     | NULL    |       |
| esal  | int         | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)


mysql> select * from employee;
+------+--------+-------+
| eid  | ename  | esal  |
+------+--------+-------+
|  101 | Om     | 12000 |
|  102 | Sai    | 16000 |
|  103 | Ram    | 20000 |
|  104 | Sachin | 15000 |
|  105 | Rohit  | 18000 |
+------+--------+-------+
5 rows in set (0.00 sec)



mysql> desc employee_copy;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| eid   | int         | YES  |     | NULL    |       |
| ename | varchar(20) | YES  |     | NULL    |       |
| esal  | int         | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+

mysql> select * from employee_copy;
Empty set (0.00 sec)

mysql> source /home/student/A46_cursor.sql
Query OK, 0 rows affected (0.14 sec)

mysql> call proc_copy
    -> ();
Query OK, 0 rows affected (0.55 sec)

mysql> select *from employee_copy;
+------+--------+-------+
| eid  | ename  | esal  |
+------+--------+-------+
|  101 | Om     | 12000 |
|  102 | Sai    | 16000 |
|  103 | Ram    | 20000 |
|  104 | Sachin | 15000 |
|  105 | Rohit  | 18000 |
+------+--------+-------+
5 rows in set (0.00 sec)

*/
