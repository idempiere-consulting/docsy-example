---
title: "Addon PDF Modificabile [A.PDF.STD00]"
date: 2020-04-24T22:47:10+02:00
draft: false
weight : 80
pre: "<b>720. </b>"
---




## FUNZIONALITA' PLUGIN (Lato Cliente)

### Obiettivo

Ho un cliente interessato ad iDempiere:

- gli propino un modulo da compilare con i campi a me necessari

- lui lo compila e me lo rimanda in digitale (mail, telegram, wathsapp..)

- lo salvo in una apposita cartella del gestionale di iDempiere Consulting

- uno script python (via cron o manualmente) si preoccupa di leggere i campi compilati ed eseguire la INSERT o UPDATE con i dati forniti dal cliente

## FUNZIONALITA' PLUGIN (Lato Gestionale)

### Procedura
- identifico la tabella che voglio poter aggiornare via pdf

- creo un modulo editabile con tutti i campi che ritengo utili, senza esagerare, alcuni li potremo inserire in modo predefinito, per esempio i campi obbligatori di iDempiere dei quali il cliente non è tenuto a sapere alcunchè, vedremo più avanti come

- tassativo: compilo il campo "titolo" del PDF  con un nome a piacimento (spazi compresi)

- lo esporto come PDF 

- apro la maschera `PDFmodule` e ne compilo una nuova

- allego entrambi i documenti creati sopra a questa scheda

- compilo il campo `Name` con LA STESSA STRINGA  (case sensitive) che abbiamo usato per il titolo del PDF

- scelgo nel drop down `Tabella` quella che ho identificato al primo punto

- flag `Insert Record`

  * ATTIVO (checked):

    il modulo PDF serve per inserire un nuovo record nella anagrafica

  * DISATTIVO (unchecked)

    il modulo PDF serve per aggiornare un record ESISTENTE quindi dovrò indicare quale colonna userò come chiave per identificarlo usando il rispettivo campo nel modulo pdf, per fare ciò basta scegliere la colonna dal drop down che si attiva automaticamente alla disattivazione del flag Insert Record

- Scrivere una breve descrizione

- Nella tab `PDFModuleline` aggiungere tante linee quanti sono i campi nel modulo PDF indicando:

  * nella colonna `Name` il nome del campo nel modulo PDF

  * nella colonna `DB Column Name` il nome della colonna a cui il campo si riferisce

- Se nella tabella obiettivo ci sono delle altre colonne che devono essere valorizzate aggiungere una linea ciascuna indicando questa volta il valore predefinito nella colonna `Default Logic` 

   

## FUNZIONALITA' PLUGIN (Lato Sistemista)
### script python: compilabile.py

Lo script si trova in 
`/opt/scripts/PDFModule/`
allo stato attuale si esegue indicando come argomento il modulo PDF DEBITAMENTE COMPILATO che vogliamo importare.
Scritto per Python3, necessita della libreria `PyPDF2` installabile semplicemente con
`pip3 install PyPDF2`
Necessita anche di `PsycoPg2` ma già presente su consulting perchè serve ad Ansible.
Il processo può essere lanciato:

```
- manualmente lanciando lo script da linux ( compilabile.py )(non serve il PATH perchè l'ho aggiunto alla variabile d'ambiente)
- manualmente all'interno di idempiere (lanciando il processo all'interno della window       "Run Task Client") TODO
- automaticamente da scheduler    TODO
```




























---

## STEP IMPORTAZIONE PRODOTTI (Parte Tecnica)

Come viene agganciato il processo in idempiere?
Innanzitutto viene creato il Task (vedi immagine sotto) ed inserito come path il file Talend di importazione (Attenzione: Ricorda di avere installato il Plugin InitialClientSetup)

![image](/image/ImportListinoProdotti-Task.png)


Dopodichè richiamiamo il Task creato in una Rule (vedi immagine sotto)

![image](/image/ImportListinoProdotti-Rule.png)

Questa Rule verrà agganciata al Processo (vedi immagine sotto)

![image](900px-Rule1.png)

Infine, entro nel mio Client e aggancio il processo alla mia maschera Run Task Client (ovviamente posso creare un solo processo da menu oppure fare una schedulazione automatica)

![image](/image/ImportListinoProdotti-Rule2.png)

### Step 3: Caricamento prodotti nella M_Product (Funzionamento del plugin GeneralImporting)

Dopo aver lanciato il processo di importazione posso visualizzare i miei prodotti all'interno della maschera "LIT Import Product"

![image](/image/ImportListinoProdotti.jpg)

I campi riquadrati di rosso devono essere obbligatori per consentire che il successivo passaggio avvenga correttamente, ovvero l'importazione definitiva dei prodotti nella M_Product.

Il plugin GeneralImporting gestisce l'importazione dalla LIT_I_Product alla M_Product con il relativo calcolo dei prezzi e inserimento del listino. 

Se nel campo "Order Pack Qty" abbiamo un numero maggiore di 1 (esempio 3) allora il plugin GeneralImporting mi creerà un listino prezzi di questo tipo: List Price/Order Pack Qty. Facciamo un esempio: se il List Price=8.00 e il campo "Order Pack Qty"=3 allora verrà creato un listino di 8.00/3= 2,66 euro (arrotondato in base alle impostazioni del listino)

E' stata creata una infoWindow "LIT Import External Product Info" che mi consente di selezionare i prodotti presenti nella LIT_I_Product ed importarli nella M_Product (vedi immagine sottostante)

![image](/image/ImportListinoProdotti-2.png)

Seleziono i prodotti che mi interessano e premo nel pulsante in basso
