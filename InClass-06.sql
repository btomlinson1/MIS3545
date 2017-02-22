use AdventureWorks2012;

/*Activity 1. Using the HumanResource.Employee table, provide a count of the number of employees by job title.  The query should consider only current employees (the CurrentFlag must equal 1).  */
SELECT Jobtitle,
	Count(BusinessEntityID) as Numbers
FROM HumanResources.Employee
WHERE CurrentFlag = 1
Group by jobtitle;



/*Activity 2. Modify the query you created in Activity 1 so that the output shows only those job titles for which there is more than 1 employee.  */
SELECT Jobtitle,
	Count(BusinessEntityID) as Number
FROM HumanResources.Employee
WHERE CurrentFlag = 1
Group by jobtitle
	Having Count(BusinessEntityID) > 1;




/*Activity 3. For each product, show its ProductID and Name (FROM the ProductionProduct table) and the location of its inventory (FROM the Product.Location table) and amount of inventory held at that location (FROM the Production.ProductInventory table).*/
Select p.ProductID, p.Name, t.Quantity, s.Name
FROM Production.Location as s
	 inner join Production.ProductInventory as t
ON t.locationID=s.locationID
	 inner join Production.Product as p
ON t.ProductID=p.ProductID;


/*Activity 4. Find the product model IDs that have no product associated with them.  
To do this, first do an outer join between the Production.Product table and the Production.ProductModel table in such a way that the ID FROM the ProductModel table always shows, even if there is no product associate with it.  
Then, add a WHERE clause to specify that the ProductID IS NULL 
*/
Select m.ProductModelID, p.ProductID, m.Name
From Production.ProductModel as m
	left outer join Production.Product as p
ON m.ProductModelID=p.ProductModelID
WHERE ProductID IS NULL
Order by ProductModelID



