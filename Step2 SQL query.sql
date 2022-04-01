-- step 2 : Write a query that directly answers a predetermined question from a business stakeholder
-- SQL languages used: SQL from MySQL
-- question:
-- What are the top 5 brands by receipts scanned for most recent month?
--(define the top 5 brands: Top 5 brands with the largest total sales
-- define the most recent month: starts from one month from today)

select b.name, sum(r.totalSpent) as totalSales 
from Receipts r left join Items i on r.receiptID = i.receiptID 
left join Brands b on i.barcode = b.barcode 
where r.dateScanned >= date_add(now(), INTERVAL -1 month) 
group by b.name 
order by totalSales desc 
limit 5;