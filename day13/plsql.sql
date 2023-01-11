drop table customers;
create table customers(
id number(5),
name varchar2(30),
address varchar2(30)
);

insert into customers values(1,'Raj','Hyderabad');
insert into customers values(2,'Ravi','Delhi');
insert into customers values(3,'Raju','Bangalore');
insert into customers values(4,'Ramesh','Chennai');

drop table customers2;
create table customers2(
id1 number(5),
name1 varchar2(30),
address1 varchar2(30)
);


insert into customers2 values(5,'prashant','Meerut');

insert into customers2 values(1,'Raj','Hyderabad');
insert into customers2 values(2,'Ravi','Delhi');
insert into customers2 values(3,'Praveen','Kanpur');




/*
declare
  v_id customers.id%type;
  v_name customers.name%type;
  v_address customers.address%type;
  v_cursor customers%rowtype;
begin
    for v_cursor in (select * from customers) loop
        v_id := v_cursor.id;
        v_name := v_cursor.name;
        v_address := v_cursor.address;
        dbms_output.put_line(v_id || ' ' || v_name || ' ' || v_address);
    end loop;
    end;
 */
--use %rowtype to get the datatype of the table

-- use %type to fetch records having same id in both tables


--select records from customers and customers2 having same id
declare
  v_id customers.id%type;
  v_name customers.name%type;
  v_address customers.address%type;
  v_cursor customers%rowtype;
begin
    for v_cursor in (select * from customers where id in (select id from customers2)) loop
        v_id := v_cursor.id;
        v_name := v_cursor.name;
        v_address := v_cursor.address;
        dbms_output.put_line(v_id || ' ' || v_name || ' ' || v_address);
    end loop;
    end;
