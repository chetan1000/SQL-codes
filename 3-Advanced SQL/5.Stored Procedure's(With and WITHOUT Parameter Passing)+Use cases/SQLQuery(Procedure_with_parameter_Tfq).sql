/*
		Procedure with Parameter
*/

USE [SQLLearn]
GO
--CREATE TABLE Products1(
--Product_code varchar(25),
--Product_name varchar(50),
--price int,
--Quantity_remaining int,
--Quantity_sold int)

--INSERT INTO SQLLearn..Products1 VALUES
--('P1','iphone 13 pro max',1000,5,195),                               
--('P2','Airpods pro',279,10,90),
--('P3','Macbook Pro 16',5000,2,48),
--('P4','iPod Air',350,1,9);

SELECT *
FROM Products1

CREATE TABLE Sales1(
Order_id int,
order_date date,
product_code varchar(10),
quantity_ordered int,
sale_price int)


INSERT INTO Sales1 VALUES
(1,'2022-01-10','P1',100,120000),
(2,'2022-01-20','P1',50,60000),
(3,'2022-02-05','P1',45,540000),
(4,'2022-01-15','P2',50,18950),
(5,'2022-03-25','P2',40,11160),
(6,'2022-02-25','P3',10,50000),
(7,'2022-03-15','P3',10,50000),
(8,'2022-03-25','P3',20,100000),
(9,'2022-04-21','P3',8,40000),
(10,'2022-04-27','P4',9,5850);

SELECT *
FROM SQLLearn..Sales1

--For every given PRODUCT & the QUANTITY,
	--1. check if product is available based on the required quantity
	--2. If available then modify the database tables accordingly.
					--you will be given product and also you will be given how much quantity of that product is required to besolfd as per particular sales order.
					--and we need to check the datbase, if so many products are actually available,
						--if it available, then do modifications
						--if not available, then may be return with 'Insufficient Quantity'.

--p_oroduct_name varchar, p_quantity int are input parameters along with dat type
--by default, these are called input parameter bez, these are the inputs that are passed when procedure is being  called
--Thse are input parameters, we can use it anywhere in our procedure to do sny calculations or any logic

--p_oroduct_name varchar, p_quantity int by default sql will take as input parameter in procedure, or we can mention manullay as   IN p_oroduct_name varchar, IN p_quantity int
--for out parameters we need to specify OUT p_oroduct_name varchar, OUT p_quantity int


--in POSTGRE SQL
/**	

	create or replace procedure pr_buy_products1(p_product_name varchar, p_quantity int)				
	language plpgsql
	as $$
	declare 
		v_product_code varchar(20);
		v_price float;
		v_cnt int;
	begin
		select count(1)						--to check for the given required data is sfficient amount is avilable or not
		into v_cnt							--count(1) or count(*) are same it returns same
		from Products1						
		where Product_name = p_product_name
		and Quantity_remaining >= p_quantity;		--returns 1 by count(1) in v_cnt if these is valid

		IF v_cnt > 0 then								--for procedure use if condition for normal sql use case statement
			select Product_code,price					--
			into v_product_code,v_price
			FROM Products1
			WHERE product_name = p_product_name;		--input parameter

			INSERT INTO Sales1(order_date,product_code,quantity_ordered,sale_price) VALUES
							  (current_date,v_product_code,p_quantity, (v_price * p_quantity));

			UPDATE Products1
			SET Quantity_remaining = (Quantity_remaining - p_quantity),
				Quantity_sold = (Quantity_sold + p_quantity)
			WHERE Product_code	= v_product_code;

			raise notice 'Product Sold!';
		else
			raise notice 'Insufficient Quantity!';
		end if;
		$$

		--To call procedure in postgre sql
		 
		 CALL pr_buy_products1('ipod Air', 1)			--we had parameter for this procedure, so we need to pass parameter while calling procedure.

		 SELECT * FROM Products1;
		 SELECT * FROM Sales1


**/




--in ORACLE
/**	

	create or replace procedure pr_buy_products1(p_product_name varchar, p_quantity int)				
	as
		v_product_code varchar(20);
		v_price float;
		v_cnt int;
	begin
		select count(1)						--to check for the given required data is sufficient amount is avilable or not
		into v_cnt							--count(1) or count(*) are same it returns same
		from Products1						
		where Product_name = p_product_name
		and Quantity_remaining >= p_quantity;		--returns 1 by count(1) in v_cnt if these is valid

		IF v_cnt > 0 then								--for procedure use if condition for normal sql use case statement
			select Product_code,price					--
			into v_product_code,v_price
			FROM Products1
			WHERE product_name = p_product_name;		--input parameter

			INSERT INTO Sales1(order_date,product_code,quantity_ordered,sale_price) VALUES
							  (current_date,v_product_code,p_quantity, (v_price * p_quantity));

			UPDATE Products1
			SET Quantity_remaining = (Quantity_remaining - p_quantity),
				Quantity_sold = (Quantity_sold + p_quantity)
			WHERE Product_code	= v_product_code;

			dbms_output.put_line('Product Sold!');
		else
			dbms_output.put_line('Insufficient Quantity!');
		end if;
	end;

		--To call procedure in ORACLE sql
		 
		 SELECT * FROM Products1;
		 SELECT * FROM Sales1;
		
		CALL pr_buy_products1('iphone 13 pro max', 2)			--we had parameter for this procedure, so we need to pass parameter while calling procedure.

		 SELECT * FROM Products1;
		 SELECT * FROM Sales1;


**/

--in MYSQL workbench
/**	

	
	DELIMETER $$
	DROP procedure if exists pr_buy_products;
	
	create or replace procedure pr_buy_products1(p_product_name varchar(50), p_quantity int)						--need to specify size for varcahr	
	Begin
		Declare v_product_code		varchar(20);
		Declare	v_price				float;
		Declare v_cnt				int;

		select count(1)						--to check for the given required data is sufficient amount is avilable or not
		into v_cnt							--count(1) or count(*) are same it returns same
		from Products1						
		where Product_name = p_product_name
		and Quantity_remaining >= p_quantity;		--returns 1 by count(1) in v_cnt if these is valid

		IF v_cnt > 0 then								--for procedure use if condition for normal sql use case statement
			select Product_code,price					--
			into v_product_code,v_price
			FROM Products1
			WHERE product_name = p_product_name;		--input parameter

			INSERT INTO Sales1(order_date,product_code,quantity_ordered,sale_price) VALUES
							  (cast(now() as date),v_product_code,p_quantity, (v_price * p_quantity));

			UPDATE Products1
			SET Quantity_remaining = (Quantity_remaining - p_quantity),
				Quantity_sold = (Quantity_sold + p_quantity)
			WHERE Product_code	= v_product_code;

			SELECT 'Product Sold!';
		else
			SELECT 'Insufficient Quantity!';
		end if;
	
	end$$

		--To call procedure in MYsql
		 
		 SELECT * FROM Products1;
		 SELECT * FROM Sales1;
		
		CALL pr_buy_products1('ipod Air', 8)			--we had parameter for this procedure, so we need to pass parameter while calling procedure.

		 SELECT * FROM Products1;
		 SELECT * FROM Sales1;


**/



--MS SQL Server

CREATE OR ALTER PROCEDURE pr_buy_products1(@p_product_name varchar(max), @p_quantity int)
AS
	DECLARE @v_product_code varchar(20),
			@v_price int,
			@v_cnt int;

BEGIN
	SELECT @v_cnt = COUNT(1)
	FROM Products1
	WHERE Product_name = @p_product_name
	AND Quantity_remaining >= @p_quantity;

	IF @v_cnt > 0											--in MS sql server, after IF, BEGIN ....END comes.......if more statements are present inside if conditions then put in begin and end
		BEGIN
			SELECT @v_product_code=Product_code, @v_price=price
			FROM Products1
			WHERE Product_name = @p_product_name;

			INSERT INTO Sales1(order_date,product_code,quantity_ordered,sale_price) VALUES
						(cast(GETDATE() AS date),@v_product_code,@p_quantity,(@v_price * @p_quantity));

			UPDATE Products1
			SET Quantity_remaining = (Quantity_remaining - @p_quantity),
				Quantity_sold	=	(Quantity_sold + @p_quantity)
			WHERE Product_code = @v_product_code;

			PRINT('Product Sold!');
		END
		ELSE
			PRINT('Insufficient Quantity!');				--in ms sql sever, for Else also Begin....End comes if more statements are present in Else 
															--only single statement is present so not necessary of begin...end in else.
END;

	--calling or executing Procedure in MS SQL Server.

	SELECT * FROM Products1;
	SELECT * FROM Sales1;

	EXEC pr_buy_products1 'Airpods Pro',5;		--no () for ms sql while calling procedure with parameter passing

	SELECT * FROM Products1;
	SELECT * FROM Sales1;
