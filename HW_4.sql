select * from AUTO;
-- 1. Вывести на экран сколько машин каждого цвета для машин марок BMW и LADA
select mark 'Произодитель', color 'Цвет', count(*) 'Остаток' 
from auto 
where mark in ('BMW','LADA')
group by color, mark
order by mark, color;

-- 2. Вывести на экран марку авто и количество AUTO не этой марки
select mark 'Производитель', count(*) 'Количество машин произодителя', (select sum(a.total) from (select mark, count(*) total 
from auto 
group by mark 
having mark != a_all.mark) a) 'Остаток машин других производителей'
from auto a_all group by mark;
-- 3.	Вывести марку авто - а так же сколько авто такой марки в таблице , вывести записи где количество авто такой марки больше 2, 
-- записи на должны дублироваться
SELECT MARK, COUNT(*) AS sum
FROM AUTO
GROUP BY MARK
HAVING sum > 2;

-- 4.	Вывести Марку и цвет автомобиля - имя и фамилию покупателя, для всех покупателей, которые живут в городе с населением больше 
-- 1 млн человек.
select mark, color, firstname, lastname from auto a inner join man m on m.phonenum = a.phonenum where m.citycode in

(select citycode from city c where c.peoples> 1000000 )