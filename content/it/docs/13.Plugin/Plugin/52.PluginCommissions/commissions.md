---
title: "Plugin Provvigioni "
date: 2020-04-24T22:47:10+02:00
draft: false
weight : 721
pre: "<b>721. </b>"
---

[Vai alla Pagina di Installazione]({{< ref "Budget[BDG00].md" >}} "Installazione Plugin Budget")

## Processi
- CalculateAllCommissions  (!!Non Utilizzato)
- CommissionCalcForOrder (!!Non Utilizzato)

## Model
- MCommissionAmt_CNET
    - calculateCommissions() :void

## Infowindow
    
## Callout
- CallDetailCommission
    - getInstance(String) : CallDetailCommission
    - CallDetailCommission(String)
    - calcolateLineCommiss (Properties, GridTab, Object, Objcet) : void
    - calcolteMultiplier (Properties, GridField, Object, Object) : void
    - start (Properties, int, GridTab, GridField, Object, Object) : String

## Eventhandler

