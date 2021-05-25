--query 4 gets the names of all the assistant managers and managers
-- pads the names for be 20 characters long with spaces in the middle
-- ordered by last then first name
select (rpad(FIRSTNAME,10,' ')||' '||lpad(LASTNAME,10,' ')) Manager, POSITION position
from EMPLOYEE
where not instr(POSITION,'manager') = 0
order by LASTNAME,FIRSTNAME;

--query 5 Gets the name and number of months since start of each employee, ordered by the number of months descending, yes there are negatives
select (FIRSTNAME||' '||Lastname) Name, TRUNC(MONTHS_BETWEEN(current_date ,STARTDATE)) "Months Since Start"
from EMPLOYEE
order by 2 desc;