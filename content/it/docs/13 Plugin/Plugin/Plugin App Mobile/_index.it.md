---
title: "Plugin App Mobile"
date: 2020-04-24T22:47:10+02:00
draft: false
weight : 732
pre: "<b>732. </b>"
---


## Prerequisiti:

- Possedere un account iDempiere Consulting
- Connessione ad Internet
- Conoscere l'IP del server


## Istruzione e Mobile

Appena lanciata l'APP si presenterà così:

{{< figure src="loginpage.png" >}}

Premendo l'ingranaggio in passo a destra avremo un input dove impostare l'IP del server

{{< figure src="loginpage2.png" >}}

Effettuato il Login ci troveremo davanti il menù

{{< figure src="menuprincipale.png" >}}


> TODO - Completare gestione password criptata [Prio:Media]

> TODO - icona app e icone interne  [ Prio:BASSA]

> TODO - Mettere sottomenu con i tasti come magazzino per tutti menu [Prio:Bassa]

> TODO - Fare 2Pack  -viste + API REST (Andrea Bellotto)

> TODO - Gestione Allegati in upload (Foto, PDF ) (Da vedere insieme)

> TODO - Generazione Report PDF (Da vedere insieme)

> TODO - Gestione NFC (Da vedere insieme)

> TODO - Stampa Diretta (Da vedere insieme)


## SOTTOMENU - CRM

{{< figure src="crm1.png" >}}
{{< figure src="crm2.png" >}}
{{< figure src="dettaglioLead1.png" >}}
{{< figure src="dettaglioLead2.png" >}}

> TODO crm
- modificare view add search
- filter per agente 
- vedere solo i propri lead ?


## SOTTOMENU - SERVICE
1.
2.
3.
4.

## SOTTOMENU - CONTABILITA'

> todo - fare voci sottomenu

1. Fatture di Acquisto 
2. Fatture di Vendita 
3. Pagamenti e Incassi 


>TODO - Fatture di Acquisto 
-  creare view - add campo search per filtro
-  impostare filtro
-  creare view dettalio (lit_mobile_c_invoiceline_v)
>TODO - Fatture di Vendita 
- stessa view fattura acquisto
- impostare filtro 
- stessa view fatt.acquisto line

> TODO - Pagamenti / Incassi

- creare view (lit_mobile_c_payment_v)
- impostare filtro

> TODO - (Riportare : Contatti Clienti)


## SOTTOMENU - VENDITE
> todo - fare voci sottomenu
0. Contatti Clienti
1. Clienti
2. Ordini di Vendita
3. Spedizioni
4. Fatture di Vendita 

> TODO - (Riportare : Contatti Clienti)

> TODO - Ordini di Vendita   (tutti con due tab tipo lead ?) 
- add Importo e Descrizione
- modificare vistra per filtro 
- add filtro 
- order by ?? da vedere insieme

## SOTTOMENU - ACQUISTI
> TODO - (Riportare : Contatti Clienti)
- add Importo e Descrizione

## SOTTOMENU - MAGAZZINO
>TODO - fare voci sottomenu
1.Info Product
2.Inventario
3.Consumo
4.Traferimento
5.Entrata Merci

>TODO Info Product 
- focus su prodotto
- estendere campi di dettaglioLead
- modificare vista per filtro (Marco)
- add filtro



## SOTTOMENU - PRODUZIONE
> TODO Fare SottoMenu 
1.Elenco Ord.di Produzione [incorso/bozza/finiti]
2.Ord.di Produzione
3.ElencoAvanz.Produzione / 
> TODO Ord.di Produzione
- Focus su orddiproduzione
- rename prodotto in ord.diproduzione
- modificare vista togliere bozza
- x cancella input dati
- Conferma dei Processi (?) (Parametro ?) 




## TASK
> TOTO Fare SottoMenu
1. Task dettaglio
2. Crea Task
3. Riepilogo Giorno

> TODO TASK
- rename in task 
- Aggiungere Business Partner
- modifica vista add search
- add filter
- add completa e duplica
- Crea TASK : Risora (IO) Filtro BUsiness PArtner - show TASK + crea dettaglio 



## To Do Mobile APP


### Contabilità

> Fare Sotto Menu : 
> Add Search alle viste [Marco]

####1) Fattura di Acquisto
> Ricerca per Search
- Fattura di Vendita
- Pagamento Incassi
- (copy from CRM) Contatti Business Partner
- (copy fro CRM) Clienti e Fornitori

### Service
- workorder


### Produzione : 
### Magazzino : 
- Inventario  : 
- Consumi 
- Trasferimenti
- Entrata Merce 



## Documentazione Tecnica

### Elenco viste
-lit_mobile_lead_v
> TODO  fare elenco viste

### Come fare una chiamata all'Api rest

Per fare una chiamata Api rest da un'applicazione Angular bisogna importare il modulo HttpClientModule in app.module.ts e fare una chiamata (GET, POST, PUT)  alla maschera Sicurezza Web Service

{{< figure src="apiRest1.png" >}}

<b>in tutte le tabelle l'id principale sarà sempre ritornado come "id"</b>

Chiave di ricerca e Nome dovranno sempre essere uguali tra di loro, e verranno utilizzare per fare le richieste all'Api rest in questo modo:

#### Chiamata GET (richiesta dati)

{{< figure src="ChiamataApi.jpg" >}}
in questo caso il nome getLead della maschera è stato utilizzato nella chiamata Api rest.</br>
Nella maschera dovremo settare dei parametri:

{{< figure src="Parametri.png" >}}

il Parametro Web Service andremo ad impostare i filtri in questo modo:

{{< figure src="filtro.png" >}}

Valore Costante viene deciso da noi, per Web Service Field input andiamo ad inserire i valori di input della maschera, un questo caso essendo una chiamata GET gli input possono essere 0 o più:

{{< figure src="ricercaID.png" >}}

quando andiamo a fare la chiamata GET in questa maschera bisogna passare i valori tremite URL e quindi la chiamata in questo caso sarà 
IpDelServer/services/api/idempierepare/web/search/getLead_idCheVogliamoPassare.

Per i field di Output invece andremo a inserire tutti i parametri che necessitiamo per il nostro frontEND

{{< figure src="campiOutput.png" >}}

#### Chiamata POST (inserimento nuovo dato)

{{< figure src="ChiamataPost.png" >}}

In questo caso il nome postOpp della maschera è stato utilizzato nella chiamata POST all'Api rest.</br>
Nel Campo tabella dovremo inserire il nome della maschera nel quale andremo a scrivere i dati, in questo caso è C_Opportunity

{{< figure src="SicurezzaPost.png" >}}

Successivamente nei campi di input andremo ad impostare tutti campi che vogliamo andare a scrivere per la nostra POST
{{< figure src="ParametriPost.png" >}}

#### Chiamata PUT (modifica di un dato già esistente)

Questo è un esempio di chiamata PUT utilizzata per modificare un elemento già esistente nel DB:

{{< figure src="ChiamataPUT.png" >}}

Come le altre due chiamate la chiamata PUT andrà ad utilizzare il nome specificato nell maschera per fare la chiamata

{{< figure src="SicurezzaPUT.png" >}}

In questo caso la chiamata avrà bisogna di avere dei parametri di input, nel caso della chiamata PUT il JSON dovrà avere al primo posto l'id dell'elemento che andremo a modificare.

{{< figure src="ParametriPUT.png" >}}


