# Analisi SQL – Online Retail

Descrizione del progetto

Il progetto ha l'obiettivo di analizzare un dataset di transazioni relative a un'azienda di e-commerce attraverso SQL, utilizzando MySQL e DBeaver.
Segue un flusso completo di analisi dei dati:

- importazione e strutturazione dei dati;
- esplorazione iniziale del dataset;
- data cleaning e controllo della qualità dei dati;
- analisi delle vendite e dei clienti;
- individuazione di insight attraverso query SQL.

Il progetto è stato realizzato come esercitazione pratica per consolidare le competenze SQL e sviluppare maggiore autonomia nella gestione e nell'analisi di un dataset reale. 

Dataset

Il dataset Online Retail contiene informazioni sulle transazioni di un'azienda britannica di vendita al dettaglio online.
Ogni riga rappresenta una voce di prodotto associata a una fattura e contiene informazioni relative a:

- numero della fattura (`InvoiceNo`);
- codice prodotto (`StockCode`);
- descrizione del prodotto (`Description`);
- quantità acquistata (`Quantity`);
- data e ora della fattura (`InvoiceDate`);
- prezzo unitario (`UnitPrice`);
- identificativo del cliente (`CustomerID`);
- Paese (`Country`).

Il dataset contiene circa 542.000 record e copre transazioni effettuate tra dicembre 2010 e dicembre 2011.
Link ai dati utilizzati-> https://archive.ics.uci.edu/dataset/352/online%2Bretail?utm_source

Strumenti utilizzati

- MySQL
- DBeaver

Struttura del database
Il progetto utilizza due tabelle principali.
1. `online_retail_raw`: tabella contenente i dati originali importati dal file CSV, mantenuti nella loro struttura iniziale.

| Colonna | Tipo |
|---|---|
| InvoiceNo | VARCHAR(128) |
| StockCode | VARCHAR(128) |
| Description | VARCHAR(128) |
| Quantity | INT |
| InvoiceDate | VARCHAR(128) |
| UnitPrice | VARCHAR(128) |
| CustomerID | INT |
| Country | VARCHAR(128) |

2. `online_retail_clean`: tabella ottenuta dalla trasformazione dei dati presenti nella tabella raw.

| Colonna | Tipo |
|---|---|
| InvoiceNo | VARCHAR(128) |
| StockCode | VARCHAR(128) |
| Description | VARCHAR(128) |
| Quantity | INT |
| InvoiceDate | DATETIME |
| UnitPrice | DECIMAL(10,2) |
| CustomerID | INT |
| Country | VARCHAR(128) |

La tabella `online_retail_raw` viene mantenuta invariata, mentre le trasformazioni vengono applicate durante il caricamento dei dati nella tabella `online_retail_clean`.

Flusso dei dati
CSV originale
     ↓
online_retail_raw
     ↓
Data cleaning e trasformazione
     ↓
online_retail_clean
     ↓
Analisi SQL
