---
title: "Plugin E_Invoice"
date: 2020-04-24T22:47:10+02:00
draft: false
weight : 721
pre: "<b>721. </b>"
---

[Vai alla Pagina di Installazione]({{< ref "Budget[BDG00].md" >}} "Installazione Plugin Budget")

## Processi
- CopyArticle_onAllLines.java
    - Toolbar Copia articolo su tutte le righe_callLines
- GenerateFEPA.java
    - Info Genera Fattura Elettronica_Generate_E-Invoice_PA
- ImportInvoice_cstm.java !!

## Model
- E_Invoice
    - MBPartner_lit.java
        - getWrapper() : I_C_BPartner_cnet
    - MDocType_lit.java
        - getWrapper(): I_C_BPartner_cnet
    - ME_Invoice.java        
        
## Infowindow


## Callout
- CallDocTypeInvoice.java
    - start(Properties, int , GridTab, GridField, Object, Object) : String
    
- it.cnet.idempiere.LIT_E_Invoice.callout.CallDocTypeInvoice
    - tableName: C_Invoice
        - C_DocTypeTarget_ID

## Eventhandler

    
    
    
