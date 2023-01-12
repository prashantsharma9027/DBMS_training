create table Orders(
order_id number,
customer_id number,
order_date date,
item_id varchar2(255),
quantity  number,
constraint pk primary key(order_id,item_id)
-- primary key (emp_id) -- Primary Key = Must be every emp_id unique and not null
);


insert into Orders values (1,1,'01-JAN-2023','1',10);
insert into Orders values (2,1,'08-JAN-2023','2',10);
insert into Orders values (3,2,'02-JAN-2023','1',5);
insert into Orders values (4,3,'03-JAN-2023','3',5);
insert into Orders values (5,4,'04-JAN-2023','4',1);
insert into Orders values (6,4,'05-JAN-2023','5',5);
insert into Orders values (7,5,'05-JAN-2023','1',10);
insert into Orders values (8,5,'14-JAN-2023','4',5);
insert into Orders values (9,5,'21-JAN-2023','3',5);
select * from Orders;

create table Items(
item_id varchar2(255) primary key,
item_name varchar2(255),
item_category varchar2(255)
-- primary key (emp_id) -- Primary Key = Must be every emp_id unique and not null
);


insert into Items values ('1','LC Alg. Book','Book');
insert into Items values ('2','LC DB. Book','Book');
insert into Items values ('3','LC Smartphone','Phone');
insert into Items values ('4','LC Phone 2020','Phone');
insert into Items values ('5','LC SmartGlass','Glasses');
insert into Items values ('6','LC T-Shirt XL','T-Shirt');

SELECT a.item_category AS CATEGORY,
        sum(CASE
                WHEN to_char(b.order_date, 'd') = '2' THEN b.quantity
                ELSE 0
            END) AS MONDAY,
        sum(CASE
                WHEN to_char(b.order_date, 'd') = '3' THEN b.quantity
                ELSE 0
            END) AS TUESDAY,
        sum(CASE
                WHEN to_char(b.order_date, 'd') = '4' THEN b.quantity
                ELSE 0
            END) AS WEDNESDAY,
        sum(CASE
                WHEN to_char(b.order_date, 'd') = '5'  THEN b.quantity
                ELSE 0
            END) AS THURSDAY,
        sum(CASE
                WHEN to_char(b.order_date, 'd') = '6'  THEN b.quantity
                ELSE 0
            END) AS FRIDAY,
        sum(CASE
                WHEN to_char(b.order_date, 'd') = '7'  THEN b.quantity
                ELSE 0
            END) AS SATURDAY,
        sum(CASE
                WHEN to_char(b.order_date, 'd') = '1'  THEN b.quantity
                ELSE 0
            END) AS SUNDAY
FROM items a
LEFT JOIN orders b ON a.item_id = b.item_id
GROUP BY a.item_category
ORDER BY a.item_category;