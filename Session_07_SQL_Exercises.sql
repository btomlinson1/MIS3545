USE AdventureWorks2012; /*Set current database*/


/*1, Display the total amount collected from the orders for each order date. */
Select Sum(TotalDue) as SumDue, OrderDate, count(SalesOrderID) as DailyNumber
From Sales.SalesOrderHeader
Group by OrderDate
Order by OrderDate



/*2, Display the total amount collected from selling the products, 774 and 777. */
Select ProductID, SUM(LineTotal) as TotalCollected, Avg(UnitPrice) as AvgUP
From Sales.SalesOrderDetail
Where ProductID like 774 or ProductID like 777
Group by ProductID
Order By ProductID asc




/*3, Write a query to display the sales person BusinessEntityID, last name and first name of all the sales persons and the name of the territory to which they belong.*/
Select sp.BusinessEntityID, p.FirstName, p.LastName, t.Name
From Sales.SalesPerson as sp
	join Person.Person as p
On p.BusinessEntityID=sp.BusinessEntityID
	Join Sales.SalesTerritory as t
ON sp.TerritoryID=t.TerritoryID



/*4,  Write a query to display the Business Entities of the customers that have the 'Vista' credit card.*/
/* Tables: Sales.CreditCard, Sales.PersonCreditCard, Person.Person*/
Select p.BusinessEntityID
From Sales.CreditCard as cc
	join Sales.PersonCreditCard as pcc
On pcc.CreditCardID=cc.CreditCardID
	join person.person as p
On pcc.BusinessEntityID=p.BusinessEntityID
Where CardType like 'Vista'
Order by p.BusinessEntityID


/*Show the number of customers for each type of credit cards*/
Select cc.CardType, count(p.BusinessEntityID) as NumberOfUsers
From Sales.CreditCard as cc
	join Sales.PersonCreditCard as pcc
On pcc.CreditCardID=cc.CreditCardID
	join person.person as p
On pcc.BusinessEntityID=p.BusinessEntityID
Group by CardType



/*5, Write a query to display ALL the country region codes along with their corresponding territory IDs*/
/* tables: Sales.SalesTerritory*/
Select r.CountryRegionCode, r.name, t.TerritoryID
From person.CountryRegion as r
	left outer join sales.SalesTerritory as t
ON r.CountryRegionCode=t.CountryRegionCode
Where TerritoryID is NULL
order by CountryRegionCode


/*6, Find out the average of the total dues of all the orders.*/
Select Avg(TotalDue) as AverageDue
From Sales.SalesOrderHeader



/*7, Write a query to report the sales order ID of those orders where the total due is greater than the average of the total dues of all the orders*/
Select SalesOrderID, TotalDue
From Sales.SalesOrderHeader
Where TotalDue > (
	Select Avg(TotalDue) as AverageDue
	From Sales.SalesOrderHeader)
Order By SalesOrderID



