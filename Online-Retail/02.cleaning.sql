#creo tabella con dati puliti
CREATE TABLE online_retail_clean (
InvoiceNo VARCHAR(128),
Stock_Code VARCHAR(128),
Description VARCHAR (128),
Quantity INT,
Invoice_Date DATETIME,
Unit_Price DECIMAL (10, 2),
Customer_ID INT,)
Country VARCHAR(128)
);

#seleziono tutta la tabella raw convertendo i formati di mio interesse
SELECT 
    InvoiceNo, 
    StockCode, 
    Description, 
    Quantity, 
    STR_TO_DATE(InvoiceDate, '%d/%m/%Y %H:%i') AS InvoiceDate, 
    CAST(REPLACE(UnitPrice, ',', '.') AS DECIMAL(10,2)) AS UnitPrice, 
    CustomerID, 
    Country
FROM online_retail_raw;

#
SELECT
    UnitPrice,
    REPLACE(UnitPrice, ',', '.') AS replaced_price,
    CAST(REPLACE(UnitPrice, ',', '.') AS DECIMAL(10,2)) AS decimal_price
FROM online_retail_raw
LIMIT 10;


DROP TABLE online_retail_clean 

#creo tabella con dati puliti - prima c'era un errore
CREATE TABLE online_retail_clean (
InvoiceNo VARCHAR(128),
StockCode VARCHAR(128),
Description VARCHAR (128),
Quantity INT,
InvoiceDate DATETIME,
Unitrice DECIMAL (10, 2),
CustomerID INT,
Country VARCHAR(128)
);

#inserisco i dati nella tabella clean
INSERT INTO online_retail_clean (
    InvoiceNo,
    StockCode,
    Description,
    Quantity,
    InvoiceDate,
    UnitPrice,
    CustomerID,
    Country
)
SELECT
    InvoiceNo,
    StockCode,
    Description,
    Quantity,
    STR_TO_DATE(InvoiceDate, '%d/%m/%Y %H:%i') AS InvoiceDate,
    CAST(REPLACE(UnitPrice, ',', '.') AS DECIMAL(10,2)) AS UnitPrice,
    CustomerID,
    Country
FROM online_retail_raw;

#check sulla nuova tabella, controlliamo che ci siano tutte le righe
SELECT count(*) as raw_rows
FROM online_retail_clean orc 

#riflessione sui missing values
SELECT COUNT(InvoiceNo), COUNT(StockCode), COUNT(Description), COUNT(Quantity), COUNT(InvoiceDate), COUNT(UnitPrice), COUNT(CustomerID), COUNT(Country)
FROM online_retail_clean orc 

#ci sono circa 135 mila righe senza idcustomer, non cancello perchè rappresentano ordini, magari da persone che non hanno una tessera fedeltà
SELECT COUNT(*) - COUNT(CustomerID) as missing_clients
FROM online_retail_clean orc 

#ci sono circa 2520 righe con prezzi negativi o pari a zero, non cancello perchè potrebbero essere rettifiche
SELECT COUNT(*) AS zero_or_negative_prices
FROM online_retail_clean
WHERE UnitPrice <= 0;

#ci sono circa 10000 righe con quantità negative o pari a zero, non cancello perchè potrebbero essere resi
SELECT COUNT(*) AS negative_quantity_rows
FROM online_retail_clean
WHERE Quantity < 0;

#cerco di capire cosa sono i prodotti con prezzo negativo, la maggior parte sono prodotti distrutti/danneggiati/buttati
SELECT
    Description,
    COUNT(*) AS num_rows
FROM online_retail_clean
WHERE UnitPrice <= 0
GROUP BY Description
ORDER BY num_rows DESC
LIMIT 20;
