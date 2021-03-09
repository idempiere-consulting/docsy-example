---
title: "Plugin resource_attendance"
date: 2020-04-24T22:47:10+02:00
draft: false
weight : 721
pre: "<b>721. </b>"
---

## Processi
- AppendAttendance_Info.java
    - Info Crea/Accoda Offerta/Ordine di Vendita_Append_SalesOrder_Info
- AppendAttendance.java
    - Info Crea/Accoda Offerta/Ordine di Vendita_Append_SalesOrder_Info
- AttendanceApproved.java
    - Info Approva Rilevamento Ore_ResourceAttendance_Approved
- AttendanceConfirmed.java
    - Info Conferma Rilevamento Ore_ResourceAttendance_Confirmed
- AttendanceInvoiced.java
    - Info Imposta Fatturazione Rilevamento Ore_ResourceAttendance_Invoced
- CreateHour_ResAttendance.java
    - Info Crea Dettaglio Ore e Ril. Ore_CreateHour_ResAttendance
    - Info Crea Dettaglio Ore e Ril. Ore_CreateHour_ResAttendance
- CreateOrderFromTasks.java
    - Info Crea ODV da Task Utenti_CreateOrderFromTasks
- CreateResAtt_FromExtRilIngr.java
    - Menu Crea Rilevamento Ore da Timbratura [CRD10]_CreateResAtt_FromExtRilIngr
- CreateResAttendanceFromTemplate.java
    - Menu Crea Rilevevamento Ore da Template [CRT10]_CreateResAttFromTemplate
- CreateTasksFromOrder.java
    - Toolbar Crea attività dall'ordine_CreateTasksFromOrder
- ProcessFactory_cnet.java
## Model
- MContactActivity.java
    - getWrapper():I_C_ContactActivity
- MExtRilIngr.java
    - getTimecardNoSync(String):ArrayList<MExtRilIngr>
- MHourWork.java
    - beforeDelete():boolean
- MResourceAttendance.java
    - getListResAttendance_Template(int, int):List<MResourceAttendance>
    - getTemplateForWeek(int, int)TreeMap<Integer, List<MResourceAttendance>>
    - beforeSave(boolean):boolean
    - calculateAmntResource():void
## InfoWindow

## Callout
- Call_ProdCostDetail.java
    - amt(Properties, int, GridTab, GridField, Object):String
    - isCalloutActive(GridTab):boolean
    - product(Properties, int, GridTab, GridField, Object):String
    - qty(Properties, int, GridTab, GridField, Object):String
    - start(Properties, int, GridTab, GridField, Object, Object):String
- CallContactActivity.java
    - getInstance(String):CallContactActivity
    - setDoNotInvoice(Properties, GridTab, GridField, int, Object):void
    - start(Properties, int, GridTab, GridField, Object, Object):String
- CalloutFactoryResource_cnet.java
    - getColumnCallouts(String, String):IColumnCallout[]
- CallResourceAttendance.java
    - getInstance(String):CallResourceAttendance
    - calculateAmnt(Properties, GridTab, int, BigDecimal):void
    - calculateAmntResource(Properties, int, GridTab, GridField, Object, Object):void
    - calculateAssignDateTo(Properties, GridTab, int, Object):void
    - getTransfer(Properties, int, GridTab, GridField):void
    - setDoNotInvoice(Properties, GridTab, GridField, int, Object):void
    - setValueZERO(Properties, GridTab, GridField, int, Object):void
    - start(Properties, int, GridTab, GridField, Object, Object):String
## EventHandler

## Form
- ResAtt_Prod.java
- WRessAtt_Prod.java
