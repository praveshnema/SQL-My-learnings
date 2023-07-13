use mypractice;

--scnario based questions and solution

------------------------------------------------------------------------------------------------------------------------------------------------
--Q.1 check duplicates from below table

DROP TABLE IF EXISTS dbo.employee;
CREATE TABLE employee 
(
    EmployeeID	INT,
    First_Name	VARCHAR(512),
    Last_Name	VARCHAR(512),
    Phone	INT,
    Email	VARCHAR(512)
);

INSERT INTO employee (EmployeeID, First_Name, Last_Name, Phone, Email) VALUES ('1', 'Adam', 'Owens', '444345999', 'adam@demo.com');
INSERT INTO employee (EmployeeID, First_Name, Last_Name, Phone, Email) VALUES ('2', 'Mark', 'Wilis', '245666921', 'mark@demo.com');
INSERT INTO employee (EmployeeID, First_Name, Last_Name, Phone, Email) VALUES ('3', 'Natasha', 'Lee', '321888909', 'natasha@demo.com');
INSERT INTO employee (EmployeeID, First_Name, Last_Name, Phone, Email) VALUES ('5', 'Adam', 'Owens', '444345999', 'adam@demo.com');
INSERT INTO employee (EmployeeID, First_Name, Last_Name, Phone, Email) VALUES ('4', 'Riley', 'Jones', '123345959', 'riley@demo.com');
INSERT INTO employee (EmployeeID, First_Name, Last_Name, Phone, Email) VALUES ('6', 'Natasha', 'Lee', '321888909', 'natasha@demo.com');

select * from employee;
---Solution:

select first_name,Last_Name,phone,email ,count(*) from employee group by first_name,Last_Name,phone,email having count(*)>1;

------------------------------------------------------------------------------------------------------------------------------------------------
--Q.2 delete duplicates from above table (which comes earlier)

---Solution:
--select min(EmployeeID) from employee group by first_name,Last_Name,phone,email --> gives all unique 

delete from employee where EmployeeID not in (select min(EmployeeID) from employee group by first_name,Last_Name,phone,email) ;

select * from employee order by EmployeeID;
------------------------------------------------------------------------------------------------------------------------------------------------
--Q.3 delete duplicates from below table (which comes latest)

DROP TABLE IF EXISTS dbo.employee;
CREATE TABLE employee 
(
    EmployeeID	INT,
    First_Name	VARCHAR(512),
    Last_Name	VARCHAR(512),
    Phone	INT,
    Email	VARCHAR(512)
);

INSERT INTO employee (EmployeeID, First_Name, Last_Name, Phone, Email) VALUES ('1', 'Adam', 'Owens', '444345999', 'adam@demo.com');
INSERT INTO employee (EmployeeID, First_Name, Last_Name, Phone, Email) VALUES ('2', 'Mark', 'Wilis', '245666921', 'mark@demo.com');
INSERT INTO employee (EmployeeID, First_Name, Last_Name, Phone, Email) VALUES ('3', 'Natasha', 'Lee', '321888909', 'natasha@demo.com');
INSERT INTO employee (EmployeeID, First_Name, Last_Name, Phone, Email) VALUES ('5', 'Adam', 'Owens', '444345999', 'adam@demo.com');
INSERT INTO employee (EmployeeID, First_Name, Last_Name, Phone, Email) VALUES ('4', 'Riley', 'Jones', '123345959', 'riley@demo.com');
INSERT INTO employee (EmployeeID, First_Name, Last_Name, Phone, Email) VALUES ('6', 'Natasha', 'Lee', '321888909', 'natasha@demo.com');

select * from employee;

---Solution:
--select max(EmployeeID) from employee group by first_name,Last_Name,phone,email --> gives all unique 

delete from employee where EmployeeID not in (select max(EmployeeID) from employee group by first_name,Last_Name,phone,email);

select * from employee order by EmployeeID;
------------------------------------------------------------------------------------------------------------------------------------------------
--Q.4 delete duplicates from below table (which comes latest) [without using subquery]

DROP TABLE IF EXISTS dbo.employee;
CREATE TABLE employee 
(
    EmployeeID	INT,
    First_Name	VARCHAR(512),
    Last_Name	VARCHAR(512),
    Phone	INT,
    Email	VARCHAR(512)
);

INSERT INTO employee (EmployeeID, First_Name, Last_Name, Phone, Email) VALUES ('1', 'Adam', 'Owens', '444345999', 'adam@demo.com');
INSERT INTO employee (EmployeeID, First_Name, Last_Name, Phone, Email) VALUES ('2', 'Mark', 'Wilis', '245666921', 'mark@demo.com');
INSERT INTO employee (EmployeeID, First_Name, Last_Name, Phone, Email) VALUES ('3', 'Natasha', 'Lee', '321888909', 'natasha@demo.com');
INSERT INTO employee (EmployeeID, First_Name, Last_Name, Phone, Email) VALUES ('5', 'Adam', 'Owens', '444345999', 'adam@demo.com');
INSERT INTO employee (EmployeeID, First_Name, Last_Name, Phone, Email) VALUES ('4', 'Riley', 'Jones', '123345959', 'riley@demo.com');
INSERT INTO employee (EmployeeID, First_Name, Last_Name, Phone, Email) VALUES ('6', 'Natasha', 'Lee', '321888909', 'natasha@demo.com');

select * from employee;

---Solution:
--We are using Common table expression for this
with cte as(
select first_name,last_name, DENSE_RANK() over(partition by first_name,last_name order by employeeID desc) as rk from employee)

delete from cte where rk>1;
select * from employee;

------------------------------------------------------------------------------------------------------------------------------------------------
--Q.5 Find Nth highest salary from below table:

DROP TABLE IF EXISTS dbo.employee
CREATE TABLE [employee] 
(
    Employee_id	INT,
    First_name	VARCHAR(512),
    Last_name	VARCHAR(512),
    phone	INT,
    email	VARCHAR(512),
    salary	INT
);

INSERT INTO [employee]  VALUES ('3', 'Natasha', 'Lee', '321888909', 'natasha@demo.com', '30000');
INSERT INTO [employee]  VALUES ('2', 'Mark', 'Wilis', '245666921', 'mark@demo.com', '85000');
INSERT INTO [employee]  VALUES ('1', 'Melissa', 'Rhodes', '1893456702', 'melissa@demo.com', '40000');
INSERT INTO [employee]  VALUES ('5', 'Adam', 'Owens', '444345999', 'adam@demo.com', '60000');
INSERT INTO [employee]  VALUES ('4', 'Riley', 'Jones', '123345959', 'riley@demo.com', '75000');
INSERT INTO [employee]  VALUES ('6', 'Nick', 'Adams', '1363456702', 'nick@demo.com', '45000');
select * from employee;

--Solution:


-- When Highest/Lowest asked:
select * from employee where salary = (select max(salary) from employee);



-- When 2nd Highest/Lowest asked:
select top 1 * from employee where salary < (select max(salary) from employee) order by salary desc;



-- When 3rd/4rth/5th/nth Highest/Lowest asked:
--below is example of 4rth highest:
select top 1 * from employee where salary in (select top 4 salary from employee order by salary desc) order by salary;



-- When 3rd/4rth/5th/nth Highest/Lowest asked [without top]:
--below is example of 4rth highest:
select *  from  ( select *,ROW_NUMBER() over(order by salary desc) as rn from employee) as new where rn=4;



-- When 3rd/4rth/5th/nth Highest/Lowest asked [without top][with common table expression]:
--below is example of 4rth highest:
with cte as 
(select *, dense_rank() over(order by salary desc) as ranks from employee)

select * from cte where ranks=3;

------------------------------------------------------------------------------------------------------------------------------------------------
--Q6. find out employee manager hirarchy from below table:

DROP TABLE IF EXISTS dbo.employee
CREATE TABLE [employee] 
(
    [EmployeelD]	INT,
    [FirstName]	VARCHAR(512),
    [LastName]	VARCHAR(512),
    [ManagerlD]	INT
);

INSERT INTO [employee] ([EmployeelD], [FirstName], [LastName], [ManagerlD]) VALUES ('1', 'Adam', 'Owens', '3');
INSERT INTO [employee] ([EmployeelD], [FirstName], [LastName], [ManagerlD]) VALUES ('2', 'Mark', 'Hopkins', NULL);
INSERT INTO [employee] ([EmployeelD], [FirstName], [LastName], [ManagerlD]) VALUES ('3', 'Natasha', 'Lee', '2');
INSERT INTO [employee] ([EmployeelD], [FirstName], [LastName], [ManagerlD]) VALUES ('4', 'Riley', 'Cooper', '5');
INSERT INTO [employee] ([EmployeelD], [FirstName], [LastName], [ManagerlD]) VALUES ('5', 'Jennifer', 'Hudson', '2');
INSERT INTO [employee] ([EmployeelD], [FirstName], [LastName], [ManagerlD]) VALUES ('6', 'David', 'Wamer', '5');
select * from employee;

--solution
select concat(emp.FirstName,' ',emp.LastName) as employee_name,concat(mgr.FirstName,' ',mgr.LastName) as manager_name 
from employee as emp left join employee as mgr on emp.ManagerlD=mgr.EmployeelD;


------------------------------------------------------------------------------------------------------------------------------------------------
--Q7. Convert data from Rows to Columns using Case:

DROP TABLE IF EXISTS dbo.employee

CREATE TABLE [employee] 
(
    name varchar(max),
	value varchar(max),
	id int
);

INSERT INTO [employee] VALUES ('Name', 'Adam', 1);
INSERT INTO [employee] VALUES ('Gender', 'Male', 1);
INSERT INTO [employee] VALUES ('Salary', 5000, 1);
select * from employee;

--solution
/*
select id,
case when Name='name' then value else '' end as name,
case when Name='gender' then value else '' end as gender,
case when Name='salary' then value else '' end as salary                     
from employee                                                          --here data is not what is want so we use max function
*/

select id,
max(case when Name='name' then value else '' end) as name,
max(case  when Name='gender' then value else '' end) as gender,
max(case when Name='salary' then value else '' end) as salary                     
from employee
group by id;  

------------------------------------------------------------------------------------------------------------------------------------------------
--Q8. Convert data from Rows to Columns using PIVOT table:
DROP TABLE IF EXISTS dbo.employee

CREATE TABLE [employee] 
(
    name varchar(max),
	value varchar(max),
	id int
);

INSERT INTO [employee] VALUES ('Name', 'Adam', 1);
INSERT INTO [employee] VALUES ('Gender', 'Male', 1);
INSERT INTO [employee] VALUES ('Salary', 5000, 1);

select * from employee;

--solution:


select id,[name],[gender],[salary] from
(select id,name as ename,value from employee) as maintable
pivot
(max(value) for ename in ([name],[gender],[salary])) as pvt

------------------------------------------------------------------------------------------------------------------------------------------------
--Q9. Custom Sorting | Order by Month in an Year

DROP TABLE IF EXISTS dbo.sales

CREATE TABLE [sales] 
(
    month_name varchar(max),
	sales int
);

INSERT INTO [sales] VALUES ('April', 2000);
INSERT INTO [sales] VALUES ('January', 3000);
INSERT INTO [sales] VALUES ('March', 5000);
INSERT INTO [sales] VALUES ('May', 2000);
INSERT INTO [sales] VALUES ('February', 2500);
INSERT INTO [sales] VALUES ('October', 2000);
INSERT INTO [sales] VALUES ('June', 3000);
INSERT INTO [sales] VALUES ('August', 5000);
INSERT INTO [sales] VALUES ('September', 2000);
INSERT INTO [sales] VALUES ('July', 2500);
INSERT INTO [sales] VALUES ('December', 2000);
INSERT INTO [sales] VALUES ('November', 3500);

select * from sales;

----solution:
select * from sales
order by 
case 
when month_name ='January' then 1
when month_name ='February' then 2
when month_name ='March' then 3
when month_name ='April' then 4
when month_name ='May' then 5
when month_name ='June' then 6
when month_name ='July' then 7
when month_name ='August' then 8
when month_name ='September' then 9
when month_name ='October' then 10
when month_name ='November' then 11
when month_name ='December' then 12
else null end

------------------------------------------------------------------------------------------------------------------------------------------------
--Q10. Custom Sorting | want particular row always on top (adam owen empid 4 should be at top) and then sort by first_name in descending
DROP TABLE IF EXISTS dbo.employee;
CREATE TABLE employee 
(
    EmployeeID	INT,
    First_Name	VARCHAR(512),
    Last_Name	VARCHAR(512),
    Phone	INT,
    Email	VARCHAR(512)
);

INSERT INTO employee (EmployeeID, First_Name, Last_Name, Phone, Email) VALUES ('1', 'Adam', 'Owens', '444345999', 'adam@demo.com');
INSERT INTO employee (EmployeeID, First_Name, Last_Name, Phone, Email) VALUES ('2', 'Mark', 'Wilis', '245666921', 'mark@demo.com');
INSERT INTO employee (EmployeeID, First_Name, Last_Name, Phone, Email) VALUES ('3', 'Natasha', 'Lee', '321888909', 'natasha@demo.com');
INSERT INTO employee (EmployeeID, First_Name, Last_Name, Phone, Email) VALUES ('5', 'Adam', 'Owens', '444345999', 'adam@demo.com');
INSERT INTO employee (EmployeeID, First_Name, Last_Name, Phone, Email) VALUES ('4', 'Riley', 'Jones', '123345959', 'riley@demo.com');
INSERT INTO employee (EmployeeID, First_Name, Last_Name, Phone, Email) VALUES ('6', 'Natasha', 'Lee', '321888909', 'natasha@demo.com');

select * from employee
order by 
case when First_Name ='Riley' then 0
else 1 end
,First_Name desc


------------------------------------------------------------------------------------------------------------------------------------------------
--Q11. Custom Sorting | Order by Month in an Year
DROP TABLE IF EXISTS dbo.sales_detail;
CREATE TABLE [sales_detail] 
(
    [Date]	VARCHAR(512),
    [Sales]	INT
);

INSERT INTO [sales_detail] ([Date], [Sales]) VALUES ('1/1/18', '3000');
INSERT INTO [sales_detail] ([Date], [Sales]) VALUES ('11/19/18', '1000');
INSERT INTO [sales_detail] ([Date], [Sales]) VALUES ('8/13/18', '2200');
INSERT INTO [sales_detail] ([Date], [Sales]) VALUES ('3/11/18', '6500');
INSERT INTO [sales_detail] ([Date], [Sales]) VALUES ('5/5/18', '3000');
INSERT INTO [sales_detail] ([Date], [Sales]) VALUES ('12/1/18', '10000');
INSERT INTO [sales_detail] ([Date], [Sales]) VALUES ('7/14/18', '9000');
INSERT INTO [sales_detail] ([Date], [Sales]) VALUES ('4/21/18', '4000');
INSERT INTO [sales_detail] ([Date], [Sales]) VALUES ('2/26/18', '1500');
INSERT INTO [sales_detail] ([Date], [Sales]) VALUES ('9/11/18', '2000');
INSERT INTO [sales_detail] ([Date], [Sales]) VALUES ('6/30/18', '1000');
INSERT INTO [sales_detail] ([Date], [Sales]) VALUES ('10/23/18', '15000');

select * from sales_detail;


--solution:

select month(date) month_number,DATENAME(MONTH,date) as months, sales from sales_detail order by month(date);
 
 ------------------------------------------------------------------------------------------------------------------------------------------------
 /*CREATE TABLE [stocks] 
(
    [Transaction_ID]	VARCHAR(512),
    [Stock_symbol]	VARCHAR(512),
    [Stock_id]	INT,
    [Stock_value]	INT,
    [Transaction type]	VARCHAR(512)
);

INSERT INTO [stocks] ([Transaction_ID], [Stock_symbol], [Stock_id], [Stock_value], [Transaction type]) VALUES ('dsadsad2132165', 'FOX', '2624', '6023', 'Buy');
INSERT INTO [stocks] ([Transaction_ID], [Stock_symbol], [Stock_id], [Stock_value], [Transaction type]) VALUES ('dsadsa1d21as2', 'CMCSA', '7660', '3461', 'Sell');
INSERT INTO [stocks] ([Transaction_ID], [Stock_symbol], [Stock_id], [Stock_value], [Transaction type]) VALUES ('2sa1d21sad21', 'FOX', '4361', '6438', 'Buy');
INSERT INTO [stocks] ([Transaction_ID], [Stock_symbol], [Stock_id], [Stock_value], [Transaction type]) VALUES ('2sa1d1as3d21a32d', 'FOX', '7262', '3131', 'Sell');
INSERT INTO [stocks] ([Transaction_ID], [Stock_symbol], [Stock_id], [Stock_value], [Transaction type]) VALUES ('1d2sadsa12D1sA', 'CMCSA', '7645', '3035', 'Sell');
INSERT INTO [stocks] ([Transaction_ID], [Stock_symbol], [Stock_id], [Stock_value], [Transaction type]) VALUES ('1sad21AS12das', 'AMZN', '5648', '3051', 'Buy');
INSERT INTO [stocks] ([Transaction_ID], [Stock_symbol], [Stock_id], [Stock_value], [Transaction type]) VALUES ('1dsa2d1as21d', 'AMZN', '5486', '2355', 'Sell');
INSERT INTO [stocks] ([Transaction_ID], [Stock_symbol], [Stock_id], [Stock_value], [Transaction type]) VALUES ('12asD21AS2d1a', 'AMZN', '2244', '2210', 'Buy');
INSERT INTO [stocks] ([Transaction_ID], [Stock_symbol], [Stock_id], [Stock_value], [Transaction type]) VALUES ('d21sads213a1ds', 'FOX', '1856', '3456', 'Sell');
INSERT INTO [stocks] ([Transaction_ID], [Stock_symbol], [Stock_id], [Stock_value], [Transaction type]) VALUES ('1s2ad13as21d31sa', 'FOX', '2486', '8785', 'Sell');
INSERT INTO [stocks] ([Transaction_ID], [Stock_symbol], [Stock_id], [Stock_value], [Transaction type]) VALUES ('s2a1d21sa31ds3a', 'CMCSA', '5468', '5640', 'Buy');
INSERT INTO [stocks] ([Transaction_ID], [Stock_symbol], [Stock_id], [Stock_value], [Transaction type]) VALUES ('21sad1as1ds1a3', 'FOX', '5248', '8940', 'Sell');
INSERT INTO [stocks] ([Transaction_ID], [Stock_symbol], [Stock_id], [Stock_value], [Transaction type]) VALUES ('1s2a1das123d1sa', 'AMZN', '9797', '6767', 'Sell');
INSERT INTO [stocks] ([Transaction_ID], [Stock_symbol], [Stock_id], [Stock_value], [Transaction type]) VALUES ('213a1ds21a1sd', 'CMCSA', '9746', '235', 'Buy');
INSERT INTO [stocks] ([Transaction_ID], [Stock_symbol], [Stock_id], [Stock_value], [Transaction type]) VALUES ('213as1d2as13d1a', 'AMZN', '7866', '1357', 'Sell');
INSERT INTO [stocks] ([Transaction_ID], [Stock_symbol], [Stock_id], [Stock_value], [Transaction type]) VALUES ('123as1d21as3s21d', 'AMZN', '4857', '3131', 'Buy');
INSERT INTO [stocks] ([Transaction_ID], [Stock_symbol], [Stock_id], [Stock_value], [Transaction type]) VALUES ('12as1d21as2s1d', 'CMCSA', '2215', '1324', 'Sell');
INSERT INTO [stocks] ([Transaction_ID], [Stock_symbol], [Stock_id], [Stock_value], [Transaction type]) VALUES ('2sa1d3as213d1as', 'FOX', '3248', '1344', 'Buy');
INSERT INTO [stocks] ([Transaction_ID], [Stock_symbol], [Stock_id], [Stock_value], [Transaction type]) VALUES ('12das1d21asd1', 'FOX', '2346', '3433', '');
*/


--Now find out
/* from stocks table find out profit/loss from each stocks, required 2 columns which is look like this below:

__________________________
|stock_symbol|Profit/Loss|
__________________________
|FOX         |-2087      |
|AMZN        |-1945      |
|CMCSA       |-10507     |
__________________________         */

--drop table stocks;
--Solution:
use practise;
select * from stocks;


with buy as
(select Stock_symbol ,sum(stock_value) as buy_stock from stocks where [Transaction type]='Buy' group by Stock_symbol)
,
sell as
(select Stock_symbol ,sum(stock_value)  as sell_stock from stocks where [Transaction type]='Sell' group by Stock_symbol )

select buy.Stock_symbol ,(buy.buy_stock-sell.sell_stock) as [profit/Loss] from buy join sell on buy.stock_symbol=sell.stock_symbol;



 
 