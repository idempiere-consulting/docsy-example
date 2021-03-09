---
title: "Plugin Product Conigurator"
date: 2020-04-24T22:47:10+02:00
draft: false
weight : 721
pre: "<b>721. </b>"
---

[Vai alla Pagina di Installazione]({{< ref "Budget[BDG00].md" >}} "Installazione Plugin Budget")

## Processi
no

## Model
- MLIT_PP_MPS.java
- MLIT_ProdBOMRule.java
    - getRuleFromProduct(int, int): MLIT_ProdBOMRule
- MLIT_ProdConfig.java
    - codeConfigurator(int, String) : MLIT_ProdConfig
    - getCodeConfigurators(int): ArrayList<MLIT_ProdConfig>
    - beforeSave(boolean) : boolean
- MOrderLine_lit.java
    - getWrapper() : I_C_OrderLineCNET
- MPPProductBOMLine_lit.java
    - getLITByProduct(MProduct) : List<MPPProductBOMLine_lit>
    - getWrapper() : I_PP_Product_BOMLine_lit


## Infowindow
no

## Callout
no
    
## Eventhandler
- EventHandler_cnet.java
    - doHandleEvent(Event) : void
    - initialize() : void

## Form
- WProdConfigurator.java
