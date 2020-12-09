---
title: "Intrastat [INT15]"
date: 2020-04-24T22:47:10+02:00
draft: false
weight : 20
pre: "<b>8.5 </b>"
---
``` 
https://www.agenziadoganemonopoli.gov.it/portale/documents/20182/908833/AllegatoXII.pdf/9cbda9df-dfe5-4e42-ab28-4216df07633f
https://assistenza.agenziadogane.it/SRVS/CGI-BIN/KanaInternet.asp?New,new,kb=tel_dogane_procedura,Solution=dich_dog_tracciato_unif,t=Startup_solution,templateset=tel_dogane_new,Company={B4C786A6-E0AD-4BC4-B71A-6BBABD6A92ED}
https://assistenza.agenziadogane.it/SRVS/CGI-BIN/KanaInternet.asp?New,new,kb=tel_dogane_procedura,solution=verifica_file_scambi_cee,Company={B4C786A6-E0AD-4BC4-B71A-6BBABD6A92ED}
```

```
https://telematici.agenziaentrate.gov.it/Main/Intra.jsp
https://telematico.agenziadoganemonopoli.gov.it/manuali/Tracciati.pdf
http://remotedisk.hextra.it/files/leonardonet/sitoweb/Genera_Intrastat.pdf
```

---

## Introduzione e guida all'intrastat

```
Guida Intrasta (slide) http://www.lombardiapoint.it/files/Guida%20Intrastat%20completa%202015.pdf
Pagina web riferimento  https://www.agenziadoganemonopoli.gov.it/portale/dogane/operatore/servizi-online/intrastat
```

---

## Aziende Soggetti all'intrastat

```
Tutte le aziende che effittuino acquisti e cessione di beni e/o servizi con partner cee 
```

---

## Cos'è l'intrastat

```
E' un insieme di report (2 Testate e 8 dettagli) degli acquisti e cessione di beni e/o servizi
```

---

## Elenco dei Codici Intrastat

```
- elenco CPA    (servizi)
- elenco TARIC  (beni)
```

---

## Dettaglio Elenchi

```
Fatture di Acquisto 
Fatture di Vendita
```

```
1) Vendita Prodotti
2) Resi da Vendita Prodotti
3) Vendita Servizi
4) Resi da Vendita Servizi
5) Acquisto Prodotti
6) Resi da Acquisto Prodotti
7) Acquisto Servizi
8) Resi da Acquisto Servizi
```

```
Programa Dogana : mensile /trimestrale
```

```

```

 * Spese di Trasporto - devo ripartire tra le righe
 * Pallet - codice escluso

```
- Spese di Trasporto - devo ripartire tra le righe
- Pallet - codice escluso
```

```
No Fatture di Anticipo
```
## Dettagli tecnici

### 1.Processo di creazione del file Intrastat

Processo dichiarato a livello di menu "Genera File Intrastat":

[{{< figure src="/image/Intra_1.png"  width="850"  >}}](/image/Intra_1.png)
[{{< figure src="/image/Intra_2.png"  width="850"  >}}](/image/Intra_2.png)

- [x] it.idIta.idempiere.LIT_InvoiceDataVAT.process.GenerateFileIntrastat


### 2.Query esempio di ricerca dati per creazione INTRA

{{% pageinfo %}}
SELECT i.ad_client_id, i.ad_org_id, oi.taxid, i.issotrx, i.c_bpartner_id, i.c_currency_id, i.paymentrule, bp.value AS bpvalue,<br> bp.lit_taxid AS bptaxid, bp.name, <br>
c.countrycode, sum(il.linenetamt) as amt, sum(il.qtyinvoiced*p.Weight) as weight, intra.value, <br>
CASE WHEN p.producttype ='I' THEN 'I' ELSE 'S' END as producttype,<br>
'1' as naturaTrans, 'E' as codConsegna, c1.countrycode as countryCodeDest, sum(il.qtyinvoiced) as qta <br>
FROM c_invoice i <br>
JOIN c_invoiceline il ON i.c_invoice_id = il.c_invoice_id <br>
JOIN c_bpartner bp ON i.c_bpartner_id = bp.c_bpartner_id <br>
JOIN c_bpartner_location bpl ON bp.c_bpartner_id = bpl.c_bpartner_id <br>
JOIN c_location l ON bpl.c_location_id = l.c_location_id <br>
JOIN c_country c ON l.c_country_id=c.c_country_id <br>
JOIN c_bpartner_location bpl1 ON i.c_bpartner_id = bpl1.c_bpartner_id AND bpl1.c_bpartner_location_id=bpl.c_bpartner_location_id <br>
JOIN c_location l1 ON bpl.c_location_id = l1.c_location_id <br>
JOIN c_country c1 ON l1.c_country_id=c1.c_country_id <br>
JOIN ad_orginfo oi ON i.ad_org_id = oi.ad_org_id <br>
JOIN m_product p ON il.m_product_id = p.m_product_id <br>
left join LIT_INTRASTAT Intra ON P.LIT_INTRASTAT_ID=intra.lit_intrastat_id <br>
where i.ad_org_id=1000000 and i.issotrx='Y' and producttype='I' <br>
and i.dateacct >= '2020-06-01 00:00:00+02' and i.dateacct <= '2020-06-30 00:00:00+02' <br>
and c.name!='Italy' and bpl.isbillto='Y' <br>
and il.c_tax_id IN (SELECT C_Tax_ID FROM C_tax WHERE LOWER(Name) LIKE '%art%' and LOWER(Name) LIKE '%41%') <br>
group by i.ad_client_id, i.ad_org_id, i.issotrx, i.c_bpartner_id, i.c_currency_id,i.paymentrule, bp.value, bp.lit_taxid, bp.name,intra.value , oi.taxid, c.countrycode, countryCodeDest, producttype
{{% /pageinfo %}}

# Link di riferimento Intra

Sistema Intrastat: https://www.adm.gov.it/portale/dogane/operatore/servizi-online/intrastat/

Documentazione: https://www.adm.gov.it/portale/-/elenchi-scambi-intracomunitari-di-beni

Software Intrastat: https://www.adm.gov.it/portale/dogane/operatore/software/software-intrastat	


