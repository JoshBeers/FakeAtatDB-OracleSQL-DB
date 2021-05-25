--query 12 gets all the employees who work at the same store as a designated employee
select FIRSTNAME||' '||LASTNAME Employee
from EMPLOYEE
where STORE = (select STORE from EMPLOYEE where lower(lastname) = lower('&Enter_LAst_Name'))
order by LASTNAME,FIRSTNAME;


--query 13, this query gets all of the products that are included in a plan
select IDPRODUCT ID, NAME Name, TYPE Type
from PRODUCT
where IDPRODUCT in (select PRODUCT from PRODUCTS_TO_PLANS)
order by IDPRODUCT;
