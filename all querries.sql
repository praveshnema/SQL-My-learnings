--This file contains all learning code from scratch:

-- Creating data base (no need to do every time)
create database allSQLquerry;

-----------------------------------------------------------------------------------------------------------------------------------------
--changing available database to start working (need to do everytime as it default set to master)
use allsqlquerry;

-----------------------------------------------------------------------------------------------------------------------------------------
--create table (when defining table give table name, when defining its attributes give column name and its data type)

create table batchb77
(
id int,
name varchar (20),
course varchar (2),
mob int
);


-----------------------------------------------------------------------------------------------------------------------------------------
--inserting values

--1st method (benefit of this method : easy copy paste and troubleshoot)

 insert into batchb77 values (1,'pravesh', 'DS',9991);
 insert into batchb77 values (2,'jyoti', 'DS',9992);
 insert into batchb77 values (3,'soumya', 'DS',9993);
 insert into batchb77 values (4,'anmol', 'DS',9994);
 insert into batchb77 values (5,'nandini', 'DS',9995);
 insert into batchb77 values (6,'dhanya', 'DS',9996);

 --2nd method (benefit of this method : u can enter or leave fields if you want to)
 insert into batchb77 (id,name,course) values (7,'khushi', 'DS');
 insert into batchb77 (id,name,course,mob) values (8,'shorya', 'DS',9985);

 --3rd method (can enter multiple data without using insert querry again and again)
 insert into batchb77 values (9,'ram', 'DS',9789),(10,'sita', 'DS',9456),(11,'hanuman', 'DS',9123),(12,'laxman', 'DS',9741);


  -----------------------------------------------------------------------------------------------------------------------------------------
 --select and see data or table

 --when need to see all the data we use *

 select * from batchb77;

 --when specific columns need to see we specify instead of *

 select id, name from batchb77;

 -----------------------------------------------------------------------------------------------------------------------------------------------
--Calling other database table into our database

select * from cuttack.dbo.hyd;   --(we not changed our database but still call it)
 -----------------------------------------------------------------------------------------------------------------------------------------
 
 
 --Write a query to create a new table that consists of data and structure copied from the other table.
select * into new_table_batchb77 from batchb77;                         --full table into new table
select * from new_table_batchb77;

select id,name,course into newtable1 from batchb77;   ---only some specific columns into new table
select * from newtable1;

select * into newtable2 from batchb77 where Id>2 and id<5;   ---only some specific rows into new table
select * from newtable2;

                                                      /* adding fields into already existing table*/
create table testtable
(id int,name varchar(20),course varchar (20),mob bigint,country varchar(22),age int);

insert into testtable select * from batchb77;
select * from testtable;


 -----------------------------------------------------------------------------------------------------------------------------------------------
 --Operators and WHERE clause

 --greater than:
 select * from batchb77 where id>6;

 --greater than and equals
 select *from batchb77 where id >=6;

 --less than
 select * from batchb77 where id <2;

--less than and equals to
select * from batchb77 where id <=2;

--not equals
select * from batchb77 where id !=3;
select * from batchb77 where name!='sita';
select * from batchb77 where id <> 7;

--between (search for range)
select * from batchb77 where id between 2 and 6;

--NOT between (search for range that not to include)
select * from batchb77 where id not between 2 and 6;

--like (search for pattern type)
select * from batchb77 where name like '%a';                     --finding last name as a
select * from batchb77 where name like 'a%';                     --finding first name as a
select * from batchb77 where id like '%1%';                      -- finding 1 in every id digit as varchar so 1,10,11,12 all comes under it

--NOT like 
select * from batchb77 where name not like '%a';

--in operator (specify multiple possible values for a column)
select * from batchb77 where id in (1,5,6,12);
select * from batchb77 where name in ('pravesh','dhanya','ram','hanuman');

--not in
select * from batchb77 where id not in (1,5,6,12);


-----------------------------------------------------------------------------------
--Write a query to calculate the even and odd records from a table.
select * from batchb77;
select * from batchb77 where id%2=0;
select * from batchb77 where id%2=1;
---------------------------------------------------------------------------------------
--date datatype
-- Write a query find number of employees whose DOB is between
--02/05/1970 to 31/12/1975 

select * from datagyan.dbo.EmployeeInfo where dob between '02/may/1970' and  '31/dec/1999' ;
select * from datagyan.dbo.EmployeeInfo;


-- Write a SQL query to retrieve employee details from EmployeeInfo table who have a date of joining in the EmployeePosition table.
select * from datagyan.dbo.employeeinfo where empid in  (select empid from datagyan.dbo.EmployeePosition);


--there is a date column and there are multiple dates for each city, for example,2-march-2019,2-march-2020 dates are for the city Jaipur . How to get the latest date for each city?
select * from datagyan.dbo.pptqtns;
select city,max(dates) as latest_dates from datagyan.dbo.pptqtns group by city;


-----------------------------------------------------------------------------------

                                                                  /*    Wild Cards Questions  */
																  select * from w3school.dbo.customers;

--Q.1 selects all customers with a City starting with "ber":
select * from w3school.dbo.customers where city like 'ber%';

--Q.2 selects all customers with a City containing the pattern "es": 
select * from w3school.dbo.customers where city like '%es%';

--Q.3 selects all customers with a City starting with any character, followed by "ondon":
select * from w3school.dbo.customers where city like '_ondon';

--Q.4 selects all customers with a City starting with "L", followed by any character, followed by "n", followed by any character, followed by "on":
select * from w3school.dbo.customers where city like 'L_n_on';

--Q.5 selects all customers with a City starting with "b", "s", or "p":
select * from w3school.dbo.customers where city like '[b,s,p]%';

--Q.6 selects all customers with a City starting with "a", "b", or "c":
select * from w3school.dbo.customers where city like '[a-c]%';

--Q.7 select all customers with a City NOT starting with "b", "s", or "p":
select * from w3school.dbo.customers where city like '[^bsp]%';

select * from w3school.dbo.customers where city not like '[bsp]%';

--------------------------------------------------------------------------------------------------------------------------------------------
--right & left
SELECT right(city,3) FROM w3school.dbo.customers;
SELECT left(city,3) FROM w3school.dbo.customers;
SELECT city FROM w3school.dbo.customers order by right(city,3) desc;



-----------------------------------------------------------------------------------------------------------------------------------------------
--specific date search

select * from student_gender where MONTH(Dateofjoin)=2;                      --gives you feb month people
select * from student_gender where day(Dateofjoin)=20;
select * from student_gender where year(Dateofjoin)=2023;
-----------------------------------------------------------------------------------------------------------------------------------------------
--AND clause (only true when both condition true):

select * from batchb77 where id>=1 and name like'%s%';

-----------------------------------------------------------------------------------------------------------------------------------------------
--OR clause (when either condition is TRUE):
select * from batchb77 where id =3 or name ='ram';

-----------------------------------------------------------------------------------------------------------------------------------------------
--delete specific record:
delete from batchb77 where id =7;
delete from batchb77 where name ='shorya';
delete from batchb77 where name='hanuman' or id=11;

select * from batchb77;

-----------------------------------------------------------------------------------------------------------------------------------------------
--Truncate table (CAUTION THIS WILL DELETE ENTIRE TABLE VALUES) however your table structure and table name intact.
truncate table batchb77;
select * from batchb77;

-----------------------------------------------------------------------------------------------------------------------------------------------
--Drop table (CAUTION THIS WILL DELETE ENTIRE TABLE with its name and table structure )
drop table batchb77;
select * from batchb77; --this will show error if u do after drop.

-----------------------------------------------------------------------------------------------------------------------------------------------
--creating table again

create table batchb77
(
id int,
name varchar (20),
course varchar (2),
mob int
);
 insert into batchb77 values (1,'pravesh', 'DS',9991);
 insert into batchb77 values (2,'jyoti', 'DS',9992);
 insert into batchb77 values (3,'soumya', 'DS',9993);
 insert into batchb77 values (4,'anmol', 'DS',9994);
 insert into batchb77 values (5,'nandini', 'DS',9995);
 insert into batchb77 values (6,'dhanya', 'DS',9996);
 insert into batchb77 (id,name,course,mob) values (7,'khushi', 'DS',9998);
 insert into batchb77 (id,name,course,mob) values (8,'shorya', 'DS',9985);
 insert into batchb77 values (9,'ram', 'DS',9789),(10,'sita', 'DS',9456),(11,'hanuman', 'DS',9123),(12,'laxman', 'DS',9741);

 select * from batchb77;
 -----------------------------------------------------------------------------------------------------------------------------------------------
 --ALTER

 --deleting specific column

 alter table batchb77 drop column course;
 select * from batchb77;   


  --add column
  alter table batchb77 add  country varchar (10);
  alter table batchb77 add age int;
  alter table batchb77 add ladline int;
  select * from batchb77;

     
  --Edit column data type
  alter table batchb77 alter column age bigint;
  alter table batchb77 alter column age int;
  sp_columns 'batchb77';                                   --checking purpose only


  --deleting column
   alter table batchb77 drop column ladline;
   select * from batchb77;

  
  --renaming column name
  sp_rename 'batchb77.name','student_name'
  sp_rename 'batchb77.student_name','name'

   -----------------------------------------------------------------------------------------------------------------------------------------------
   --update existing table
   update batchb77 set country='INDIA'; --(add coumn country if not added) (this will affect all rows)
     select * from batchb77;

	 --update specific record
	 update batchb77 set mob ='947123' where id=1;
	 update batchb77 set age=29 where id =1;
	 update batchb77 set age=25 where name='jyoti';
	 update batchb77 set age=20 where name= 'nandini' or name='dhanya';
	 update batchb77 set age=24 where name='anmol' or name='soumya';
	 update batchb77 set age=40 where id >=7;
	 update batchb77 set country = 'canada' where name ='dhanya';
	 select * from batchb77;

	 update batchb77 set country = 'Canada' where name ='dhanya';          --we can re update as well
	 select * from batchb77;

-----------------------------------------------------------------------------------------------------------------------------------------------
-- ORDER bY

--Assending
select * from batchb77 order by age;          -- default orderby is assending if you not write
select * from batchb77 order by age asc; 

--desending
select * from batchb77 order by age desc; 

select * from batchb77 order by age desc , id desc; --can use multiple order but 1st preferance is given which is written first.

-----------------------------------------------------------------------------------------------------------------------------------------------
--TOP (use to find specified top rows from table)

select top 5 *  from batchb77;
select top 6 name from batchb77;
select top 6 name,* from batchb77;

select top 3 * from batchb77 where age=40;

--showing percentage wise data
select top 30 percent * from batchb77;


         --Write a query to retrieve the last 3 records from the EmployeeInfo table.
		 select * from datagyan.dbo.employeeinfo where empid in (select top 3 empid from datagyan.dbo.EmployeeInfo order by empid desc) order by empid; --with top


		 --.Write a query to find the third-highest salary from the EmpPosition table.
		 select top 1 salary from (select distinct top 3 salary from datagyan.dbo.EmployeePosition order by salary desc) as tb1 order by salary ;


-----------------------------------------------------------------------------------------------------------------------------------------------
--Constraints

--primary key (can only have 1 in 1 table), (its not null and unique always)
--not null (can't give empty value after assigning this)
--unique (value should be diffrent than the value present in that specific column after assign this)
--check (always check the condition given whenever inserting new values)
--default ( default ensure if there is no value submitted so it will put that default value assign by user)


create table studentdata
(id int primary key,
name varchar (20) not null,
mob bigint unique,
email varchar (20) unique,
age int check (age>18),
addr varchar(22) default 'INDIA'
);

insert into studentdata values (1,'pravesh',9991,'pravesh@gmail.com',29,'bangalore');
insert into studentdata values (2,'jyoti',9992,'jyoti@gmail.com',25,'delhi');
insert into studentdata values (3,'soumya',9993,'soumya@gmail.com',24,'bangalore');
insert into studentdata values (4,'anmol',9994,'anmol@gmail.com',24,'chandigarh');
insert into studentdata values (6,'dhanya',9996,'dhanya@gmail.com',20,'vancover');
insert into studentdata values (5,'nandini',9995,'nandini@gmail.com',20,'pune');
insert into studentdata values (7,'khushi',9998,'khushi@gmail.com',40,'kolkata');
insert into studentdata values (8,'shorya',9985,'shorya@gmail.com',40,'surat');
insert into studentdata (id,name, mob,email,age) values (13,'rocky',1111,'rocky@gmail.com',19);
insert into studentdata (id,name, mob,email,age) values (14,'taylor',2222,'taylor@gmail.com',30);

select * from studentdata;

insert into studentdata values (10,'pravesh',9925,'fsgsg@gmail.com',19,'bangalore');



------------------------------------------------------
-- when 2 constraints are added its called composite key check in mobile number (its unique and not null)
create table student_gender
(id int primary key,
name varchar (20) not null,
mob bigint unique not null,
gender varchar (1) not null,
);
insert into student_gender values (1,'pravesh',9991,'M');
insert into student_gender values (2,'jyoti',9992,'F');
insert into student_gender values (3,'soumya',9993,'M');
insert into student_gender values (4,'anmol',9994,'M');
insert into student_gender values (6,'dhanya',9996,'F');
insert into student_gender values (5,'nandini',9995,'F');
insert into student_gender values (7,'khushi',9998,'F');
insert into student_gender values (8,'shorya',9985,'M');
insert into student_gender (id,name, mob,gender) values (13,'rocky',1111,'b');
insert into student_gender (id,name, mob,gender) values (14,'taylor',2222,'b');
insert into student_gender (id,name, mob,gender) values (15,'tony',12563,'M');

select * from student_gender;




                                                                         /* Constraints */

--SQL NOT NULL on CREATE TABLE

--ensures that the "ID", "LastName", and "FirstName" columns will NOT accept NULL values when the "Persons" table is created:
CREATE TABLE Persons (
ID int not null,
LastName varchar(25) not null,
FirstName varchar(25) not null,
Age int
);

--SQL NOT NULL on ALTER TABLE
--create a NOT NULL constraint on the "Age" column when the "Persons" table is already created, use the following SQL:

alter table Persons alter column Age int not null;

--------------------------------------
--SQL UNIQUE Constraint on CREATE TABLE
--The following SQL creates a UNIQUE constraint on the "ID" column when the "Persons2" table is created:

CREATE TABLE Persons2 (
    ID int NOT NULL UNIQUE,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int
);


--SQL UNIQUE Constraint on ALTER TABLE
--To create a UNIQUE constraint on the "ID" column when the table is already created, use the following SQL:

ALTER TABLE Persons ADD UNIQUE (ID);

-------------------------------------
--DROP a UNIQUE Constraint
--To drop a UNIQUE constraint, use the following SQL:

ALTER TABLE Persons DROP CONSTRAINT UC_Person;

-----------------------------------------------------------------------------------------------------------------------------------------------
--Alias 
  --use to shortten the column name or table name for temporary purpose.
  --it will not change in the actual table
  --when column is refered it will change its column name while selecting (temporary).

  --table alias
  select * from student_gender as sg;

  select sg.id from student_gender as sg;


  --column alias
  select name, gender as g from student_gender;

  --column and table both.
  select sg.name,sg.gender as gender_of_students from student_gender as sg;


-----------------------------------------------------------------------------------------------------------------------------------------------
--SCHEMA
--use to get information about tables databases and columns


--columns attributes

select * from INFORMATION_SCHEMA.tables;                            --give you all the tables name inside this database

sp_tables 'studentdata';                                           --use to check is this table is there in this data base or not
sp_tables '%student%';                                             -- use when you only knows little name about table and unsure
sp_tables;                                                         --all tables inside database



--table attributes

select * from INFORMATION_SCHEMA.columns where TABLE_NAME ='studentdata';              --when you know specific name of table then this method gives you table attributes

sp_columns 'studentdata';                                                              --shortcut method

select * from INFORMATION_SCHEMA.columns where TABLE_NAME like 'student%';                  --when you are unsure and knows little name

-----------------------------------------------------------------------------------------------------------------------------------------------
-- changing column name
select * from studentdata;

sp_rename 'studentdata.addr' ,'address';  --from addr to address
sp_rename 'studentdata.address' ,'addr';   --undo


-----------------------------------------------------------------------------------------------------------------------------------------------

--SQL distinct (gives you unique/diffrent value from a column which)
select * from studentdata;
select distinct (age) from studentdata;
select distinct (addr) from studentdata;

-----------------------------------------------------------------------------------------------------------------------------------------------

--NULL function



     --null value entry

	 insert into batchb77 (id,name,course,mob) values (13,'null', null,9998);
	 insert into batchb77 (id,name,course,mob) values (14,'mario', null,9998);
	 insert into batchb77 (id,name,course,mob) values (15,'lugia', null,9998);
	 insert into batchb77 (id,name,course,mob) values (15,null, null,9998);
	 insert into batchb77 (id,name,course,mob) values (16,null, 'DA',9123);
	 select * from batchb77;

	 -- select null value
	 select * from batchb77 where country is null;
	 select * from batchb77 where name is null;
	 select * from batchb77 where country is null and name is null;

	 --this is diffrent than 'null' this is consider as value as if its in name column so it consider someone name is null.
	 select * from batchb77 where name ='null';
	 update batchb77 set name ='null' where name='pooja';

-----------------------------------------------------------------------------------------------------------------------------------------------
--AUTO INCREMENT
drop table studentsgroup;

create table studentsgroup
(id int identity(1,1),
name varchar (20),
groups varchar (5)
);
insert into studentsgroup values ('pravesh','G1');
insert into studentsgroup values ('jyoti','G1');
insert into studentsgroup values ('anmol','G1');
insert into studentsgroup values ('soumya','G1');
insert into studentsgroup values ('nandini','G1');
insert into studentsgroup values ('dhanya','G1');
insert into studentsgroup values ('ram','G20');
insert into studentsgroup values ('sita','G20');
insert into studentsgroup values ('hanuman','G20');
select * from studentsgroup; --see all the id are auto inserted even you not inserted.

-----------------------------------------------------------------------------------------------------------------------------------------------
--SQL JOINS


  --when join name is not mention then that join is considered automatically inner join

  --INNER JOIN

  select * from studentdata;
  select * from student_gender;

  select * from studentdata join student_gender on studentdata.id=student_gender.id;

  select * from studentdata inner join student_gender on studentdata.id=student_gender.id;

  --OUTER JOIN

    --LEFT OUTER JOIN
	select * from studentdata;
    select * from studentsgroup;
	select * from studentdata left join studentsgroup on studentdata.id=studentsgroup.id;

	 --RIGHT OUTER JOIN
	select * from studentdata;
    select * from studentsgroup;
	select * from studentdata RIGHT join studentsgroup on studentdata.id=studentsgroup.id;

	--FULL OUTER JOIN
	select * from studentdata;
    select * from studentsgroup;
	select * from studentdata FULL join studentsgroup on studentdata.id=studentsgroup.id;

  --CROSS JOIN (with cross u no need universal truth /ON statement)
    select * from studentdata;
    select * from studentsgroup;
	select * from studentdata CROSS join studentsgroup;

	--there is another method of cross join
	select * from studentdata,studentsgroup;

	--Write a query to retrieve the list of employees working in the same department.
	select ep1.empid,ep1.empfname,ep1.department from datagyan.dbo.EmployeeInfo as ep1,datagyan.dbo.EmployeeInfo as ep2 where ep1.department= ep2.department and ep1.EmpID!=ep2.EmpID;
-----------------------------------------------------------------------------------------------------------------------------------------------
--SQL FUNCTIONS

  --AGGREGATED FUNCTIONS
    
	--SUM()
	  select * from studentdata;
	  select sum(age) as SUM_OF_ALL_STUDENTS from studentdata;

	--AVG()
	  select * from studentdata;
	  select avg(age) as AVG_OF_ALL_STUDENTS from studentdata;

	--max()
	  select * from studentdata;
	  select max(age) as max_age_among_ALL_STUDENTS from studentdata;

	--min()
	  select * from studentdata;
	  select min(age) as min_age_among_ALL_STUDENTS from studentdata;

	        -- Write a query to display the first and the last record from the EmployeeInfo table.
             select * from datagyan.dbo.EmployeeInfo where empid =(select min( empid) from datagyan.dbo.EmployeeInfo) or empid =(select max(empid) from datagyan.dbo.EmployeeInfo);


    --count()
	  select * from studentdata;
	  select count(id) as count_of_student from studentdata;                  --it is preferable take id as count as its not null most of the time
	
	  --types of using count
	    select count(*) from studentdata;  --select all data even null too
		
		select count(1) from studentdata;  --select all data even null too and that does not mean 1st column if doubt see next line of code
		select count(10) from studentdata;
		select count(getdate()) from studentdata;
		select count('02-02-1993') from studentdata;
		select count('i am the hero') from studentdata;    -- count allots that value which is inside to each row and return the integer how many rows alloted

		--but whenever we select column name then it will not include null values for example
        select count(addr) from studentdata;           --if there is null value it will not included 

		-- Write a query to fetch 50% records from the EmployeeInfo table.
		select * from datagyan.dbo.EmployeeInfo where empid<=(select count(empid)/2 from datagyan.dbo.EmployeeInfo)

			   		 	  	  	 
	-- In Microsoft SQL server FIRST() and LAST() is not a built in function
-----------------------------------------------------------------------------------------------------------------------------------------------
--SQL FUNCTIONS

  --SCALAR FUNCTIONS
    -- UPPER (U-case)
	 select UPPER (name) as fullname from studentdata;

	--lower (L-CASE)
	 select LOWER (name) as fullname from studentdata;

	--SUBSTRING (MID)
	 select * from studentdata;
     select substring(name,2,5) from studentdata;

	             --USE of charindex
				 --Write a query to fetch only the place name(string before brackets) from the Address column of EmployeeInfo table.?
                  select substring(addr,1,(CHARINDEX('(',addr)-1)) from datagyan.dbo.EmployeeInfo;
                  select * from datagyan.dbo.EmployeeInfo;


    --LEN()
	  select * from studentdata;
	  select len(name) as charater_length from studentdata;

	--Replace()
	 select * from studentdata;
	 select replace(name,'rocky','ranbir') as replaced_name from studentdata;
	  	 
	--concat
	 select concat (name,mob) as fullname from studentdata;
	 select concat (name,' ',mob) as fullname from studentdata;

	            --we can concat by using + operator
				select (name+' '+addr) as fullname from studentdata;
				select name+' '+addr as fullname from studentdata;

				-- + operators add the integer values rather join
				select (mob+' '+age) as mix_data from studentdata;

				-- but concat will join int values as varchar value
				select concat (mob,' ',age) as mix_data from studentdata;

	--TRIM() (removes extra spaces from both ends)
	  select trim (name) as fullname from studentdata;
	   
	   --Ltrim() removes extra spaces from left side of the string
	    select Ltrim (name) as fullname from studentdata;

	   --Rtrim() removes extra spaces from right side of the string
	    select Rtrim (name) as fullname from studentdata;
	 
   --ROUND()
	  select * from studentdata;
	  select round (age,2) as roundoffvalues from studentdata;     --need decimal value to round off

   
   --GETDATE() (NOW())
    select getdate() as todays_date;

	SELECT CONVERT(date, GETDATE());                                                      --only date no time
	select format(getdate(),'dd-MM-yyyy') as today;

    insert into student_gender values (16,'steve',5555,'M',getdate());                    --we can enter date by this

	update student_gender set Dateofjoin=getdate() where id=13;
	

	--FORMAT()
	  select * from student_gender;
	  
	  alter table student_gender add Dateofjoin date;
	  update student_gender set Dateofjoin ='2023-01-20' where id=1;
	  update student_gender set Dateofjoin ='01-15-2023' where id between 2 and 6;          --just adding date column and values to process
	  update student_gender set Dateofjoin ='02-20-2022' where id =7;

	  select format(Dateofjoin,'dd-MM-yyyy') as Date_Of_JOIN_INDIAN_FORMAT from student_gender;
	

	--UCASE(), LCASE(),MID(),NOW() are not inbuilt function of sql

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
  --GROUP BY
  select * from studentdata;
  
  select addr,sum(age) as city_wise_STUDENTS_AGE from studentdata group by addr;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 --HAVING (when you need to give condition and you are using aggregated functions and group by)
  select * from studentdata;
  select addr,sum(age) as city_wise_STUDENTS_AGE from studentdata group by addr having sum(age) >20;


      -- Write a query to retrieve duplicate records from a table.
	 select id,name,age,salary,count(id) as repeating_times from repeateddata group by id,name,age,salary having count(id)>1;

     --.Write a query to fetch the department-wise count of employees sorted by departments count in ascending order.
	 select * from datagyan.dbo.EmployeeInfo;
     select department, count(*) as no_of_employee from datagyan.dbo.EmployeeInfo group by department order by department asc;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--SELF JOIN

 select * from studentsgroup;

  alter table studentsgroup add leader int;
 update studentsgroup set leader =2;
 update studentsgroup set leader =7 where id between 7 and 9;           --just making table for self join operation

 --self join step by step

 select * from studentsgroup;
 select * from studentsgroup as sg1 join studentsgroup as sg2 on sg1.id=sg2.leader;
 select sg2.name as studentname,sg1.name as leadername from studentsgroup as sg1 join studentsgroup as sg2 on sg1.id=sg2.leader;






 select * from studentsgroup as sg1 join studentsgroup as sg2 on sg1.id=sg2.leader;


 select sg2.id as id,sg2.name as name,sg1.name as leadername from studentsgroup as sg1 join studentsgroup as sg2 on sg1.id=sg2.leader;   --(final result)
 select * from studentsgroup;                                                                                                            --compare original table


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--SQL SET OPERATOR (show vertical columns)

  --UNION (no duplicates)

    select * from student_gender;
	select * from studentdata;                --as there is rule that for set operator same no. of columns and same data type should be there curently we have id,name,mob common
  
    
	select id,name,mob from student_gender
	union
	select id,name,mob from studentdata;  

	  


	   	 
 --UNION ALL (all the data including duplicates)

    select * from student_gender;
	select * from studentdata;                
  
    
	select id,name,mob from student_gender
	union all
	select id,name,mob from studentdata; 



	
 --INTERSECT (only common data)

    select * from student_gender;
	select * from studentdata;                
  
    
	select id,name,mob from student_gender
	intersect
	select id,name,mob from studentdata; 




 --EXCEPT (only non common data of table 1)

    select * from student_gender;
	select * from studentdata;                
  
    
	select id,name,mob from student_gender
	except
	select id,name,mob from studentdata; 

----------------------------------------------------------------------------------------------------------------------------------------------
--Coalesce() this will returns first non-null value in a list. (but under this same data type need to put)

select * from batchb77;
select name, coalesce (mob,age) as details from batchb77;  --see khushi age is given as her mob no. is empty

-------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Stored procedure (create once and call it whenever needed, no need to write again big query just use simple call name)


    --creating store procedure
	  
	  create procedure SPstudentdata
	  as
	  begin
	  select * from studentdata;
	  end;

	     --can be write this as
      create proc SPstudent_gender
	  as
	  begin
	  select * from student_gender;
	  end;

	     --also can write this as
	  create proc test
	  as
	  begin
	  select * from student_gender;
	  end;


	  --creating procedure which is not changeable (WITH ENCRYPTION)
	   create proc test2
	   with encryption
	   as
	   begin
	   select * from student_gender;
	   end;

	  -------------------------------------------

	  --syntax for using

	   execute SPstudent_gender;

	   exec SPstudentdata;

	   test;

	   spstudentdata;

	   spstudent_gender;

	   exec test;


	   ------------------------------
	 --Delete/drop store procedure
	  drop procedure SPstudentdata;
	  drop proc SPstudent_gender
	  drop proc test;


------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                          /* Case Expression*/

-- create a table having at least two sales field 

create table allsales
(id int identity,
item_name varchar(25),
hyd_sale int,
blr_sale int,
mumbai_sale int,
);

insert into allsales values('denim jacket',25000,30000,5000),
                           ('jeans denim',2000,40000,6000),
						   ('white shirt',50000,50000,65000),
						   ('red jacket',100,5000,2),
						   ('black t-shirt',100000,50000,20000);

------------------------------------------------------
--Q.1 create a table having two sales field and combine with concate and + 


-- using + operator
select * from allsales;
select item_name, (hyd_sale+blr_sale+mumbai_sale) as total_sales from allsales;

-- using concate
select * from allsales;
select item_name, concat(hyd_sale,blr_sale,mumbai_sale) as total_sales from allsales;

-------------------------------------------------------
--Q.2 What is case statement give with min 2 examples.

/*uses in select statement and It goes through conditions and returns a value when the first condition is met. 
if no condition is met then goes to else statement if else is not used then throws null value. */

select * from allsales;

--case statement on 1 column

select  item_name,hyd_sale,
Case
when hyd_sale >100000 then 'Bumper sale'
when hyd_sale>50000 then 'Big sale'
when hyd_sale>10000 then 'Average sale'
else 'Low sale'
end as hydSaleStatus
from allsales;


---------------------------------------------------------

--case column using multiple column

select  item_name,hyd_sale+blr_sale+mumbai_sale as totalsale,
Case
when hyd_sale+blr_sale+mumbai_sale >100000 then 'Bumper sale'
when hyd_sale+blr_sale+mumbai_sale>50000 then 'Big sale'
when hyd_sale+blr_sale+mumbai_sale>10000 then 'Average sale'
else 'Low sale'
end as totalsale_status
from allsales;


--------------------------------------------------------
--Example 2 case expresion

select * from emp20;

select Concat (FN,' ',LN) as fullname,salary,
Case salary
when  600 then 'High paid'
when 300 then 'Well paid'
when 200 then 'Average Paid'
else 'Under paid'
end as employee_status
from emp20;

-----------------------------------------------------------------------------------------------------------------------------------------------------------
 
 --SQL WINDOWS FUNCTIONS
	
	 --Rank (it will assign to rank to each record present in partition skipping rank numbers)

	  select id, name ,age,rank() over (order by age ASC) as rank_age_in_assending from studentdata;
	  select id, name ,age,rank() over (order by age DESC) as rank_age_in_dessending from studentdata;
	  


	 --Dense_Rank (it will assign to rank to each record present in partition WITHOUT skipping rank numbers)

	  select id, name ,age,dense_rank() over (order by age ASC) as Dense_rank_age_in_assending from studentdata;
	  select id, name ,age,dense_rank() over (order by age DESC) as Dense_rank_age_in_dessending from studentdata;



	  --NTILE (assign record into partition but need one argument)

	  select id, name ,age,NTILE(3) over (order by age ASC) as Ntile_groups_age_in_assending from studentdata;
	  select id, name ,age,NTILE(3) over (order by age DESC) as Ntile_groups_age_in_dessending from studentdata;



	  --Row_number (It will assign rank number to each record present)

	  select id, name ,age,ROW_NUMBER() over (order by age ASC) as row_numbers_age_in_assending from studentdata;
	  select id, name ,age,ROW_NUMBER() over (order by age DESC) as row_numbers_age_in_dessending from studentdata;

	  select *,ROW_NUMBER() over (order by age asc) as number_of_rows from repeateddata;     ---even repeated data or same value of column is not affect on row_number counting 
	
	        --Write a query to find the Nth highest salary from the table without using TOP/limit keyword.
	        select newtable.salary from (select Salary,row_number() over(order by salary desc) as nth from datagyan.dbo.EmployeePosition ) as newtable where newtable.nth=4; 

			  
	  --all functions side by side

	  select id, name ,age,
	  rank() over (order by age ASC) as rank_age_in_assending,
	  dense_rank() over (order by age ASC) as Dense_rank_age_in_assending,
	  NTILE(3) over (order by age ASC) as Ntile_groups_age_in_assending,
	  ROW_NUMBER() over (order by age ASC) as Ntile_groups_age_in_assending 
	  from studentdata;

---------------------------------------------------------------------------------------------------------------------------------------------------------

--1) OVER() keyword can be use it as here we not neccesarly required order by keyword (if you wish you can use):


select * from datagyan.dbo.employee;                                                                                                              --original table

select max(salary) as max_salary from datagyan.dbo.employee;                                                                                      --maximum salary

select *,max(salary) as max_salary from datagyan.dbo.employee;                                                                                    --give you error
 
select *,max(salary) over() as max_salary from datagyan.dbo.employee;                                                                             --salary of employee vs max salary comparision all data

select id,name,department,salary,max(salary) over() as max_salary from datagyan.dbo.employee;                                                     --simplified (salary of employee vs max salary comparision all data)
    
select id,name,department,salary,max(salary) over(order by salary desc) as max_salary from datagyan.dbo.employee;                                 --use with order by

select id,name,department,salary,max(salary) over(partition by department order by salary desc) as max_salary from datagyan.dbo.employee;         --use with order by and partision by particular column


---------------------------------------------------------------------------------------------------------------------------------------------------------
--partition

 select id, name ,department,salary,rank() over (partition by department order by salary ASC) as rank_salary_in_low_to_high from datagyan.dbo.employee;

 select id, name ,department,salary,Dense_rank() over (partition by department order by salary ASC) as Dense_rank_salary_in_low_to_high from datagyan.dbo.employee;

 select id, name ,department,salary,Ntile(12) over (partition by department order by salary ASC) as Ntile_salary_in_low_to_high from datagyan.dbo.employee;

select id, name ,department,salary,Row_number() over (partition by department order by salary ASC) as row_number_salary_in_low_to_high from datagyan.dbo.employee;


---------------------------------------------------------------------------------------------------------------------------------------------------------
-- fetch only first two records from each department whoes salary is high 


select * 

from  (select id, name ,department,salary,rank() over (partition by department order by salary ASC) as desnse_salary from datagyan.dbo.employee ) as outertable

where outertable.desnse_salary <3;


---------------------------------------------------------------------------------------------------------------------------------------------------------
--LEAD() and LAG() (need over and order by clause)


--Lag()

--use for comparision

select * from datagyan.dbo.employee;

select id,name,department,salary,lag(salary) over(order by salary desc) as Just_above_employee_salary  from datagyan.dbo.employee; 

select id,name,department,salary,lag(name) over(order by id  asc) as Just_above_employee_salary  from datagyan.dbo.employee; 

select id,name,department,salary,lag(name) over(partition by department order by salary desc) as Just_above_employee_salary_department_wise  from datagyan.dbo.employee; 

--we can specify what to be write in place of null value (but only integer value) as in place of default value

select id,name,department,salary,lag(salary,1,null) over(partition by department order by salary desc) as Just_above_employee_salary  from datagyan.dbo.employee; 


-----------------------------------------------------------------------
--same is for lead just only instead of showing above salary it will show below employee salary (tells by whome that person is leading by)

select * from datagyan.dbo.employee;

select id,name,department,salary,lead(name) over(order by salary desc) as Just_above_employee_salary  from datagyan.dbo.employee;




-----------------------------------------------------------------------
--Q.show all the data sorted by id in assending order and tell each employee salary is greater or less then its previous person salary.

select id,name,department,salary,lead(salary) over(order by id desc) as Just_above_employee_salary,
case
when salary>lead(salary) over(order by id desc) then 'Higher salary '
when salary<lead(salary) over(order by id desc) then 'Lower salary'
when salary=lead(salary) over(order by id desc) then 'Equal salary'
else null
end as comparision_from_previous_employee
from datagyan.dbo.employee;

--------------------------------------------------------------------------------------------------------------------------------------------------------------
--First_value

select * from datagyan.dbo.employee;

select *,first_value(salary)  over (order by salary asc) as highest_salary from datagyan.dbo.employee;

select *,first_value(salary)  over (order by id desc) as highest_salary from datagyan.dbo.employee;


--------------------------------------------------------------------------------------------------------------------------------------------------------------


--last_value (not work like it has to do in microsoft sql) (reason is frame clause)
select * from datagyan.dbo.employee;

select *,last_value(name)  over ( order by id desc) as lowest_salary from datagyan.dbo.employee;                                                        --not work as it has to be
select *,last_value(salary)  over ( order by id asc range between unbounded preceding and current row) as lowest_salary from datagyan.dbo.employee;      --default 

select *,last_value(salary)  over (order by id asc range between unbounded preceding and unbounded following) as lowest_salary from datagyan.dbo.employee;   

--------------------------------------------------------------------------------------------------------------------------------------------------------------
--CUME_DIST (cummulative distribution) gives cummulative value from total value (row no./total no. of rows) (duplicate records considered same and takes last no. of row)

--Q find out first 30% of higher salary people.

select * from datagyan.dbo.employee;
select *,cume_dist() over (order by salary desc) as cummulative_value from datagyan.dbo.employee;                                --actual

select *,round(((cume_dist() over (order by salary desc))*100) ,2) as cummulative_value from datagyan.dbo.employee;             ---percentage format 


--------------------------------------------------------------------------------------------------------------------------------------------------------------
--percentage_rank (current row-1/total no. of rows-1)

--Q how much higer percentage nagesh pal is getting paid in compare to all other people

select *,round(percent_rank() over (order by salary )*100,2) as percentage_ranking from datagyan.dbo.employee;	 

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
  
  --SUBQUERY (or called nested query,or inner query)
   
   select * from studentdata;
   select * from student_gender;

    --lets say we need to find all female student email id using subquery
	 select name,email from studentdata                                            /* main query*/
	 where id in 
	 (select id from student_gender where gender='f');                             /* subquery */



	 -- Write a query to find the Nth highest salary from the table without using TOP/limit keyword.
     select salary from datagyan.dbo.EmployeePosition ep1  where 4-1 =(select count(salary) from datagyan.dbo.employeeposition ep2 where ep1.salary>ep2.Salary);

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
    
	--SQL VIEW (used to make virtual tables which can hide rows/columns from original table for security purpose)

	  --column level security
	    
				
		create view vwstudent                                               --creating view
	    as
	    select id,name,Dateofjoin from student_gender;

		select * from student_gender;                                       --original table
		select * from vwstudent;                                            --calling view table 


		-------------------------------------------------------------------------------------------
	   --Row level security
	    
				
		create view vwstudent_row                                              --creating view
	    as
	    select * from student_gender where gender ='m';

		select * from student_gender;                                       --original table
		select * from vwstudent_row;                                        --calling view table 


		-------------------------------------------------------------------------------------------
		--MODIFY VIEW

		alter view vwstudent_row
		as
		select * from student_gender where gender ='F';

		select * from student_gender;                                       --original table
		select * from vwstudent_row;                                        --calling view table


	  -------------------------------------------------------------------------------------------
	    --DROP/DELETE VIEW

		drop view vwstudent
		drop view vwstudent_row;

----------------------------------------------------------------------------------------------------------------------------------------------------------------
--INDEX
select * from employee;                                              --original table

create index pravesh on employee(name);                           -- creating index                                       

select * from employee where name like 'l%';                        --it will act fast when doing on big data
	 




	  







