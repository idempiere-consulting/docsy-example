---
title: "Plugin utilPDF"
date: 2020-04-24T22:47:10+02:00
draft: false
weight : 721
pre: "<b>721. </b>"
---

## Processi
- PrintSyncronize.java
    - Menu ProcessBATCH_1_PrintBatch
- ProcessFactPDF_cnet.java
    - NO RECORDS FOUND!!
## Model
- MAdditDocsPDF.java
    - getAdditionDocs(Properties, int, int):List<MAdditDocsPDF>
    - getAddPDF_forPrintBatch(Properties, int, int):List<MAdditDocsPDF>
- MDirectPrint.java
- MDocType_lit.java
    - getWrapper():I_C_DocTypeCNET
- MPrinter_lit.java
- MProcess_lit.java
    - getPrinterName():String
    - getWrapper():I_AD_ProcessCNET
- MStamp.java
## InfoWindow

## Callout
- CalloutFactory_cnet.java
    - getColumnCallouts(String, String):IColumnCallout[]
- CalloutSpecialField.java
    - start(Properties, int, GridTab, GridField, Object, Object):String
## EventHandler

## Form
- WEMailDialog_custom.java.old
