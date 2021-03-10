---
title: "Plugin WarehouseExtend"
date: 2020-04-24T22:47:10+02:00
draft: false
weight : 721
pre: "<b>721. </b>"
---

[Vai alla Pagina di Installazione]({{< ref "Budget[BDG00].md" >}} "Installazione Plugin Budget")

## Processi
- WarehouseExtend
    - CopyBOMfromBOM_Light.java
        - Info Copia BOM da BOM Standard_cpBOMfromLIGHT
    - GenerateReceiptFromPO.java
        - Toolbar Crea Entrata Merci da ODV_C_Order_CreateInOutPO_FromSO
        - Toolbar Crea Entrata Merci da ODA_C_Order_CreateInOutPO
    - GenerateShipAndInvFromSO.java
        - Toolbar Genera DDT e Fattura da Ordine di Vendita_GenerateShipAndInvFromSO
    - GenerateShipmentFromSO.java
        - Toolbar Crea DDT da Ordine di Vendita_GenerateShipmentFromSO
    - MaterialReceiptToShipment.java
        - Toolbar Crea DDT da Entrata Merci_CreateShipCutomer
        - Toolbar Crea DDT da Entrata Merci_CreateShipCutomer
    - ReplenishReport_R25_B.java
        - Menu Report di ri-approvigionamento magazzino [R.25_B]_RV_T_Replenish_B
    - ReverseTransfer.java
        - Info Stornare Trasferimento DDTM_reverseTransfer
    - RMACreateReturn.java
        - Toolbar Crea Reso_RMACreateReturn
        - Toolbar Crea Reso_RMACreateReturn
    - RMACreateShipment.java
        - Toolbar Crea DDT da RMA_RMACreateShipment
    - RMAMaterialDischarge.java
        - Toolbar Scarico Materiale da RMA_RMAMaterialDischarge
- WarehouseExtended.production
    - CopyBOM.java
        - Info Copia BOM da BOM Standard_cpBOMfromLIGHT
        - Toolbar Copia Distinta Base da Prodotto_M_Product_BOM CopyFrom
    - EndProductDeclaration.java
        - Dichiarazione Prodotto Finito_EndProductDeclaration
    - FinalProductionOverwrite.java
    - GenerateDailyProduction.java
        - Toolbar Genera Produzione giornaliera_GenerateDailyProduction
    - GeneratePOfromProduction.java
    - GenerateProductionMPS.java
    - GenerateRequisitionMPS.java
    - OrderLineCreateProduction_upd.java
        - Info Crea Ordine di Produzione da Riga Ordine_OrderLine Create Production   
    - ReplenishMPSProduction.java
    - ReplenishRepProd_36.java
        - Info Report di ri-approvigionamento produzione [R.351]_Replenish_Production
    - RunConsumeComponents.java
        - Toolbar Esegui consumo componenti_RunConsumeComponents
    - RunPickingComponents.java
        - Info Esegui prelievo componenti_RunPickingComponents
        - Info Esegui prelievo componenti_RunPickingComponents

## Model
- WarehouseExtend    
    - MAttributeField
        - getAttributeFieldByIdColumn(int): MAttributeField
    - MDocType_lit.java
        - getWrappe() : I_C_DocType_cnet
    - MMRP_Replenish.java
    - MProductionNode.java
    - MProductionWFOperation.java
    - MProductionWorkflow
        - getLastActivity() : MProductionNode
    - MShopfloorControl.java
        - approveIt() : boolean
        - closIt() : boolean
        - completeIt() : String
        - createPDF() : File
        - getApprovalAmt() : BigDecimal
        - getC_Currency_ID(): int
        - getDoc_User_ID() : int
        - getDocumentInfo() : String
        - getProcessMsg() : String
        - getSummary() : String
        - invalidateIt() : boolean
        - prepareIt() : String
        - processIt(String) : boolean
        - reAcrivateIt() : boolean
        - rejectIt() : boolean
        - reverseAccrualIt() : boolean
        - reverseCorrecIt() : boolean
        - unlockIt() : boolean
        - voidIt() : boolean 
- WarehouseExtend.production
    - ProductionValidator.java
        - docValidate(PO, int) : String
        - getAD_Client() : int
        - initialize (ModelValidationEngine, MClient) : void
        - login(int , int, int) : String
        - modelChange(PO , int) : String
        - runConsumeComponents(MInOut) : void

## Infowindow
no

## Callout
- WarehouseExtend
    - Call_MInoutLineQtyEntered
        - start(Properties, int, GridTab, GridField, Object, Object) : String
    - CallQtyBarcode
        - start(Properties, int, GridTab, GridField, Object, Object) : String
- WarehouseExtend.production
    - Call_ProductionLineBOMQty
        - BOMQtychange(Properties, int, GridTab, GridField, Object, Object) : String
        - DisableComponent(Properties, int, GridTab, GridField, Object, Object) : String
        - start(Properties, int, GridTab, GridField, Object, Object) : String
    - Call_RequisitionLine
        - bp_CurrentVendor(Properties, int, GridTab, GridField, Object, Object) : String
        - star(Properties, int, GridTab, GridField, Object, Object) : String
        
- it.cnet.idempiere.LIT_WarehouseExtend.production.callout.Call_ProductionLineBOMQty
    - tableName : M_ProductionLine
        - columnName : BOMQty
        
- it.cnet.idempiere.LIT_WarehouseExtend.production.callout.Call_ProductionLineBOMQty
    - tableName : M_ProductionLine
        - columnName : IsActive
        
- it.cnet.idempiere.LIT_WarehouseExtend.production.callout.Call_RequisitionLine
    - tableName : M_RequisitionLine
        - columnName : M_Product_ID
    
## Eventhandler
- WarehouseExt_EvtHandler_cnet.java
    - doHandleEvent(Event) : void
    - initialize() : void

## Form
- AttributeSetAdjustment.java
- WAttSetAdjustment.java
- WTreeBOMAdvanced.java
