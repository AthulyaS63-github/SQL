use task1;
create table salary_grade (grade int primary key,min_salary int,max_salary int);
select * from salary_grade;
select * from department;
create table employees (emp_id int primary key,emp_name varchar(15),job_name varchar(10),manager_id int,hire_date date,salary decimal(10,2),commission decimal(7,2),dep_id int);
insert into employees values(68319,'KAYLING','PRESIDENT',NULL,'19911118',6000.00,NULL,1001)
select * from employees
insert into employees
values
(66928,'BLAZE','MANAGER',68319,'19910501',2750.00,null,3001),
(67832,'CLARE','MANAGER',68319,'19910609',2550.00,null,1001),
(65646,'JONAS','MANAGER',68319,'19910402',2957.00,null,2001),
(67858,'SCARLET','ANALYST',65646,'19970419',3100.00,null,2001),
(69062,'FRANK','ANALYST',65646,'19911203',3100.00,null,2001),
(63679,'SANDRINE','CLERK',69062,'19901203',900.00,null,2001),
(64989,'ADELYN','SALESMAN',66928,'19910220',1700.00,400.00,3001),
(65271,'WADE','SALESMAN',66928,'19910222',1350.00,600.00,3001),
(66564,'MADDEN','SALESMAN',66928,'19910928',1350.00,1500.00,3001),
(68454,'TUCKER','SALESMAN',66928,'19910908',1600.00,0.00,3001),
(68736,'ADNRES','CLERK',67858,'19970523',1200.00,null,2001),
(69000,'JULIUS','CLERK',66928,'19911203',1050.00,null,3001),
(69324,'MARKER','CLERK',67832,'19920123',1400.00,null,1001);
select * from employees;
select salary from employees;
select distinct job_name from employees;
select emp_name,format(1.15*salary,'c') As "salary" from employees;
select emp_name as employee,job_name as job from employees;
select len(emp_name) from employees;
select emp_id,salary,commission from employees;
select * from employees where dep_id!= 2001;
select avg(salary)from employees where job_name='ANALYST';
select * from employees where emp_name='BLAZE';
SELECT * FROM employees WHERE (1.25*salary) > 3000;
select * from employees where MONTH(hire_date)=01;
select emp_id,emp_name,hire_date,salary from employees where hire_date < '19910401';
insert into salary_grade
values
(1,800,1300),
(2,1301,1500),
(3,1501,2100),
(4,2101,3100),
(5,3101,9999);
select * from salary_grade;
SELECT e.emp_name,e.salary
     FROM employees e,
     salary_grade s
     WHERE e.emp_name = 'FRANK'
     AND e.salary BETWEEN s.min_salary AND s.max_salary
     AND e.salary = s.max_salary ;
SELECT *FROM employees WHERE job_name NOT IN ('PRESIDENT','MANAGER') ORDER BY salary ASC;
SELECT max(salary) from employees;
SELECT job_name,avg(salary),avg(salary+commission) FROM employees GROUP BY job_name;
insert into department
values
(1001,'FINANCE','SYDNEY'),
(2001,'AUDIT','MELBOURNE'),
(3001,'MARKETING','PERTH'),
(4001,'PRODUCTION','BRISBANE');
SELECT * FROM department;
select * from employees;
SELECT e.emp_id,e.emp_name,e.dep_id,d.deplocation,d.depname
				FROM employees e,department d
				WHERE e.dep_id = d.dep_id AND e.dep_id IN (1001,2001);
SELECT w.manager_id,count(*)
			FROM employees w,employees m
			WHERE w.manager_id = m.emp_id
			GROUP BY w.manager_id
			ORDER BY w.manager_id ASC;
SELECT dep_id,count(*) FROM employees GROUP BY dep_id HAVING count(*) >=2;
SELECT * FROM employees where emp_name like  '%AR%';
select emp_id,emp_name,salary,FORMAT(hire_date,'MMMM dd,yyyy')as "hire date" from employees;
ALTER TABLE employees ADD gender varchar(20);
update employees set gender = 'MALE' where emp_id in ('68319','66928','65646','69062','68454','69324'); 
update employees set gender = 'FEMALE' where emp_id NOT IN ('68319','66928','65646','69062','68454','69324'); 
select * from employees where job_name NOT IN ('PRESIDENT','MANAGER'); 
update employees set commission = NULL where emp_id not in ('64989','65271','66564','68454'); 
update employees set commission =400.00  where emp_id =64989;
update employees set commission =600.00  where emp_id =65271;
update employees set commission =1500.00  where emp_id =66564;
update employees set commission =0.00  where emp_id =68454;
select distinct(job_name),
	case
		 when  job_name in ('PRESIDENT','MANAGER','ANALYST') then 'Management Level'
		 when  job_name in ('SALESMAN','CLERK') then 'Employee Level'
	end as 'label' from employees;

update employees set commission =650.00  where job_name='ANALYST';
update employees set commission = NULL where emp_id in ('67858','69062');
update employees set commission =650.00  where job_name='ANALYST' and exists(select job_name from employees where job_name='ANALYST');
select emp_id, emp_name, salary,FORMAT(hire_date,'MMMM dd, yyyy') as "to_char" from employees;
select emp_id,emp_name,salary,FORMAT(hire_date,'MMMM dd,yyyy')as "hire_date" from employees;











