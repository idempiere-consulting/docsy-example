---
title: "Plugin VAT Journal"
date: 2020-04-24T22:47:10+02:00
draft: false
weight : 721
pre: "<b>721. </b>"
---

[Vai alla Pagina di Installazione]({{< ref "Budget[BDG00].md" >}} "Installazione Plugin Budget")

## Processi
- LIT_Validator.java
- YearCreatePeriodsVAT.java
    - Toolbar Creare Periodi IVA_C_Year Create Periods VAT

## Model
- MDocType_lit.java
    - getWrapper() : I_C_DocType_lit
- MLITVATDocTypeSequence.java
    - getSequence(Properties, int, int, int boolean, String) : MSequence
    - getVATDocTypeSequnce(Properties, int, int, int, boolean, String) : MLITVATDocTypeSequence
    - beforeSave(boolean) : boolean
- MPeriodVAT
    - findByCalendar(Properties, Timestamp, int, String) : MPeriodVAT

## Infowindow
no

## Callout
no
    
## Eventhandler
no 


