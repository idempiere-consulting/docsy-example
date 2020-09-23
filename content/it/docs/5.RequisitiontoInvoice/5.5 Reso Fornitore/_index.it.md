---
title: "Reso Fornitore"
date: 2020-04-24T22:47:10+02:00
draft: false
weight : 340
pre: "<b></b>"
---

Menù Idempiere

[RMA Fornitore [RMAF00]]({{< ref "_index.it.md#RMAF00" >}} "RMA Fornitore") <br>
[Info Completa Fatture di Acquisto [ICFA00]]({{< ref "_index.it.md#ICFA00" >}} "Info Completa Fatture di Acquisto") <br>
[Info crea fattura Acquisto da Entrata Merci [ICFAE00]]({{< ref "_index.it.md#ICFAE00" >}} "Info crea fattura Acquisto da Entrata Merci") <br>
[Fatturazione Batch [FB00]]({{< ref "_index.it.md#FB00" >}} "Fatturazione Batch ") <br>
[Controllo Bolla Fattura [CBF00]]({{< ref "_index.it.md#CBF00" >}} "Controllo Bolla Fattura") <br>
[Fattura Abbinata [FABB00]]({{< ref "_index.it.md#FABB00" >}} "Fattura Abbinata") <br>


## RMA Fornitore [RMAF00]
La Maschera permette l'attivazione della procedura di Reso al Fornitore.
[{{< figure src="/image/RMAFornitore.png"  width="850"  >}}](/image/RMAFornitore.png)
## Reso Fornitore [REF00]
La Maschera permette la registrazione della Nota di Accredito del Fornitore.
[{{< figure src="/image/ResoFornitore.png"  width="850"  >}}](/image/ResoFornitore.png)



## Nota di Accredito Fornitore
##  1. Fase d'import file xml

Nell'importazione su tabella I_Invoice (maschera "Importazione Fattura Fornitore XML"), quando leggo il tag relativo all'aliquota IVA, si cerca d'impostare già da subito il C_Tax_ID presente a sistema.
Qui di seguito il codice di riferimento:

```java
MTax tax = new Query(ctx, MTax.Table_Name, "IsDefault='Y' AND Parent_Tax_ID IS NULL AND SOPOType='B' AND Rate=?", null)
.setClient_ID()
.setOnlyActiveRecords(true)
.setParameters(lineaFattura.getAliquotaIVA())
.first();

if(tax!=null)
	i_invoice.setC_Tax_ID(tax.getC_Tax_ID());
else
i_invoice.setTaxIndicator(lineaFattura.getAliquotaIVA().toString());
```

Il filtro di ricerca si basa su 
*"IsDefault='Y' AND Parent_Tax_ID IS NULL AND SOPOType='B' AND Rate=?"*

