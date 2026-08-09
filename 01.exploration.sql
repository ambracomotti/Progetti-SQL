# numero di clienti unici presenti nella tabella
SELECT count(distinct orr.CustomerID ) as num_customers
FROM online_retail_raw orr 

# numero di prodotti venduti
SELECT count(distinct StockCode) as num_products
from online_retail_raw orr 

# singoli paesi in cui si è venduto + numeri di righe per paese
SELECT COUNT(*) as num_records, orr.Country 
FROM online_retail_raw orr 
GROUP BY orr.Country 
ORDER BY num_records DESC

# numero paesi in cui si è venduto :38
SELECT COUNT(distinct orr.Country ) 
FROM online_retail_raw orr 

# periodo di fatture analizzate: dicembre 2010-dicembre 2011
SELECT min(Invoicedate), MAX(InvoiceDate)
FROM online_retail_raw orr 

#check sui dati causa errore lettura del periodo
SELECT
    SUBSTRING(InvoiceDate, 4, 7) AS month,
    COUNT(*) AS num_records
FROM online_retail_raw
GROUP BY SUBSTRING(InvoiceDate, 4, 7)
ORDER BY month;

#query corretta per valutare periodo di analisi
SELECT
    MIN(STR_TO_DATE(InvoiceDate, '%d/%m/%Y %H:%i')) AS first_invoice,
    MAX(STR_TO_DATE(InvoiceDate, '%d/%m/%Y %H:%i')) AS last_invoice
FROM online_retail_raw;
 