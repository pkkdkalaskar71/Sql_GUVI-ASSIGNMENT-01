use assignment;
#creating tables 
# creating table clients 

create table clients (
clientid int primary key,
cname varchar(40) not null,
address varchar(30),
email varchar(30)unique,
phone int,
business varchar(20)not null);


insert into clients(clientid,cname,address,email,phone,business)
values('1001','ACME utilities','Noida','contact@acmeutil.com','9567880032','Manufacturing');
insert into clients(clientid,cname,address,email,phone,business)
values('1002','Trackon Consultants','Mumbai','consult@trackon.com','8734210090','Consultant');
insert into clients(clientid,cname,address,email,phone,business)
values('1003','MoneySaverDistributors','Kolkata','save@moneysaver.com','7799886655','Reseller');
insert into clients(clientid,cname,address,email,phone,business)
values('1004','Lawful Corp','Chennai','justice@lawful.com','9210342219','Professional');
select* from clients;



#creating second table employees

create table employees (
empno int primary key,
ename varchar(20) not null,
job varchar(15),
salary int,
deptno int
);
alter table employees
add foreign key(deptno)
references departments(deptno);
alter table employees
add constraint greaterthan
check(salary>0);


insert into employees(empno,ename,job,salary,deptno)
values('7001','sandeep','analyst','25000','10');
insert into employees(empno,ename,job,salary,deptno)
values('7002','rajesh','designer','30000','10');
insert into employees(empno,ename,job,salary,deptno)
values('7003','madhav','developer','40000','20');
insert into employees(empno,ename,job,salary,deptno)
values('7004','manoj','developer','40000','20');
insert into employees(empno,ename,job,salary,deptno)
values('7005','abhay','designer','35000','10');
insert into employees(empno,ename,job,salary,deptno)
values('7006','uma','tester','30000','30');
insert into employees(empno,ename,job,salary,deptno)
values('7007','gita','tech writer','30000','40');
insert into employees(empno,ename,job,salary,deptno)
values('7008','priya','tester','35000','30');
insert into employees(empno,ename,job,salary,deptno)
values('7009','Nutan','developer','45000','20');
insert into employees(empno,ename,job,salary,deptno)
values('7010','smita','analyst','20000','10');
insert into employees(empno,ename,job,salary,deptno)
values('7011','anand','projectmgr','65000','10');
select * from employees;



# creatiing third table departments
create table departments (
deptno int primary key,
dname varchar(15) not null,
loc varchar(20));


insert into departments(deptno,dname,loc)
values('10','design','pune');
insert into departments(deptno,dname,loc)
values('20','development','pune');
insert into departments(deptno,dname,loc)
values('30','testing','mumbai');
insert into departments(deptno,dname,loc)
values('40','document','mumbai');
select * from departments;



#creating table projects
create table projects(
projectid int primary key,
descr varchar(30) not null,
startdate date,
plannedenddate date,
actualenddate date,
budget int ,
clientid int,
 foreign key(clientid) references clients(clientid));
 alter table projects
 add constraint budgetcons
 check(budget>0);
  alter table projects
 add constraint endadtegreater
 check(actualenddate>=plannedenddate);
 
 
 #inserting values into projects
 insert into projects(projectid,descr,startdate,plannedenddate,actualenddate,budget,clientid)
 values('401','inventory','2011-04-01','2011-10-01','2011-10-31','150000','1001');
 insert into projects(projectid,descr,startdate,plannedenddate,actualenddate,budget,clientid)
 values('402','accounting','2011-04-01','2012-01-01',null,'500000','1002');
  insert into projects(projectid,descr,startdate,plannedenddate,actualenddate,budget,clientid)
 values('403','payroll','2011-10-01','2011-12-31',null,'75000','1003');
  insert into projects(projectid,descr,startdate,plannedenddate,actualenddate,budget,clientid)
 values('404','contact mngr','2011-11-01','2011-12-31',null,'50000','1004');
 select * from projects;
 
 
 
 # creating 5th table empprojecttasks
 create table empprojecttasks(
 projectid int ,
 foreign key(projectid) references projects(projectid),
 empno int ,
 primary key(projectid,empno),
 foreign key(empno) references employees(empno),
 startdate date,
 enddate date,
 task varchar(25) not null,
 status varchar(15)not null);
 
 
 
 insert into empprojecttasks(projectid,empno,startdate,enddate,task,status)
 values('401','7001','2011-04-01','2011-04-20','system analysis','completed');
  insert into empprojecttasks(projectid,empno,startdate,enddate,task,status)
 values('401','7002','2011-04-21','2011-05-30','system design','completed');
  insert into empprojecttasks(projectid,empno,startdate,enddate,task,status)
 values('401','7003','2011-06-01','2011-06-14','coding','completed');
  insert into empprojecttasks(projectid,empno,startdate,enddate,task,status)
 values('401','7004','2011-07-18','2011-09-01','coding','completed');
  insert into empprojecttasks(projectid,empno,startdate,enddate,task,status)
 values('401','7006','2011-09-03','2011-09-15','testing','completed');
  insert into empprojecttasks(projectid,empno,startdate,enddate,task,status)
 values('401','7009','2011-09-18','2011-10-05','code change','completed');
  insert into empprojecttasks(projectid,empno,startdate,enddate,task,status)
 values('401','7008','2011-10-06','2011-10-16','testing','completed');
  insert into empprojecttasks(projectid,empno,startdate,enddate,task,status)
 values('401','7007','2011-10-06','2011-10-22','documentation','completed');
  insert into empprojecttasks(projectid,empno,startdate,enddate,task,status)
 values('401','7011','2011-10-22','2011-10-31','signoff','completed');
  insert into empprojecttasks(projectid,empno,startdate,enddate,task,status)
 values('402','7010','2011-08-01','2011-08-20','system analysis','completed');
  insert into empprojecttasks(projectid,empno,startdate,enddate,task,status)
 values('402','7002','2011-08-22','2011-09-30','system design','completed');
  insert into empprojecttasks(projectid,empno,startdate,enddate,task,status)
 values('402','7004','2011-10-01',null,'coding','inprogress');
 select * from empprojecttasks;
 
 
 
 #--------------assignment-----------------------------
 
# 1.Display customer details with business as ‘Consultant’
select * from clients where business='consultant';

#2.	Display employee details who are not ‘Developers’
select * from employees where job <> 'Developer';

#3.	Display project details with budget > 100000
select * from projects where budget>100000;

#4.	Display details of project that are already finished
select * from empprojecttasks
where status ='completed';

#5.	Display employee names beginning with ‘M’
select* from employees where ename like 'm%';

#6.	Display employee names ending with ‘a’
select* from employees where ename like '%a';

#7.	Display the number of months project ‘Inventory’ took for completion
select (datediff(actualenddate,startdate))/30 as no_of_months from projects where descr='inventory';
SELECT TIMESTAMPDIFF(Month,Startdate, Actualenddate) as months
from projects where descr='Inventory';

#8.	Display the task that is ‘In Progress’
select * from empprojecttasks where status='inprogress';

#9.	Display details of departments located in Pune
select * from departments where loc='pune';

#10.	Display employee name and salary in descending order of salary
select ename,salary from employees order by salary desc;

#11.	Display tasks in ascending order of end date
select task from empprojecttasks order by enddate;

#12.	Display distinct jobs from Employees table
select distinct job from employees;

#13.	Display employee names in all uppercase
select upper(ename) from employees;

#14.	Display employee name, salary and bonus calculated as 25% of salary
select ename,salary,salary+(salary*(25/100)) as bonus from employees;

#15.	Display concatenated string ‘Employee works as Job’ (e.g. Manoj works as Developer) for all employeesemployees
select concat(ename,' works as ',job)  as concatenatedstring from employees;

#16.	Display day of week (e.g. Friday) for each start date of projects
select startdate,dayname(startdate) as dayofweek from empprojecttasks;

#17.	Display position number of ‘@’ symbol in each email id of clients
select position('@' in email) as position_number from clients;

#18.	Display first 3 characters of each client name
select substring(cname,1,3) as abnames from clients;


#19.	Display project budget values formatted as ‘$150,000’
select concat('$',format(budget,'','en.us'))as format from projects;

#20.	Display planned end date and review date as 3 months after planned end date for each project
select plannedenddate,date_add(plannedenddate,interval 3 month) as reviewdate from projects;


#21.	Display count of clients
select count(clientid) as count from clients;

#22.	Display count of employees and sum of their salaries
select count(empno) as countofemps, sum(salary) as sum from employees;

#23.	Display max salary per department
select deptno, max(salary) from employees group by deptno;

#24.	Display min salary per job
select job,min(salary) from employees group by job;

#25.	Display average salary
select avg(salary) as avgsalary from employees;

#26.	Display sum of budget
select sum(budget) as sum from projects;

#27.	Display count of ‘Coding’ task
select count(task) as count  from empprojecttasks where task='coding';

#28.	Display department wise count and sum of salary of employees
select count(deptno) as deptcount ,sum(salary) as salarysum from employees group by deptno;

#29.	Display client names and their project desc, start date and budget
select clients.cname, 
projects.descr ,
projects.startdate,
projects.budget from clients,projects
where clients.clientid  =projects.clientid order by projects.descr desc;

#30.	Display department name, employee name and job
select departments.dname,
employees.ename,
employees.job
from departments,employees
where departments.deptno=employees.deptno;

#31.	Display names of employees doing ‘System Analysis’ along with project name
select employees.ename,projects.descr as projectname
from employees,projects,empprojecttasks
where employees.job='analyst'and employees.empno=empprojecttasks.empno and projects.projectid=empprojecttasks.projectid;

#32.	Display job wise count
select count(distinct(job)) as jobs from employees;

#33.	Display employee numbers not present in EmpProjectTasks table using necessary set operator
select employees.empno from employees
intersect
select empprojecttasks.empno from empprojecttasks;


#34.	Display employee numbers present in both Employees and EmpProjectTasks table using necessary set operator
select employees.empno from employees
union select empprojecttasks.empno from empprojecttasks;

#35.	Display all employee numbers present in both Employees and EmpProjectTasks table using necessary set operator
select employees.empno from employees
union all select empprojecttasks.empno from empprojecttasks;

#next week assignment
#------------------------------------

#1.	Display the project name with highest budget
select descr from projects where budget=(select max( budget) from projects) ;

#2.	Display employee names who have same job as ‘Madhav’
select ename from employees where job=(select job from employees where ename='madhav');

#3.	Display employee’s name and job who worked on ‘Code Change’ task of project 401
select employees.ename,employees.job from
employees where employees.empno=
(select empprojecttasks.empno
 from empprojecttasks 
where empprojecttasks.projectid='401' and empprojecttasks.task='code change');

#4.	Display client name whose project’s ‘Coding’ task is ‘In Progress’
select cname from clients 
where clientid=
(select projects.clientid from projects where projects.projectid =
(select empprojecttasks.projectid from empprojecttasks 
where empprojecttasks.task='coding' and empprojecttasks.status='inprogress'));

#5.	Display department number, names and salaries of employees who are earning max salary in their departments
select a.deptno,a.ename,a.salary from 
(select max(salary) as maxsal,deptno from employees 
group by deptno) as b
join employees a
on a.salary=b.maxsal and a.deptno=b.deptno
order by a.deptno;


#6.	Display name of department with highest SUM of salary
select a.dname from departments a join
(select sum(salary) as sumsal,deptno from employees b
group by deptno) b on
a.deptno=b.deptno order by b.sumsal desc;

#7.	Create a table named ‘CLIENT_PROJECTS’ using CTAS method that includes CLIENT_ID,
# CNAME, ADDRESS,BUSINESS,DESCR,BUDGET columns from CLIENTS and PROJECTS tables
create table client_projects
as
(select c.clientid,c.cname,c.address,c.business,p.descr,p.budget from clients c,projects p
where 
c.clientid=p.clientid);

#8.	Increase salary of employees by 15% who have performed task of ‘Testing’ on projects
select (salary+(salary*(15/100))) as increase_salary from employees e,empprojecttasks t
where e.empno=t.empno and t.task='testing';

#9.	Create a view named DEPT_EMP with DEPTNO,DNAME,LOC,ENAME,JOB, and SALARY columns
create view dept_emp as
(select d.deptno,d.dname,d.loc,e.ename,e.job,e.salary from departments d,employees e
where 
d.deptno=e.deptno);

#10.	Create synonym EPT for table EmpProjectTasks
create SYNONYM ept for empprojecttasks;