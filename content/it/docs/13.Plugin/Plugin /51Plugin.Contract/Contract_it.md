---
title: "Plugin Contratti "
date: 2020-04-24T22:47:10+02:00
draft: false
weight : 721
pre: "<b>721. </b>"
---

[Vai alla Pagina di Installazione]({{< ref "Budget[BDG00].md" >}} "Installazione Plugin Budget")


## Sistemare Itop!!

## Processi
- AppendContract_Info.java  
    - Info Crea/Accoda ODV da Contratto_AppendContract_Info 
    - Info Crea/Accoda ODA da Contratto_AppendContract_Info
- AppendContract.java
    - Maschera Genera Ordine di Acquisto da Contratto [GOAC20]_Append_ContractToPurchaseOrder
    - Maschera Genera Ordine di Vendita da Contratto [GOVC20]_Append_ContractToSalesOrder
    - Maschera Genera Fattura di Acquisto_AppendContractToInvoiceVendor  
    - Info Crea/Accoda ODV da Contratto_AppendContract_Info
    - Info Crea/Accoda ODA da Contratto_AppendContract_Info
- AppendContractTOInvoice.java !!
    - Toolbar Genera Fattura di Acquisto_AppendContractToInvoiceVendor
    - Info Genera Fattura di Acquisto_AppendContractToInvoiceVendor
- AppendOrderToContract_Info.java
    - Info Genera Contratto da Ordine_AppendOrderToContract_Info
    - Info Genera Contratto da Ordine_AppendOrderToContract_Info
- AppendOrderToContract.java
    - Toolbar Genera Contratto da Ordine_Append_OrderToContract
    - Info Genera Contratto da Ordine_AppendOrderToContract_Info
    - Info Genera Contratto da Ordine_AppendOrderToContract_Info

## Model
- MContract.java
    - get(Properties, int): MContract
- MContractLine.java 
    - getContract(int) : MContract
    - getLineFromAsset(int) : MContractLine
## Infowindow
    
## Callout
no

## Eventhandler
- ContractEventHandler 
    - doHandleEvent(Event): void
    - getConnect_iTop(Properties): ITopRestClient
    - initialize(): void
