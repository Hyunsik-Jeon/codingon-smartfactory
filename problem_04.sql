CREATE DATABASE final CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

create table employees(
	employee_id int primary key, 
    first_name varchar(50), 
    last_name varchar(50),
    email varchar(100), 
    phone_number varchar(20), 
    hire_date date, 
    job_id int, 
    salary decimal(8,2), 
    commission_pct decimal(4,2), 
    manager_id int, 
    department_id int
);

create table jobs(
	job_id int primary key, 
    job_title varchar(50), 
    min_salary decimal(8,2), 
    max_salary decimal(8,2)
);

create table departments(
	department_id int primary key, 
    department_name varchar(50), 
    manager_id int, 
    location_id varchar(50)
);

INSERT INTO employees VALUES
  (1, 'John', 'Doe', 'johndoe@example.com', '555-1234', '2021-01-01', 1, 100000.00, 0.05, 3, 1),
  (2, 'Jane', 'Smith', 'janesmith@example.com', '555-5678', '2021-02-01', 2, 80000.00, NULL, 3, 1),
  (3, 'Bob', 'Johnson', 'bobjohnson@example.com', '555-9012', '2021-03-01', 1, 90000.00, 0.02, 5, 2),
  (4, 'Alice', 'Williams', 'alicewilliams@example.com', '555-3456', '2021-04-01', 3, 70000.00, NULL, 5, 2),
  (5, 'Mike', 'Brown', 'mikebrown@example.com', '555-7890', '2021-05-01', 4, 120000.00, 0.08, NULL, 3),
  (6, 'Sara', 'Lee', 'saralee@example.com', '555-2345', '2021-06-01', 4, 75000.00, NULL, 7, 4),
  (7, 'Tom', 'Jackson', 'tomjackson@example.com', '555-6789', '2021-07-01', 5, 110000.00, 0.03, NULL, 4),
  (8, 'Karen', 'Davis', 'karendavis@example.com', '555-1234', '2021-08-01', 5, 95000.00, NULL, 7, 4),
  (9, 'David', 'Miller', 'davidmiller@example.com', '555-5678', '2021-09-01', 2, 85000.00, NULL, 10, 5),
  (10, 'Lisa', 'Wilson', 'lisawilson@example.com', '555-9012', '2021-10-01', 1, 110000.00, 0.06, NULL, 5);
  
  INSERT INTO jobs VALUES
  (1, 'Manager', 80000.00, 120000.00),
  (2, 'Developer', 60000.00, 100000.00),
  (3, 'Designer', 50000.00, 90000.00),
  (4, 'Salesperson', 40000.00, 80000.00),
  (5, 'Accountant', 50000.00, 100000.00);
  
INSERT INTO departments VALUES
(1, 'Engineering', 3, 'New York'),
(2, 'Sales', 5, 'Los Angeles'),
(3, 'Marketing', 7, 'Chicago'),
(4, 'Accounting', 8, 'Houston'),
(5, 'IT', 10, 'San Francisco');

select * from employees where department_id = 5;

select department_id, count(*) from employees group by department_id;

select first_name, last_name from employees where salary >=80000;

select first_name, last_name, salary from employees where salary >=80000 and department_id = 3;

select job_id, avg(salary) from employees group by job_id;

select job_id, max(salary) from employees group by job_id;

select first_name, last_name, salary from employees order by salary desc limit 10;

select first_name, last_name, salary from employees order by salary asc limit 5;

select first_name, last_name from employees where job_id = 1;

select first_name, last_name from employees where hire_date between '2021-01-01' and '2021-12-31';

select first_name, last_name, salary from employees where not commission_pct is null;

select first_name, last_name, salary from employees where commission_pct is null;