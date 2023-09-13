use tsql;
go 

--Task 1: 
--  Write an UPDATE statement to update all the records in the sales.Customers 
--  table that have a city of ‘Berlin’ and a contacttitle of ‘Sales Representative’ 
--  to have a contacttitle of ‘Sales Consultant’. 

--select* from sales.Customers;
--go

drop table if exists CustomersBak;
go

select* into CustomersBak
from sales.Customers;
go

update CustomersBak
set contacttitle = 'Sales Consultant'
output inserted.contacttitle as newContacttitle,
       deleted.contacttitle as oldContacttitle
where city = 'Berlin' and contacttitle = 'Sales Representative';
go

  --Task 2: 
  --Write a DELETE statement to delete all the records in the sales.Customers2 
  --table which have the contactname of ‘Taylor, Maurice’, ‘Mallit, Ken’, or ‘Tiano, Mike’, 
  --as these records have now been added to the sales.Customers table.

  delete from CustomersBak
  output deleted.*
  where contactname in('Taylor, Maurice', 'Mallit, Ken','Tiano, Mike');
  go