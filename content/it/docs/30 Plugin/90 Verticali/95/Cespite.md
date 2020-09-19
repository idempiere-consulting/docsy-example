---
title: "Cespite"
date: 2020-04-24T22:47:10+02:00
draft: false
weight : 
pre: "<b></b>"
---

## Indice
###  1. [Fine della gestione](#Fine della gestione)

###  2. [Setup di base](#Setup di base)

###  3. [Processo](#Processo)

4.[]




### Fine della gestione


 1.1 Scopo di gestire un cespite (bene ammortizzabile) è quello di avere la possibilità       bilità di gestire detto bene imputando il suo costo di acquisto ed eventuali oneri accessori che faranno parte del valore storico del bene, ivi compresi valori che possono essere finanziari (ad es. interessi per acquisto) non come costo di esercizio bensì registrandone il suo acquisto fra le immobilizzazioni patrimoniali e di rilevare, come civilmente indicato il relativo costo (ammortamento) per  periodi relativi. E’ quindi necessario avere la possibilità di avere un registro cespiti che stampato ogni esercizio contabile indicherà:

1. valore storico

2. ammortamento del periodo

3. fondo ammortamento (somma degli ammortamenti degli anni preceduti)

4. eventuali ammortamenti fiscalmente differenti dai civili e loro fondo ammortament


1.2 Le registrazioni da effettuare per la gestione del cespite sono le seguenti:

​     a)  al momento dell’acquisto:

​          conto patrimoniale   (dare)                                      conto patrimoniale  (avere)

immobilizzazione materiale o immat.                   debiti verso fornitori

​     b)  alla fine esercizio contabile (fine anno):

​          conto economico    (dare)                                      conto patrimoniale  (avere)

​          ammortamento bene                                             fondo ammortamento bene

​     c)  eventuali vendite bene con rilevazione o di plusvalenza o di minusvalenza rilevata da valore di vendita meno valore residuo del cespite (valore storico - fondo ammortamento)

​     d) altre casistiche tipo rivalutazioni del bene (derivante da legge dello stato) per cui si adeguerà il valore del bene in base ad. un coefficiente rivalutativo).

### Setup di base

### Processo

#### Azione n° 1 : La prima operazione da eseguire è inserire un ordine di acquisto per il Cespite che si intende acquisire.

![](/opt/md/images/ODA Cespite.png)

#### Azione n° 2 : si genera l'entrata merce come per un qualsiasi materiale da elaborazione processo con Crea Entrata Merci da elabora processo

![](/opt/md/images/Crea entrata merce da ODA.png)

Azione n° 3 : creo l' entrata merce

![](/opt/md/images/Processo entrata merce.png)

mi si genera anche la registrazione contabile di entrata a magazzino

![](/opt/md/images/Registrazione contabile enrata magazzino.png)

Azione n° 4 : Genero fattura sempre da processo

![](/opt/md/images/Generazione fattura acquisto cespite.png)

Azione n° 5 : assegno a capitale il cespite da creare aprendo a pagina la riga fattura (troverò assegna a capitale fleggato e completerò i campi necessari)

![](/opt/md/images/Selezione_075.png)

Completo la registrazione fattura e avro la registrazione a contabilità relativa

![](/opt/md/images/Registrazione contabile fattura acquisizione cespite.png)

Quindi se interrogo tutti i moviemnti contabili del giorno vedo i movimenti di magazzino stornati e i rimanenti movimenti contabili da fattura.















Acquisizione del cespite con Idempiere.

​     2.1 La prima operazione necessaria è l’inquadramento del gruppo cespite da cui dipenderanno le varie registrazioni contabili del cespite.

​     2.2 da secondo si andranno a delineare e inserire delle categorie prodotto per gestire “i passaggi” contabili del cespite. 

​     2.3 Si genera un ordine di acquisto del bene cespite che si andrà ad acquisire. 

​     2.4 Si andrà a generare un’entrata materiali utilizzando il prodotto cespite  e richiamando  l’ordine precedentemente inserito. Con questa registrazione si andrà a generare anche un “Cespite” a livello anagrafico.  

​     2.5 Seguentemente andiamo a registrare la fattura andando a richiamare l’entrata merci precedentemente effettuata. A seguito di tale operazione verrà effettuata l’aggiunta cespite andando a verificare ed aggiornare i valori da menù che ci interessano.





|         |                                                              |      |      |      |             |      |      |      |
| ------- | ------------------------------------------------------------ | ---- | ---- | ---- | ----------- | ---- | ---- | ---- |
| esempio |                                                              |      |      |      |             |      |      |      |
|         | vendo un cespite a euro 300 del vaolre storico di euro 100 ed  ammortizzato per 70 |      |      |      |             |      |      |      |
|         |                                                              |      |      |      |             |      |      |      |
| avremo: |                                                              |      |      |      |             |      |      |      |
|         | storno cespite per 100 in avere (il valore storico è in dare) |      |      |      |             |      |      |      |
|         | storno del fondo ammortamento per 70 (il valore è in avere)  |      |      |      |             |      |      |      |
|         | la plusvalenza sarà quindi la differenza tra valore di vendita e il residuo da ammortizzare (30 che è il valore contabile) quindi 270 |      |      |      |             |      |      |      |
|         |                                                              |      |      |      |             |      |      |      |
|         | NB: NATURALMENTE NON SI CONSIDERA L' IVA                     |      |      |      |             |      |      |      |
|         |                                                              |      |      |      |             |      |      |      |
|         |                                                              |      |      |      |             |      |      |      |
|         |                                                              |      |      |      |             |      |      |      |
|         | fondo ammortamento                                           |      |      |      | cespite     |      |      |      |
|         | dare                                                         | 70   |      |      | avere       | 100  |      |      |
|         |                                                              |      |      |      |             |      |      |      |
|         | cred.v.clienti                                               | 300  |      |      | plusvalenza | 270  |      |      |
|         |                                                              |      |      |      |             |      |      |      |
|         |                                                              | 370  |      |      |             | 370  |      |      |
|         |                                                              |      |      |      |             |      |      |      |
