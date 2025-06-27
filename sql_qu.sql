

/*
1.Take first row of table and tranpose it and add data type
2. Create db/ table 
*/
create database sales_db

drop table if exists customerTempo ;
create table customerTempo
(
CustomerKey varchar(100),
Prefix varchar(100),
FirstName varchar(100),
LastName varchar(100),
BirthDate varchar(100),
MaritalStatus varchar(100),
Gender varchar(100),
EmailAddress varchar(100),
Salary varchar(100),
TotalChildren varchar(100),
EducationLevel varchar(100),
Occupation varchar(100),
HomeOwner varchar(100),

)

/*

3.Declare variable to store to file directory
*/
---to rum first import from here 
declare @sourcefile varchar(200)
select @sourcefile='C:\Users\Surat\Desktop\data-ingestion-cleaning-medallion-SQL\data\Customers.csv'
print(@sourcefile)

----------------------------
-----Import data using Bulk insert
--------------------------
Bulk insert customerTempo
from 'C:\Users\Surat\Desktop\data-ingestion-cleaning-medallion-SQL\data\Customers.csv'
with
(
firstrow=2,
FIELDTERminator=',',
rowterminator='\n',
format='CSV',
FIELDQUOTE= '"'

)
---to here
select * from customerTempo


---Second Part Import with data cleaning--
/*
Trimming whitespace

Dropping null-heavy columns

Renaming columns for clarity

*/

declare @sourcefile varchar(200)
select @sourcefile='C:\Users\Surat\Desktop\data-ingestion-cleaning-medallion-SQL\data\Customers.csv'
drop table if exists customerClean
create table customerClean
(
CustomerKey varchar(100),
Prefix varchar(100),
FirstName varchar(100),
LastName varchar(100),
BirthDate varchar(100),
MaritalStatus varchar(100),
Gender varchar(100),
EmailAddress varchar(100),
Salary varchar(100),
TotalChildren varchar(100),
EducationLevel varchar(100),
Occupation varchar(100),
HomeOwner varchar(100),
sourcefile varchar(100)
)
insert into customerClean
select
	LTRIM(RTRIM(CustomerKey)) AS CustomerKey,
	LTRIM(RTRIM(Prefix)) AS Prefix,
	LTRIM(RTRIM(FirstName)) AS FirstName,
	LTRIM(RTRIM(LastName)) AS LastName,
	LTRIM(RTRIM(BirthDate)) AS BirthDate,
	LTRIM(RTRIM(MaritalStatus)) AS MaritalStatus,
	LTRIM(RTRIM(Gender)) AS Gender,
	LTRIM(RTRIM(EmailAddress)) AS EmailAddress,
	LTRIM(RTRIM(Salary)) AS Salary,
	LTRIM(RTRIM(TotalChildren)) AS TotalChildren,
	LTRIM(RTRIM(EducationLevel)) AS EducationLevel,
	LTRIM(RTRIM(Occupation)) AS Occupation,
	LTRIM(RTRIM(HomeOwner)) AS HomeOwner,
    @sourcefile
from  customerTempo

select * from customerClean




/*
Third Step
--Change Datatype



*/

drop table if exists customer
create table customer
(
CustomerKey bigint,
Prefix varchar(100),
FirstName varchar(100),
LastName varchar(100),
BirthDate Date,
MaritalStatus varchar(100),
Gender varchar(100) check (Gender in ('M','F','NA')),
EmailAddress varchar(100),
Salary int,
TotalChildren varchar(100),
EducationLevel varchar(100),
Occupation varchar(100),
HomeOwner varchar(100),
sourcefile varchar(100)
)




insert into customer
select
	CustomerKey,
	Prefix,
	FirstName,
	LastName,
	BirthDate,
	MaritalStatus,
	Gender,
	EmailAddress ,
	replace(replace(Salary,'$',''),',','') as Salary,
	TotalChildren,
	EducationLevel,
	Occupation,
	HomeOwner,
	sourcefile
     from customerClean

select '$5000,$2000'
select replace('$5000,$2000','$','')
select replace(replace('$5000,$2000','$',''),',','')

select top 10* from customer
order by Salary desc