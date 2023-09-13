use tempdb;
go
drop database if exists Temirlan; 
go
create database Temirlan;
go
use Temirlan;
go
drop schema if exists HomeWork;
go
create schema HomeWork;
go
drop table if exists HomeWork.Cars;
go
create table HomeWork.Cars(
 id int primary key identity(1,1),
 Vendor nvarchar(20) not null,
 Model nvarchar(20) not null,
 Qty int not null,
 Price int not null,
)

insert into HomeWork.Cars(Vendor, Model, Qty,Price)
values 
('Audi','A4',12, 34000),
('Audi','A6',18, 48000),
('Opel','Vectra',28, 18000),
('Volkswagen','Golf',34,17000),
('Volkswagen','Passat',29,28000)
go

select c.Qty*c.Price as Summa, c.Qty as Quantity 
from HomeWork.Cars as c
where c.Qty>15 and c.Qty <30;

alter table HomeWork.Cars
add Definition nvarchar(50);
go

-- вы нам не показывали как менять данные в определенном столбце поэтому я погуглил
-- а еще при редактировании или селекте нового столбца редактор показывает как ошибка. 
-- т.е. не видит новый столбец после alter add
-- меня это сильно сбивало с толку

update HomeWork.Cars
set Definition = 'hello world'
where id = 1;
update HomeWork.Cars
set Definition = 'TEST'
where id = 2;
update HomeWork.Cars
set Definition = 'why Definition is shown us as an error?'
where id =3;
update HomeWork.Cars
set Definition = 'and still works??'
where id = 4;
update HomeWork.Cars
set Definition = 'that misled me so much'
where id = 5;

select*from HomeWork.Cars

select Definition from HomeWork.Cars