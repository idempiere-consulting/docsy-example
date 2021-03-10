---
title: "Plugin PriceOnASI"
date: 2020-04-24T22:47:10+02:00
draft: false
weight : 721
pre: "<b>721. </b>"
---

## Processi
/
## Model
- MProductPrice_lit.java
    - getWrapper():I_M_ProductPrice_Lit
- MProductPricing_lit.java
    - calculateBPL():boolean
    - calculateBPL_VB():boolean
    - calculateDiscount():void
    - calculatePL():boolean
    - calculatePL_VB():boolean
    - calculatePLV():boolean
    - calculatePLV_VB():boolean
    - calculatePrice():boolean
    - getC_Currency_ID():int
    - getC_UOM_ID():int
    - getDiscount():BigDecimal
    - getM_PriceList_id():int
    - getM_PriceList_Versione_ID():int
    - getM_Product_ID():int
    - getPrecision():int
    - getPriceDate():TimeStamp
    - getPriceLimit():BigDecimal
    - getPriceList():BigDecimal
    - getPriceStd():BigDecimal
    - isCalculated():boolean
    - isDiscountSchema():boolean
    - isEnforcePriceLimit():boolean
    - isTaxIncluded():boolean
    - round(BigDecimal):BigDecimal
    - setBaseInfo():void
    - setM_PriceList_ID(int):void
    - setM_PriceList_Version_ID(int):void
    - setPrecision():void
    - setPriceDate(TimeStamp):void
## InfoWindow
/
## Callout
- CallProdASI.java
    - priceByAttributeSetInstance(Properties, int, GridTab, GridField, Object):String
    - recalPriceByQty(Properties, int, GridTab, GridField, Object):String
    - start(Properties, int, GridTab, GridField, Object, Object):String
    
- it.idIta.idempiere.LIT_PriceOnASI.callout.CallProdASI
    - CallProdASI
        - TableName: C_OrderLine
        - ColumnName: M_AttributeSetInstance_ID
    - CallProdASI
        - TableName: C_OrderLine
        - ColumnName: QtyOrdered
    - CallProdASI
        - TableName: C_OrderLine
        - ColumnName: QtyEntered
    - CallProdASI
        - TableName: C_OrderLine
        - ColumnName: C_UOM_ID
    
## EventHandler
/
## Form

