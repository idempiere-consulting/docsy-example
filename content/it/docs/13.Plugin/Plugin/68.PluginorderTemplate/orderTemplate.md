---
title: "Plugin OrderTemplate"
date: 2020-04-24T22:47:10+02:00
draft: false
weight : 721
pre: "<b>721. </b>"
---

[Vai alla Pagina di Installazione]({{< ref "Budget[BDG00].md" >}} "Installazione Plugin Budget")

## Processi
- Create_ShipAndInvFromLine.java
    - Info Crea DDT e Fattura da Linee d'Ordine_oLineCreateDDT_Inv_from_InfoWindow
    - Info Crea DDT e Fattura da Linee d'Ordine (Gestione KIT)_oLineCreateDDT_Inv_from_InfoWindow(KIT)
- CreateOrderFromInfoWindow.java
    - Info Crea Ordine da Dettaglio Ordini_CreateOrderFromInfoWindow
- DigestOfFile.java
- ExportDatabase.java
- GenInvoicePayAllocation.java
    - Info Crea Fattura Anticipata e Abbinamento_GenInvoicePayAllocation
    - Info Crea Fattura Anticipata e Abbinamento_GenInvoicePayAllocation
- InOutGenerate_upd.java
- InvoiceGenerate_upd.java
- InvoiceGenerateFromReceipt.java
    - Info Generare Fattura dalla Entrata Merci_genInvoiceFromReceipt
- InvoiceGenerateFromShipLine.java
    - Info Genera Fattura da Righe DDT (Autofattura)_genInvoiceFromShipLine
- InvoiceGenerateFromShipment.java
    - Info Genera Fattura da DDT_genInvoiceFromDDT
- InvoiceProgressiveGenerate.java
    - Info Genera Fattura Progressiva_genInvoiceProgr
- LIT_InventoryValue.java
    - Menu Report Valutazione Inventario alla Data[R.132]_InventoryValueDate
- MaterialDischarge.java
    - Toolbar Scarico Materiale da RMA_RMAMaterialDischarge
    - Menu Scarico Materiale_MaterialDischarge
- OrderLineCreateShipment_upd.java
    - Info Crea DDT da Linee d'Ordine (Gestione KIT)_OrderLine_CreateDDT_from_InfoWindow(KIT)
    - Info Crea DDT da Linee d'Ordine_OrderLine_CreateShipment_from_InfoWindow
- OrderPrint.java
    - Menu Stampare Ordini di Acquisto_C_Order_Print
- PeriodsCreateMeasurement.java
    - Menu Genera Misurazioni/Consumi da Template_LIT_PeriodsMeasurement_Process
- POtoOrderCreate_lit.java
    - Menu Generare Ordine di Vendita dall'Ordine di Acquisto_C_Order SO_Create
- PreferredProductVendor.java
    - Info Imposta Fornitore Preferenziale_PreferredProductVendor
    - Info Imposta Fornitore Preferenziale_PreferredProductVendor
- ProcessFact_template.java
- ReportStarterConsulting.java
- ValidationBPartner.java
    - Toolbar Valida BPartner_ValidationBPartner
- WFActivityApproval.java
    - Info Approvazione Attività Workflow_WFActivityApproval

## Model
- MInOut_StepOver.java
    - copyFrom(MInOut_StepOver, Timestamp, Timestamp, int, boolean, boolean, String, boolean) : MINOut_StepOver
    - beforeSave(boolean) : boolean
    - copyLinesFrom(MInOut_StepOver, boolean, boolean) : int
    - getLiness(int) : MInOutLine_StepOver[]
- MInOutLine_StepOver.java
    - beforeDelete() : boolean
    - beforeSave(boolean) : boolean
    - getWrapper() : I_M_InOutLineCNET
- MInvoiceLine_lit.java
    - getWrapper() : I_C_InvoiceLineCNET
    - updateInvoiceTaxCustom(boolean) : boolean
- MInvoiceTerm
    - getLines() : MInvoiceTermLine[]
- MInvoiceTermLine.java
- MMeasurment.java
- MMeasurementModel.java
- MMovementLine_lit.java
    - getWrapper(): I_M_MovementLineCNET
- MOrderLine_lit.java
    - getWrapper() : I_C_OrderLineCNET
- MOrderWizard.java
- MServices.java
- MWFActivity_lit.java
    - getWrapper() : I_AD_WF_ActivityCNET
- MZoomCondtion_lit.java
    - getWrapper() : I_AD_ZoomConditionCNET

## Infowindow
no

## Callout
- CallOrderWizard.java
    - start(Properties, int, GridTab, GridField, Objcet, Object) : String
- CallUtility
    - shortCut(Properties, int, GridTab, GridField, Objcet) : String
    
## Eventhandler
- EventHandler_cnet.java
    - composeStringFromTable(PO) : String
    - doHandleEvent(Event) : void
    - initialize() : void
    - setParamSysProp(String) : void


