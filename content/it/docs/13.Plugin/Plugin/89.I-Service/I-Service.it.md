---
title: "Plugin I-Service"
date: 2020-04-24T22:47:10+02:00
draft: false
weight : 721
pre: "<b>721. </b>"
---

## Processi
- AssociateBoardTrip_FromWO.java
    - NO RECORDS FOUND!!
- CreateNewHelpDesk.java
    - NO RECORDS FOUND!!
- CreateProductCardLine.java
    - NO PROCESS FOUND!!
- CreateSalesOrderFromWO.java
    - NO REPORTS FOUND!!
- GenerateProdCardFromOrder.java
    - NO REPORTS FOUND!!
- GenerateWorkOrder.java
    - NO REPORTS FOUND!!
- GenerateWorkOrderFromHelpDesk.java
    - NO REPORTS FOUND!!
- GenMaintenance_FromProductCard.java
    - NO REPORTS FOUND!!
- LinkToGeo.java
    - NO REPORTS FOUND!!
- MPAssetPlanning.java
    - NO PROCESS FOUND!!
- MPCopyFromSJ.java
    - NO PROCESS FOUND!!
- MPProcessOT.java
    - NO PROCESS FOUND!!
- ProcessRequestOT.java 
    - NO PROCESS FOUND!!
## Model
NO MFiles.java !!
## InfoWindow
/
## Callout
- CalloutProductCartd.java
    - bPartner(Properties, int, GridTab, GridField, Object):String
    - start(Properties, int, GridTab, GridField, Object, Object):String
- CalloutWorkOrder.java
    - bPartner(Properties, int, GridTab, GridField, Object):String
    - start(Properties, int, GridTab, GridField, Object, Object):String
    
- it.idIta.idempiere.LIT_I_Service.model.CalloutAssetMPLogAmt
    - CalloutAssetMPLogAmt
        - TableName: MP_AssetMeter_Log
        - ColumnName: Amt
    - CalloutAssetMPLogMeterAmt
        - TableName: MP_AssetMeter_Log
        - ColumnName: MP_AssetMeterSearch_ID

- it.idIta.idempiere.LIT_I_Service.callout.CalloutProductCartd
    - CalloutProductCard
        - TableName: LIT_ProductCard
        - ColumnName: C_BPartner_ID

- it.idIta.idempiere.LIT_I_Service.callout.CalloutWorkOrder
    - CalloutWorkOrder
        - TableName: MP_OT
        - ColumnName: LIT_ProductCard_ID
## EventHandler

## Form
- WMPGenerateOT.java
- WMPProgrammingOT.java
- WMPRequestOT.java
