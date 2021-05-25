--q10 this table shows each employee and their store
select FIRSTNAME||' '||Lastname Name, STORE "Store ID", CITY "Location"
from EMPLOYEE e join STORE s
on e.STORE = s.IDSTORE
order by STORE;


--q11 this query shows all customers and the employee that is associated with that customer if one exists
select c.FIRSTNAME||' '||c.LASTNAME Name, EMPLOYEE "employee id", E.FIRSTNAME||' '||e.LASTNAME "Employee Name"
from CUSTOMER c left join EMPLOYEE e
on c.EMPLOYEE = e.IDEMPLOYEE
order by 1;
