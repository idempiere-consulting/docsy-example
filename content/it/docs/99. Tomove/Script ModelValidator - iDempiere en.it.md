---
title: "Script Model Validator"
date: 2020-04-24T22:47:10+02:00
draft: false
weight : 10000
pre: "<b></b>"
---


# Script ModelValidator

Da iDempiere en

## Contenuto

```
1 Creare la Regola
2 Configurare il Validatore di script da tavolo/colonna
3 Codice campione fornito per il test copia/incolla
4 Vedi anche
```
# Creare la Regola

Lo script del validatore del modello può essere richiamato per le modifiche sulle tabelle o sullo stato dei documenti.

L'elenco degli eventi supportati è:

```
Per le tabelle
Tabella TBN prima del nuovo
Tabella TBC prima del cambiamento
Tabella TBD prima della cancellazione
Tavolo TAN dopo il nuovo
Tabella TAC dopo il cambiamento
Tabella TAD dopo la cancellazione
Per i documenti
Documento DBPR prima della preparazione
Documento DBCO prima del completamento
Documento DBCL prima della chiusura
Documento DBVO prima del vuoto
Documento DBAC prima della riattivazione
Documento DBRA prima della rateizzazione inversa
Documento DBRC prima dell'inversione Correggere
Documento DBPO prima della pubblicazione
Documento DAPR dopo la preparazione
Documento DACO dopo il completamento
Documento DACL dopo la chiusura
Documento DAVO dopo il vuoto
Documento DAAC dopo la riattivazione
Documento DARA dopo la rateizzazione inversa
Documento DARC dopo la correzione dell'inversione
Documento DAPO dopo la pubblicazione
```
All'interno dello script è possibile utilizzare:

```
Le variabili di contesto della finestra iniziano con un prefisso W_
Le variabili di contesto di login iniziano con il prefisso G_
Parametri per l'inizio del callout con prefisso A_
A_Ctx
A_PO
A_Type
A_Evento
```

# Configurare il Validatore di script da tavolo/colonna


# Codice campione fornito per il test copia/incolla

Sulla chiave di ricerca delle regole:

```
beanshell:AD_Rule_after_ave
```
Sullo Script delle Regole:

```
A_PO.setDescrizione(A_PO.getName());
risultato = "";
```
# Vedi anche

```
Script Process per l'esempio di regola degli eventi da una finestra Report & Process.
Script ModelValidatorLogin
Script Callout
```
Recuperato da "http://wiki.idempiere.org/wen/index.php?title=Script_ModelValidator&oldid=4138".
Categorie: Sviluppo di frammenti di codice

```
Questa pagina è stata modificata l'ultima volta il 23 luglio 2013, alle ore 20:57.
Questa pagina è stata visitata 323 volte.
Il contenuto è disponibile sotto GNULizenz für freie Dokumentation 1.3 oder höher.
```



