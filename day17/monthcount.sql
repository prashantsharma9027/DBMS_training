create table ques
(
date1 DATE,
count number
);

insert into ques values(DATE'2022-12-04',1);
insert into ques values(DATE'2022-12-03',2);
insert into ques values(DATE'2022-12-02',1);
insert into ques values(DATE'2022-12-01',3);
insert into ques values(DATE'2022-11-30',1);
insert into ques values(DATE'2022-11-29',1);
insert into ques values(DATE'2022-11-28',1);
insert into ques values(DATE'2022-11-27',2);


select to_char(date1,'yyyy-mm') as month,sum(count1) as count1 from ques
where date1 != DATE '2022-12-01'
group by to_char(date1,'yyyy-mm')
UNION
select to_char(date1,'yyyy-mm-dd') as month,count1 from ques where date1= DATE '2022-12-01';

