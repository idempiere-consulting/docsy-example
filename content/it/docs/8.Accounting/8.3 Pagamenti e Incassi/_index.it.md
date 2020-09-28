---
title: "Pagamenti e Incassi"
date: 2020-04-24T22:47:10+02:00
draft: false
weight : 670
pre: "<b></b>"
---

Menù Idempiere

[Pagamento/Incasso [PI00]]({{< ref "_index.it.md#PI00" >}} "Pagamento/Incasso") <br>
[Seleziona Fattura per Pagamento [SPF00]]({{< ref "_index.it.md#SPF00" >}} "Seleziona Fattura per Pagamento") <br>
[Selezione Pagamento (manuale) [SEP00]]({{< ref "_index.it.md#SEP00" >}} "Selezione Pagamento (manuale)") <br>
[Crea RIBA e Prima Nota [CRPN00]]({{< ref "_index.it.md#CRPN00" >}} "Crea RIBA e Prima Nota") <br>
[Info Registra Incassi [IRI00]]({{< ref "_index.it.md#IRI00" >}} "Info Registra Incassi") <br>
[Info Registra Incassi/Pagamenti da Fattura [IRIF00]]({{< ref "_index.it.md#IRIF00" >}} "Info Registra Incassi/Pagamenti da Fattura") <br>
[Info Totale RIBA [IR10]]({{< ref "_index.it.md#IR10" >}} "Info Totale RIBA [IR10]") <br>
[Operazione di Pagamento [OP00]]({{< ref "_index.it.md#OP00" >}} "Operazione di Pagamento") <br>
[Stampa o Export Pagamento [ODP00]]({{< ref "_index.it.md#ODP00" >}} "Stampa o Export Pagamento") <br>
[Accomodamento Pagamento [AP00]]({{< ref "_index.it.md#AP00" >}} "Accomodamento Pagamento") <br>
[Storno Crediti [STC00]]({{< ref "_index.it.md#STC00" >}} "Storno Crediti") <br>
[Crea Ricavo Obbiettivo Promozioni [CROP00]]({{< ref "_index.it.md#CROP00" >}} "Crea Ricavo Obbiettivo Promozioni") <br>
[Allocazione Automatica [ALA00]]({{< ref "_index.it.md#ALA00" >}} "Allocazione Automatica") <br>
[Abb. Pagamento [AP00]]({{< ref "_index.it.md#AP00" >}} "Abb. Pagamento") <br>
[Annulla Allocazione Fattura [AAF00]]({{< ref "_index.it.md#AAF00" >}} "Annulla Allocazione Fattura") <br>
[Abbinamento Pagamenti [ABP00]]({{< ref "_index.it.md#ABP00" >}} "Abbinamento Pagamenti") <br>
[Report Registrazioni non Riconciliate [R.56]]({{< ref "_index.it.md#R56" >}} "Report Registrazioni non Riconciliate") <br>
[Stampa lettere Solleciti [SLS00]]({{< ref "_index.it.md#ABP00" >}} "Stampa lettere Solleciti") <br>
[Elaborazione Sollecito [ELS00]]({{< ref "_index.it.md#ELS00" >}} "Elaborazione Sollecito") <br>
[Report Registrazioni Contabili Semplice [R.59]]({{< ref "_index.it.md#R59" >}} "Report Registrazioni Contabile Semplici") <br>
[Setup Sollecito [SS01]]({{< ref "_index.it.md#SS01" >}} "Setup Sollecito") <br>
[Gruppo Pagamenti [GP00]]({{< ref "_index.it.md#GP00" >}} "Gruppo Pagamenti") <br>
[Estratto Contro Bancario [ECB00]]({{< ref "_index.it.md#ECB00" >}} "Estratto Contro Bancario") <br>
[Report Movimenti Bancari [R.70]]({{< ref "_index.it.md#R70" >}} "Report Movimenti Bancari") <br>
[Report Dettagli Pagamenti [R.62]]({{< ref "_index.it.md#R62" >}} "Report Dettagli Pagamenti") <br>
[Riconciliazione Contabile (manuale) [RIC00]]({{< ref "_index.it.md#RIC00" >}} "Riconciliazione Contabile (manuale)") <br>
[Riconciliazione Automatica dei Conti [RAC00]]({{< ref "_index.it.md#RAC00" >}} "Riconciliazione Automatica dei Conti") <br>
[Esegui Trasferimento Bancario [ETB00]]({{< ref "_index.it.md#ETB00" >}} "Esegui Trasferimento Bancario") <br>
[Quadratura Estratto Conto [QEC00]]({{< ref "_index.it.md#QEC00" >}} "Quadratura Estratto Conto") <br>

## Pagamento/Incasso [PI00] {#PI00}
[{{< figure src="/image/PagamentoIncasso.png"  width="850"  >}}](/image/PagamentoIncasso.png)

## Plugin SEPA

## Link esterni

Link wiki idempiere 

[Link/SEPA.xml](http://Link/image/SEPA.xml)


---

## Riferimenti

*link pubblico          : http://wiki.idempiere.org/en/Plugin:_SEPA
*link idempiere italia  : https://bitbucket.org/consulnet/plugin-standard.de.aulersipel.sepapaymentexport
*link jar               : 
*versione idempiere     : idempiere 3.1
*versione zk supportata : 

---

## Descrizione Plugin

```
SEPA Credit Transfer (SCT), evoluzione del servizio di bonifico domestico; 
SEPA Direct Debit (SDD), evoluzione del servizio di addebito diretto domestico RID.
```

3. Codice CUC (Codice Univoco CBI) (stringa 8 caratteri, nullabile): vedi identificativo del creditore 

Per il corretto funzionamento, bisogna avere una banca di default impostata nel Client

[{{< figure src="/image/SEPA_1.png"  width="850"  >}}](/image/SEPA_1.png)


'''Window "Bank>Account":''' in questa tab bisogna dichiarare la classe java per la gestione della creazione del documento SEPA; nel campo'''<pre style="color: green">

```
Payment Export Class
```

</pre>''' dichiarare il nome della classe del plug-in e cioè '''de.aulersipel.util.SEPAPaymentExport_idIta'''. Inoltre bisogna creare un Bank Account Document per farlo eseguire nella maniera corretta il pagamento e generazione del file SEPA; nella creazione impostare il giusto Payment Rule che si vuole applicare ---- Es. "Direct Debit"
<br\>
Prima di avviare l'esportazione del file SEPA, bisogna assicurarsi che il BPartner, a cui fare il pagamento, abbia un bank account impostato. Vedere maschera Business Partner > Bank Account
<br\>

[{{< figure src="/image/SEPA_4.png"  width="850"  >}}](/image/SEPA_4.png)
![image](1200px-SEPA_4.png)<br\>
<br\>

[{{< figure src="/image/SEPA_2.png"  width="850"  >}}](/image/SEPA_2.png)
![image](1200px-SEPA_2.png)<br>
'''Window "Payment Print/Export":''' in questa maschera bisogna dichiarare selezionare il pagamento che si vuole effettuare e la generazione del file SEPA
<br>

[{{< figure src="/image/SEPA_3.png"  width="850"  >}}](/image/SEPA_3.png)
![image](1200px-SEPA_3.png)<br>
'''Window "Payment Selection":''' in questa maschera bisogna si può visualizzare e gestire i pagamenti da effettuare

```
SELECT C_PaySelection.C_PaySelection_ID, 
       NULL,
       NVL(C_PaySelection.Name,'-1'),
       C_PaySelection.IsActive 
FROM C_PaySelection WHERE   
C_PaySelection.C_PaySelection_ID=? AND 
C_PaySelection.AD_Client_ID IN (0,1000008) AND  
(C_PaySelection.C_PaySelection_ID IS NULL OR   C_PaySelection.C_PaySelection_ID )
```



---

## Funzionalità supportate

---

## Installazione Plugin

Installare nella console felix il jar reperibile su [https://bitbucket.org/consulnet/idempiere-download idempiere-download]

---

## Parametrizzazione Plugin

---

## Istruzioni Plugin

---

## Documentazione Tecnica Plugin

Per controllo file xml SEPA, utilizzare il seguente link http://www.cbiservice.com/correttoresepa.php

---

## Modifiche all'AD

### Tables / Windows esistenti

### Nuove Tables /Windows

---

## Funzionalità Future

---

## Errori e bug

---


## FILE SEPA

<CBIPaymentRequest xsi:schemaLocation="urn:CBI:xsd:CBIPaymentRequest.00.03.09 CBIPaymentRequest.00.03.09.xsd">
<GrpHdr>
<MsgId>ubifeb1720170209123243</MsgId>
<CreDtTm>2017-02-09T12:32:43+01:00</CreDtTm>
<NbOfTxs>91</NbOfTxs>
<CtrlSum>634331</CtrlSum>
<InitgPty>
<Nm>nomeAzienda</Nm>
<Id>
<OrgId>
<Othr>
<Id>1338106H</Id>
<Issr>CBI</Issr>
</Othr>
</OrgId>
</Id>
</InitgPty>
</GrpHdr>
<PmtInf>
<PmtInfId>ubifeb1720170209123243</PmtInfId>
<PmtMtd>TRA</PmtMtd>
<PmtTpInf>
<InstrPrty>NORM</InstrPrty>
<SvcLvl>
<Cd>SEPA</Cd>
</SvcLvl>
</PmtTpInf>
<ReqdExctnDt>2017-02-09</ReqdExctnDt>
<Dbtr>
<Nm>nomeAzienda</Nm>
<Id>
<OrgId>
<Othr>
<Id>11323900016</Id>
<Issr>ADE</Issr>
</Othr>
</OrgId>
</Id>
</Dbtr>
<DbtrAcct>
<Id>
<IBAN>ibanazienda</IBAN>
</Id>
</DbtrAcct>
<DbtrAgt>
<FinInstnId>
<ClrSysMmbId>
<MmbId>03111</MmbId>
</ClrSysMmbId>
</FinInstnId>
</DbtrAgt>
<ChrgBr>SLEV</ChrgBr>
<CdtTrfTxInf>
<PmtId>
<InstrId>1</InstrId>
<EndToEndId>ubifeb1720170209123243-0001</EndToEndId>
</PmtId>
<PmtTpInf>
<CtgyPurp>
<Cd>SUPP</Cd>
</CtgyPurp>
</PmtTpInf>
<Amt>
<InstdAmt Ccy="EUR">18.91</InstdAmt>
</Amt>
<Cdtr>
<Nm>nomeAziendaFornitore1</Nm>
<PstlAdr>
<AdrTp>ADDR</AdrTp>
<StrtNm>Indirizzo</StrtNm>
<PstCd>cap</PstCd>
<TwnNm>Localita</TwnNm>
<CtrySubDvsn>prov</CtrySubDvsn>
<Ctry>nazione</Ctry>
</PstlAdr>
</Cdtr>
<CdtrAcct>
<Id>
<IBAN>ibanaziendafornitore</IBAN>
</Id>
</CdtrAcct>
<RmtInf>
<Ustrd>394 29/11/16</Ustrd>
</RmtInf>
</CdtTrfTxInf>
<CdtTrfTxInf>
<PmtId>
<InstrId>2</InstrId>
<EndToEndId>ubifeb1720170209123243-0002</EndToEndId>
</PmtId>
<PmtTpInf>
<CtgyPurp>
<Cd>SUPP</Cd>
</CtgyPurp>
</PmtTpInf>
<Amt>
<InstdAmt Ccy="EUR">903.96</InstdAmt>
</Amt>
<Cdtr>
<Nm>nomeAziendaFornitore1</Nm>
<PstlAdr>
<AdrTp>ADDR</AdrTp>
<StrtNm>Indirizzo</StrtNm>
<PstCd>cap</PstCd>
<TwnNm>Localita</TwnNm>
<CtrySubDvsn>prov</CtrySubDvsn>
<Ctry>nazione</Ctry>
</PstlAdr>
</Cdtr>
<CdtrAcct>
<Id>
<IBAN>ibanaziendafornitore</IBAN>
</Id>
</CdtrAcct>
<RmtInf>
<Ustrd>3389 17/11/16</Ustrd>
</RmtInf>
</CdtTrfTxInf>
</PmtInf>
</CBIPaymentRequest>








## Seleziona Fattura per Pagamento [SPF00] {#SPF00}
[{{< figure src="/image/SelezionaFatturaPerPagamento.png"  width="850"  >}}](/image/SelezionaFatturaPerPagamento.png)
## Selezione Pagamento (manuale) [SEP00] {#SEP00}
[{{< figure src="/image/SelezionePagamentoManuale.png"  width="850"  >}}](/image/SelezionePagamentoManuale.png)
## Crea RIBA e Prima Nota [CRPN00] {#CRPN00}
[{{< figure src="/image/CreaRIBAPrimaNota.png"  width="850"  >}}](/image/CreaRIBAPrimaNota.png)
## Info Registra Incassi [IRI00] {#IRI00}
[{{< figure src="/image/InfoRegistraIncassi.png"  width="850"  >}}](/image/InfoRegistraIncassi.png)
## Info Registra Incassi/Pagamenti da Fattura [IRIF00] {#IRIF00}
[{{< figure src="/image/InfoRegistraIncassiPagamenti.png"  width="850"  >}}](/image/InfoRegistraIncassiPagamenti.png)
## Info Totale RIBA [IR10] {#IR10}
[{{< figure src="/image/IncassoTotaleRIBA.png"  width="850"  >}}](/image/IncassoTotaleRIBA.png)
## Operazione di Pagamento [OP00] {#OP00}
[{{< figure src="/image/OperazioneDIPagamento.png"  width="850"  >}}](/image/OperazioneDIPagamento.png)
## Stampa o Export Pagamento [ODP00] {#ODP00}
[{{< figure src="/image/StampaExportPagamento.png"  width="850"  >}}](/image/StampaExportPagamento.png)
## Accomodamento Pagamento [AP00] {#AP00}
[{{< figure src="/image/AccomodamentoPagamento.png"  width="850"  >}}](/image/AccomodamentoPagamento.png)
## Storno Crediti [STC00] {#STC00}
[{{< figure src="/image/StornoCrediti.png"  width="850"  >}}](/image/StornoCrediti.png)
## Crea Ricavo Obbiettivo Promozioni [CROP00] {#CROP00}
[{{< figure src="/image/CreaRicavoObbiettivoPromozioni.png"  width="850"  >}}](/image/CreaRicavoObbiettivoPromozioni.png)

## Abbinamento
## Allocazione Automatica [ALA00] {#ALA00}
[{{< figure src="/image/AllocazioneAutomatica.png"  width="850"  >}}](/image/AllocazioneAutomatica.png)
## Abb. Pagamento [AP00] {#AP00}
[{{< figure src="/image/AbbinamentoPagamento.png"  width="850"  >}}](/image/AbbinamentoPagamento.png)
## Annulla Allocazione Fattura [AAF00] {#AAF00}
[{{< figure src="/image/AnnullaAllocazioneFattura.png"  width="850"  >}}](/image/AnnullaAllocazioneFattura.png)
## Abbinamento Pagamenti [ABP00] {#ABP00}
[{{< figure src="/image/AbbinamentoPagamenti.png"  width="850"  >}}](/image/AbbinamentoPagamenti.png)
## Report Registrazioni non Riconciliate [R.56] {#R56}
[{{< figure src="/image/ReportRegistrazioniNonRiconciliate.png"  width="850"  >}}](/image/ReportRegistrazioniNonRiconciliate.png)

## Sollecito Pagamento
## Stampa lettere Solleciti [SLS00] {#SLS00}
[{{< figure src="/image/StampaLettereSolleciti.png"  width="850"  >}}](/image/StampaLettereSolleciti.png)
## Elaborazione Sollecito [ELS00] {#ELS00}
[{{< figure src="/image/ElaborazioneSollecito.png"  width="850"  >}}](/image/ElaborazioneSollecito.png)
## Report Registrazioni Contabili Semplice [R.59] {#R59}
[{{< figure src="/image/ReportRegistrazioniContabiliSemplici.png"  width="850"  >}}](/image/ReportRegistrazioniContabiliSemplici.png)

## Setup Ragamenti e Solleciti
## Setup Sollecito [SS01] {#SS01}
[{{< figure src="/image/SetupSollecito.png"  width="850"  >}}](/image/SetupSollecito.png)
## Gruppo Pagamenti [GP00] {#GP00}
[{{< figure src="/image/GruppoPagamenti.png"  width="850"  >}}](/image/GruppoPagamenti.png)


## Cassa e Banca
## Estratto Contro Bancario [ECB00] {#ECB00}
[{{< figure src="/image/EstrattoContoBancario.png"  width="850"  >}}](/image/EstrattoContoBancario.png)
## Report Movimenti Bancari [R.70] {#R70}
[{{< figure src="/image/ReportMovimentiBancari.png"  width="850"  >}}](/image/ReportMovimentiBancari.png)
## Report Dettagli Pagamenti [R.62] {#R62}
[{{< figure src="/image/ReportDettagliPagamenti.png"  width="850"  >}}](/image/ReportDettagliPagamenti.png)
## Riconciliazione Contabile (manuale) [RIC00] {#RIC00}
[{{< figure src="/image/RiconciliazioneContabileManuale.png"  width="850"  >}}](/image/ConfigurazioneContabilita.png)
## Riconciliazione Automatica dei Conti [RAC00] {#RAC00}
[{{< figure src="/image/RiconciliazioneAutomaticaDeiConti.png"  width="850"  >}}](/image/RiconciliazioneAutomaticaDeiConti.png)
## Esegui Trasferimento Bancario [ETB00] {#ETB00}
[{{< figure src="/image/EseguiTrasferimentoBancario.png"  width="850"  >}}](/image/EseguiTrasferimentoBancario.png)
## Quadratura Estratto Conto [QEC00] {#QEC00}
[{{< figure src="/image/QuadraturaEstrattoConto.png"  width="850"  >}}](/image/QuadraturaEstrattoConto.png)
