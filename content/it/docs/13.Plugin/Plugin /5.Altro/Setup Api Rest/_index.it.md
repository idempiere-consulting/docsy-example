---
title: "Setup Api Rest"
date: 2020-04-24T22:47:10+02:00
draft: false
weight : 732
pre: "<b>732. </b>"
---


## Prerequisiti:

- Possedere un account iDempiere Consulting
- Connessione ad Internet
- Conoscere l'IP del server

## File necessari all'installazione

Per prima cosa dobbiamo scaricare questo <a href="ViewREST.dump" download>File<a> che contiene tutte le viste necessarie per far funzionare il nostro progetto.


Successivamente avremo bisogno di procurarci questi quattro 2pack che sono <a href="2Pack_System_patchMobile.zip"> la patch per le tabelle</a>, <a href="2pack_viewMobile.zip">la dichiarazione delle viste</a> e <a
 href="1__2PACK_SYSTEM_WebService.zip">Web Store</a> da installare a livello System mentre <a href="2__2PACK_CLIENT_WebService.zip">le chiamate PUT, GET e POST</a> vanno installate a livello Client.
 
 
## Come importare le viste nella macchina

Per prima cosa entriamo nella cartella dove abbiamo scaricato i files, poi bisogna fare il tunnel sulla macchina semplicemente scrivendo "tu" e premere un po' di volte TAB, questo sarà quello che vedremo 

{{< figure src="tunnel.png" >}}


fatto il tunnel bisogna fare il PackIn di alcuni settaggi di colonne del DB mancanti e quindi fare il PackIn a livello <b>System</b> del file <b>Patch per le tabelle(2Pack_System_patchMobile.zip)</b>
{{< figure src="packin1.png" >}}
{{< figure src="packin2.png" >}}


fatto il PackIn eseguire questo comando per l'inserimento delle viste appena scaricate
```tmpl
    psql -d idempiere -U adempiere -h localhost -p 5433 -f ViewREST.dump
```
ed infine fare il PackIn del file della <b>Dichiarazione delle viste (2pack_viewMobile.zip)</b> sempre a livello <b>System</b>

## Installazione delle chiamate REST

Logghiamo a livello <b>System</b> su iDempiere e facciamo il PackIn del <b>WebStore (1__2PACK_SYSTEM_WebService.zip)</b>, successivamente logghiamo a livello <b>Client</b> per fare il PackIn delle <b>chiamate REST (2__2PACK_CLIENT_WebService.zip)</b>
