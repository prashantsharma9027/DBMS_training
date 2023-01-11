drop table products;
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

select * from products;

-------------get average of price in savg collumn in each row


--using subquery
SELECT ProductID, ProductName, Price, (SELECT AVG(Price) FROM Products) AS SAVG FROM Products;

--using objects
select t1.productid,t1.productname,t1.price,(select avg(t2.price) from products t2) as savg from products t1;
--get average of price in savg collumn in each row using object

--using window function
SELECT ProductID, ProductName, Price, AVG(Price) OVER() AS SAVG FROM Products;

--using objects and window function
select t1.productid,t1.productname,t1.price,avg(t1.price) over() as savg from products t1;
desc products;

------------------------group by

-- using objects
select t1.productid,t1.productname,t1.price,savg.av
from products t1,(select productname,avg(price) as av
from products group by productname) savg where
t1.productname=savg.productname;


--using window function
SELECT ProductID, ProductName, Price, AVG(Price) OVER(PARTITION BY Productname) AS SAVG FROM Products;


-- using objects and window function
select t1.productid,t1.productname,t1.price,avg(t1.price) over(partition by t1.productname) as savg from products t1;


-- truncate date added in products table
select productid,productname,price,TRUNC(date_added) from products;




select * from products
order by price;

--leave first 2 rows and fetch next 2 rows
select * from products
order by price
offset 2 rows fetch next 2 rows only


select * from products order by productname;

select row_number() over (partition by price order by productname)
from products;

--trunc date_added in products table by month

select productid,productname,price,TRUNC(date_added,'mon') as salemonth from products;


select p1.productname, p1.date_added,
avg(price) over(partition by date_added) as savg,
avg(price) over(partition by trunc(date_added, 'mon')) as
    savgs from products p1;
