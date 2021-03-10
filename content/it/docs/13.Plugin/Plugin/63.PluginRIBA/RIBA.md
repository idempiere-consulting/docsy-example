---
title: "Plugin RIBA"
date: 2020-04-24T22:47:10+02:00
draft: false
weight : 721
pre: "<b>721. </b>"
---

[Vai alla Pagina di Installazione]({{< ref "Budget[BDG00].md" >}} "Installazione Plugin Budget")

## Processi
- LIT_RIBAGenerateFile.java
    - Menu Genera RIBA e Prima Nota_LIT_RIBAGenerateFile
- LIT_RIBAGeneratePayment.java
    - Info Registra Incasso/Pagamento_LIT_RIBAGeneratePayment
    - Info Registra Incasso/Pagamento_LIT_RIBAGeneratePayment
- LIT_RIBAGenMergePayment.java
    - Info Registra Incasso Unico RIBA_LIT_RIBAGenMergePayment
- LIT_RIBAGenOutstandingPayment.java
    - Info Registra Insoluti RIBA_LIT_RIBAOutstandingPayment
- LIT_RIBAGenSingleOutstanding.java
    - Toolbar Registra Insoluto_LIT_RIBASingleOutstanding
- LIT_RIBAOutstandingFromAllocate.java
    - Registra Insoluto da Imputa_LIT_RIBAOutstandingFromAllocate

## Model
- LIT_Validator.java
    - createJournal(MInvoice, MAcctSchema, MAccount,MDocType, String, boolean,String): void
    - createJournalHeader(MAllocationHdr, MAcctSchema, MDocType, String) : Mjournal
    - createJournalLine(MJournal, MAllocationLine, MInvoice, MAcctSchema, MAccount, MDoctype, String, int) : void
    - createJournalLine(MJournal, MAllocationLine, MPayment, MAcctSchema, MAccount, MDoctype, String, int) : void
    - doHandleEvent(Event) : void
    - getBPARAcct(MInvoice, MAcctSchema) : MAccount
    - getRIBAamt(MInvoice) : BigDecimal
    - getRIBABankAcct(MPayment, MAcctSchema) : MAccount
    - getRIBADescription(MAllocationHdr) : String
    - getRIBADescription(String, MInvoice) : String
    - getRIBADocType(MAllocationHdr) : MDocType
    - getRIBADocType(MInvoice) : MDocType
    - getRIBADocTypeGenericAcct(MInvoice,MAcctSchema) : MAccount
    - initialize() : void

    
## Infowindow
no

## Callout
no
    
## Eventhandler
no 


