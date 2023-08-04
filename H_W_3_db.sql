create database H_W_3_db;
use H_W_3_db;
CREATE TABLE staff
(
id int primary key not null auto_increment,
firstname varchar(40) not null,
lastname varchar(40) not null,
post varchar(40) not null,
seniority int,
salary int,
age int not null
);

insert into staff
VALUES
(null, 'Вася', 'Петров', 'Начальник', '40', 100000, 60),
(null,'Петр', 'Власов', 'Начальник', '8', 70000, 30),
(null,'Катя', 'Катина', 'Инженер', '2', 70000, 19),
(null,'Саша', 'Сасин', 'Инженер', '12', 50000, 35),
(null,'Иван', 'Иванов', 'Рабочий', '40', 30000, 59),
(null,'Петр', 'Петров', 'Рабочий', '20', 25000, 40),
(null,'Сидр', 'Сидоров', 'Рабочий', '10', 20000, 35),
(null,'Антон', 'Антонов', 'Рабочий', '8', 19000, 28),
(null,'Юрий', 'Юрков', 'Рабочий', '5', 15000, 25),
(null,'Максим', 'Максимов', 'Рабочий', '2', 11000, 22),
(null,'Юрий', 'Галкин', 'Рабочий', '3', 12000, 24),
(null,'Людмила', 'Маркина', 'Уборщик', '10', 10000, 49);
-- 1.Отсортируйте поле “зарплата” (salary) в порядке убывания и возрастания
select *
from staff
order by salary;

select *
from staff
order by salary desc;

-- 2. Выведите 5 максимальных зарплат (salary)
select *
from staff
order by salary desc
limit 5;


-- 3. Подсчитать суммарную зарплату(salary) по каждой специальности (post)
select post, sum(salary)
from staff
group by post;

-- 4. Найти количество сотрудников по специальности “Рабочий” (post) в возрасте от 24 до 49 лет.
select count(*)
from staff
where post='рабочий' and age between 24 and 49;

-- 5. Найти количество специальностей
select count(*)
from (select distinct post from staff) as temp;

-- 6. Вывести специальности, у которых средний возраст сотрудника меньше 30 лет
select post, avg(age)
from staff
group by post
having avg(age)<30;