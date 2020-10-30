---
title: "Cespite"
date: 2020-04-24T22:47:10+02:00
draft: false
weight : 700
pre: "<b></b>"
---

Menù Idempiere
- Anagrafica e Processi

 Si Visualizza l'Angrafica del Cespite 
[Cespite [CES00]]({{< ref "_index.it.md#CES00" >}} "Cespite") <br>
 Si Crea il Piano di Ammortamento del Cespite
[Creazione Ammortamento Cespite [CASC00]]({{< ref "_index.it.md#CASC00" >}} "Creazione Ammortamento Cespite") <br>
 Si inserisce la Categoria di Appartenenza del Cespite
[Gruppo Cespite [GC00]]({{< ref "_index.it.md#GC00" >}} "Gruppo Cespite") <br>
 Si Gestisce la Consegna del Cespite
[Consegnare Beni Gestiti [CBG00]]({{< ref "_index.it.md#CBG00" >}} "Consegnare Beni Gestiti") <br>
 Si Effettua la Registrazione del Cespite 
[Registrazione [REG00]]({{< ref "_index.it.md#REG00" >}} "Registrazione") <br>

- Report

 Si ottengono informazioni sulle Movimentazioni del Cespite ceduto al Cliente 
[Report Consegnare Bene Gestito [R.78]]({{< ref "_index.it.md#R78" >}} "Report Consegnare Bene Gestito") <br>
 Si ottengono informazioni riassuntive per periodo sulla movimentazione del Cespite al Cliente.
[Report Consegna Bene Gestito Mensili [R.77]]({{< ref "_index.it.md#R77" >}} "Report Consegna Bene Gestito Mensili") <br>
 Si ottengono informazioni dul Cespite presso un Cliente
[Report Bene Gestito Cliente [R.79]]({{< ref "_index.it.md#R79" >}} "Report Bene Gestito Cliente") <br>

- Tabelle e setup

 Si Definisce un Tipo di Ammortamento
[Metodo di Ammortamento [MDA00]]({{< ref "_index.it.md#MDA00" >}} "Metodo di Ammortamento") <br>
 Si Attribuisce un Attirbuto al Cespite
[Registrazione Attributi [REGA00]]({{< ref "_index.it.md#REGA00" >}} "Registrazione Attributi") <br>
 Si Crea un Cespite da un Progetto
[Crea Cespite da Progetto [CCPR00]]({{< ref "_index.it.md#CCPR00" >}} "Crea Cespite da Progetto") <br>
 Si Dismette un Cespite
[Attivazione/Dismissione Cespite [ADC00]]({{< ref "_index.it.md#ADC00" >}} "Attivazione/Dismissione Cespite") <br>
 Si Aggiunge un Cespite
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



### Importazione del Cespite
L'importazione Cespite è generalmente la prima operazione che ci si trova a fare, dovendo caricare il data base storico dei Cespiti aziendali. Tale operazione può essere eseguita "massivamente" da file CSV o attraverso la maschera appunti di Importazione Cespite, le maschere da utilizzare sono le seguenti: 
[{{< figure src="/image/Cespiti-52.png"  width="850"  >}}](/image/Cespiti-52.png)
[{{< figure src="/image/Cespiti-53.png"  width="850"  >}}](/image/Cespiti-53.png)


### Dismissione Cespite
Si segue la stessa procedura dell'acquisto quindi si inserisce un **Ordine di Vendita** e lo si completa.
Da Processo si prosegue in via ordinaria come per un documento di ciclo attivo normale per cui si procede con il **Documento di Trasporto** e (anche contemporaneamente) con l'emissione della **Fattura di Vendita**.
Per completare e registrare la Fattura si deve indicare in riga il cespite che si va a vendere.
Ora si richiama la Dismissione (da link in barra fattura) apparirà una videata popolata dei dati relativi al Cespite in oggetto e ai valori di vendita. **Fare attenzione a indicare data Registrazione 01/01/n per completare la registrazione con i dati contabili di fine anno precedente (si otterrà una plusvalenza o minusvalenza relativa a tali dati)**, come di seguito:
[{{< figure src="/image/DismissioneCespite.png"  width="850"  >}}](/image/DismissioneCespite.png)
Si completa la registrazione.

**@Todo**
problema con data registrazione

### Incrementi Manutentivi al Cespite

**<u>Manutenzione straordinaria collegata al Cespite</u>**

**<u>Caso a)Manutenzione straordinaria incrementativa del valore del Cespite</u>**

E' il caso di spese di manutenzione o incrementative di natura straordinaria o che modificano sostanzialmente il valore del cespite stesso e come tali di carattere pluriennale quindi da ammortizzare.
In questo caso si procede come per l'acquisto del cespite primario, quindi:
- Inserimento Ordine di acquisto
- Entrata Merce 
- Fattura di acquisto
- Aggiunta cespite ** **<u>Da Vedere</u>**

In questo momento si andrà a collegare l'acquisto al Cespite originario e come unica indicazione andiamo a inserire la data di registrazione relativa all'immissione in ammortamento (01.01.n oppure 01.07.n se desideriamo avere un ammortamento metà per il periodo di entrata in produzione della manutenzione). 

Inseriamo una fattura per una spesa incrementativa del cespite e/o una manutenzione staordinaria che si intende ammortizzare
[{{< figure src="/image/Cespiti-58.png"  width="850"  >}}](/image/Cespiti-58.png)
Dovremo effettuare una aggiunta Cespite collegando questa registrazione al cespite cui si fa riferimento, quindi Indichiamo in riga fattura il cespite padre. **<u>Si ricorda la necessità di dover effettuare il calcolo dell'ammortamento per il bene iniziale aggiornandolo al mese precedente in modo da effettuare un calcolo corretto degli ammortamenti successivamente generati (regola dell'ammortamento a metà per il primo anno su aggiunta da impostare sull'aggiunta in data inizio ammortamento/entrata produzione 01/01/n o 01/07/n)</u>** 
Nel dettaglio della riga fattura (dopo aver proceduto all'aggiunta cespite) avremo  queste informazioni 
[{{< figure src="/image/Cespiti-59.png"  width="850"  >}}](/image/Cespiti-59.png)
mentre nella tab Aggiunta Cespite del cespite troveremo le informazioni che avremo aggiornato 
[{{< figure src="/image/Cespiti-60.png"  width="850"  >}}](/image/Cespiti-60.png)

**<u>Caso b)Rettifica della Manutenzione straordinaria in negativo (nota di accredito eventuale del fornitore) del valore del Cespite</u>**

- Nota di Accredito a Rettifica fattura del fornitore
- Aggiunta cespite ** **<u>Da Vedere</u>**

Nel caso si debba effetturare una rettifica in diminuzione dell'importo del cespite dovremo procedere con la registrazione di una nota di accredito come di seguito visualizzato
[{{< figure src="/image/Cespiti-61.png"  width="850"  >}}](/image/Cespiti-61.png)
si effettuerà quindi l'Aggiunta Cespite collegando la diminuzioneal cespite relativo e si procederà ai calcoli ammortamenti desiderati.

### Superammortamento
Si effettua l'acquisto del Cespite con la procedura consueta, Ordine di Acquisto, Entrata Merce e Fattura a fronte.
[{{< figure src="/image/CespiteTranspallets.png"  width="850"  >}}](/image/CespiteTranspallets.png)
e si ottiene la Aggiunta del Cespite
[{{< figure src="/image/CespiteTranspallets1.png"  width="850"  >}}](/image/CespiteTranspallets1.png)
In Scheda Cespite si va a indicare il dato del Superammortamento
[{{< figure src="/image/CespiteTranspallets2.png"  width="850"  >}}](/image/CespiteTranspallets2.png)

@Da vedere

### Rivalutazione del Cespite

E' un'operazione stabilita con decreto ministeriale una tantum a seguito di variazioni sostanziali di valori dei beni magari dopo anni, per cui a fronte di valori patrimoniali notevolmente differenti il governo può emanare dei provvedimenti relativi. @Da vedere 



## Ammortamento
### Creazione Ammortamento Cespite [CASC00] {#CASC00}
[{{< figure src="/image/CreazioneAmmortamentoCespite.png"  width="850"  >}}](/image/CreazioneAmmortamentoCespite.png)


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
