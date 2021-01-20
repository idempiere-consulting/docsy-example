---
title: "Rule Engine Implementation - ADempiere ERP Wiki"
date: 2020-04-24T22:47:10+02:00
draft: false
weight : 10000
pre: "<b></b>"
---

# 14/8/2015 Implementazione del motore delle regole - Wiki di ADempiere ERP

# http://www.adempiere.com/index.php/Rule_Engine_Implementation 1 /

# Implementazione del motore delle regole

## Da ADempiere ERP Wiki

`` `
Questa è la mia idea per implementare la regola e il motore in ADempiere
`` `
`` `
Per prima cosa dobbiamo creare nuovi dati di modello nel dizionario dell'applicazione:
`` `
`` `
Tabella AD_Rule_Engine
`` `
`` `
Campi:
Valore
Nome
Descrizione
Tipo di motore delle regole
Script
`` `
`` `
Script DDL
`` `
`` `
CREA TABELLA adempiere.ad_rule_engine
(
ad_client_id numerico (10) NOT NULL,
ad_org_id numerico (10) NOT NULL,
ad_rule_engine_id numerico (10) NOT NULL,
creato timestamp senza fuso orario NOT NULL,
creato da numerico (10) NOT NULL,
descrizione carattere variabile (255),
carattere isattivo (1) NOT NULL,
nome carattere variabile (60) NOT NULL,
rule_engine_type carattere variabile (2),
carattere della sceneggiatura variabile (4000),
timestamp aggiornato senza fuso orario NOT NULL,
aggiornato da numerico (10) NOT NULL,
valore carattere variabile (40),
CONSTRAINT ad_rule_engine_key PRIMARY KEY (ad_rule_engine_id),
CONSTRAINT ad_rule_engine_isactive_check CHECK (isactive = ANY (ARRAY ['Y' :: bpchar, 'N' :: bpchar]))
)
`` `
## Nuove finestre nel dizionario dell'applicazione

`` `
Nome Windows: motore delle regole
`` `
`` `
Campi
Chiave di ricerca: valore da cercare per regola
Nome: nome della regola
Descrizione: la descrizione descrive in dettaglio la regola
Tipo di motore delle regole:
Bash Shell (Consenti di eseguire una regola basata su questo linguaggio di script)
SQL (consentirà di eseguire una regola basata sullo standard SQL)
AOP (consentirà di eseguire una regola basata su AOP)
Script: la logica dello script per il tipo di motore delle regole
`` `
## Immagine dello schermo


# 14/8/2015 Implementazione del motore delle regole - Wiki di ADempiere ERP

# http://www.adempiere.com/index.php/Rule_Engine_Implementation 2 /

`` `
Qui puoi rivedere come sto implementando bash Shell in Payroll
`` `
`` `
MHRProcess (http://adempiere.svn.sourceforge.net/viewvc/*checkout*/adempiere/branches/libero/src/org/eevolution/model/MHRProcess.java)
`` `
`` `
Estratto da "http://www.adempiere.com/Rule_Engine_Implementation"
Categorie: Documentazione per sviluppatori | Sviluppo | Concetti e funzionalità ERP
`` `
`` `
Questa pagina è stata modificata l'ultima volta il 8 febbraio 2008 alle 04:01.
Il contenuto è disponibile sotto GNU Free Documentation License 1.2.
```





