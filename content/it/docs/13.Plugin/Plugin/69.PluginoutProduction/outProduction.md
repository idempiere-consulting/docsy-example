---
title: "Plugin OutProduction"
date: 2020-04-24T22:47:10+02:00
draft: false
weight : 721
pre: "<b>721. </b>"
---

[Vai alla Pagina di Installazione]({{< ref "Budget[BDG00].md" >}} "Installazione Plugin Budget")

## Processi
- CopyFromOrderProduction.java
- CreateReceiptAndProduction.java
- OLineOutProdCreateProduction.java
- OrderOutProdCreateReceipt.java


## Model
- MInOut_CNET.java
    - completeIt() : String
- MOrderLine_BOM.java
    - beforeSave(boolean) : boolean
    - setOrder(MOrder) : void
- MOrderLine_OutProd.java
    - beforeSave(boolean) : boolean
    - setCurrencyFromOrder(MOrder) : void

## Infowindow
no

## Callout
- Callout_OutProd_Warehouse.java
    - start(Properties, int, GridTab, GridField, Object, Object) : String
- Callout_OutProduction.java
    - product_OutProd(Properties, int, GridTab, GridField, Object) : String
    - QtyEntered_OutProd(Properties, int, GridTab, GridField, Object) : String
    - Weight_OutProd(Properties, int, GridTab, GridField, Object) : String
- CallOutProd_CreateFromOP.java
    - start(Properties, int, GridTab, GridField, Object, Object) : String
- CallOutProd_Product.java
    - start(Properties, int, GridTab, GridField, Object, Object) : String
- CallOutProd_ProductNew.java
    - start(Properties, int, GridTab, GridFiel, Object, Object) : String
- CallOutProd_Workflow.java
    - start(Properties, int, GridTab, GridField, Object, Object) : String
    
- it.cnet.idempiere.outProduction.callout.Callout_OutProd_Warehouse
    - tableName : C_Order
        - columnName : LIT_WarehouseDestination_ID
        
- it.cnet.idempiere.outProduction.callout.Callout_OutProd_Warehouse
    - tableName : C_Order
        - columnName : LIT_Workflow_ID
    
## Eventhandler


## Form
- CreateFromShipment.java
- WCreateFromShipmentUI.java



