---
title: "Plugin payment_term"
date: 2020-04-24T22:47:10+02:00
draft: false
weight : 721
pre: "<b>721. </b>"
---

## Processi
- CreateNewPayTermExcluded.java
    - Toolbar Crea Nuovi Termini di Pagamento Esclusi_CrNewPayTermExcl
## Model
- MBPPayTermExcl.java
- MInvoiceLine_lit.java
    - updateInvoiceTaxCustom(boolean):boolean
- MInvoiceTax_lit.java
    - setClientOrgCustom(MInvoice):void
    - setPrecisionCustom(int):void
- MOrderTax_lit.java
    - setClientOrgCustom(MOrder):void
    - setPrecisionCustom(int):void
- MRMALine_lit.java
    - updateOrderTaxCustom(boolean):boolean
- MRMATax_lit.java
    - setClientOrgCustom(MRMA):void
    - setPrecisionCustom(int):void
## InfoWindow

## Callout
- CallPaySchedule.java
    - getInstance(String):CallPaySchedule
    - start(Properties, int, GridTab, GridField, Object, Object):String
## EventHandler

## Form
- CustomPaymentFormCash.java
- WPaymentFormStandard.java
