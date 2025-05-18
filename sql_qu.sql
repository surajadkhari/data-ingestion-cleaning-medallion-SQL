

/*
1.Take first row of table and tranpose it and add data type
2. Create db/ table 
*/
create database sales_db
create table customer
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

declare @sourcefile varchar(200)
set @sourcefile='C:\Users\Surat\Desktop\data-ingestion-cleaning-medallion-SQL\data\Customers.csv'
print(@sourcefile)