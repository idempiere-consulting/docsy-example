---
title: "Script Process"
date: 2020-04-24T22:47:10+02:00
draft: false
weight : 10000
pre: "<b></b>"
---


# Processo di script

Da iDempiere en

## Contenuto

```
1 Creare la regola
2 Configurare il processo
3 Codice fornito per il test copia/incolla
4 Vedi anche
```
## Crea la Regola

All'interno dello script è possibile utilizzare:

```
Le variabili di contesto di login iniziano con il prefisso G_
Parametri di processo per l'avvio del processo con prefisso P_, ad esempio P_Name
Se il parametro è un intervallo, allora i parametri saranno P_Name1 e P_Name
```
E i seguenti argomenti predefiniti:

```
A_Ctx il contesto
A_Trx la transazione
A_TrxName
A_Registrazione_ID
A_AD_Client_ID
A_AD_User_ID
A_AD_PInstanza_ID
A_Tabella_ID
```

## Configurare il processo


## Codice fornito per il test copia/incolla

Sul rapporto e sul processo:

```
@script:groovy:ImportDelete
```
Sulla chiave di ricerca delle regole:

```
groovy:ImportaCancella
```
Sullo Script delle Regole:

```
importare org.compiere.model.MTable;
importare org.compiere.util.DB;
importare org.compiere.util Msg;
/* ottieni informazioni sulla tabella */
Tabella MTable = nuovo MTable (A_Ctx, P_AD_Table_ID, A_TrxName);
se (table.get_ID() == 0)
lanciare la nuova IllegalArgumentException ("No AD_Table_ID=" + P_AD_Table_ID);
Stringa tableName = table.getTableName();
se (!tableName.startsWith("I"))
lanciare la nuova IllegalArgumentException ("Non una tabella di importazione = " + tableName);
/* Cancella */
Stringa sql = "CANCELLA DA " + tableName + " DOVE AD_Client_ID=" + A_AD_Client_ID;
int no = DB.executeUpdate(sql, A_TrxName);
A_ProcessInfo.addLog (0, null, null, "Eliminato "+no+" righe dalla tabella "+tableName");
risultato = "OK";
```
# Vedi anche


```
Script Callout
Script ModelValidatorLogin
Script_ModelloValidator
```
Recuperato da "http://wiki.idempiere.org/wen/index.php?title=Script_Process&oldid=4145".
Categorie: Sviluppo di frammenti di codice

```
Questa pagina è stata modificata l'ultima volta il 23 luglio 2013, alle 21:14.
Questa pagina è stata visitata 316 volte.
Il contenuto è disponibile sotto GNULizenz für freie Dokumentation 1.3 oder höher.
```




