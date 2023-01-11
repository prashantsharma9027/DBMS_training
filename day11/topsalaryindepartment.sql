/* +--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| id           | int     |
| name         | varchar |
| salary       | int     |
| departmentId | int     |
+--------------+---------+
id is the primary key column for this table.
departmentId is a foreign key of the ID from the Department table.
Each row of this table indicates the ID, name, and salary of an employee. It also contains the ID of their department. */

/* Write an SQL query to find the employees who earn the top three salaries in each of the departments. Return the result table in any order.

*/
--department with primary key
--employee with foreign key


create table department(id int primary key, name varchar(20));
create table employee(id int primary key, name varchar(20), salary int, departmentId int, foreign key(departmentId) references department(id));

insert into department values(1,'IT');
insert into department values(2,'Sales');
insert into department values(3,'Marketing');

/* +----+-------+--------+--------------+
| id | name  | salary | departmentId |
+----+-------+--------+--------------+
| 1  | Joe   | 85000  | 1            |
| 2  | Henry | 80000  | 2            |
| 3  | Sam   | 60000  | 2            |
| 4  | Max   | 90000  | 1            |
| 5  | Janet | 69000  | 1            |
| 6  | Randy | 85000  | 1            |
| 7  | Will  | 70000  | 1            |
+----+-------+--------+--------------+ */

insert into employee values(1,'Joe',85000,1);
insert into employee values(2,'Henry',80000,2);
insert into employee values(3,'Sam',60000,2);
insert into employee values(4,'Max',90000,1);
insert into employee values(5,'Janet',69000,1);
insert into employee values(6,'Randy',85000,1);
insert into employee values(7,'Will',70000,1);

select * from department;
select * from employee;

/* A company's executives are interested in seeing who earns the most money in each of the company's departments. A high earner in a department is an employee who has a salary in the top three unique salaries for that department.
Write an SQL query to find the employees who are high earners in each of the departments.
Return the result table in any order */

select * from employee;
select * from department;

--limit does not work in oracle


--replace limit with rownum
/*
SELECT d.Name AS
    , e.Name AS
    , e.Salary
FROM Department d
LEFT JOIN Employee e
ON d.Id = e.DepartmentId
WHERE (
    SELECT count(DISTINCT Salary)
    FROM Employee
    WHERE DepartmentId = d.Id and Salary > e.Salary) < 3
AND b.Salary IS NOT NULL

 */


SELECT d.Name AS, e.Name AS , e.Salary
FROM Department d
 JOIN Employee e
ON d.Id = e.DepartmentId
WHERE (SELECT count(DISTINCT Salary) FROM Employee WHERE DepartmentId = d.Id and Salary > e.Salary) < 3


