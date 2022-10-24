--1 
select 
	EmployeeName,
	CustomerName,
	[TransactionDate] = convert(varchar, SalesTransactionDate, 107),
	TransactionCount = count(SalesTransactionID)
from Employee e
	join SalesTransactionHeader sth on e.EmployeeID = sth.EmployeeID
	join Customer c on sth.CustomerID = c.CustomerID
where EmployeeName like '% %' and EmployeeGender = 'Female'
group by EmployeeName, CustomerName, SalesTransactionDate


--2 
select
	IngredientName,
	IngredientPrice = 'Rp. ' + cast(IngredientPrice as varchar),
	TotalQuantity = concat(sum(QtyIngredient),' Item(s)'),
	SupplierName = upper(SupplierName)
from Ingredient i
	join PurchaseTransactionDetail ptd on i.IngredientPurchasedID = ptd.IngredientPurchasedID
	join PurchasetransactionHeader pth on ptd.PurchaseTransactionID = pth.PurchaseTransactionID
	join Supplier s on pth.SupplierID = s.SupplierID,
	(SELECT 
		PurchaseTransactionID, 
		SUM(QtyIngredient) AS qtyi,
		COUNT(PurchaseTransactionID) AS pti
	FROM PurchaseTransactionDetail
	GROUP BY PurchaseTransactionID) as subquery
where subquery.qtyi=subquery.pti and  subquery.qtyi<5 and subquery.pti>5
group by IngredientName,IngredientPrice,SupplierName


--3
select
	NoodleName,
	[NoodlePrice] = 'Rp. ' + cast(Price as varchar),
	TransactionCount =concat(count(std.SalesTransactionID), ' Transaction(s)'),
	TotalQuantity = concat(sum(QtyNoodlePurchased), ' Qty(s)'),
	TotalPrice = concat('Rp. ' , sum(QtyNoodlePurchased) * Price)
from Noodle n
	join SalesTransactionDetail std on n.NoodleID = std.NoodleID
	join SalesTransactionHeader sth on std.SalesTransactionID = sth.SalesTransactionID
where day(SalesTransactionDate) > 20 
group by  NoodleName,Price,std.SalesTransactionID
having count(std.SalesTransactionID) >= 5

--4
select
	IngredientName,
	IngredientPrice = 'Rp. ' + cast(IngredientPrice as varchar),
	PurchaseCount = concat(count(pth.PurchaseTransactionID), 'Qty(s)'),
	TotalPrice = concat('Rp. ', sum(QtyIngredient) * IngredientPrice)
from Ingredient i
	join PurchaseTransactionDetail ptd on i.IngredientPurchasedID = ptd.IngredientPurchasedID
	join PurchaseTransactionHeader pth on ptd.PurchaseTransactionID = ptd.PurchaseTransactionID
where datename(month,PurchaseTransactionDate) = 'November' and IngredientPrice between 20000 and 30000 
group by IngredientName, IngredientPrice,pth.PurchaseTransactionID,QtyIngredient
--5.
select 
NoodleID =replace( n.NoodleID , 'Noodle' , 'NO'),  
NoodleName,
NoodlePrice = 'Rp. ' + cast (n.Price as varchar) 
from Noodle n
join salestransactiondetail std on n.noodleID = std.noodleID
join salestransactionheader sth on std.salestransactionID=sth.salestransactionID,
(select Price = avg(Price) from Noodle)as avgPrice
Where n.Price > avgPrice.Price and datename( day, SalestransactionDate) LIKE 'Wednesday'


--6.
select 
	TransactionDate = convert (varchar,SalestransactionDate,107),
	EmployeeName
from
employee e
join salestransactionheader sth on e.employeeID=sth.employeeID
join salestransactiondetail std on sth.salestransactionID=std.salestransactionID,
(select 
	QtyNoodlePurchased = avg(QtyNoodlePurchased),
	[Trasanction Date] = CONVERT(VARCHAR, SalesTransactionDate, 107)
from salestransactiondetail std
join salestransactionheader sth on  std.SalesTransactionID=sth.SalesTransactionID
WHERE datediff(DAY,'2020-11-25', '2020-11-20') = -5
	GROUP BY SalesTransactionDate)as avgqty
where sth.SalesTransactionDate= avgqty.[Trasanction Date]


--7.
select
IngredientPurchasedID = replace (IngredientPurchasedID, 'Ingredient' , 'ID') ,
IngredientName,
IngredientPrice
from Ingredient i,
(
	SELECT
	[Ingredient Sum] = MIN(i.IngredientPrice),
	[Ingredient Avg] = AVG(i.IngredientPrice)
	FROM Ingredient i
	JOIN PurchaseTransactionDetail ptd ON ptd.IngredientPurchasedID = i.IngredientPurchasedID
	JOIN PurchaseTransactionHeader pth ON pth.PurchaseTransactionID = ptd.PurchaseTransactionID
	WHERE DATENAME(MONTH, PurchaseTransactionDate) = 'October' AND IngredientName LIKE ' % % '
) AS SubQuery
WHERE i.IngredientPrice < SubQuery.[Ingredient Avg] AND i.IngredientPrice > SubQuery.[Ingredient Sum]


--8
select 
	SalesTransactionDate = CONVERT(varchar,SalesTransactionDate,107),
	NoodleTypename,
	[Total Transaction] = concat(count(std.QtyNoodlePurchased),' transaction(s)')
from SalesTransactionDetail std
	join Noodle n on std.NoodleID = n.NoodleID
	join Noodletype nt on n.NoodleTypeID = nt.NoodleTypeID
	join SalesTransactionHeader sth on std.SalesTransactionID = sth.SalesTransactionID,
		(select[Total Transaction] = MAX(QtyNoodlePurchased )from SalesTransactionDetail)as TMT
		where std.QtyNoodlePurchased  > TMT.[Total Transaction]
		and DATENAME(weekday,SalesTransactionDate)in('Friday','Wednesday')
group by SalesTransactionDate,NoodleTypename


--9
CREATE VIEW CustomerRecord AS
SELECT 
	CustomerID = REPLACE(c.CustomerID,'CU','Customer '),
	CustomerName,
	[TransactionCount] = count(sth.SalesTransactionID),
	[QuantityBought] = count(std.QtyNoodlePurchased)

FROM Customer c
	JOIN SalesTransactionHeader sth on c.CustomerID = sth.CustomerID
	JOIN SalesTransactionDetail std on sth.SalesTransactionID = std.SalesTransactionID
where left(SUBSTRING(CustomerName,CHARINDEX(' ',CustomerName)+1,len(CustomerName)),1) = 'H'
	and QtyNoodlePurchased > 10
group by c.CustomerID,CustomerName

--10
create view NoodleRecord as
select 
	SalesTransactionDate =  CONVERT(varchar,SalesTransactionDate,107),
	NoodleName = lower(REPLACE(NoodleName,'noodle','Mian')),
	Price = 'Rp. ' + cast( (n.Price *0.2)as varchar),
	QtyNoodlePurchased = concat (count(sth.SalesTransactionID),' Qty(s)')
from SalesTransactionDetail std 
	join Noodle n on std.NoodleID=n.NoodleID
	join SalesTransactionHeader sth on std.SalesTransactionID = sth.SalesTransactionID
group by SalesTransactionDate,NoodleName,Price
having  count(std.SalesTransactionID) <5 
	and count(sth.SalesTransactionID)>10