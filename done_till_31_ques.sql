#-----------------------------------------------------------------------------------------------------------------------#

# Pralay Kalaskar

#-----------------------------------------------------------------------------------------------------------------------#
# copied all tables data to one excel workbook file
# seperately created 5 CSV file from that maain excel file
# successfully imported all the 5 CSV files
#-----------------------------------------------------------------------------------------------------------------------#
#-----------------------------------------------------------------------------------------------------------------------#
# need to perform the following operations mentioned below:-

# 1.	Display customer details with business as ‘Consultant’
select * from clients where Business = 'consultant';

# 2.	Display employee details who are not ‘Developers’
select * from employees where not job = 'developer';

# 3.	Display project details with budget > 100000
select * from projects where Budget > '100000';

# 4.	Display details of project that are already finished
select * from empprojecttasks where Status = 'completed';

# 5.	Display employee names beginning with ‘M’
select * from employees where Ename like 'M%';

# 6.	Display employee names ending with ‘a’
select * from employees where Ename like '%a';

# 7.	Display the number of months project ‘Inventory’ took for completion
select * from projects;
select (datediff(actual_end_date,start_date))/30 as no_of_months from projects where Descr = 'Inventory'; # 1
select (datediff(str_to_date(Actual_End_Date, '%d-%b-%y'), str_to_date(Start_Date, '%d-%b-%y')))/30 as no_of_months from projects where Descr = 'Inventory'; # 1
select timestampdiff(Month, actual_end_date,start_date) as no_of_months from projects where Descr = 'Inventory'; # 2
select timestampdiff(Month, str_to_date(Start_Date, '%d-%b-%y'), str_to_date(Actual_End_Date, '%d-%b-%y')) as no_of_months from projects where Descr = 'Inventory'; # 2

# 8.	Display the task that is ‘In Progress’
select * from empprojecttasks where Status = 'In Progress';

# 9.	Display details of departments located in Pune
select * from departments where Loc = 'Pune';

# 10.	Display employee name and salary in descending order of salary
select Ename, Salary from employees order by Salary desc;

# 11.	Display tasks in ascending order of end date
select task, End_Date from empprojecttasks order by str_to_date(End_Date, '%d-%b-%y');

# 12.	Display distinct jobs from Employees table
select distinct Job from employees;

# 13.	Display employee names in all uppercase
select upper(Ename) from employees;

# 14.	Display employee name, salary and bonus calculated as 25% of salary
select Ename, Salary, Salary*.25 as Bonus from employees;

# 15.	Display concatenated string ‘Employee works as Job’ (e.g. Manoj works as Developer) for all employees
select concat(Ename, ' ', 'work as', ' ', Job) as concatenated_text from employees;

# 16.	Display day of week (e.g. Friday) for each start date of projects
select Project_ID, Descr, Start_Date, Day_of_week from projects;

# 17.	Display position number of ‘@’ symbol in each email id of clients
select Email, instr(email,'@') as Position_number from clients;

# 18.	Display first 3 characters of each client name
select Cname, substring(Cname,1,3) as first_3_alphabets from clients;

# 19.	Display project budget values formatted as ‘$150,000’
select Budget,concat('$', format (Budget, 0)) as Budget_in_$ from projects;

# 20.	Display planned end date and review date as 3 months after planned end date for each project
select Project_ID, Descr, Planned_End_Date, date_add(Planned_End_Date, interval 3 month) as Review_Date from projects;
select Project_ID, Descr, Planned_End_Date, Planned_End_Date + interval 1 quarter as Review_Date from projects;

# 21.	Display count of clients
select count(Cname) from clients;

# 22.	Display count of employees and sum of their salaries
select count(Empno), sum(Salary) from employees;

# 23.	Display max salary per department
select Deptno, max(salary) as Maximum_salary from employees group by Deptno; # 1
select employees.Deptno, departments.Dname, max(Salary) as Max_salary from employees inner join departments on employees.Deptno = departments.Deptno group by employees.Deptno, departments.Dname; # 2

# 24.	Display min salary per job
select job, min(Salary) from employees group by job;

# 25.	Display average salary
select avg(Salary) from employees;

# 26.	Display sum of budget
select sum(Budget) from projects;

# 27.	Display count of ‘Coding’ task
select Task, count(Task) from empprojecttasks where Task = 'Coding';

# 28.	Display department wise count and sum of salary of employees
select Deptno, count(*) as count, sum(Salary) from employees group by Deptno;

# 29.	Display client names and their project desc, start date and budget
select clients.client_ID, clients.Cname, projects.Project_ID, projects.Descr, projects.Start_Date, projects.Budget from projects inner join clients on clients.Client_ID = projects.Client_ID;

# 30.	Display department name, employee name and job
select departments.Dname, employees.Ename, employees.Job from employees inner join departments on employees.Deptno = departments.Deptno;

# 31.	Display names of employees doing ‘System Analysis’ along with project name
select employees.Empno, employees.Ename, projects.Project_ID, projects.Descr, empprojecttasks.Task from empprojecttasks inner join (projects, employees) on empprojecttasks.Project_ID = projects.Project_ID and empprojecttasks.Empno = employees.Empno where Task = 'System Analysis';

# 32.	Display job wise count
select Job, count(job) from employees group by job;

# 33.	Display employee numbers not present in EmpProjectTasks table using necessary set operator
select Empno from employees
except
select Empno from empprojecttasks;

# 34.	Display employee numbers present in both Employees and EmpProjectTasks table using necessary set operator
select Empno from employees union select Empno from empprojecttasks;

# 35.	Display all employee numbers present in both Employees and EmpProjectTasks table using necessary set operator
select Empno from employees union all select Empno from empprojecttasks;

#-----------------------------------------------------------------------------------------------------------------------#
#-----------------------------------------------------------------------------------------------------------------------#
# need to perform the following operations mentioned below:-

# 1.	Display the project name with highest budget
select Project_ID, Descr, Budget from projects where Budget = (select max(Budget) from projects);

# 2.	Display employee names who have same job as ‘Madhav’
select Ename, Job from employees where job = (select job from employees where Ename = 'Madhav');

# 3.	Display employee’s name and job who worked on ‘Code Change’ task of project 401
select employees.Empno, employees.Ename, employees.Job from employees where employees.Empno = (select empprojecttasks.Empno from empprojecttasks  where empprojecttasks.Project_ID = '401' and empprojecttasks.Task = 'Code Change');

# 4.	Display client name whose project’s ‘Coding’ task is ‘In Progress’
select Cname from clients  where Client_ID = (select projects.Client_ID from projects where projects.Project_ID = (select empprojecttasks.Project_ID from empprojecttasks  where empprojecttasks.Task = 'Coding' and empprojecttasks.Status = 'In Progress'));

# 5.	Display department number, names and salaries of employees who are earning max salary in their departments
select a.Deptno, a.Ename, a.Salary from  (select max(salary) as maxsal, Deptno from employees  group by deptno) as b join employees a on a.Salary = b.maxsal and a.Deptno = b.Deptno order by a.Deptno;

# 6.	Display name of department with highest SUM of salary
select Deptno, sum(salary) as Sum_of_salaries from employees group by Deptno; # 1
select employees.Deptno, departments.Dname, sum(salary) as Sum_of_salaries from employees inner join departments on employees.Deptno = departments.Deptno group by employees.Deptno, departments.Dname; # 2

# 7.	Create a table named ‘CLIENT_PROJECTS’ using CTAS method that includes CLIENT_ID, CNAME, ADDRESS,BUSINESS,DESCR,BUDGET columns from CLIENTS and PROJECTS tables
create table client_projects as (select c.clientid, c.cname,c.address, c.business, p.descr, p.budget from clients c, projects p where c.clientid = p.clientid);

# 8.	Increase salary of employees by 15% who have performed task of ‘Testing’ on projects
select employees.Empno, employees.Ename, employees.Job, employees.Salary, (salary + (salary*(15/100))) as increase_salary from employees inner join empprojecttasks on employees.Empno = empprojecttasks.Empno and empprojecttasks.Task = 'testing';

# 9.	Create a view named DEPT_EMP with DEPTNO,DNAME,LOC,ENAME,JOB, and SALARY columns
create view Dept_Emp as (select departments.Deptno, departments.Dname, departments.Loc, employees.Ename, employees.Job, employees.Salary from departments inner join employees on departments.Deptno = employees.Deptno);
select * from Dept_Emp;

# 10.	Create synonym EPT for table EmpProjectTasks


#-----------------------------------------------------------------------------------------------------------------------#
#-----------------------------------------------------------------------------------------------------------------------#