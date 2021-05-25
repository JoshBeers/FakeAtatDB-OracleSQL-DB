--drops all tables
DROP TABLE products_to_plans CASCADE CONSTRAINTS;
DROP TABLE plans_to_customers CASCADE CONSTRAINTS;
DROP TABLE CUSTOMER CASCADE CONSTRAINTS;
DROP TABLE EMPLOYEE CASCADE CONSTRAINTS;
DROP TABLE STORE CASCADE CONSTRAINTS;
DROP TABLE plan CASCADE CONSTRAINTS;
DROP TABLE product CASCADE CONSTRAINTS;

--drops all sequences
drop sequence store_seq;
drop sequence employee_seq;
drop sequence customer_seq;
drop sequence plan_seq;
drop sequence product_seq;

--creates the store table
create table Store(
    idStore Number(6),
    city VARCHAR(75),
    zip varchar(9) not null ,
    constraint store_idStore_pk PRIMARY KEY (idStore)
);

--creates the employee table
create table EMPLOYEE(
    idEmployee number(6),
    firstName varchar(30) not null ,
    lastName varchar(30) not null ,
    startDate DATE not null ,
    position varchar(10) not null ,
    store number(6),
    constraint employee_idEmployee_pk primary key (idEmployee),
    constraint employee_idStore_fk FOREIGN KEY (store) references Store(idStore)
);

--creates the customer table
create table customer(
    idCustomer number(6),
    firstName varchar(30),
    lastName varchar(30) not null,
    employee number(6),
    constraint customer_idCustomer_pk PRIMARY KEY (idCustomer),
    constraint customer_idEmployee_fk FOREIGN KEY (employee) references employee(idEmployee)
);

--creates the plan table
create table plan(
    idPlan number(6),
    name varchar(30) not null,
    type varchar(30) not null,
    description varchar(160) not null,
    constraint plan_idPlan_pk primary key (idPlan)
);

--creates the product table
create table product(
    idProduct number(6),
    name varchar(30) not null,
    description varchar(160) not null,
    type varchar(3) not null,
    constraint product_idProduct_pk primary key (idProduct)
);

--creates the intermediate table between plans and customers
create table plans_to_customers(
    customer number(6),
    plan number(6),
    constraint pTC_customerAndPlan_cpk primary key (customer,plan),
    constraint pTC_customer_fk foreign key (customer) references customer(idCustomer),
    constraint pTC_plan_fk foreign key (plan) references plan(idPlan)
);

--creates the intermediate table between plans and products
create table products_to_plans(
    product number(6),
    plan number(6),
    constraint pTP_productAndPlan_cpk primary key (product,plan),
    constraint pTP_product_fk foreign key (product) references product(idProduct),
    constraint pTP_plan_fk foreign key (plan) references plan(idPlan)
);

--create sequences for primary keys
Create sequence store_seq
start with 1
increment by 1;

create sequence employee_seq
start with 1
increment by 1;

create sequence customer_seq
start with 1
increment by 1;

create sequence plan_seq
start with 1
increment by 1;

create sequence product_seq
start with 1
increment by 1;

--creating store data
insert into store values (store_seq.nextval, 'jamestown', 20158);
insert into store values (store_seq.nextval, 'new york', 14568);
insert into store values (store_seq.nextval, 'atlanta', 30519);
insert into store values (store_seq.nextval, 'penington', 47894);
insert into store values (store_seq.nextval, 'clarksville', 75681);
insert into store values (store_seq.nextval, 'houston', 45896);
insert into store values (store_seq.nextval, 'clarksville', 75681);
insert into store values (store_seq.nextval, null, 15647);

--creating employee data
insert into EMPLOYEE values (employee_seq.nextVal,'Alan','Darren','1May16','a manager',1);
insert into EMPLOYEE values (employee_seq.nextVal,'Jason','Blake','8Mar04','manager',8);
insert into EMPLOYEE values (employee_seq.nextVal,'Calum','Calum','8Jun43','manager',3);
insert into EMPLOYEE values (employee_seq.nextVal,'George','Max','25Nov76','a manager',6);
insert into EMPLOYEE values (employee_seq.nextVal,'Declan','Rhys','13Jun21','4th key',1);
insert into EMPLOYEE values (employee_seq.nextVal,'Gary','Nicholas','16May30','sales',null);
insert into EMPLOYEE values (employee_seq.nextVal,'Alexander','Ronald','2Nov58','4th key',7);
insert into EMPLOYEE values (employee_seq.nextVal,'Nathan','Alistair','15feb12','manager',3);
insert into EMPLOYEE values (employee_seq.nextVal,'Marc','Harrison','5Sep58','sales',1);
insert into EMPLOYEE values (employee_seq.nextVal,'Alan','Martin','21Jul84','4th key',7);
insert into EMPLOYEE values (employee_seq.nextVal,'Nathan','Max','5Jul15','4th key',4);
insert into EMPLOYEE values (employee_seq.nextVal,'Graham','Luke','1Jun31','a manager',null);
insert into EMPLOYEE values (employee_seq.nextVal,'Allan','Nathan','19Aug62','a manager',5);
insert into EMPLOYEE values (employee_seq.nextVal,'Simon','Andrew','26Oct86','sales',7);
insert into EMPLOYEE values (employee_seq.nextVal,'Joshua','Kevin','8mar26','a manager',7);
insert into EMPLOYEE values (employee_seq.nextVal,'Euan','Brodie','15Sep66','manager',6);
insert into EMPLOYEE values (employee_seq.nextVal,'Robert','Callum','1Jul26','a manager',6);
insert into EMPLOYEE values (employee_seq.nextVal,'Graeme','Archie','4Oct05','a manager',2);
insert into EMPLOYEE values (employee_seq.nextVal,'Jake','Kyle','15apr78','a manager',1);
insert into EMPLOYEE values (employee_seq.nextVal,'Kieran','Blair','12apr64','4th key',5);

--creating customer date
insert into customer values (customer_seq.nextVal,'James','Jake',5);
insert into customer values (customer_seq.nextVal,'Darren','Isaac',20);
insert into customer values (customer_seq.nextVal,'Conner','Mark',8);
insert into customer values (customer_seq.nextVal,'Kevin','Murray',null);
insert into customer values (customer_seq.nextVal,null,'Ian',19);
insert into customer values (customer_seq.nextVal,'Caleb','Cameron',7);
insert into customer values (customer_seq.nextVal,'James','Josh',9);
insert into customer values (customer_seq.nextVal,'Jason','Jonathan',19);
insert into customer values (customer_seq.nextVal,null,'Mohammed',12);
insert into customer values (customer_seq.nextVal,'Patrick','Iain',3);
insert into customer values (customer_seq.nextVal,null,'Kevin',6);
insert into customer values (customer_seq.nextVal,'Euan','Kieran',null);
insert into customer values (customer_seq.nextVal,'Andrew','Niall',18);
insert into customer values (customer_seq.nextVal,null,'Darren',17);
insert into customer values (customer_seq.nextVal,null,'Thomas',6);
insert into customer values (customer_seq.nextVal,'Jordan','Robert',7);
insert into customer values (customer_seq.nextVal,null,'Jay',2);
insert into customer values (customer_seq.nextVal,'Charles','Garry',6);
insert into customer values (customer_seq.nextVal,'Richard','Dylan',3);
insert into customer values (customer_seq.nextVal,'Fraser','Duncan',4);

--creating plans
insert into plan values (plan_seq.nextval,'phone','mp','mobile only talk phone');
insert into plan values (plan_seq.nextval,'data','mp','mobile phone data only');
insert into plan values (plan_seq.nextval,'phoneAndData10','mp','mobile talk and data 10Gb');
insert into plan values (plan_seq.nextval,'text','mp','mobile only text phone');
insert into plan values (plan_seq.nextval,'allPhone10','mp','talk, text, and data 10gb for mobile');
insert into plan values (plan_seq.nextval,'unlimited','mp','unlimited talk text and data');
insert into plan values (plan_seq.nextval,'home Internet 100','hi','100mbs home internet');
insert into plan values (plan_seq.nextval,'home Internet 1000','hi','1000mbs home internet');
insert into plan values (plan_seq.nextval,'home Internet 10000','hi','10000mbs home internet');

--create products
insert into product values (product_seq.nextval,'iphone 1', 'iphone 1 des', 'mp');
insert into product values (product_seq.nextval,'ipad', 'ipad des', 'tb');
insert into product values (product_seq.nextval,'laptop', 'generic laptop', 'pc');
insert into product values (product_seq.nextval,'apple watch','smart watch', 'sw');
insert into product values (product_seq.nextval,'access point', 'wireless access point', 'net');
insert into product values (product_seq.nextval,'hotpost', 'mobile hotspot', 'net');
insert into product values (product_seq.nextval,'Android phone', 'Android phone des', 'mp');
insert into product values (product_seq.nextval,'Android phone', 'Android phone des', 'mp');

--creates plans to customer link
insert into plans_to_customers values (4,2);
insert into plans_to_customers values (7,3);
insert into plans_to_customers values (8,4);
insert into plans_to_customers values (20,5);
insert into plans_to_customers values (15,6);
insert into plans_to_customers values (7,7);
insert into plans_to_customers values (2,8);
insert into plans_to_customers values (4,9);
insert into plans_to_customers values (5,2);

--creates products to plans
insert into products_to_plans values(1,5);
insert into products_to_plans values(2,3);
insert into products_to_plans values(3,9);
insert into products_to_plans values(4,8);
insert into products_to_plans values(5,6);
insert into products_to_plans values(6,4);
insert into products_to_plans values(7,2);
insert into products_to_plans values(8,7);
insert into products_to_plans values(8,3);
insert into products_to_plans values(3,5);


commit;