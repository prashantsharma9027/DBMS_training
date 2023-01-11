
create table products(
productid int,
productname varchar(50),
price number,
date_added date default sysdate
);


INSERT INTO Products(ProductID,ProductName, Price,date_added) VALUES(1,'Laptop',20000,Date '2001-08-22');
INSERT INTO Products(ProductID,ProductName, Price,date_added) VALUES(2,'Mobile',8000,date '2001-08-25');
INSERT INTO Products(ProductID,ProductName, Price,date_added) VALUES(3,'Car',111250,date '2020-05-22');
INSERT INTO Products(ProductID,ProductName, Price,date_added) VALUES(4,'Shoes',3000,date '2003-03-25');

INSERT INTO Products(ProductID,ProductName, Price,date_added) VALUES(5,'Laptop',10000,Date '2005-04-22');

INSERT INTO Products(ProductID,ProductName, Price,date_added) VALUES(6,'Laptop',30000,Date '2007-09-22');

INSERT INTO Products(ProductID,ProductName, Price,date_added) VALUES(7,'desktop',30000,Date '2009-07-22');

INSERT INTO Products(ProductID,ProductName, Price,date_added) VALUES(8,'Mac',30000,Date '2010-06-22');


--check rank of 15012 from price when sorted by price
select rank(15012) within group (order by price) as row_rank
from products;

--get rank of all products by their prices if same name.
select productid,
productname,price,
rank() over (partition by productname order by price ) as myrank
from products;


select rank(trunc(date_added,'mon')) as promonth within group (order by promonth) as row_rank from products;

--using trunc with rank
select trunc(date_added, 'mon')
as promonth, rank()
over(partition by trunc(date_added, 'mon') order by date_added)
 as date_rank from products;


--get top three entries



create table salesman(salesman_id number, name varchar2(20), city varchar2(20), comission number
);

desc salesman;

create table sales(order_id number, cust_name varchar2(20), order_dt Date, order_price number, order_city varchar2(20)
);

desc sales;

Insert into sales values(101, 'prashant', DATE'21-05-08', 2500, 'modinagar');
Insert into sales values(102, 'kinshuK', DATE'21-05-08', 2700, 'modinagar');
Insert into sales values(103, 'prashant', DATE'21-05-08', 2500, 'meerut');



Insert into sales values(111, 'prashant', DATE'21-05-08', 2500, 'modinagar');
Insert into sales values(112, 'kinshuK', DATE'21-05-08', 2700, 'modinagar');
Insert into sales values(113, 'prashant', DATE'21-05-08', 2500, 'meerut');

Insert into salesman values(121, 'shantanu', 'meerut', 10);
Insert into salesman values(131, 'raj', 'modinagar', 15);
Insert into salesman values(101, 'raj', 'modinagar', 15);



select trunc(s.order_dt,'mon') as sales_month , sp.name, sum(order_price) as sum1,
rank() over (partition by trunc(s.order_dt, 'mon') order by sum(order_price) desc) as sq from sales s, salesman sp where
s.order_id = sp.salesman_id
group by trunc(s.order_dt, 'mon'), sp.name;

--get top three entries


--divides into three buckets
select sp.name,sum(order_price) as sum2,ntile(3)
over (order by sum(order_price)desc ) amt from sales s, salesman sp
where s.order_id=sp.salesman_id group by sp.name;


--lag navigates back
--lead navigates front
select trunc(s.order_dt,'mon') , sum(order_price) as sum2,
lag(sum) (order_price,1 trunc(s.order_dt, 'mon') order by sum(order_price) desc) as sq from sales s, salesman sp where
s.order_id = sp.salesman_id
group by trunc(s.order_dt, 'mon'), sp.name;


--sales growth across time


