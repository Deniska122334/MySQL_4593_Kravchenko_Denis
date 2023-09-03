CREATE database H_W_5;
use H_W_5;
create table staff (
  id INT PRIMARY KEY AUTO_INCREMENT,
  firstname VARCHAR(50),
  lastname VARCHAR(50),
  post VARCHAR(50),
  salary INT
);
INSERT INTO staff (firstname, lastname, post, salary) VALUES
('John', 'Doe', 'Engineer', 80000),
('Jane', 'Doe', 'Manager', 90000),
('Bob', 'Smith', 'Developer', 85000),
('Alice', 'Johnson', 'Designer', 75000),
('Charlie', 'Brown', 'Tester', 70000);
select * from staff;

creaTE TABLE ACADEMIC_RECORD (
id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50),
  quartal INT,
  subject VARCHAR(50),
  grade INT
);
INSERT INTO academic_record (name, quartal, subject, grade) VALUES
('Петя', 1, 'физика', 5),
('Петя', 1, 'математика', 4),
('Петя', 2, 'физика', 3),
('Петя', 2, 'математика', 4),
('Петя', 3, 'физика', 4),
('Петя', 3, 'математика', 5),
('Вася', 1, 'физика', 2),
('Вася', 1, 'математика', 3),
('Вася', 2, 'физика', 4),
('Вася', 2, 'математика', 4),
('Маша', 3, 'математика', 5),
('Маша', 1, 'физика', 2),
('Маша', 1, 'математика', 3),
('Маша', 2, 'физика', 4),
('Маша', 2, 'математика', 4);
SELECT * FROM ACADEMIC_RECORD;
-- 1
SELECT dense_rank()
over(
order by salary desc) as rank_salary,
cONCAT(FIRSTNAME, " ", LASTNAME) as фио,
post, salary FROM staff 
ORDER BY rank_salary;

-- 2

SELECT rank()
over(
-- PARTITION BY POST 
order by salary desc) as rank_salary,
cONCAT(FIRSTNAME, " ", LASTNAME) as фио,
post, salary FROM staff 
ORDER BY post, rank_salary;

-- 3

select rank_salary, post, salary from (select rank()
over(
partition by post
order by salary desc) as rank_salary,
cONCAT(FIRSTNAME, " ", LASTNAME) as фио,
post, salary FROM staff) as list
where rank_salary = 1
ORDER BY salary desc;

INSERT INTO staff (firstname, lastname, post, salary) VALUES
('John', 'Doe', 'Engineer', 1100000),
('Jane', 'Doe', 'Manager', 95000);





 -- ДОМАШКА
-- 1. текущая успеваемость
SELECT name, grade, quartal, subject
from academic_record
WHERE name = 'Петя' AND subject = 'физика'
ORDER BY quartal;
-- 2. оценка в следующей четверти
SELECT name, grade, quartal, 
lead(grade) over (order by quartal) as 'оценка в следующей	 четверти'
from academic_record
WHERE name = 'Петя' AND subject = 'физика'
ORDER BY quartal;
-- 3. оценка в предыдущей четверти
SELECT name, grade, quartal, 
lag(grade) over (order by quartal) as 'оценка в предыдущей четверти'
from academic_record
WHERE name = 'Петя' AND subject = 'физика'
ORDER BY quartal;


-- V.2
select name, subject, quartal, grade,
LAG(grade) OVER (PARTITION BY name) AS "пред четверть",
LEAD(grade) OVER (PARTITION BY name) AS "след четверть"
from academic_record
where name="Петя" AND subject="физика";