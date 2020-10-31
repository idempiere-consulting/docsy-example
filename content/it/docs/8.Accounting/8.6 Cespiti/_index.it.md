---
title: "Cespite"
date: 2020-04-24T22:47:10+02:00
draft: false
weight : 700
pre: "<b></b>"
---

Menù Idempiere
- Anagrafica e Processi

 Visualizzare l'anagrafica del Cespite 
[Cespite [CES00]]({{< ref "_index.it.md#CES00" >}} "Cespite") <br>
 Creare il Piano di Ammortamento del Cespite
[Creazione Ammortamento Cespite [CASC00]]({{< ref "_index.it.md#CASC00" >}} "Creazione Ammortamento Cespite") <br>
 Creare la Categoria di Appartenenza del Cespite
[Gruppo Cespite [GC00]]({{< ref "_index.it.md#GC00" >}} "Gruppo Cespite") <br>
 Gestire la Consegna del Cespite
[Consegnare Beni Gestiti [CBG00]]({{< ref "_index.it.md#CBG00" >}} "Consegnare Beni Gestiti") <br>
 Creare la Registrazione del Cespite 
[Registrazione [REG00]]({{< ref "_index.it.md#REG00" >}} "Registrazione") <br>

- Report

 Ottenere informazioni sulle Movimentazioni del Cespite ceduto al Cliente 
[Report Consegnare Bene Gestito [R.78]]({{< ref "_index.it.md#R78" >}} "Report Consegnare Bene Gestito") <br>
 Ottenere un sunto delle informazioni per periodo sulla movimentazione del Cespite al Cliente.
[Report Consegna Bene Gestito Mensili [R.77]]({{< ref "_index.it.md#R77" >}} "Report Consegna Bene Gestito Mensili") <br>
 Ottenere informazioni sul Cespite presso un Cliente
[Report Bene Gestito Cliente [R.79]]({{< ref "_index.it.md#R79" >}} "Report Bene Gestito Cliente") <br>

- Tabelle e setup

 Creare un Tipo di Ammortamento
[Metodo di Ammortamento [MDA00]]({{< ref "_index.it.md#MDA00" >}} "Metodo di Ammortamento") <br>
 Creare un Attributo del Cespite
[Registrazione Attributi [REGA00]]({{< ref "_index.it.md#REGA00" >}} "Registrazione Attributi") <br>
 Creare un Cespite da un Progetto
[Crea Cespite da Progetto [CCPR00]]({{< ref "_index.it.md#CCPR00" >}} "Crea Cespite da Progetto") <br>
 Creare la Dismissione del Cespite
[Attivazione/Dismissione Cespite [ADC00]]({{< ref "_index.it.md#ADC00" >}} "Attivazione/Dismissione Cespite") <br>
 Creare un nuovo Cespite
[Aggiunta Cespite [ACES00]]({{< ref "_index.it.md#ACES00" >}} "Aggiunta Cespite") <br>

- Funzionalità avanzate


## Cespite [CES00] {#CES00}
La Maschera permette di ottenere tutte le informazioni riguardanti un Cespite Aziendale.
[{{< figure src="/image/Cespite.png"  width="850"  >}}](/image/Cespite.png)


## Creazione Ammortamento Cespite [CASC00] {#CASC00}
**<u>Registrazione dell'Ammortamento</u>**
La maschera che si utilizza generalmente a fine anno per registrare gli ammortamenti è la seguente:
[{{< figure src="/image/AmmortamentoCespite.png"  width="850"  >}}](/image/AmmortamentoCespite.png)
Si Selezionano gli ammortamenti da registrare (normalmente sono quelli dell'anno o esercizio contabile/fiscale in corso), generalmente si procede con abilitazione registrazione riepilogativa si avrà così una registrazione in contabilità "raggruppata" per gruppo cespite/contabile.
[{{< figure src="/image/RegistrazioneAmmortamentoCespite.png"  width="850"  >}}](/image/RegistrazioneAmmortamentoCespite.png)


## Gruppo Cespite [GC00] {#GC00}
[{{< figure src="/image/GruppoCespite.png"  width="850"  >}}](/image/GruppoCespite.png)


## Setup Ammortamento Cespite
### Consegnare Beni Gestiti [CBG00] {#CBG00}
[{{< figure src="/image/ConsegnareBeniGestiti.png"  width="850"  >}}](/image/ConsegnareBeniGestiti.png)
### Registrazione [REG00] {#REG00}
[{{< figure src="/image/Registrazione.png"  width="850"  >}}](/image/Registrazione.png)
### Report Consegnare Bene Gestito [R.78] {#R78}
[{{< figure src="/image/ReportConsegnareBeneGestito.png"  width="850"  >}}](/image/ReportConsegnareBeneGestito.png)
### Report Consegna Bene Gestito Mensili [R.77] {#R77}
[{{< figure src="/image/ReportConsegnareBeneGestitoMensili.png"  width="850"  >}}](/image/ReportConsegnareBeneGestitoMensili.png)
### Report Bene Gestito Cliente [R.79] {#R79}
[{{< figure src="/image/ReportBeneGestitoCliente.png"  width="850"  >}}](/image/ReportBeneGestitoCliente.png)
### Metodo di Ammortamento [MDA00] {#MDA00}
[{{< figure src="/image/MetodofiAmmortamento.png"  width="850"  >}}](/image/MetodofiAmmortamento.png)
### Registrazione Attributi [REGA00] {#REGA00}
[{{< figure src="/image/RegistrazioneAttributi.png"  width="850"  >}}](/image/RegistrazioneAttributi.png)

## Trasferimenti,Suddivisioni e Cessione Cespite
### Crea Cespite da Progetto [CCPR00] {#CCPR00}
[{{< figure src="/image/CreaCespitedaProgetto.png"  width="850"  >}}](/image/CreaCespitedaProgetto.png)
### Attivazione/Dismissione Cespite [ADC00] {#ADC00}
[{{< figure src="/image/AttivazioneDismissioneCespite.png"  width="850"  >}}](/image/AttivazioneDismissioneCespite.png)
### Dismissione Cespite
Si segue la stessa procedura dell'acquisto quindi si inserisce un **Ordine di Vendita** e lo si completa.
Da Processo si prosegue in via ordinaria come per un documento di ciclo attivo normale per cui si procede con il **Documento di Trasporto** e (anche contemporaneamente) con l'emissione della **Fattura di Vendita**.
Per completare e registrare la Fattura si deve indicare in riga il cespite che si va a vendere.
Ora si richiama la Dismissione (da link in barra fattura) apparirà una videata popolata dei dati relativi al Cespite in oggetto e ai valori di vendita. **Fare attenzione a indicare data Registrazione 01/01/n per completare la registrazione con i dati contabili di fine anno precedente (si otterrà una plusvalenza o minusvalenza relativa a tali dati)**, come di seguito:
[{{< figure src="/image/DismissioneCespite.png"  width="850"  >}}](/image/DismissioneCespite.png)
Si completa la registrazione.

**@Todo**
problema con data registrazione



### Aggiunta Cespite [ACES00] {#ACES00}
[{{< figure src="/image/AggiuntaCespite.png"  width="850"  >}}](/image/AggiuntaCespite.png)
