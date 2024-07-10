/*1. Customers from African region that placed sales greater than 5000*/
Select orders.Customer_Name 
from orders
Where orders.Sales > 5000 And orders.Region = 'Africa';

/*2. Number of Orders that have a Discount* greater than 0 and less than 0.5*/
Select count(orders.Order_ID) as Orders
from orders
Where orders.Discount > 0 And orders.Discount < 0.5;

/*3. Orders for "African Markets" that made over 50000 in sales*/
Select *
from orders
Where orders.Sales > 50000 And orders.Market = 'Africa';


/*4. Orders with a "Ship Date" in the Year 2013*/
Select * 
from orders
Where Year(orders.Ship_Date) = 2013;


/*5. Orders with a "Product Name" ending with 'System'*/
Select * 
from orders
Where orders.Product_Name Like '%System';


/*6. Number of Orders that have a "Discount" not equal to 0*/
Select count(orders.Order_ID) as Orders
from orders
Where orders.Discount <>0;


/*7. Orders from "United States" or "Australia"*/
Select *
from orders
Where orders.Country = 'United States' Or orders.Country = 'Australia';


/*8. Orders with a "Product Name" containing 'Phone'*/
Select * 
from orders
Where orders.Product_Name Like '%Phone%';


/*9. Number of Orders made in China, Mexico, Brazil and Germany all together*/
Select count(orders.Order_ID) as Orders
from orders
Where orders.Country = 'China' Or orders.Country = 'Mexico' Or orders.Country = 'Brazil' Or orders.Country = 'Germany';


/*10. Number of Orders not made from the United States*/
Select count(orders.Order_ID) as Orders
from orders
Where orders.Country <> 'United States';


/*11. Orders ID and Profit for orders with 'Ship Mode' staring with 'First' and having a loss*/
Select orders.Order_ID, orders.Profit
from orders
Where orders.Ship_Mode Like 'First%' And orders.Profit < 0;


/*12. Number of customers from EMEA region with sales over 5000 without any discount*/
Select count(Distinct orders.Customer_ID) as Customers
from orders
Where orders.Region = 'EMEA' And orders.Sales > 5000 And orders.Discount = 0;


/*13. Customers from United States with Jim in their name and placed sales over 2500*/
Select orders.Customer_Name
from orders
Where orders.Country = 'United States' And orders.Customer_Name Like '%Jim%' And orders.Sales > 2500;


/*14. Orders with a "Ship Mode" like 'Same%' and 'Profit' between 500 and 1000*/
Select *
from orders
Where orders.Ship_Mode Like 'Same%' And orders.Profit >= 500 And orders.Profit <= 1000;


/*15. Number of High Order priority in the US Market with profit between 500 and 1000*/
Select count(orders.Order_Priority) as "High Order Priority"
from orders
Where orders.Market = 'US' And orders.Profit >= 500 And orders.Profit <= 1000;