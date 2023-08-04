/*
Task 1. Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными.
*/

CREATE DATABASE Home_Work_2_db;
use Home_Work_2_db;
create table sales(

id int unsigned not null auto_increment unique primary key,
order_date DATE,
count_product int default '0' 
);

insert into `sales` (order_date, count_product)
VALUES

('2022-01-01', '156'),
('2022-01-02', '180'),
('2022-01-03', '21'),
('2022-01-04', '124'),
('2022-01-05', '341');
select * from sales;
SELECT 
	id AS 'id заказа',
	IF (count_product < 100, 'Маленький заказ', 
		IF (count_product BETWEEN 100 AND 300, 'Средний заказ', 'Большой заказ')
	) AS 'Тип заказа'	
FROM sales;