# Sql_GUVI-ASSIGNMENT-01

SQL Assignment
A small IT firm designing business software for its clients wants to store and manage its data. It has identified following entities for which, it will maintain data.
1.	Clients
2.	Employees
3.	Departments
4.	Projects
5.	EmpProjectTasks *
* This will hold data of employees working on projects.
* You are required to create the tables using the information provided below. Once tables are ready, fill in the given data in each table.

## The tables below describe attributes for each entity:

#### "Clients" Table

|Attribute Name|Attribute Type|Constraint|Remarks|
|---|---|---|---|
|Client_ID   |NUMBER(4)   |Primary Key   |   |
|Cname   |VARCHAR2(40)   |Not Null   |   |
|Address   |VARCHAR2(30)   |   |   |
|Email   |VARCHAR2(30)   |Unique   |   |
|Phone   |NUMBER(10)   |   |   |
|Business   |VARCHAR2(20)   |Not Null   |Business type of client like Manufacturer, Reseller, Consultant, Professional etc.      |

#### "Employees" Table

|Attribute Name|Attribute Type|Constraint|Remarks|
|---|---|---|---|
|Empno   |NUMBER(4)   |Primary Key   |   |
|Ename   |VARCHAR2(20)   |Not Null   |   |
|Job   |VARCHAR2(15)   |   |   |
|Salary   |NUMBER(7)   |Must be positive   |Use CHECK constraint to ensure salary is > 0   |
|Deptno   |NUMBER(2)   |Foreign Key   |Deptno as per Departments table   |

#### "Departments" Table

|Attribute Name|Attribute Type|Constraint|Remarks|
|---|---|---|---|
|Deptno   |NUMBER(2)   |Primary Key   |   |
|Dname   |VARCHAR2(15)   |Not Null   |   |
|Loc   |VARCHAR2(20)   |   |   |

#### "Projects" Table

|Attribute Name|Attribute Type|Constraint|Remarks|
|---|---|---|---|
|Project_ID   |NUMBER(3)   |Primary Key   |   |
|Descr   |VARCHAR2(30)   |Not Null   |Description of project like ‘Accounting’ , ‘Inventory’, ‘Payroll’ etc.   |
|Start_Date   |DATE   |   |Start date of project   |
|Planned_End_Date   |DATE   |Unique   |Planned End date of project   |
|Actual_End_date   |DATE   |Must be later than Planned_End_Date   |Actual End date of project (Use CHECK constraint)   |
|Budget   |NUMBER(10)   |Must be positive   |Use CHECK constraint to ensure budget is > 0      |
|Client_ID   |NUMBER(4)   |Foreign Key   |Client ID from Clients table   |

#### "EmpProjectTasks" Table

|Attribute Name|Attribute Type|Constraint|Remarks|
|---|---|---|---|
|Project_ID   |NUMBER(3)   |Primary Key, Foreign Key   |Composite primary key and foreign keys referring Projects and Employees table   |
|Empno   |NUMBER(4)   |Primary Key, Foreign Key   |Composite primary key and foreign keys referring Projects and Employees table   |
|Start_Date   |DATE   |   |Start date when employee begins task on this project   |
|End_Date   |DATE   |   |End date when employee finishes task on this project   |
|Task   |VARCHAR2(25)   |Not Null   |Task performed by employee like designing, coding, review, testing etc.   |
|Status   |VARCHAR2(15)   |Not Null   |Status of task like ‘in progress’, ‘complete’,’cancelled’      |

## Data to be entered in the created tables:

#### "Clients" Table

|Client ID|Cname|Address|Email|Phone|Business|
|---|---|---|---|---|---|
|1001   |ACME Utilities   |Noida   |contact@acmeutil.com   |9567880032   |Manufacturing   |
|1002   |Trackon Consultants   |Mumbai   |consult@trackon.com   |8734210090   |Consultant   |
|1003   |MoneySaver Distributors   |Kolkata   |save@moneysaver.com   |7799886655   |Reseller   |
|1004   |Lawful Corp   |Chennai   |justice@lawful.com   |9210342219   |Professional   |

#### "Employees" Table

|Empno|Ename|Job|Salary|Deptno|
|---|---|---|---|---|
|7001   |Sandeep   |Analyst   |25000   |10   |
|7002   |Rajesh   |Designer   |30000   |10   |
|7003   |Madhav   |Developer   |40000   |20   |
|7004   |Manoj   |Developer   |40000   |20   |
|7005   |Abhay   |Designer   |35000   |10   |
|7006   |Uma   |Tester   |30000   |30   |
|7007   |Gita   |Tech.Writer   |30000   |40   |
|7008   |Priya   |Tester   |35000   |30   |
|7009   |Nutan   |Developer   |45000   |20   |
|7010   |Smita   |Analyst   |20000   |10   |
|7011   |Anand   |ProjectMgr   |65000   |10   |

#### "Departments" Table

|Deptno|Dname|Loc|
|---|---|---|
|10   |Design   |Pune   |
|20   |Development   |Pune   |
|30   |Testing   |Mumbai   |
|40   |Document   |Mumbai   |

#### "Projects" Table

|Project_ID|Descr|Start_Date|Planned_End_Date|Actual_End_date|Budget|Client_ID|
|---|---|---|---|---|----|---|
|401   |Inventory   |01-Apr-11   |01-Oct-11   |31-Oct-11   |150000   |1001   |
|402   |Accounting   |01-Aug-11   |01-Jan-12   |   |500000   |1002   |
|403   |Payroll   |01-Oct-11   |31-Dec-11   |   |75000   |1003   |
|404   |Contact Mgmt   |01-Nov-11   |31-Dec-11   |	   |50000   |1004   |

#### "EmpProjectTasks" Table

|Project_ID|Empno|Start_Date|End_Date|Task|Status|
|---|---|---|---|---|----|
|401   |7001   |01-Apr-11   |20-Apr-11   |System Analysis   |Completed   |
|401   |7002   |21-Apr-11   |30-May-11   |System Design   |Completed   |
|401   |7003   |01-Jun-11   |15-Jul-11   |Coding   |Completed   |
|401   |7004   |18-Jul-11   |01-Sep-11   |Coding   |Completed   |
|401   |7006   |03-Sep-11   |15-Sep-11   |Testing   |Completed   |
|401   |7009   |18-Sep-11   |05-Oct-11   |Code Change   |Completed   |
|401   |7008   |06-Oct-11   |16-Oct-11   |Testing   |Completed   |
|401   |7007   |06-Oct-11   |22-Oct-11   |Documentation   |Completed   |
|401   |7011   |22-Oct-11   |31-Oct-11   |Sign off   |Completed   |
|402   |7010   |01-Aug-11   |20-Aug-11   |System Analysis   |Completed   |
|402   |7002   |22-Aug-11   |30-Sep-11   |System Design   |Completed   |
|402   |7004   |01-Oct-11   |   |Coding   |In Progress   |



## Need to find the following requirements
* ### Requirements:-

1.	Display customer details with business as ‘Consultant’
2.	Display employee details who are not ‘Developers’
3.	Display project details with budget > 100000
4.	Display details of project that are already finished
5.	Display employee names beginning with ‘M’
6.	Display employee names ending with ‘a’
7.	Display the number of months project ‘Inventory’ took for completion
8.	Display the task that is ‘In Progress’
9.	Display details of departments located in Pune
10.	Display employee name and salary in descending order of salary
11.	Display tasks in ascending order of end date
12.	Display distinct jobs from Employees table
13.	Display employee names in all uppercase
14.	Display employee name, salary and bonus calculated as 25% of salary
15.	Display concatenated string ‘Employee works as Job’ (e.g. Manoj works as Developer) for all employees
16.	Display day of week (e.g. Friday) for each start date of projects
17.	Display position number of ‘@’ symbol in each email id of clients
18.	Display first 3 characters of each client name
19.	Display project budget values formatted as ‘$150,000’
20.	Display planned end date and review date as 3 months after planned end date for each project
21.	Display count of clients
22.	Display count of employees and sum of their salaries
23.	Display max salary per department
24.	Display min salary per job
25.	Display average salary
26.	Display sum of budget
27.	Display count of ‘Coding’ task
28.	Display department wise count and sum of salary of employees
29.	Display client names and their project desc, start date and budget
30.	Display department name, employee name and job
31.	Display names of employees doing ‘System Analysis’ along with project name
32.	Display job wise count
33.	Display employee numbers not present in EmpProjectTasks table using necessary set operator
34.	Display employee numbers present in both Employees and EmpProjectTasks table using necessary set operator
35.	Display all employee numbers present in both Employees and EmpProjectTasks table using necessary set operator


* ### Requirements:-

1.	Display the project name with highest budget
2.	Display employee names who have same job as ‘Madhav’
3.	Display employee’s name and job who worked on ‘Code Change’ task of project 401
4.	Display client name whose project’s ‘Coding’ task is ‘In Progress’
5.	Display department number, names and salaries of employees who are earning max salary in their departments
6.	Display name of department with highest SUM of salary
7.	Create a table named ‘CLIENT_PROJECTS’ using CTAS method that includes CLIENT_ID, CNAME, ADDRESS,BUSINESS,DESCR,BUDGET columns from CLIENTS and PROJECTS tables
8.	Increase salary of employees by 15% who have performed task of ‘Testing’ on projects
9.	Create a view named DEPT_EMP with DEPTNO,DNAME,LOC,ENAME,JOB, and SALARY columns
10.	Create synonym EPT for table EmpProjectTasks

.
