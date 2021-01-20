---
title: "Script Model Validator Login"
date: 2020-04-24T22:47:10+02:00
draft: false
weight : 10000
pre: "<b></b>"
---


## 25/7/2015 Script ModelValidatorLogin - ADempiere ERP Wiki

## http://www.adempiere.com/index.php/Script_ModelValidatorLogin 1/

# Script ModelValidatorLogin

#### Da ADempiere ERP Wiki

```
Stato: funzionante in versione > 3.3.1b
```
```
Con il contributo di:
Sistemi e soluzioni di qualità QSS Ltda.
Carlos Ruiz
```
## Basta creare la regola

```
All'interno dello script è possibile utilizzare le seguenti variabili predefinite:
```
```
A_Ctx
A_AD_Client_ID
A_AD_Org_ID
A_AD_Ruolo_ID
A_AD_User_ID
```
## Codice fornito per il test copia/incolla


### 25/7/2015 Script ModelValidatorLogin - ADempiere ERP Wiki

### http://www.adempiere.com/index.php/Script_ModelValidatorLogin 2/

```
Sulla chiave di ricerca delle regole:
```
```
beanshell:DontAllowGardenAdmin
```
```
Sullo Script delle Regole:
```
```
org.compiere.model.MUser user = nuovo org.compiere.model.MUser(A_Ctx, A_AD_User_ID, null);
se (user.getName().equals("GardenAdmin"))
retorno = "GardenAdmin è bandito da questa installazione";
altro
retorno = "";
resultado = retorno;
```
## Vedi anche

```
Script Callout
Processo di script
Script_ModelloValidator
```
```
Recuperato da "http://www.adempiere.com/Script_ModelValidatorLogin".
Categorie: Caratteristiche | Documentazione per lo sviluppatore | Sviluppo | Frammenti di codice
```
```
Questa pagina è stata modificata l'ultima volta il 20 agosto 2010, alle 14:15.
Il contenuto è disponibile sotto la GNU Free Documentation License 1.2.
```





