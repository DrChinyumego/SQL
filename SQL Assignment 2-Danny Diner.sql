Use Danny


/*1.	What is the total amount each customer spent at the restaurant?*/
SELECT sales.customer_id as "customer",sum(menu.price) as "total amt spent" from sales
inner join menu
on sales.product_id=menu.product_id
Group by sales.customer_id


/*2.	How many days has each customer visited the restaurant?*/
Select sales.customer_id as "Customer Name", count(sales.customer_id) as "No of Times Visited"
From sales
Group by sales.customer_id


/*3.	When was the last time a customer purchased from the restaurant?*/
Select sales.customer_id as "Customer ID", sales.order_date as "Last Date" from sales
Where sales.order_date = (select max(sales.order_date) from sales)


/*4.	What is the most purchased item on the menu and how many times was it purchased by all customers?*/
Select TOP 1 b.product_name, b.Purchases as "Number of Purchases"
from
(
Select t.product_name, max(Total) as Purchases
from
(
Select menu.product_name, count(sales.product_id) as Total 
from sales
	join menu on sales.product_id = menu.product_id
Group by menu.product_name
) t
Group by t.product_name
) b
Order by b.Purchases DESC


/*5.	What is the total items and amount spent for each member before they became a member?*/
Select sales.customer_id as "Customer ID", count(sales.product_id) as "Number of Items", sum(menu.price) as "Total Amount"
from sales
join menu on sales.product_id = menu.product_id
Group by sales.customer_id


/*6.	Return ALL the customers and their join date.*/
Select members.customer_id as Customer, members.join_date as "Join Date"
From members
Where members.join_date is not null


/*7.	Which customer made the least purchase?*/
Select TOP 1 t.customer_id as "Customer ID", Min(Total) as Amount
from
(
Select sales.customer_id, SUM(menu.price) as Total
From sales
	join menu on sales.product_id = menu.product_id
Group By sales.customer_id
) t
group by t.customer_id
Order by Amount ASC
