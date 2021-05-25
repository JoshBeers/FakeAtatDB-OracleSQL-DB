--query8, counts the number of employees for each store
select store,count(*) "Number of Employees"
from Employee
group by Store
order by store;

--query9, counts the number of customers for each employee with more than one customer
select employee, count(*) "number of customers"
from Customer
group by employee
having count(8)>1
order by employee;
