---
title: "Provvigioni"
date: 2020-04-24T22:47:10+02:00
draft: false
weight : 240
pre: "<b></b>"
---


Menù Idempiere

[Provvigione [PRV00]]({{< ref "_index.it.md#PRV00" >}} "Provvigione") <br>
[Crea Provvigione [CPRV00]]({{< ref "_index.it.md#CPRV00" >}} "Crea Provvigione") <br>

## Provvigione [PRV00] {#PRV00}
La maschera permette la generazione delle provvigioni sulle fatture.
[{{< figure src="/image/Commissioni0.png"  width="850"  >}}](/image/Commissioni0.png)
## Crea Provvigione [CPRV00] {#CPRV00}
La maschera permette la creazione della fattura da ricevere dall'agente relativa alle provvigioni sulle fatture di vendite del periodo.
[{{< figure src="/image/CreaProvvigione0.png"  width="850"  >}}](/image/CreaProvvigione0.png)

---

## Provvigioni
## Descrizione Plugin


TRADUZIONE 
Commissioni -> Provvigioni  PRO0
Msk Provvigioni :select su BP deve essere solo agenti (rappresentatnti)

Aggiunge 2 processi
CalCommForOrder - it.cnet.idempiere.commissions.process.CommissionCalcForOrder
CalcAllCommissions - it.cnet.idempiere.commissions.process.CalculateAllCommissions

COSA NEGATIVA : deve generare per ogni agente (???) ci vorrebbe un generara tutti gli agenti

FARE REPORT PROVVIGIONI a) revisione report con dettaglio prodotti  B) creare report con riepilogo Documento (no dettaglio prodotti)

Plugin commissioni

[{{< figure src="/image/Commission.png"  width="850"  >}}](/image/Commission.png)

[{{< figure src="/image/Commision_1.png"  width="850"  >}}](/image/Commision_1.png)

## Funzionalità supportate

## Installazione Plugin

Installare nella console felix il jar reperibile su [idempiere-download](https://bitbucket.org/consulnet/idempiere-download)

## Parametrizzazione Plugin

[{{< figure src="/image/CommisionParam.png"  width="850"  >}}](/image/CommisionParam.png)

## Istruzioni Plugin

## Documentazione Tecnica Plugin

### Modifiche all'AD

#### Tables / Windows esistenti

```
 ----------------------
 | C_CommissionDetail |
 ----------------------
 | nome column        | 
 ----------------------
 | AmnLineCommission  | 
 ----------------------
 | AmtMultiplier      | 
 ----------------------
 | AmtSubtract        |
 ----------------------
 | QtyMultiplier      |
 ----------------------
 | QtySubtractor      |  
 ----------------------
 -----------------------------------------
 | Commission Run TAB> Commission Detail |
 -----------------------------------------
 | nome campo          | 
 -----------------------
 | Multiplier Amount   | 
 -----------------------
 | Subtract Amount     | 
 -----------------------
 | Multiplier Quantity | 
 -----------------------
 | Subtract Quantity   | 
 -----------------------
 | Line Commission     | 
 -----------------------
 --------------------------------------
 | Sales Order TAB> Commission Detail |
 --------------------------------------
 | nome processo             | 
 -----------------------------
 | Calc All Commission       | 
 -----------------------------
 | Calc Commission for Order | 
 -----------------------------
```

## Provvigioni di vendita-enasarco 

## SetUp Agente 2018

E' necessario procedere a :

a) inserire un rappresentante in anagrafica in maniera completa di modo che si agganci per creare la proforma della fattura che genererà il sistema e che verrà inviata al rappresentante stesso per ottenerne la sua definitiva eguale.

![](/opt/md/images/Ritenuta acconto ed enasarco/Setupritenutaenasarco_005.png)

sarà necessario inserire il contatto nei record di dettaglio:

![](/opt/md/images/Ritenuta acconto ed enasarco/Setupritenutaenasarco_006.png)

completando l'anagrafica correttamente con i dati a piena pagina:

![](/opt/md/images/Ritenuta acconto ed enasarco/Setupritenutaenasarco_007.png)

inserire anche indirizzo necessario per creazione proforma fattura da inoltrare eventualmente al rappresentante:

![](/opt/md/images/Ritenuta acconto ed enasarco/Setupritenutaenasarco_008.png) 

b) creare un tipo soggetto a ritenuta enasarco con ritenuta acconto 23% ad esempio (ritenuta acconto rappresentanti).

![](/opt/md/images/Ritenuta acconto ed enasarco/Setupritenutaenasarco_009.png)

c) è necessaria quindi una categoria ritenuta acconto 23% (eventualmente da creare).

![](/opt/md/images/Ritenuta acconto ed enasarco/Setupritenutaenasarco_010.png)

d) si procedarà quindi a setuppare nel seguente modo la relativa ritenuta acconto ed enasarco:

![](/opt/md/images/Ritenuta acconto ed enasarco/Setupritenutaenasarco_001.png)

nella seconda tab impostare la regola ritenuta acconto ed enasarco 

![](/opt/md/images/Ritenuta acconto ed enasarco/Setupritenutaenasarco_002.png)

in modo da avere per enasarco la segnuente impostazione:

![](/opt/md/images/Ritenuta acconto ed enasarco/Setupritenutaenasarco_003.png)

e una impostazione ritenuta acconto come segue:

![](/opt/md/images/Ritenuta acconto ed enasarco/Setupritenutaenasarco_004.png)

con le seguenti regole di calcolo:

![](/opt/md/images/Ritenuta acconto ed enasarco/Setupritenutaenasarco_011.png)

per cui a ritenuta acconto nel seguente modo:

![](/opt/md/images/Ritenuta acconto ed enasarco/Setupritenutaenasarco_012.png)

e ritenuta enasarco nel seguente:

![](/opt/md/images/Ritenuta acconto ed enasarco/Setupritenutaenasarco_013.png)

## SetUp Agente 2019

## Procedura Calcolo Provvigioni

Si parte da dati fattura consolidati quindi fatture contabilizzate (generalmente il calcolo che viene fatto è trimestrale). Il menù dove effettuare la procedura è quello delle provvigioni.

![](/opt/md/images/Ritenuta acconto ed enasarco/Setupritenutaenasarco_018.png)

A questo punto utlilizzeremo il rappresentante correttamente settuppato e utilizzeremo un tipo addebito che avremo creato per indirizzare correttamente in contabilità i dati che si andranno a produrre.

Sarà necessario inserire una configurazione a livello linea commissioni che faccia a nostro caso per il tipo di elaborazione che desideriamo (ad esempio la schermata successiva determinerà una provvigione dello 1% sulle fatture dell' agente in testata in base al solo moltiplicatore importo indicato con 0,01).

## Indicazioni per il Setup Agenti

NB: NEL 2019 L'ALIQUOTA CONTRIBUTIVA SARA' DEL 16,50% SARA' QUINDI DA REIMPOSTARE LA PROCEDURA CON TASSI 8,25 CARICO DITTA E 8,25 AGENTE

SI ALLEGANO INDICAZIONI PER CALCOLI ENASARCO 2019.

![](/opt/md/images/Ritenuta acconto ed enasarco/Setupritenutaenasarco_014.png)

![](/opt/md/images/Ritenuta acconto ed enasarco/Setupritenutaenasarco_015.png)

![](/opt/md/images/Ritenuta acconto ed enasarco/Setupritenutaenasarco_016.png)

![](/opt/md/images/Ritenuta acconto ed enasarco/Setupritenutaenasarco_017.png)

DA VERIFICARE FUNZIONAMENTO PROFORMA

