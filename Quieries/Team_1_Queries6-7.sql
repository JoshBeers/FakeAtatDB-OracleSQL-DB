-- query 6
-- This query returns all the empolyees with their start date for a user chosen month
select FIRSTNAME ||' '|| lastname Name, TO_CHAR(STARTDATE,'mm/dd/yy') "Hire Date"
from EMPLOYEE
where to_char(STARTDATE,'mm') = to_char( to_date('&month','Month'),'mm')
order by firstname;


-- query 7
-- this query returns products names with their type spelled out
select NAME "Product Name",(case when type = 'mp' then 'Mobile Phone'
                when TYPE = 'tb' then 'Tablet'
                when TYPE = 'pc' then 'Personal Computer'
                when TYPE = 'sw' then 'Smart Watch'
                when TYPE = 'net' then 'Networking' end ) "product type"
from PRODUCT
order by type;