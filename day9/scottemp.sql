

select * from scott.emp;


select empno,ename from scott.emp
start with ename='JONES'
connect by prior empno=mgr;


select empno,ename from SCOTT.EMP
start with ename='JONES'
connect by prior empno=mgr
order by level

--prior
select empno,ename,prior ename manager from scott.emp
start with ename='JONES'
connect by prior empno = mgr
order by level

select empno,ename ,level
from scott.emp
start with ename='JONES'
CONNECT BY PRIOR EMPNO=MGR
ORDER BY LEVEL



select empno,ename, level
from scott.emp
start with ename='JONES'
connect by empno =prior mgr
order by level


select empno,ename, level
,connect_BY_ROOT ename
from scott.emp
start with ename='KING'
connect by prior empno=mgr
order by level

select empno,ename ,
level,
connect_by_root ename,
sys_connect_by_path(ENAME,' ->') PATH
from scott.emp
start with ename = 'JONES'

connect by prior empno= mgr
order by level


select empno,ename ,
level,
connect_by_root ename,
sys_connect_by_path(ENAME,' ->') PATH,
Connect_by_isleaf
from scott.emp
start with ename = 'JONES'

connect by prior empno= mgr
order by level

--to set manager whose empno is 7556
update scott.emp
set mgr=7992
where empno=7566
