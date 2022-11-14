
-- ПРАКТИКА
/*
1) Создать таблицу students с полями
name (не null)
lastname (не null)
avg_mark (от 0 до 5)
gender varchar(128) (или “M” или “F”)
*/

create table students (
name varchar(128) not null,
lastname varchar(128) not null,
avg_mark numeric(2,1) check(avg_mark between 0 and 5),
gender varchar(128) check(gender in('M','F'))
);

/*
2) добавить 5 записей студентов

Олег Петров 4.3 M
Семен Степанов 3.1 M 
Ольга Семенова 4.7 F 
Игорь Романов 3.1 M 
Ирина Иванова 2.2 F
*/
insert into students (name, lastname, avg_mark, gender ) values 
('Олег', 'Петров', 4.3, 'M'),
('Семен', 'Степанов', 3.1, 'M'),
('Ольга', 'Семенова', 4.7, 'F'),
('Игорь', 'Романов', 3.3, 'M'),
('Ирина', 'Иванова', 2.2, 'F');

select * from students;
drop table students;

-- 3) добавить поле id integer primary key auto_increment
alter table students
add id integer primary key auto_increment;

-- 4) поменять тип у gender на char(1)
alter table students
modify column gender char(1);

-- 5) переименовать поле name на firstname

alter table students
change name firstname varchar(128);

-- ДЗ:

-- 6) выборки

-- - найти учеников, у которых оценка больше 4
select * from students
where avg_mark > 4;
-- - найти учеников, у которых не входит в диапазон от 3 до 4
select * from students
where avg_mark not between 3 and 4;
-- - найти учеников, у которых имя начинается на И
select * from students
where firstname like 'и%';
-- - найти учеников, у которых оценка 2.2 или 3.1 или 4.7 
select * from students
where avg_mark in(2.2, 3.1,4.7);


-- 7)  Найти набор уникальных оценок
select distinct
avg_mark
from students;
-- 8)  Увеличить всем учащимся оценку в 10 раз
alter table students
modify column avg_mark numeric(3,1);

alter table students
drop check students_chk_1;

update students
set avg_mark = avg_mark*10;

-- 9) Поменяйте у Олега Петрова фамилию на Сидоров
update students
set lastname = 'Сидоров'
where firstname = 'Олег' and lastname ='Петров';
-- 10) Для всех учеников, у которых оценка не больше 31 увеличить на 10
update students
set avg_mark = avg_mark+10
where avg_mark <= 31;


