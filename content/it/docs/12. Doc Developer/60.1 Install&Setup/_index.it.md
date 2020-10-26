---
title: "Installazione e Setup"
date: 2020-04-24T22:47:10+02:00
draft: false
weight : 5
pre: "<b>60.1 </b>"
---

## Base
### 1. Installazione di Base 
- Loghi e Sfondi del Sistema  - Maschera Login		DA FARE			
- Setup dati Client /Gruppo		
- Setup Client > Posta SMTP		
- Setup dati Organizzazione  					
- Setup dati Schema Contabile 		
- Dati Dimensioni Contabili			
- Check Parametri Report Default	
- Sequenza Documenti (overview e check up alla fine (extra)				--	--
- Controllo Registri IVA 		OK	V128	https://vimeo.com/idempiere/setup-check-registrii-iva-sequenze	scVry6uMsd
- video registri-sequenze-avanzato		OK	V130	https://vimeo.com/idempiere/setup-registri-sequenze-avanzato	7vxX3Ywq4G	
- Integrazione con Ldap	

### Navigazione di Base
- Accesso,Menu, Preferiti,Ricerca Doc, Maschera, Barra Strumenti, Filtri ,Filtri Salvati
- Zoom tra le maschere,info window, special form, dashboard
- Report interni e Jasper Report invio email moduli e report
- Gestione Allegati
- Stao documento : bozza, in lavoro, completa, annulato , chiuso 

### Configurazione Avanzata
- Piano dei Conti custom cliente	
- Sicurezza elevate [ vpn/blocco mac-adddr]
- Gestione Ruoli avanzata 
- Alert
- Workflow
- Scheduler
- Window Customization
- Direct Print

## Importazione 
- Clienti `+ contatti + indirizzi di spedizione + banca`
- Fornitori  `+ contatti + indirizzi di spedizione + banca`
- Prodotti `unità di misura, categoria merceologica, categoria iva, tipo prodotto`
    - categoria prodotto
- Saldi Magazzino
- Partite Aperte 
- Ordini di Produzione (Aperti)
- Distinta Base
- Saldi Contabilità
- Piano dei Conti
- Listini di Vendita
- Listini di Acquisto
- Codici Intrasta
- Saldi Magazzino
- Movimenti Magazzino
- Movimenti Bancari
- Importazione Storico
- Ordini di Acquisto
- Ordini di Vendita
- Ordini di Produzione
- Fatture di Vendita
- Fatture di Acquisto
- Incassi
- Pagamenti
  
- Sincronizzazione
## Organizzazione  Avanzata
- Multischema Contbabile (Piano dei Conti)
- Multiorganizzazione
- Multivaluta
- Intercompany
- Dimensioni Contabili 

## Dati di Base
- Business Partner
    - gruppo business partner / Categoria Business Partner
    - partita iva e codice fiscale
    - natura giuridica
    - regola di fatturazione
    - regola di spedizione
    -termini di pagamento
- Prodotti 
    - Fornitore Preferenziale - Referenza
    - Approvigionamento 
    - Descrizioni in lingua
    - Descrizione Cliente-Fornitore 
    - UM Alernativa 
    - qty default / 6 pack 
    - costo del prodotto
    attributo non di istanza
    attributo di istanza `gestione taglia/colori`
    attributo di istanza `gestione lotti in acquisto e spedizione`  `automatico/fifo/lifo`
    attributo di istanza `gestione nr di serie in produzione`
    attributo di istanza `gestione lotti in produzione`  `automatico/fifo/lifo`
    - Addebiti e Codici di Servizio
- Banche 
- Piano dei Conti
- Agenti /Commerciali 
### Extra
- Prodotto Correlato  - KIT
- Prodotto Correlato - CONOE
- Prodotto Correlato - CONAI

## Gestione Costi
- Costo standard 
- Costo medio ponderato
- Costo ultimo acquisto

## Contabilità
- Logiche di Contabilizzazione [Prodotto/Categoria Prodotto/Charge/Schema Contabile /Business Partner /Gruppo Business Partner]
- Incasso 
- Pagamenti
- Sollecito Clienti
- Abbinamento Fattura
    - Abbinamento triangolato - 2 Business Partner(extra)
- Tassi di Cambio
- Gestione RIBA (Presentazione, Incasso, Insoluti)
- Gestione  SEPA
- Gestione Lettere d'intento
- Fattura con Split Payment
- Gestione Iva ( Periodi Iva, Aliquote, Registro, Liquidazione)
- Stampe Fiscali : Libro Giornale
- Prima Nota Contabile
- Gestione Ritenute passive ( Fattura di Acquisto)
- Report Bilancio Finanziario
- Stampa Bilancio
- Apertura e Chiusura
- Bolletta Doganale
## Gestione Finanziaria / Banche
- Importazione Movimenti Bancari

### Cespiti

## Vendite

- contratti di vendita
- Ordini di Vendita
    - Offerta di Vendita Standard
    - Gestione Ordine Prepagato 
    - Ordine di Vendita Magazzino
    - Ordine di Vendita Fattura Accompagnatoria
    - Ordine di Vendita con Fattura di Anticipo
    - Ordine di Vendita pagata
    - Ordine di Vendita Dropshipment
    - Ordine di Vendita Scontrino + Fattura scontrino
    - `Ordine di Vendita in valuta estera + Fattura`
    - `Ordine di Vendita con UM alternativa `
    -`Modifiche : Qty - Prezzi`
    -`data consegna a livello riga`
    - Ricalcola prezzi ODV FDV
        - Crea DDT 
        - Crea DDT e Fattura
- Gestione Spese di Trasporto
- Spedizione
    - Documento di Trasporto
    - info genera ddt da ordine
    - info genera ddt ordine riga
    - info genera ddt da ordine riga kit
    `Spedizione con conferma`
- Fatture di Vendita 
    - Genera Fattura Elettronica )
- Estensione Gestione Conto Deposito
- Reso Cliente RMA - Reso Cliente  - DDT REsto - ORdine di Vendita - Nota di Accredito 
- Agenti e Provvigioni finoa Fattura Agente
- Fattura di Vendita ( Italia ,UE , Extra UE )  ( Stampa e invio Fattura
### Vendite Avanzato
- Offerta di Vendita a Stato Avanzamento + DDT + Fatttura


## CRM
- Scheda Business Partner 
Appuntamenti
Lead
Opportunità di Vendita
Crm Plus (Plugin) + MailChimp + Reader Mail

## Approvigionamento / Acquisto
- Richiesta di Quotazione a Fornitore
- Richiesta di Acquisto Interna (crea oda da rda)
- Contratti di acquisto
- Ordini di Acquisto  (Crea ODV da ODA )
    - residuo ordine (chiudi ordine / sollecito )
    - ordini in valuta estera
- Entrata Merce
    - Crea Entrata Merci da Fattura
    . `Entrata merci con conferma`
    - `Controllo imputazione Conti Contabili`
    - `Gestione Anomalie : riapertura ` 
    - `extra consegna`
- Approvigionamento a scorta
- Approvigionamento a fabbisogno ( Politica Approvigionamento)

- Reso Fornitore (RMA 
- Nota di Accredito Fornitore
- Autofattura per Merce Omaggio senza Rivalsa
- Fattura di Acquisto ( ITA , UE(reverse charge ) , EXtra UE 
    - Crea Entrata Merci da Fattura
    - `Fattura con Errore Iva`
    `special editor variazione iva`
    - Nota di Variazione IVA Fornitore
    
    

## Listini Prezzi
- Listini di Acquisto / Prezzi Speciali Fornitore  /Scaglio  / Sconto 2 livelli
- Listini Aggiornamento automatico
- Listini Schema Sconto 
- Promotion Ciclo Vendita
- Promotion Ciclo Passivo
- Listino di Vendita (base
- Listini - Markup
- Listini Aggiornamento 
- Listini Sconto Cassa / Sconto di Testata

## Magazzino Logistica
- Gestione Lotti in acquisto
- Gestione Lotti in produzione 
- Gestione Ubicazione
- Definizione Magazzini, Aree di Stoccaggio
- Ordine di Trasferimento
- DDT di Trasfmerimento
- Ordini di distribuzione
- Inventario Fisico e Rettifiche

## Gestione Progetti


## Produzione
- Distinta Base
- Centri Lavoro
- Cicli di Lavoro
- Ordine di Produzione
- Conto lavoro Passivo ( Ordine di Conto Lavoro , Invio Materiale , Ricezione e Fattura )
- Ciclo di Lavoro
- Modifica MPS
- Creazione OP da Ord.Vendita
- Dichiarazione di finito
- Avanzamento
- Schedulatore
- Master Plan Schedule
- POS Production
- Collaudo
- Gestione rilascio DB Uff.Tecnico
- POP AVanzamnento Produzione

## Conto Lavoro Attivo
- Ordine di Conto Lavoro


## Punto di Vendita

- POS Ordine di acquisto /distribuzione
- POS Ordine di Vendita 

## Plugin
### NextCloud
### Configuratore di Prodotto
- Gestione MPS
- Gestione Configurazioni
- Ordine di Vendita e assegnazione a MPS
### Post Vendita
- Reso Cliente RMA - Reso Cliente  - DDT REsto - ORdine di Vendita - Nota di Accredito
  (Avanzmaneot Riparazione / MAteriali di Consumo )
   Gestione PArti di Ricambio
### Service
### 

## Estensioni
### Post it
### Telegram
### Kanban
### Util PDF 
### HR Gestione Risorse Umane / Corsi / Abilitazioni
### Rilevamento Ore
### ISO 90001 - NCF
- NC Fornitore
- NC Produzione
- Azione Correttiva
### Importazione Listini Fornitore
### Ticket ( Spiceworks)
### Caldav Cardav
### Geo iDEmpiere
### Attribute on all table
### Controllo di Gestione
### Codifica Assistita
### Timbro on Report



