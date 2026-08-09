#qual è il fatturato totale generato dalle vendite : 10,7 milioni di sterline nel periodo dic 2010- dic 2011
SELECT SUM(Quantity * UnitPrice) as total_revenue
FROM online_retail_clean
WHERE Quantity >= 0 AND UnitPrice >= 0

#qual è il fatturato generato da ciascun paese - UK, Paesi Bassi e Repubblica d'Irlanda nella top 3
SELECT DISTINCT Country, SUM(Quantity * UnitPrice) as total_revenue_per_country
FROM online_retail_clean
WHERE Quantity >= 0 AND UnitPrice >= 0
GROUP BY Country
ORDER BY total_revenue_per_country DESC

#10 prodotti che generano più fatturato
SELECT StockCode , Description, SUM(Quantity * UnitPrice) as total_revenue_per_code
FROM online_retail_clean
WHERE Quantity >= 0 AND UnitPrice >= 0
GROUP BY StockCode, Description 
ORDER BY total_revenue_per_code DESC
LIMIT 10

#10 clienti con più fatturato
SELECT CustomerID, SUM(Quantity * UnitPrice) as total_revenue_per_customer
FROM online_retail_clean
WHERE Quantity >= 0 AND UnitPrice >= 0 AND CustomerId IS NOT NULL
GROUP BY CustomerID 
ORDER BY total_revenue_per_customer DESC
LIMIT 10

#come varia fatturato nel tempo, mese per mese - autunno 2011 trimestre in crescita mese per mese, dic 2011 il mese peggiore
SELECT MONTH(InvoiceDate) AS Month, YEAR(InvoiceDate) as Year, SUM(Quantity * UnitPrice) as total_revenue_per_month
FROM online_retail_clean orc 
GROUP BY Year, Month



