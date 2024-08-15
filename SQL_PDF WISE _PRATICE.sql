#Create database: syntax- create database database_name;
create database College;

#Drop Database ; syntax- drop database database_name;
drop database college;

#Backup database:Always back up the database to a different drive than the actual database. Then, if you get a disk crash, you will not lose your backup file along with the database.
-- syntax- Backup database database_name to disk = 'filepath';
# SQL Backup with Differential:A differential back up reduces the back up time (since only the changes are backed up).
-- Syantax- backup database databasename to disk = 'filepath' with differential;

#select Database: syntax- use database_name;
create database College;
use college;

   -- single line comment
   # single line comment
  /* multi line comment */  
  
#Create Table:syntax- create table table_name(column1 datatype,column2 datatype,....);
  create table students (
    id serial primary key,
    name varchar(100),
    roll_no int unique,
    dob date,
    marks int
);
# create table using another table: creates a new table called "TestTable" (which is a copy of the old_table);
-- syntax- create table new_table_name as select column1,column2 from table_name where condition;
#delete duplicate rows in table
create table table_name select column1,column2 from table_name;


 #Drop Table:Delete the entire table
 -- syntax-drop table table_name;
 drop table students;
 
 create table students (
    id serial primary key,
    name varchar(100),
    roll_no int unique,
    dob date,
    marks int
);
#Sql select statement:syntax-select column1,column2 from table_name
select * from students;

#Alter Table statemnt:The ALTER TABLE statement is used to add, delete, or modify and remanae columns in an existing table.
#1. Add column in table:
-- Add column in last porsition by default:synatx-alter table table_name add new_column_name datatype datatypesize;
alter table students add email varchar(100);

-- Add column in first position:syntax-alter table table_name add new_column_name datatype first;

-- Add column in middle position:syntax-alter table table_name add new_column_name datatype after old_column_name;
alter table  students add phone_number varchar(15) after name ; 

#2.Modiffy column:To change the data type of a column in a table, use the following syntax
-- syntax-alter table table_name modify  column_name datatype;

#3.Drop column :• To delete a column in a table, use the following syntax
-- syntax:alter table table_name drop column_name;
alter table students drop  phone_number;

alter table  students add phone_number varchar(15) after name ; 

#4.Raname column:You can rename column use the following syntax:
-- syntax-alter table table_name raname column old_column_name to new_column_name;
alter table students rename column marks to students_marks;
alter table students rename column students_marks to marks;
-- column select :syntax- select * from table_name
select * from students;

#Truncate table: is used to remove all data from a table 
#delete data inside a table but not the table itself
-- syntax-truncate table table_name;

#Rename table:syntax-rename table table_name to new_table_name;
rename table students to student;
rename table student to students;

#describe table: the table structure can be describe y using the describe command
#  give data which we use null value field name and dtype
-- syntax-desc table_name
desc students;

#insert query:insert data into table
/*syntax-insert into table_name(column1,column2,column3...columnN) values (value1,value2,value3...valueN);*/
insert into students (name, roll_no, dob, marks, email, phone_number) values
('John Doe', 5, '2000-01-15', 75,'john.doe@example.com','+91-9876543210'),
('Jane Smith', 13, '1999-06-23', 92,'jane.smith@example.com','+91-9876543211'),
('Alice Brown', 22, '2001-04-10', 86,'alice.brown@example.com','+91-9876543212'),
('Bob Davis', 35, '2000-12-30', 78,'bob.davis@example.com','+91-9876543213'),
('Charlie Lee', 44, '1998-03-25', 89,'charlie.lee@example.com','+91-9876543214'),
('David Wilson', 57, '1999-11-12', 83,'david.wilson@example.com','+91-9876543215'),
('Emma Johnson', 62, '2002-02-20', 91,'emma.johnson@example.com','+91-9876543216'),
('Frank Williams', 74, '2001-07-08', 65,'frank.williams@example.com','+91-9876543217'),
('Grace Miller', 85, '1998-10-05', 76,'grace.miller@example.com','+91-9876543218'),
('Henry Moore', 96, '2000-08-22', 88,'henry.moore@example.com','+91-9876543219');

#select query:
-- syntax-select * from from table_name
-- select column1,column2 from table_name 
select * from students;
select name,phone_number from students;


#where:filter data based on condition
-- syntax-select * from table_name where conditon
-- syntax-select column1,column2,columnN from table_name where condition(for particular column)

/*where condition(comparison operator > ,< ,>=,<=,=,!= <>)
(Logical operator and, or, not)
between & not between, in & not in ,is null & is not null,like,Exists,Any,All,some
*/

-- (comparison operator >,<,>=,<=,=,!= <>)
select * from students where marks>90;
select name from students where marks<70;
select * from students where marks>=90;
select * from students where marks<=70;
select phone_number from students where name='Grace Miller';
select phone_number from students where name!='Grace Miller';

-- (Logical operator and, or, not)
select * from  students where marks>=80 and marks<=100; -- The AND operator displays a record if all the conditions are TRUE
select * from students where name='Grace Miller' or marks>=80;-- -- The OR operator displays a record if any of the conditions are TRUE.
select * from students where not marks>80;

-- between & not between
#1.Between Operator:BETWEEN operator selects values within a given range , begin and end values are included. 
-- syntax- select column_name from table_name where column_name between value1 and value2
select * from students where  marks between 50 and 70;
select * from students where name between 'Alice Brown' and 'David wilson';

#2.Not between : not between operator not select values  within a give range
-- syntax- select column_name from table_name where column_name not between value1 and value2
select * from students where name not between 'Alice Brown' and 'David wilson';
select * from students where  marks not between 50 and 70;

-- in & not in
#1.in operator:if column value are matches with any of the specifies values.
-- syntax-select column_name from table_name where column_name in (value1,value2)
select * from students where name in (select name from students where marks > 90);
select * from students where Phone_number in (select phone_number from students where marks>90);

#2.not in:
-- syntax-select column_name from table_name where column_name not in (value1,value2)
select * from students where marks not in  (select marks from students where roll_no>50);
select * from students where name not in ('John Doe','Jane Smith');

-- is null & is not null:
-- syntax- select column_name from table_name where column_name is null;
insert into students (name, roll_no) values ('Sam',100); 
#1.is null:null value checking using is null and is not null   --  to check check empty values 
-- syntax-select * from table_name where column_name is null;
select * from students where phone_number is null;
#2.	is not null:  check non-empty values 
-- syntax- select * from table_name where column_name is not null;
select * from students where phone_number is not null;

-- like
#1. % -represent zero,one or multiple character
-- syntax-select*from table_name where column_name like pattern;

-- 1.'  %' - starts with string
select * from students where name like 'A%';-- start with A
select * from students where phone_number like '+91%';
select * from students where marks like '8%';
select * from students where dob like '2000%';

-- 2. '%  '-ends with string
select * from students where email like '%.com';-- ends with .com

-- 3.'%  %'- string contains 
select * from students where email like '%@%';#string contains

-- 4. '  %%  '-#string contains with start  and  end   
select * from students where email like 'j%.com' ;#string contains with start j and end .com

#2. _- represent one,and only one character
select * from students where name like 'j_h_ D_e';
select * from students where phone_number like '+91_%';
select * from students where email like '%_example.com';

#3.SELECT * FROM Customers
-- WHERE CustomerName LIKE '[bsp]%';-- Return all customers starting with either "b", "s", or "p":


#4.SELECT * FROM Customers
-- WHERE CustomerName LIKE '[a-f]%';-- Return all customers starting with "a", "b", "c", "d", "e" or "f":

#without wildcard 
select * from students where name like 'John Doe';


-- Exists:excute outer select statement only when inner select statement returns something
select name from students where exists (select marks from students where marks>90);
 
-- Any:where selected column condition matches any of the value for inner query result.
-- same as in operator but here we can compare(=,>,<,!=) column name with value returned by inner query.
select * from students where  marks > any(select marks from students where marks>90);
select * from students where phone_number= any(select phone_number from students where marks < 70 );
select * from students where roll_no = any (select roll_no from students where id between 1 and 5);

-- All:it checks condition for selected column with each of the value return by inner query
select * from students where marks > all(select marks from students where marks>80 and marks<90);


-- Some:some operator(); some is similar to any()
select * from students where marks > some(select marks from students where id >5);
select * from students where name = some(select name from students where marks <70);


#update table query:The SQL UPDATE Query is used to modify the existing records in a table.
-- syntax update table_name Set column1 = value1, column2=value2...,columnN=valueN where condition;
insert into students (roll_no) values(99);
update students set name='Viz',marks=49 where roll_no=99;
-- in update query where condition is important bacause in above ex if we dont specify where condition it will update all name as viz.
select * from students;


# Delete table query:The SQL DELETE Query is used to delete the existing records from a
-- table You can use WHERE clause with DELETE query to delete
-- selected rows, otherwise all the records would be deleted
-- syntax-delete from table_name where condition;
insert into students () values();
delete from students where roll_no is null ;


/*   DDL                                                                      DML
It stand for Data Definition Language                                     It stand for Data Manipulation Language
Basic command present in DDL are –Create, Drop, Alter, Truncate, Rename     Basic command present in DML are–Insert, Update, Delete
DDL does not use Where clause in its statement.                             While DML uses WHERE clause in its statement.
DDL is used to define the structure of a database.                          DML is used to manipulate the datawithin the database.
DDL statements do not change the contents of the database.                  DML statements change the contents of the database.*/

# Aggregate Function:
#min(),max(),count(),sum(),avg()

#MIN() function returns the smallest value of the selected column
-- syntax- select min(column_name) from table_name;
select min(Marks) from students;
select min(Name) from students;-- give first letter alphabetical max min

#MAX() function returns the largest value of the selected column.
-- syntax- selesct max(column_name) from table_name;
select max(Marks) from students; 
select max(name)from students;
 
#COUNT() function returns the number of rows that matches a specified condition
-- syntax- select count(column_name) from table_name
select count(Name) from students;
select count(Name) from students where marks>80;

# SUM() function returns the total sum of a numeric column.
-- syntax-select sum(column_name) from table_name;
select sum(Id) from students;
select sum(Marks) from students where marks>80 and marks<100;

# AVG() function returns the average value of a numeric column.
-- syntax- select avg(column_name) from table_name;
select avg(marks) from students;

select * from students;
/*Distinct keyword:There may be a situation when you have multiple duplicate records
 in a table. While fetching such records, it makes more sense 
 
 to fetch only unique records instead of fetching duplicate records.*/
-- syntax- select distinct column_name from table_name;
select distinct roll_no from students;
select distinct * from students;
-- If DISTINCT is specified, rows with the same value for the specified column will be counted as one.
select count(distinct roll_no)from students;
select avg(distinct roll_no)from students;
select max(distinct roll_no) from students;

#String Function
-- 1.Ascii-- Returns the ASCII value for the specific character
-- syntax-select ascii(character);
select ascii('a');

-- 2.concat: add two column
-- syntax- select concat(column1,column2) from table_name;
select concat(Name,Marks) from students;
select concat(Name,Phone_number,email) as'student_information' from students;
select concat(Name,' ',Phone_number,' ',email) as'student_information' from students;
select concat('Priyanka','Vijesh');
-- syntax- select column_name,concat(column1,column2) from table_name;
select Id ,concat(Name,Marks) from students;
select Roll_no ,concat(Name,Phone_number,email) as'student_information' from students;
select Roll_no ,concat(Name,' ',Phone_number,' ',email) as'student_information' from students;
select concat('Priyanka','Vijesh');

-- 3.concat_ws:concat strings based on specified delimeter.
-- syntax-select concat_ws('delimeter','column1,column2,column3...) from table_name;
select concat_ws('--',Name,Phone_number,email) as'student_information' from students;
select concat_ws('  ',Name,Phone_number,email) as'student_information' from students;
select concat_ws('   ','Priyanka','Vijesh');
-- syntax-select column_name,concat_ws('delimeter','column1,column2,column3...) from table_name;
select Roll_no ,concat_ws('--',Name,Phone_number,email) as'student_information' from students;
select Roll_no ,concat_ws('  ',Name,Phone_number,email) as'student_information' from students;
select concat_ws('   ','Priyanka','Vijesh');


-- 4.length:This function is used to find the Length of a word or string
-- syntax-select length(column_name) from table_name;
select length(Name) from students;
select length(Roll_no) from students;
select length(Name) from students;
select length('priyanka');
-- syntax-select column_name,length(column_name) from table_name;
select Name,length(Name) from students;
select Roll_no,length(Roll_no) from students;
select length('priyanka');

-- 5.upper: This function is used to make the string in uppercase
-- syntax:select column_name ,upper(column_name) from table_name;
select upper(Name) from students;
select *,upper(Name) from students;
select upper(Name) from students;
select upper('Priyanka');

-- 6.Lower:This function is used to make the string in lowercase
-- Syntax: select column_name,lower(column_name) from table_name;
select lower(Name) from students;
select lower('Priyanka');

-- 7. replace:– Replace all the occurrences of a substring withing a string
-- syntax-select_column_name,replace(column_name,string to replace,new_replace_column_name)from table_name
select replace ('virat Boweler virat','virat','Vijesh');
select * from students;
select replace(name,'John Doe','Priyanka');

 -- 8.reverse:This function is used to reverse a string
 -- syntax-select column_name reverse(column_name) from table_name;
 select name ,reverse(name) from students;
 select reverse('Priyaka');
 select 'priyanka', reverse('priyanka');
 
 -- 9.substring:– It allows you to extract a portion(substring) of a string based on a specified starting position and length.
 -- syntax- select column_name,substring(column_name,start_position,length)from table_name;
 select name ,substring(name,1,4) from students;
 
 
 -- 10.left:Returns a specified number of character from the left side of a string
-- syntax-select column_name,left(column_name,length) from table_name
  select name ,left(name,6) from students;
 
 
 -- 11.right:Returns a specified number of character from the Right side of a string
 -- syntax-select column_name ,right(column_name,length) from table_name;
 select name ,right(name,6) from students;
 
 
 #Date and Time function
 
 select current_date();
 select current_time();
 select current_timestamp();


 # current date
 select current_date();
 select month(current_date());
 select month('2024-08-02');
 select year(current_date());
 select year('2024-11-30');
 select day(current_date());
 select day('2024-02-31'); #null because in feb not 31 days 
 select day('2024-02-28');
 select dayname(current_date()); -- for particular day name
 
 #current time
 select current_time();
 select hour(current_time());
 select hour('22:21:25');
 select minute(current_time());
select minute('22:21:25');
select second(current_time());
select second('12:30:61'); #null
select second('12:30:59');

# current time and date use current_timestamp()
select current_timestamp();
select month(current_timestamp());
select year(current_timestamp());
select day(current_timestamp());
select hour(current_timestamp());
select minute(current_timestamp());
select second(current_timestamp());

select week(current_timestamp());-- give number week number out of 52
select week('2024-12-29')+1;
select dayname(current_timestamp());-- for particular month name
select monthname(current_timestamp());-- For particular month name
#Extract
-- syntax- select extract(date function() or time function() from current_timestamp());
select extract(hour from current_timestamp()) ;
select extract(day from '2000-05-02') ;
select extract( year from '2000-05-02') ;
  
#Datediff:– Calculate the difference between two dates and or Timestamp
-- select datediff(date1,date2);
select datediff(current_date(),'2000-05-02'); -- they give difference in days

#TimeDiff – Calculate the difference between two times or timestamps
-- select datediff(time1,time2);
select timediff(current_time(),'8:30:59'); -- they give all difference in form 13:49:28



-- (Arithmetic operators +,-,*,/,%) operators
select name,marks from students;
select name,marks+5 from students;
select 5+100 As 'sum';
select name, marks-30 from students;
select id,name, marks*2 from students;
select id,name,roll_no,marks/100 from students;
select id,name,id/1*2 from students;

select name,marks+marks+10/100 from students;

/*  compound operator not supporated in my sql
-- compound operators (+=,-=,/=,*=,%=,)
select name,marks from studens;
select name,(marks-=5) from students;
*/

-- Bitise operator(& |)
select name,marks & Roll_no from students;
select 1 & 2; -- 1 binary value is 01 and 2 binary value is 10 then = 00
select name,marks | Roll_no from students;
select 1 | 2; -- 1=01,2=10 1|2=11

# set operators :
/*SET operators are special type of operators which are used 
to combine the result of two queries*/
-- 1.union operator:
/*unionoperator is used to combine the result of 2 or more select statements.
 It removes duplicate rows between the various select
statements.
each select statement within the union operator must have the same
number of columns in the result sets with similar data types.*/

-- syntax- select column_name from table1 union select column_name from table2;
select name,marks from  students where marks<60
union select name,marks from students where marks>90;
select name,marks from  students union select name,marks from students ;
select name,marks from  students union select name,Phone_number from students ;
select name,marks from  students -- select statement within the union operator must have the same
union                            -- -- number of columns in the result sets with similar data types.
select name,Phone_number from students 
union
select email,name from students;

-- 2.union all:
/*The union  all clause/operator is used to combine the results of two 
select statements including duplicate rows.*/
-- syntax- select column_name from table1 union all select column_name from table2;
select name,marks from students union all select name,marks from students;
select id,roll_no from students union all select id,marks from students; --  is combine two query result

-- 3.intersect:intersect operator return common element in two sets or common record from two or more tables.
-- syntax- select colummn_name from table1 intersect select column_name from table2;

select id,name, marks from students where id in (1,2,3) 
intersect 
select id,name, marks from students where id in (1,2);

-- 4.Minus- (in my sql minus not support use Except)
/*same as difference 
returns only record from table1 which are not in table2.*/
-- syntax-
select id,name, marks from students where id in (1,2,3) 
Except
select id,name, marks from students where id in (1,2);

#Case statement:case statement similar to if else
/* syntax-case
 when condition1 then result1
 when condition2 then result2
 when conditionN then resultN
 else result
 end*/
select id,name,marks,(case
when marks>=90 then 'Grade A'
when marks>=80 and marks<90 then 'Grade B'
when marks>=70 and marks<80 then 'Grade C' 
else 'Fail'
end) as Grade
 from students ;
 
#delete duplicate row
-- syntax create table new_table_name select distinct column_name from table_name;
select * from students;
insert into students () values();
insert into students () values();

create table student_new_table select distinct name,phone_number,roll_no,dob,marks,email from students;
select * from student_new_table;
drop table student_new_table;

-- delete from students where id in (15,16);

#Group by clause:kasya tari wise grouping karane
-- synatx select column_name ,sum(column_name) from table_name group by column_name;
-- in group by we use aggregate functin min,max,sum,avg,count
-- add new column 
alter table students add column college varchar(255); 
update students set college='COEP' where id <= 6;
update students set college='GCCOERA' where id in (7,8,9,10,11,12);

select college,sum(marks) from students group by college;
select college,sum(marks) from students where marks>90 group by college;
select college,max(marks) from students  group by college;
select college,min(marks) from students  group by college;
select college,avg(marks) from students  group by college;
select college,count(name) from students group by college;
select college,max(marks) from students group by college  order by max(marks) desc limit 1; -- college wise first highest marks
select college,max(marks) from students group by college  order by max(marks) desc limit 1,1;-- college wise second highest marks

# Having clause:to aaply condition after group by on aggregate function . having only use with group by.
-- syntax- select column_name,sum(column_name) from table_name group by column_name having sum(column_name) condition ;
-- group by syntax having sum(column_name) condition ;
select college,sum(marks) from students group by college having sum(marks)>300;
select college,sum(marks) from students group by college having sum(marks)>400;

/*WHERE Clause                                       HAVING Clause
1.The WHERE clause does not allow to work with     1.In group by The HAVING clause can work with aggregate
aggregate functions.                             functions
2.We can use the WHERE clause with the SELECT,     2. HAVING clause can only use with the group by
UPDATE, and DELETE statements.*/


#Order by:-
-- order by keyword sorts data based on column specified(ascending sort)
-- by default order by ascending order
-- syntax-select column_name from table_name order by column_name;
select * from students order by name;
select * from students order by college,name;
select * from students order by roll_no;
-- descending order;
select * from students order by name desc;
select * from students order by  id desc;
select college,max(marks) from students  group by college order by max(marks) desc;  -- group by then order by
select college,count(name) from students group by college order by count(marks) desc;

#1.limit clause:limit is similar to head
-- syntax: select column_name from table_name limit n;
 select * from students limit 5;
 select * from students limit 1;
 select * from students order by marks desc limit 1; #first highest marks
 -- off set:in limit to select particular rows for ex:
 -- to get start any row to number of rows to write as limit 4,5;
 -- syntax- select column_name from table_name limit offset,row count;
 select * from students limit 5,2;
 select * from students order by marks desc limit 0,5;
 select * from students order by marks desc limit 0,1;# first highest marks
 select * from students order by marks desc limit 1,1; #second highest marks
 select * from students order by marks desc limit 2,1 ;#third highest marks
 select * from students order by marks desc limit 3,1 ;#fourth highest marks
 select college,max(marks) from students group by college  order by max(marks) limit 1;
 
 /* Top is not supporated in my sql:
 #2.Top clause : top is similar to limit but we cant not supporated off set.
 -- syntax: select top n * column_name from table_name;
 select top 2 * from students ;
 select top 5 * from students;
 */
 
 
 #Aliases:sql aliases are used to give a table or a column in a table,a temporary name
 /* use of renaming while 
 display use to display name
 aliases are often used to make column name more readable
 an aliases is created with the   As   keyword.
 
 If you want your alias to contain one or more spaces, like 'My Great Products'- we use '  ' ,
 */
 -- syntax select column_name as 'alias_name' from table_name; -- for column name
 -- syntax select column_name from table_name as 'alias_name';-- for table name
 --------------------------------------------------------------------------
 -- Joins :A JOIN clause is used to combine rows from two or more tables, based on a related column between them.
Create table StudentDetails(Name varchar(50),
 id int, 
 Age int, 
 Gender varchar(50),
 Location varchar(50));
 
 insert into StudentDetails values('sai',1,12,
'female','spain'),('Baba',2,15, 'Male','Newyork'),('ram',3,15,
'Male','spain'),('raghu',4,15, 'female','Newyork'),('Ajay',5,12,
'male','Nijeria'),('Amit',6,12, 'male','spain');


 create table Grade(
 Grade varchar(25), 
 id int);
 
 insert into Grade values('A', 2),('B',3),('A',4),('C',5),('B',7);
 
 #1.innerjoin: Returns records that have matching values in both tables
 /*syntax: select table1.columna,table2.column2... 
   from table1
   inner join table2 
   on table1.common_field=table2.common_field;*/
 
 select * from studentDetails;
 select * from Grade;
 select * from studentDetails inner join Grade  on studentDetails.id=Grade.id;
 select s.*,g.* from studentDetails as s inner join Grade as g on s.id=g.id;
 -------------------------------------------------------------------------------
 #2.Left join
 /*The LEFT JOIN keyword returns all records from the left table (table1),
 and the matching records from the right table (table2).*/
 
 /*syntax-select table1.column1,table2.column2... 
 from table1 
 left join table2 
 on table1.common_filed=table2.common_filed;*/
 
 select * from studentDetails;
 select * from Grade;
 
 select * from studentDetails
 left join Grade 
 on studentDetails.id=Grade.id ;
 
select s.*,g.* from studentDetails as s
right join Grade as g 
on s.id=g.id;
 --------------------------------------------------------------------------
 #3. Right join 
 /*The RIGHT JOIN keyword returns all records from the right table (table2), 
 and the matching records from the left table (table1).*/
 /* syntax-select table1.column1,table2.column2...
    from table1
    right join table2
    on table1.common_field=table2.common_filed;*/
    
select * from studentDetails;
select * from Grade;    

select * from studentDetails 
right join Grade
on studentDetails.id=Grade.id;

select s.*,g.* from studentDetails as s
right join Grade as g 
on s.id=g.id;
------------------------------------------------------------------------
#4.full join 
/*The FULL OUTER JOIN keyword returns all 
 records when there is a match in left (table1) or right (table2) table records.*/
-- Tip: FULL OUTER JOIN and FULL JOIN are the same.
/*syntax-select table1.column1,table2.column2...
         from table1 
         full join table2
         on table1.common_filed=table2.common_filed;*/
         
/*If your Database does not support FULL JOIN (MySQL does not support FULL JOIN), 
then you can use UNION ALL or
UNION clause to combine these two JOINS as shown below  */
       
select * from studentDetails;
select * from Grade;          
select s.*,g.* from studentDetails as s left join Grade as g on s.id=g.id 
union
select s.*,g.* from studentDetails as s  right join grade as g on  s.id=g.id;

select * from studentDetails as s right join Grade as g on s.id=g.id 
union
select * from studentDetails as s  left join grade as g on  s.id=g.id;


-----------------------------------------------------------
create table Emp(Emp_ID int, Name varchar(255),Mgr_ID int);
insert into Emp values(1, 'Rahul',3),
(2,'Jay',3),
(3,'Sonam',4),
(4,'Kunal',5),
(5,'Ram',6);
insert into Emp(Emp_ID,Name)values(6,'Rani');
insert into Emp values(7, 'Veeru',6);

create table child_father_self
(id int,
child varchar(55),
father int);
 insert into child_father_self values
 (100,'salman',400), (200,'Arbaz',400), (300,'sohail',400),
  (400,'salim',500), (500,'ali',null);
#5.Self join-The SQL SELF JOIN is used to join a table to itself 
-- A self join is a regular join, but the table is joined with itself.
-- syntax-select table1.column1 from table1,table1 where Condition
-- syntax- select column_name from table1 ,table1 where condition;
/*In self join use 
1.self join
2.self left join
3.self right join
4.self cross join*/

select * from Emp;
select * from Emp as  E inner join Emp as M on E.Mgr_Id=M.Emp_ID;
select E.Name,M.Name from Emp as  E inner join Emp as M on E.Mgr_Id=M.Emp_ID;
select E.Name,M.Name as maneger from Emp as E,Emp as M where E.mgr_ID=M.Emp_ID;

select * from child_father_self;
select c.child as childName, f.child as fatherName from child_father_self as c inner join child_father_self as f on c.father=f.id;
select c.child as childName,f.Child as fatherName from child_father_self as c,child_father_self as f
where c.father=f.Id;

-- Pratice 
select * from Emp;
select count(E.Name),M.Name from Emp as  E inner join Emp as M on E.Mgr_Id=M.Emp_ID group by M.name;
select count(E.Name),M.Name from Emp as  E inner join Emp as M on E.Mgr_Id=M.Emp_ID group by M.name having count(E.Name)>=2;

-------------------------------------------------------------------------------------
CREATE TABLE Employee(Employee_ID int, Name
varchar(255));
Insert into Employee values(7369,'Sai'),
(7499,'Rahul'),
(7521,'Pooja'),
(04,'Johnson');
 
 CREATE TABLE Orders(Prod_ID int, Product varchar(255),
Employee_ID int);
insert into Orders values(234, 'Finacle',7369),
(657, 'Table',7521),
(865, 'QTP',7521);

Select * from Orders;
Select * from Employee;
#6.Cartesin join:• The CARTESIAN JOIN or CROSS JOIN returns the Cartesian product of
-- the sets of records from the two or more joined tables.
-- syntax-select table1.column1,table2.column2 from table1,table2
-- synatx - select * from table1,table2;
Select * from Orders;
Select * from Employee;
select * from Orders,Employee;
select e.name,o.product from Employee as e,orders as o;

select * from orders as o ,orders;

select * from Emp;
select * from child_father_self;
select * from Emp,child_father_self;
select e.Name,c.child from Emp as e,child_father_self as c;

select * from StudentDetails;
select * from Grade;
select * from studentDetails,Grade;		
select s.Name,g.Grade from StudentDetails as s,Grade as g;
        
# Sub Queries: query inside the query is sub queries
create table Empdetails
(
eName varchar(255),
eSal Decimal(10,2),
eage smallint,
dob date
);
insert into Empdetails values ('Ulhas',54235.00,26,'1998-05-10');
select * from Empdetails;
insert into Empdetails values ('Rohith',256984.00,35,'1989-01-01'),
('Gavaskar',156489.00,74,'1949-07-10'),('Kapil',86598.00,65,'1959-01-06')
,('MSD',365984.00,35,'1981-07-06');
select * from empdetails;

select * from empdetails where esal>(select esal from empdetails where ename='kapil');
-- Highest salary using sub query
 select max(esal) from empdetails ; #1st highest
 select  * from empdetails where esal<(select max(esal) from empdetails);
 select  max(esal) from empdetails where esal<(select max(esal) from empdetails); # 2nd highest
 select max(esal) from empdetails where esal<
 (select max(esal) from empdetails where esal<(select max(esal) from empdetails)); #3rd highest
 
 
 --------    important question on sub query -------
 /*1.  select employees whose is greater than 'Michael's' salary
	   select * from employees where salary > (select salary from employees where first_name ='Michael’);
       
 2.   Query to get first name, lastname department id and department name
      select first_name, last_name, department_id,
      (select department_name from departments where employees.department_id =departments.department_id) departmentname from employees;
      
3.    Find the customers who have not placed any orders
      SELECT customerName FROM customers WHERE customerNumber NOT IN (SELECT DISTINCT customerNumber FROM orders);*/
   
-- ----------------------------------------------------------------
# sql constraints
-- 1. Not Null:• It does not allow to user insert the null value
Create table customer(ID int NOT NULL, NAME Varchar(25),Lname
varchar(30),Aadhar int);

 Insert into customer
(ID,NAME,LNAME,AADHAR)Values(1,'Asif','Shaikh',2525); -- Correct
Insert into customer
(NAME,LNAME,AADHAR)Values('Asif','Shaikh',2525); -- Error:Filed 'ID'does not have default value

select * from customer;

-- 2. Unique  Constarint:1.It does not accept duplicate value
                  --  2. accept only UNIQUE value
                  -- 3.Unique constraint column can accept multiple NULLS.
create table student1(
 sno int Unique, 
sname varchar(10), 
marks int);
insert into student1 values(101,'arun',50);
insert into student1 values(101,'kiran',60); -- 101 not allowed because duplicate 
insert into student1 values(null,'suresh',80);
insert into student1 values(null,'raj',60);

select * from student1;

-- 3.Default Constraint: It is used to set the default values
Create table EMP1(
ID int, 
Name varchar(25),
City varchar(30) Default 'Satara');

insert into EMP1(ID,Name, city)Values(1,'Vishal','Pune');
insert into EMP1(ID,Name)values(2,'Vinay');

select * from emp1;      

-- 4. Check Constraint:Check constraint is used for allowing to user to enter specific values 
-- into column.         
create table student2(sno int, 
sname varchar(15),
marks int check(marks between 50 and 100));

insert into student2 values(101,'amith',60); # valid
insert into student2 values(101,'amith',45); # invalid  because marks is 45<50
insert into student2 values(101,'amith',105); #invalid because marks >100
insert into student3 values(1,'Rahul',90); # valid
select * from student2;


create table student3(sno int, 
sname varchar(15),
marks int check(marks=90));
insert into student3 values(1,'Rahul',90); # valid
insert into student3 values(2,'Sagar',45); # invalid  because marks not equal 90
insert into student3 values(3,'samarath',105); # invalid  because marks not equal 90
select * from student3;


-- 5.Primary Key Constraint
/*   1.Primary Key is a Combination of NOT NULL +UNIQUE key
     2.It does not allow duplicate values
     3.It does not allow null values
     4.in each table only one primary key*/
     
create table student_PrimaryKey(sno int primary key, 
sname varchar(20),
marks int);
insert into student_Primarykey values(101,'arun',50);-- Valid
insert into student_Primarykey(101,'suresh',60); -- Invalid --Not unique 101 is repeat
insert into student_Primarykey values(null,'suresh',60); -- Invalid --Null present 
     
     
 --  Auto Increment Keyword--automatically generates a unique number for each new row inserted into the table. 
 -- This is particularly useful for primary keys, where you need each row to have a unique identifier.
 CREATE TABLE Students_AutoIncrementKeyword(
 Student_ID int AUTO_INCREMENT PRIMARY KEY,
 First_Name varchar(255),
 Last_Name varchar(255));
INSERT INTO Students_AutoIncrementKeyword(First_Name, Last_Name ) VALUES ('Anish','Jain'),
('Akshita','Sharma'),('Shruti','Sogani'),('Aishwarya','gomasale');
 
 select * from Students_AutoIncrementKeyword;-- student Id automatic increment 
     
     
-- 6.Foreign Key constraint:
/*parent child relationship 
foreign key child table refer primary key in parent table
 In simple words, foreign key values in one table
must be present in another table.*/

    create table department_foreign
	(dept_name varchar(20), 
	 building varchar(15), 
	 budget numeric(12,2) check (budget > 0),
	 primary key (dept_name)
	);
    
	create table student_Foreign
	(ID	varchar(5), 
	 name varchar(20) not null, 
	 dept_name varchar(20), 
	 tot_cred numeric(3,0) check (tot_cred >= 0),
	 primary key (ID),
     foreign key(dept_name) references department_foreign(dept_name)
     
	);
    
insert into department_foreign values ('Biology', 'Watson', '90000'),
 ('Comp. Sci.', 'Taylor', '100000'),
('Elec. Eng.', 'Taylor', '85000'),
 ('Finance', 'Painter', '120000'),
 ('History', 'Painter', '50000'),
 ('Music', 'Packard', '80000'),
 ('Physics', 'Watson', '70000');
    
insert into student_foreign values ('00128', 'Zhang', 'Comp. Sci.', '102'),
 ('12345', 'Shankar', 'Comp. Sci.', '32'),
 ('19991', 'Brandt', 'History', '80'),
 ('23121', 'Chavez', 'Finance', '110'),
 ('44553', 'Peltier', 'Physics', '56'),
 ('45678', 'Levy', 'Physics', '46'),
 ('54321', 'Williams', 'Comp. Sci.', '54'),
('55739', 'Sanchez', 'Music', '38'),
 ('70557', 'Snow', 'Physics', '0'),
 ('76543', 'Brown', 'Comp. Sci.', '58'),
 ('76653', 'Aoi', 'Elec. Eng.', '60'),
 ('98765', 'Bourikas', 'Elec. Eng.', '98'),
 ('98988', 'Tanaka', 'Biology', '120');
 
 insert into student_foreign values ('01234', 'Zhang', 'Automobile', '102');-- error
 -- cannot update child row foreign key error
 select * from department_foreign;
select * from student_foreign;
    
#1.On Delete Cascade keyword:foreign key(sno)references school_cascade(sno) on delete cascade,

delete from department_foreign where dept_name='Elec. Eng.'; #error not directly delete parent record because parent table is refered by child table for delete use cascade

-- Parent table
create table school_cascade(sno int Primary Key, 
sname varchar(15),
marks int);
insert into school_cascade values(101,'arun',90),
(102,'kiran',70),
(103,'amit',80);

-- Child table
create table library_cascade(sno int, 
foreign key(sno)references school_cascade(sno) on delete cascade,
book_name varchar(255));
insert into library_cascade values(101, 'Java'); -- valid
insert into library_cascade values(444,'C programming'); -- error-- Invalid becoz 444 is not in parent table
insert into library_cascade values(null,'html'); -- valid-- null means not refered for parent 

delete from school_cascade where sno=101;
select * from school_cascade;
select * from library_cascade;

#2.On Update Cascade keyword:foreign key(sno)references school_updatecascade(sno) on delete cascade on update cascade
update department_foreign set dept_name='Dace' where dept_name='Music'; #error not directly update parent record because parent table is refered by child table for update use update cascade keyword

-- parent table
create table school_updatecascade(sno int Primary Key, 
sname varchar(15),
marks int);
insert into school_updatecascade values(101,'arun',90),
(102,'kiran',70),
(103,'amit',80);
 
create table library_updatecascade(sno int, 
foreign key(sno)references school_updatecascade(sno) on delete cascade on update cascade,
book_name varchar(255));
insert into library_updatecascade values(101, 'Java'); -- valid
insert into library_updatecascade values(444,'C programming'); -- error-- Invalid becoz 444 is not in parent table
insert into library_updatecascade values(null,'html'); -- valid-- null means not refered for parent 

 update school_updatecascade set sno=105 where sno=101;   
 select * from school_updatecascade;
 select * from library_updatecascade;

 #with cascade
-- Insert: first insert in parent table then child but
-- delete : first delete parent entry then automaticaly delete child entry
-- update: first update  parent entry  then automaticaly update child entry


# without cascade
-- delete : first delete child table then parent  


# CREATE a table with multile foreign key in sql

/*CREATE TABLE student_details(
stu_id VARCHAR(8) NOT NULL PRIMARY KEY,
stu_name VARCHAR(20),
stu_branch VARCHAR(20) FOREIGN KEY REFERENCES student_branch_details(stu_branch),
stu_pin_code VARCHAR(6) FOREIGN KEY REFERENCES student_address(stu_pin_code)
);
CREATE TABLE student_branch_details(
stu_branch VARCHAR(20) PRIMARY KEY,
subjects INT,
credits INT
);
CREATE TABLE student_address(
stu_pin_code VARCHAR(6) PRIMARY KEY,
stu_state VARCHAR(20),
student_city VARCHAR(20)
);*/



# view :Suppose “First” is the table already available in database. Creating view use below query.
-- syntax- Create view view_name as (query)
-- view_name means = new_table_name

-- for ex-1. Create view view_name as(select * from table_name);
-- 2. Create view view_name as (select column_name from table_name where condition )
-- 3. Create view view_name as (select column_name from table1 inner join table2 on table1.column_name=table2.column_name )
-- 4. create view view_name as (inside any query)
Drop view view_name; -- only delete view

#Index :Index are used to retrive data from the database more quickly than otherwise
	-- The users cannot see the indexes, they are just used to speed up searches/queries
    -- Syntax:Create Index index_name on table_name(column1,column2);
 Drop Index index_name on table_name;
 
CREATE TABLE Students_Index (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT
);
-- create index index_name on table_name(column1,column2);
-- to create an index on the lastname column
CREATE INDEX idx_lastname ON Students_Index(LastName);

-- single-column Index:An index created on a single column:
CREATE INDEX idx_firstname ON Students_Index(FirstName);

-- composite index: an index created on two or more columns
CREATE INDEX idx_name_age ON Students_Index(LastName, Age);

-- Unique Index: Ensures that all the values in the indexed column(s) are unique.
CREATE UNIQUE INDEX idx_unique_studentid ON Students_Index(StudentID);

select * from Students_Index;
#SELECT * FROM Students WHERE LastName = 'Smith';  -- With an index on the LastName column, the database can quickly find the rows where LastName is smith 
#SELECT * FROM Students WHERE LastName = 'Smith'; -- Without an index, the database has to check every row in the Students table to find rows where LastName is 'Smith'.



#Normalization:technique to avoid duplicate data by spliting into multiple tables
    -- the process of structuring and resolving data in a database is known as normalization.
-- 1.1NF:First normal form : your single column should not have multiple value attributes
-- 2.2NF
-- 3.NF

# schema : schema is a structure of database.A schema is the structure that defines the organization of data in a database. 
-- It describes how the data is organized, including tables, fields, relationships, constraints
-- Entity-Relationship Diagram (ERD).


#enum:is used when we  want to  accept only specific values.
CREATE TABLE Students_enum(
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Gender ENUM('Male', 'Female', 'Other'), -- gender only accept value from this three values
    Age INT
);
INSERT INTO Students_enum(FirstName, LastName, Gender, Age) VALUES ('John', 'Doe', 'Male', 20);
INSERT INTO Students_enum(FirstName, LastName, Gender, Age) VALUES ('Jane', 'Smith', 'Female', 22);
INSERT INTO Students_enum(FirstName, LastName, Gender, Age) VALUES ('Alex', 'Johnson', 'Unknown', 21);-- error
-- This will result in an error because 'Unknown' is not a valid value for the Gender column.
-- ALTER TABLE Students MODIFY Gender ENUM('Male', 'Female', 'Other', 'Non-Binary'); -- change datasize ENUM('Male', 'Female', 'Other')



--   Window Function   --
CREATE TABLE Sales_windowFunction (
    SalesID INT PRIMARY KEY,
    EmployeeID INT,
    Amount DECIMAL(10, 2),
    SaleDate DATE
);

INSERT INTO Sales_windowFunction (SalesID, EmployeeID, Amount, SaleDate) VALUES
(1, 101, 100.00, '2023-01-01'),
(2, 102, 200.00, '2023-01-01'),
(3, 101, 150.00, '2023-01-02'),
(4, 102, 250.00, '2023-01-02'),
(5, 101, 200.00, '2023-01-03'),
(6, 102, 300.00, '2023-01-03');

-- 1.Row-number()
SELECT *,ROW_NUMBER() OVER(ORDER BY Amount) AS RowNum FROM Sales_windowFunction; -- after , this is column 
SELECT *,ROW_NUMBER() OVER(ORDER BY Amount DESC) AS RowNum FROM Sales_windowFunction;
SELECT *,ROW_NUMBER() OVER(PARTITION BY EmployeeID ORDER BY Amount) AS RowNum FROM Sales_windowFunction;


-- 2.sum():
SELECT *,SUM(Amount) OVER(ORDER BY Amount) AS RunningTotal FROM Sales_windowFunction;
SELECT *,SUM(Amount) OVER(ORDER BY Amount DESC) AS RunningTotal FROM Sales_windowFunction;
SELECT *,SUM(Amount) OVER(PARTITION BY EmployeeID ORDER BY Amount) AS RunningTotal FROM Sales_windowFunction;


-- 3.Rank():
SELECT *,RANK() OVER( ORDER BY AMOUNT DESC  ) AS SalesRank from Sales_windowFunction;
SELECT *,RANK() OVER( ORDER BY AMOUNT ) AS SalesRank from Sales_windowFunction ;
SELECT *,RANK() OVER(PARTITION BY EmployeeID ORDER BY Amount DESC) AS SalesRank from Sales_windowFunction;

# duplicate record max amount we not use rank because rank skip the order
select Amount from (SELECT *,RANK() OVER(ORDER BY Amount DESC) AS SalesRank from Sales_windowFunction) as T where salesRank=4;
select Amount from (SELECT *,RANK() OVER(ORDER BY Amount ) AS SalesRank from Sales_windowFunction) as T where salesRank=1;

-- 4.Dense Rank():

SELECT *,DENSE_RANK() OVER( ORDER BY Amount DESC) AS SalesRank FROM Sales_windowFunction;
SELECT Amount,DENSE_RANK() OVER( ORDER BY Amount DESC) AS SalesRank FROM Sales_windowFunction;
SELECT *,DENSE_RANK() OVER( ORDER BY Amount) AS SalesRank FROM Sales_windowFunction;
SELECT *,DENSE_RANK() OVER(PARTITION BY EMPLOYEEID ORDER BY Amount DESC) AS SalesRank FROM Sales_windowFunction;
select * from(select *,dense_rank() over(partition by EmployeeID order by Amount desc) as SalesRank from Sales_windowFunction) as T where SalesRank<=2;
select Amount from(select *,dense_rank() over(partition by EmployeeID order by Amount desc) as SalesRank from Sales_windowFunction) as T where SalesRank<=2;

#select Department,Employee,Salary from(select Department,Employee,Salary,dense_rank() over(partition by Department order by Salary desc) as T from t )as T1 where T<=3;

# duplicate record max amount we dense rank use rank because rank skip the order
-- Nth Highest Salary
select Amount from(select Amount,dense_rank() over(order by Amount desc) as salesRank from saleswindowFunction ) as T where SalesRank=n;
-- First Highest Salary
select Amount from (SELECT *,DENSE_RANK() OVER( ORDER BY Amount DESC) AS SalesRank FROM Sales_windowFunction) as T where SalesRank=1;
-- Second Highest Salary
select Amount from (SELECT *,DENSE_RANK() OVER( ORDER BY Amount DESC) AS SalesRank FROM Sales_windowFunction) as T where SalesRank=2;
-- Third Highest Salary
select Amount from (SELECT *,DENSE_RANK() OVER( ORDER BY Amount DESC) AS SalesRank FROM Sales_windowFunction) as T where SalesRank=3;

-- fourth Highest Salary 
select Amount from (SELECT *,DENSE_RANK() OVER( ORDER BY Amount DESC) AS SalesRank FROM Sales_windowFunction) as T where SalesRank=4;

-- partition by employeeid wise highest salary;
select Amount from (SELECT *,DENSE_RANK() OVER(PARTITION BY EMPLOYEEID ORDER BY Amount DESC) AS SalesRank FROM Sales_windowFunction ) 
as T where EmployeeId=101 and salesRank=1;

#Round Function:ROUND() function is used to round a numeric value to a specified number of decimal places.
-- syntax-ROUND(number, decimal_places)
SELECT ROUND(123.456) AS RoundedValue;
SELECT ROUND(123.456, 2) AS RoundedValue;
SELECT ROUND(-123.456, 1) AS RoundedValue;
SELECT ROUND(123.456, 0) AS RoundedValue;
SELECT ROUND(12345.6789, -2) AS RoundedValue;

CREATE TABLE Products_Round(
    ProductID INT,
    ProductName VARCHAR(50),
    Price DECIMAL(10, 4)
);

INSERT INTO Products_Round(ProductID, ProductName, Price) VALUES
(1, 'Product A', 123.4567),
(2, 'Product B', 78.91011),
(3, 'Product C', 45.6789);
select * from Products_Round;

SELECT ProductID, ProductName, ROUND(Price, 2) AS RoundedPrice FROM Products_Round;
select round(max(Price),2) as Max_round_price from products_round;
select round(min(price),2) as min_round_price from products_round;


#CTE:common table expression: It is also know as temperory result expression.

with t1 as (select * from students where id>5)

select id,marks from t1;


-- remove duplicate rows by CTE
with t1 as (select column_name,row_number() over(partition by column1,column2,column3 order by column_number )as row_num from table_name)
select * from t1 where row_num=1;

insert into Sales_windowFunction values(7,101,100.00,'2023-01-01');
with t1 as (SELECT *,ROW_NUMBER() OVER(PARTITION BY EmployeeID,Amount,SaleDate ORDER BY Amount) AS RowNum FROM Sales_windowFunction)
select * from t1 where rownum=1;

#Insert into using select to copy data from one table to another table.
-- -- syntax-insert into table2 (column1,column2,column3) select column1,column2,column3 from table1 where condition;
CREATE TABLE Employees_IS1 (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2)
);
INSERT INTO Employees_IS1 (EmployeeID, FirstName, LastName, Department, Salary)
VALUES
(1, 'John', 'Doe', 'HR', 50000.00),
(2, 'Jane', 'Smith', 'Finance', 60000.00),
(3, 'Bob', 'Brown', 'IT', 70000.00);

CREATE TABLE Employees_IS2 (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2)
);

select * from employees_IS1;
select * from Employees_IS1 where EmployeeID>=2;
-- syntax-insert into table2 (column1,column2,column3) select column1,column2,column3 from table1 where condition;
insert into employees_IS2 select * from Employees_IS1 where EmployeeID>=2;

insert into employees_IS2 (EmployeeID,FirstName) select EmployeeID,FirstName from employees_IS1 where FirstName='John';

select * from employees_IS2;

# IFNULL() Functions:If Values specified to null then return alt_value.
-- syntax-IFNULL(expression, alt_value)
-- expression	- The expression to test whether is NULL
-- alt_value	-The value to return if expression is NULL
select * from employees_IS2;
select Firstname,ifnull(Lastname,'Priyanka') from employees_Is2;
select Firstname,ifnull(Department,'Priyanka'),ifnull(Salary,0) from employees_Is2;
