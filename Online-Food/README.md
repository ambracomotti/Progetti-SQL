Online Food – SQL Data Analysis

Descrizione del progetto

Il progetto consiste nell'analisi di un database relazionale relativo a un servizio di food delivery, con l'obiettivo di applicare competenze di SQL alla gestione, pulizia e analisi dei dati e di rispondere a domande di business.
Il database è composto da diverse tabelle relative a clienti, ristoranti, ordini e prodotti.

Attività svolte

Il progetto segue un processo completo di gestione e analisi dei dati, dalla fase di importazione fino all'analisi dei principali KPI di business.

1. Importazione e strutturazione dei dati
- Importazione dei dataset CSV in MySQL.
- Creazione delle tabelle:
  - `customers_medium`
  - `restaurants`
  - `menu_items`
  - `orders_medium`
  - `order_items`
- Definizione dei principali tipi di dato.

2. Data Quality e modellazione

- Controllo della presenza di valori `NULL`.
- Controllo dei duplicati sulle chiavi identificative.
- Identificazione delle chiavi primarie e delle chiavi esterne.
- Definizione delle relazioni tra le tabelle.
- Verifica dell'integrità referenziale tramite `JOIN`.
- Identificazione delle relazioni 1:N e N:N.
- Utilizzo di `order_items` come tabella ponte tra ordini e prodotti.

3. Data Cleaning

- Creazione delle tabelle `customers_clean` e `orders_clean`.
- Conversione dei campi contenenti date da `VARCHAR` a `DATE`/`DATETIME`.
- Utilizzo di `STR_TO_DATE()` per la trasformazione delle date.
- Controllo dei valori anomali nelle variabili numeriche.
- Verifica dei valori relativi a prezzi e quantità.

4. Business Analysis

Sono state sviluppate query SQL per rispondere a diverse domande di business:

- Quali sono i 10 ristoranti con il maggior numero di ordini?
- Quali sono i 10 ristoranti con il maggior fatturato?
- Qual è il valore complessivo dei singoli ordini?
- Qual è il valore medio degli ordini per ristorante?
- Qual è la percentuale di ordini consegnati?
- Qual è la percentuale di ordini in ritardo?
- Qual è la percentuale di ordini cancellati?
- Gli status degli ordini risultano coerenti con il totale degli ordini?

Obiettivo

Il progetto è stato realizzato per consolidare competenze pratiche di SQL, data quality, data cleaning, modellazione relazionale e business analysis, simulando un flusso di lavoro tipico dell'analisi di dati aziendali.
