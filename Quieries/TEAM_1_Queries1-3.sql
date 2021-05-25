
-- Query 1: gets all employees name that are assistant managers or managers
select (FIRSTNAME||' '||EMPLOYEE.LASTNAME) Manager
from EMPLOYEE
where POSITION = 'manager' or POSITION = 'a manager'
order by LASTNAME;

-- Query 2: searches for customer based on input
select (FIRSTNAME||' '||LASTNAME) Employee
from Customer
where upper(FirstName||' '||LastName) like upper('%&name%')
order by Lastname, FirstName;

--query 3: gets all the products that have a type of tablet(tb) or mobile phone(mp)
select name "product name", type
from product
where type in('tb','mp')
order by name
fetch first 3 rows only;
