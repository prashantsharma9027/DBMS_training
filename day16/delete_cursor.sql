-- Create a program to implement trigger for automatically generating the backup of deleted row into new table.

drop table customers;
create table customers(
id number(5),
name varchar2(30),
salary number(10)
);

insert into customers values(9403, 'prashant', 40000);
insert into customers values(9500, 'Manav', 30000);
insert into customers values(9510, 'Rohan', 20000);
insert into customers values(1111, 'Shivam', 10000);

drop table customer_backup;
CREATE TABLE customer_backup (


    id number(5),
    name varchar2(30),
    salary number(10)
);


CREATE OR REPLACE TRIGGER backup_row_delete
BEFORE DELETE ON customers
FOR EACH ROW

BEGIN
    INSERT INTO customer_backup
    VALUES(:OLD.id,:OLD.name,:OLD.salary);
END;
/




DECLARE
total_rows number(2);
BEGIN
DELETE FROM customers WHERE id=9403;
IF sql%notfound THEN
    dbms_output.put_line('no customers deleted, id not found');
ELSIF sql%found THEN
    total_rows := sql%rowcount;
    dbms_output.put_line( total_rows || ' customers deleted and stored in customer_backup ');
END IF;
END;
/

select * from customer_backup;

select * from customers;



