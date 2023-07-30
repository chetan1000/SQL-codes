/*
	STORED PROCEDURE
*/

	--Procedure?
		--Named Block of code
		--Stored in database.
		--Procedure is block of code, which is given a name and stored in a database.

	--Procedure include:
		--SQL queries
		--DML,DDL,DCL & TCL commands
		--collection types
		--cursors
		--loop & IF ELSE statement
		--Variables
		--Exception Handling
		--Etc

	--Procedure can not use only for querying data from table, but we can used procedure for complex Logic, Data validation and Data cleanup.

	--Purpose of using procedures
		--procedures are introduced to give more power to sql language
		--procedures are generally do things which are not possible by SQL
				--based upon our requirement
					--multiple query bundle together used in procedure
					--building entire software logic inside a procedure, which may include Validation check, Data Processing, Queries of data.


	--Syntax for creating Procedures in different RDBMS:
		--1) in POSTGRE SQL
		/*

		CREATE or REPLACE PROCEDURE pr_name(p_name varchar,p_age int)
		Language plpgsql
		as $$
		declare
			variable delaring

		Begin
					
					procedure body_all logic,all queries...

		End;
		$$

		*/



		--2) in Oracle(Sql server)
		/*

		CREATE or REPLACE PROCEDURE pr_name(p_name varchar, p_age int)
		AS
			Variables..

		Begin
				Procedre body - all logics


		End;

		*/


		--3) in MYSQL (workbench)
		/*
		
		DELIMETER $$

		CREATE or REPLACE PROCEDURE pr_name(p_name varchar, p_age int)
		AS
		Declare var_name datatype;
		Declare var_name datatype;
		BEGIN
			
			procedure body-all logic

		END $$

		*/


		--4) in MSSQL Server
		/*

		CREATE or ALTER PROCEDURE pr_name(@p_name varchar, @p_age int)
		AS
			DECLARE @v_name varcahr,						or(we can )			DECLARE @v_name varchar;   			
					@v_age int;													DECLARE @v_age int;			

		BEGIN
			
			Procedure body - all logics

		END;
					
														--the parameter name starts with @
														--the variables also start with @
																												
		*/

--with no parameter passing into procedure:


USE [SQLLearn]
GO

--CREATE TABLE Products(
--Product_code varchar(20),
--Product_name varchar(50),
--Price int,
--Quqntity_remaining int,
--Quantity_sold int) 

--INSERT INTO Products VALUES('P1','iPhone 13 Pro Max',1000,5,195)

SELECT *
FROM SQLLearn..Products;

--CREATE TABLE Sales(
--Order_id int,
--Order_date date,
--Product_code varchar(20),
--Quantity_ordered int,
--Sales_Price int)

--INSERT INTO Sales VALUES
--(1,'2022-01-10','P1',100,120000),
--(2,'2022-01-20','P1',50,60000),
--(3,'2022-02-05','P1',45,54000);

SELECT *
FROM SQLLearn..Sales;


--For Every iPhone Pro Max Sale, Modify the Database Table Accordingly.
		
			--Everytime sales  happens,
				
					--We need to go first to Sales  table, for Storing Sales Order Information.
					--Secondly we need to go for Product table to update, in that specifically two Columns, 
						--they are Quantity_remaining & Quantity_sold
								--As soon as 1 iphone Sold,
									--Quantity_remaining = Quantity_remaining - 1
									--Quantity_sold = Quantity_sold + 1

									
	--in MS SQL server with no Parameters:

USE [SQLLearn]
GO
CREATE or ALTER PROCEDURE pr_buy_products
AS
DECLARE @v_product_code varchar(20),
		@v_price int;

BEGIN

	SELECT @v_product_code=Product_code,@v_price=Price
	FROM SQLLearn..Products
	WHERE Product_name = 'iPhone 13 Pro Max';

	INSERT INTO SQLLearn..Sales (Order_date,Product_code,Quantity_ordered,Sales_Price) VALUES (CAST(GETDATE() as date), @v_product_code,1,(@v_price*1));

	UPDATE Products
	SET Quqntity_remaining=(Quqntity_remaining - 1),
		Quantity_sold=(Quantity_sold + 1)
	WHERE Product_code=@v_product_code;

	PRINT('Product_Sold!');

END;




SELECT * FROM SQLLearn..Products;
SELECT * FROM SQLLearn..Sales;

EXEC pr_buy_products

SELECT * FROM SQLLearn..Products;
SELECT * FROM SQLLearn..Sales;

