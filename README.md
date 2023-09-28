# Sql_GUVI-ASSIGNMENT-01

SQL Assignment
A small IT firm designing business software for its clients wants to store and manage its data. It has identified following entities for which, it will maintain data.
1.	Clients
2.	Employees
3.	Departments
4.	Projects
5.	EmpProjectTasks *
* This will hold data of employees working on projects.
You are required to create the tables using the information provided below. Once tables are ready, fill in the given data in each table.

The tables below describe attributes for each entity.
Clients
Attribute Name	Attribute Type	Constraint	Remarks
Client_ID	NUMBER(4)	Primary Key	
Cname	VARCHAR2(40)	Not Null	
Address	VARCHAR2(30)		
Email	VARCHAR2(30)	Unique	
Phone	NUMBER(10)		
Business	VARCHAR2(20)	Not Null	Business type of client like Manufacturer, Reseller, Consultant,
Professional etc.

