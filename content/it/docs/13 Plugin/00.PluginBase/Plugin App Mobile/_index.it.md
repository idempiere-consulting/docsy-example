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

## Come fare una chiamata all'Api rest

Per fare una chiamata Api rest da un'applicazione Angular bisogna importare il modulo HttpClientModule in app.module.ts e fare una chiamata (GET, POST, PUT)  alla maschera Sicurezza Web Service

{{< figure src="apiRest1.png" >}}

<b>in tutte le tabelle l'id principale sarà sempre ritornado come "id"</b>

Chiave di ricerca e Nome dovranno sempre essere uguali tra di loro, e verranno utilizzare per fare le richieste all'Api rest in questo modo:

### Chiamata GET (richiesta dati)

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

### Chiamata POST (inserimento nuovo dato)

{{< figure src="ChiamataPost.png" >}}

In questo caso il nome postOpp della maschera è stato utilizzato nella chiamata POST all'Api rest.</br>
Nel Campo tabella dovremo inserire il nome della maschera nel quale andremo a scrivere i dati, in questo caso è C_Opportunity

{{< figure src="SicurezzaPost.png" >}}

Successivamente nei campi di input andremo ad impostare tutti campi che vogliamo andare a scrivere per la nostra POST
{{< figure src="ParametriPost.png" >}}

### Chiamata PUT (modifica di un dato già esistente)

Questo è un esempio di chiamata PUT utilizzata per modificare un elemento già esistente nel DB:

{{< figure src="ChiamataPUT.png" >}}

Come le altre due chiamate la chiamata PUT andrà ad utilizzare il nome specificato nell maschera per fare la chiamata

{{< figure src="SicurezzaPUT.png" >}}

In questo caso la chiamata avrà bisogna di avere dei parametri di input, nel caso della chiamata PUT il JSON dovrà avere al primo posto l'id dell'elemento che andremo a modificare.

{{< figure src="ParametriPUT.png" >}}

# Applicazione Mobile

Appena lanciata l'APP si presenterà così:

{{< figure src="loginpage.png" >}}

Premendo l'ingranaggio in passo a destra avremo un input dove impostare l'IP del server

{{< figure src="loginpage2.png" >}}

Effettuato il Login ci troveremo davanti il menù

{{< figure src="menuprincipale.png" >}}

# CRM

{{< figure src="crm1.png" >}}
{{< figure src="crm2.png" >}}
{{< figure src="dettaglioLead1.png" >}}
{{< figure src="dettaglioLead2.png" >}}

## To Do Mobile APP

- Completare gestione passoword criptata [Prio:Media]
- icona appe e icone interne  [ Prio:BASSA]
- Mettere sottomenu con i tasti come magazzino per tutti menu [Prio:Bassa]



### Produzione : 



### Magazzino : 
- Inventario  : 
- Consumi 
- Trasferimenti
- Entrata Merce 
