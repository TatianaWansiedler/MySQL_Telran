-- Создайте таблицу goods:
-- id первичный ключ
-- title строка 128
-- quantity строка 128
-- price целое число
-- Добавьте 10 строк
-- Проверьте содержимое таблицы
-- Найдите товары дешевле 1000
-- Найдите товары, начинающиеся на А
-- Удалите товары дороже 1000 *
-- Очистите всю таблицу *

show databases;
create database homeworks;
use homeworks;
create table goods (
	id integer primary key auto_increment,
  	title varchar(128),
  	quantity integer,
  	price integer
);
insert into goods (title, quantity, price) values ('Яблоки', 10, 250),
														('Груши', 17, 290),
														('Апельсины', 6, 770),
														('Виноград', 15, 370),
														('Арбуз', 3, 1500),
														('Дыня', 14, 250),
														('Томаты', 19, 450),
														('Огурцы', 25, 750),
														('Киви', 15, 660),
														('Авокадо', 7, 1000);


show tables;
drop table goods;

select * from goods;

select * from goods 
where price < 1000;

select * from goods 
where title like 'а%';


delete from goods
where price > 1000;

delete from goods
where title like 'а%';

set sql_safe_updates = 0;

delete from goods;
truncate goods;  -- удаляет содержимое таблицы до первоначального состояния (id обновиться и начнется с 1)



create table users (
	id integer primary key auto_increment,
  	firstname varchar(128),
  	lastname varchar(128),
  	age integer check(age>=18) default 20,
    gender char(1) check(gender in ('m', 'f'))
);
insert into users (firstname, lastname, gender) values ('Anna','Ivanova', 'f');
insert into users (firstname, lastname, age, gender) values ('Ivan','Ivanov',30, 'm');

select * from users;
truncate users;

/*
Создать таблицу students с полями:
id первичный ключ авто-инкремент
firstname строка 128 not null
lastname строка 128 not null
age больше 20
group строка 128
avg_mark число от 0 до 5 значение по умолчанию 3.0
*/

create table students (
	id integer primary key auto_increment,
  	firstname varchar(128) not null,
  	lastname varchar(128),
  	age integer check(age>20),
    avg_mark numeric(2,1) check(avg_mark between 0 and 5) default 3.0
);
insert into students (firstname, lastname, age, avg_mark) values ('Anna', 'Ivanova', 22, 5.0),
																('Ivan', 'Petrov', 21, 4.0);

															
insert into students (firstname, lastname, age) values ('Igor', 'Nikolaev', 23),
														('Nikolay', 'Serov', 25);
                                                                
select * from students;

