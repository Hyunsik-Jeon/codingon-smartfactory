-- < 실습 문제 >
-- 1. IT 부서에서 일하는 모든 직원을 반환하는 쿼리를 작성합니다.
SELECT * FROM employees WHERE department_id=5;

-- 2. 각 부서의 총 직원 수를 반환하는 쿼리를 작성합니다.
-- (department_id, num_employees)
SELECT department_id, COUNT(*) AS 'num_employees' FROM employees GROUP BY department_id;

-- (department_name, num_employees)
SELECT department_name, COUNT(*) AS 'num_employees' 
FROM departments AS d JOIN employees AS e ON d.department_id = e.department_id
GROUP BY d.department_name;

-- 3. $80,000 이상의 급여를 받는 모든 직원의 이름을 반환하는 쿼리를 작성합니다.
-- (first_name, last_name, salary)
SELECT first_name, last_name, salary FROM employees WHERE salary >= 80000;


-- 4. 영업부(Sales)에서 근무하며 $50,000 이상의 급여를 받는 모든 직원의 이름과 급여를 반환하는 쿼리를 작성합니다.
-- (first_name, last_name, salary)
SELECT first_name, last_name, salary FROM employees WHERE department_id = 2 AND salary >= 50000;
SELECT first_name, last_name, salary 
	FROM employees AS E JOIN departments AS d
	ON d.department_id = e.department_id 
	WHERE d.department_name = 'Sales' AND salary >= 50000;

-- 5. 직함과 직함별 평균 급여를 반환하는 조회를 작성합니다.
-- (job_id, avg_salary)
SELECT job_id, AVG(salary) AS avg_salary FROM employees GROUP BY job_id;

-- (job_title, avg_salary)
SELECT job_title, AVG(salary) AS avg_salary 
	FROM employees AS e JOIN jobs AS j
	ON e.job_id = j.job_id
	GROUP BY job_title;

-- 6. 모든 직업에 대한 직책과 최대 급여를 반환하는 조회를 작성합니다.
SELECT job_title, MAX(max_salary) FROM jobs GROUP BY job_title;
SELECT job_id, MAX(max_salary) FROM jobs GROUP BY job_id;

SELECT job_title, MAX(salary) FROM jobs AS j JOIN employees AS e 
ON j.job_id = e.job_id 
GROUP BY job_title;

-- 7. 가장 높은 연봉을 받는 직원 상위 10명의 이름과 급여를 반환하는 쿼리를 작성합니다.
-- (first_name, last_name, salary)
SELECT first_name, last_name, salary FROM employees 
ORDER BY salary DESC LIMIT 10;

-- 8. 최저임금을 받는 하위 5명의 직원들의 이름과 급여를 반환하는 쿼리를 작성하세요.
SELECT first_name, last_name, salary FROM employees 
ORDER BY salary LIMIT 5;

-- 9. 관리자와 동일한 직함을 가진 모든 직원의 이름을 반환하는 쿼리를 작성합니다.

SELECT e.first_name, e.last_name
FROM employees AS e JOIN employees AS m
ON e.manager_id = m.employee_id
WHERE e.job_id = m.job_id;

SELECT e.first_name, e.last_name
FROM employees AS e JOIN employees AS m
ON e.job_id = m.job_id
WHERE e.manager_id = m.employee_id;

-- 10. 2021년에 채용된 모든 직원의 이름을 반환하는 쿼리를 작성합니다.
SELECT first_name, last_name, hire_date FROM employees 
WHERE hire_date BETWEEN '2021-01-01' AND '2021-12-31';

SELECT first_name, last_name, hire_date FROM employees 
WHERE hire_date >= '2021-01-01' AND hire_date <= '2021-12-31';

SELECT first_name, last_name, hire_date FROM employees 
WHERE YEAR(hire_date) LIKE 2021;

SELECT first_name, last_name, hire_date FROM employees 
WHERE YEAR(hire_date) = 2021;

-- 11. 수수료를 받는 모든 직원의 이름과 급여를 반환하는 쿼리를 작성합니다.
SELECT first_name, last_name, salary, commission_pct FROM employees
WHERE commission_pct IS NOT NULL;

-- 12. 수수료를 받지 않는 모든 직원의 이름과 급여를 반환하는 쿼리를 작성합니다.
SELECT first_name, last_name, salary, commission_pct FROM employees
WHERE commission_pct IS NULL;

-- 셀프 조인
CREATE TABLE users(
	id int primary key,
    name varchar(10),
    superior_id int
);

insert users values
(1, 'happy',null),
(2, 'banana',1),
(3, 'lucky',2),
(4, 'orange',2),
(5, 'apple',null);

select * from users;

select* from users as u1 join users as u2 on u1.superior_id = u2.id;