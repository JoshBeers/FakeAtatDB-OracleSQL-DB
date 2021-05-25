--q14 this query gets all of the products and plans aka everything sold
select NAME, DESCRIPTION, 'Product' Type
from PRODUCT
union
select NAME, DESCRIPTION, 'Plan'
from PLAN
order by 1;



--q15 this query returns all of the customers that dont have a plan
select IDCUSTOMER "Customer ID", FIRSTNAME||' '||CUSTOMER.LASTNAME Name
from CUSTOMER
minus
select CUSTOMER,(select distinct FIRSTNAME||' '||CUSTOMER.LASTNAME  from CUSTOMER where IDCUSTOMER = pTC.CUSTOMER)
from PLANS_TO_CUSTOMERS pTC;

