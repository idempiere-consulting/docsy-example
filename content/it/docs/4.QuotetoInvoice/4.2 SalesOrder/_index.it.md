---
title: "Ordini di Vendita"
date: 2020-04-24T22:47:10+02:00
draft: false
weight : 210
pre: "<b></b>"
---
Menù Idempiere

[Offerta/Ordine di Vendita [ODV00]]({{< ref "_index.it.md#ODV00" >}} "Offerta Ordine di Vendita") <br>
[Info Ordine di vendita con Pagamento Anticipato [IOVP00]]({{< ref "_index.it.md#IOVP00" >}} "Info Ordine di vendita con Pagamento Anticipato") <br>
[Ordine Conto Lavoro Attivo Light [CLAL13]]({{< ref "_index.it.md#CLAL13" >}} "Ordine Conto Lavoro Attivo Light") <br>
[Elabora Gruppo di Ordine [EGO00]]({{< ref "_index.it.md#EGO00" >}} "Elabora Gruppo di Ordine") <br>
[Info Completa Ordini di Vendita [ICOV00]]({{< ref "_index.it.md#ICOV00" >}} "Info Completa Ordini di Vendita") <br>
[Crea Ordine di Acquisto dall'Ordine di Vendita [COAOA00]]({{< ref "_index.it.md#COAOA00" >}} "Crea Ordine di Acquisto dall'Ordine di Vendita") <br>
[Riapertura ordine [RIO00]]({{< ref "_index.it.md#RIO00" >}} "Riapertura ordine") <br>
[Crea Ordine di Vendita dall'Ordine di Acquisto [COVOA00]]({{< ref "_index.it.md#COVOA00" >}} "Crea Ordine di Vendita dall'Ordine di Acquisto") <br>
[Conversione Preventivo [COP00]]({{< ref "_index.it.md#COP00" >}} "Conversione Preventivo") <br>
[Crea Ordine/Offerta di Vendita da Modello [CODM12]]({{< ref "_index.it.md#COD12" >}} "Crea Ordine/Offerta di Vendita da Modello") <br>
[Parametrizzazione Modello Ordine [PMO00]]({{< ref "_index.it.md#PMO00" >}} "Parametrizzazione Modello Ordine") <br>
[Configurazione Vendite [CV00]]({{< ref "_index.it.md#CV00" >}} "Configurazione Vendite") <br>
[Tipo Pagamento POS [TPP00]]({{< ref "_index.it.md#TPP00" >}} "Tipo Pagamento POS") <br>
[Origine Offerta [OO00]]({{< ref "_index.it.md#OO00" >}} "Origine Offerta") <br>

## Offerta Ordine di Vendita [ODV00] {#ODV00}
La maschera permette l'inserimento dell'offerta/ordine di vendita. Il documento ancora in stato bozza viene considerato come offerta ovvero ordine non confermato. Nella stampa del report infatto viene interpretato lo stato del documento stesso e compare la dicitura "Offerta" invece che "Conferma d'Ordine" proprio in base allo stato del documento. Questo permette di avere in un' unica maschera sia i preventi che le offerte.

[{{< figure src="/image/OffertaOrdineVendita0.png"  width="850"  >}}](/image/OffertaOrdineVendita0.png)

L'inserimento dell' offerta/ordine richiede pochi dati obbligatori :
- ***organizzazione***: (determinata di default in base all'utente se una sola)[COVOA00]  [link]({{< ref "_index.it.md#COVOA00" >}})
- ***business partner***: (il referente commerciale al quale fa capo il documento)[OO00]  [link]({{< ref "_index.it.md#OO00" >}}) 
- ***tipo documento***: (tipo di documento che si vuole emettere in base al quale verranno successivamente generati processi e creati documenti relativi). 

Il tipo di offerta gestito tramite il campo TIPO DOCUMENTO determina lo sviluppo del processo al suo completamento .
Esistono 8 tipi di documenti che scatenano tipi di processi differenti:

### Tipo Documento 

-  [Ordine Fattura Accompagnatoria Pagata]({{< ref "_index.it.md#TDOFAP" >}})
-  [Ordine Fattura Accompagnatoria]({{< ref "_index.it.md#TDOFA" >}})
-  [Ordine Standard]({{< ref "_index.it.md#TDOS" >}})
-  [Preventivo vincolante]({{< ref "_index.it.md#TDPV" >}})
-  [Preventivo non vincolante]({{< ref "_index.it.md#TDPNV" >}})
-  [Ordine Prepagato]({{< ref "_index.it.md#TDOP" >}})
-  [Scontrino]({{< ref "_index.it.md#TDSC" >}})
-  [Ordine Magazzino]({{< ref "_index.it.md#TDOM" >}})
-  [Ordine Conto Lavoro Attivo]({{< ref "_index.it.md#TDCLA" >}})

#### **Ordine Fattura Accompagnatoria** {#TDOFAP}
Come per ordine a magazzino (dovranno essere presenti merci a stock) e fattura corrispondente.

#### **Ordine Fattura Accompagnatoria** {#TDOFA}
Come per ordine a magazzino (dovranno essere presenti merci a stock) e fattura corrispondente.

#### **Ordine Standard** {#TDOS}
Una volta confermata l'offerta da parte del BP, cambiamo il tipo documento e lo rinominiamo ad ordine standard dopo di che lo completiamo, si potranno cosi stampare i ***Documenti di spedizione DDT00***

#### **Preventivo Vincolante** {#TDPV}
***Un preventivo Vincolante aggiunge un impegno e riserva (a differenza del precedente) il relativo quantitativo merce a Magazzino.***

#### **Preventivo non Vincolante**  {#TDNV}
***Un preventivo non vincolante crea un documento stampabile ed inviabile al cliente senza fare altro.***
Come si inserisce: Semplicemente si indica il BP  (è bene sia il più correttamente schedulato perchè a cascata si riprenderanno i dati inseriti) a cui si dovrà indirizzare ***il preventivo non vincolante***. E' bene indicare il periodo di tempo di valità dell'offerta e i dati fondamentali quali magazzino partenza merce, termini consegna, pagamento ove non indicati nel BP.
In particolare:
1. Regole di consegna.
   - Disponibilità
     (Predefinita). sono permesse spedizioni solo se in presenza di materiali a magazzino. (permette spedizioni parziali)
   - Linea completa o Ordine completo
     Spedizione possibile solo con ordine completo
   - Forza 
     La spedizione è indipendente dalle scorte (possibilità di andare in negativo a magazzino)
   - Manuale
     E' richiesto inserimento manuale delle quantità da spedire
2.  Regole di fatturazione da impostare in BP.
    da impostare a livello BP
   - Dopo Spedizione/Consegna
     Le fatture sono generate solo dopo la consegna delle merci
   - Immediata
     La fattura viene emessa anche in caso la merce non sia stata cosegnata/ancora arrivata al cliente
   - Dopo ordine consegnato
     La fattura viene emessa dopo che l'ordine intero è stato consegnato
   - Da prospetto fatturazione cliente dopo Spedizione
     L'emissione della fattura avviene in base a programma impostato (1volta mese/settimana).
3.  Compilazione BP.
Si conferma la testata e si inseriscono gli articoli o i codici servizi che si andranno a preventivare e si completa. Nel momento in cui riceviamo la conferma dal BP procederemo col riattivare il preventivo e a cambiare in testata il tipo documento a Ordine Standard. Si completa l'ordine e da processo si crea il ***Documento di trasporto DDT00*** dopo di che si proseguirà con la creazione e contabilizzazione della Fattura di Vendita. 

#### **Ordine Prepagato** {#TDOP}
Come per l'ordine a magazzino  completata offerta  e si creerà la fattura corrispondente.

#### **Scontrino** {#TDSC}

#### **Ordine Magazzino** {#TDOM}
Come per il precedente completata offerta andremo da processo a creare il DDT00; la creazione sarà possibile solo se tutte le merci dell'ordine sono a stock.

#### **Ordine Conto Lavoro Attivo** {#TDCLA}
non attivo

**Tabella riassuntiva Tipo Documento**

|ID | Nome<br />Interno |                                                                           | Ordine | Impegno | DDT  | Fattura | Pagam. |
|-  | ---------------   | ------------------------------------------------------------              | :----: | ------- | ---- | ------- | ------ |
|1  | POS Order         | Ordine/Fattura Accompagnatoria Pagata<br />(en) SO / Invoice / Payment<br/>(pt) Ordem de Venda / Fatura / Pagamento   |   SI   |    SI   | SI   |    SI   |   SI   |
|2  | Credit Order      | Ordine /Fattura Accompagnatoria<br />(en) SO / Invoice / Payment<br />(pt) Ordem de Venda / Fatura |   SI   |    SI   |  SI  |    SI   |        | 
|3  | Standard Order    | Ordine Standard<br /> (en) Sale Order<br />(pt) Ordem de Venda            |   SI   |    SI   |      |         |        |
|4  | Binding offer     | Proforma<br />(en) Quotation w/reserve<br />(pt) Cotação c/reserva        |   SI   |    SI   |      |         |        |
|5  | Non binding offer | Preventivo non vincolante<br />(en) Quotation<br />(pt) Cotação           |   SI   |         |      |         |        |
|6  | Prepay Order      | Ordine Prepagato<br />(en) Sale Order w/advance payment<br />(pt)         |        |         |      |         |   SI   |                                      |   |                   |          Ordem de Venda prepago                                           |   SI   |    SI   |      |         |        |
|7  | Scontrino         | Scontrino                                                                 |   SI   |    SI   |  SI  |    SI(*)|        |
|8  | Warehouse Order   | Ordine Magazzino/DDT<br />(en) Sale Order w/Delivery Note <br />(pt) Ordem de Venda c/guia entrega     |   SI   |    SI   |  SI  |         |        | 

<u>I TIPI ORDINI CON IMPEGNO SI:</u>   La riserva dello stock e' attivata solo quando lo stato documento=IN PROGRESS (per mettere in progress un documento utilizzare la funzione DOCUMENT ACTION/PREPARE)
Suggerimento: eventualmente si potrebbe indicare un conto transitorio per tutti questi tipi di ordini di vendita? tipo una cassa vendita e successivamente il contabile va spostando e riconciliando tutti i movimenti?
ID=7
Sicuramente legato al problema rif. ID 1, questo processamento e' da riverificare dopo una riconfigurazione dell'account del business partner.
ID=8
Non lo vedo piu'

### Processi 
- Crea Ordine di Acquisto dall'Ordine di Vendita [COVOA00]  [link]({{< ref "_index.it.md#COVOA00" >}})
-
-
-




#### **Ciclo Attivo : Ordine di Vendita - Documento di Trasporto - Fattura di Vendita** 

##### Modifica Prezzi 
---

##### Modifica Aliquota iva 

---

##### Modifica Quantità 

---
##### Modifica Quantità su ordine completato - non ho il DDT nè la fattura
```
a) Riapro l'ordine eseguendo la sua riattivazione
b) Procedo alla modifica della Quantità
c) Completo nuovamente l'ordine di vendita 
```
##### Modifica Quantità su ordine completato e DDT già emesso - Non ho ancora emesso la fattura

###### ***Ho 1 solo DDT - Quantità completamente evasa*** 
```
Esempio : quantità ordine 6 - DDT quantità 6

 a) Utilizzo Special Editor per modificare l'odv o il ddt    #??? da completare
```
######  ***Ho 1 solo DDT - Quantità parzialmente evasa***

```
Esempio quantità ordine 10 - DDT quantità 5

a) Posso modificare la Quantità sul DDT (Specuak -Editor) e lasciare l'ordine com'era prima
b) Posso eseguire le due modifiche senza relazione tra le stesse
c)
```

###### ***Ho + DDT - Quantità parzialmente o copmletamente evasa***

```
non è permessa nessuna modifica . E' necessario stornare l'odv
```
##### Modifica Quantità su ordine completato e DDT giù emesso - Fattura Emessa

###### ***Ho 1 ODV 1 DDT 1 Fattura  tutto completamento evaso***
```
Caso tipico della Fattura Immediata
a) Eseguo la modifica nella Fattura (Special Editor) ed eseguo una rettifica di magazzino  oppure eseguo la modifica del DDT della quantità (Special Editor)
```

#### **Ciclo Passivo : Ordine di Acquisto - Entrata Merci - Fattura di Acquisto**



#### **Offerta Chiusa Materiale a Magazzino**

---

#### **Offerta Chiusa Materiale con creazione Ord.Acquisto**

---

#### **Offerta Chiusa Servizio una tantum**

---

#### **Offerta Chiusa Servizio a contratto**

---

#### **Offerta Aperta (in economia)**

---

#### **Processo approvazione**

```
a) creazione offerta in stato bozza
b) richiesta approvazione
c) completamento
```

#### **Controllo Offerte**

```
- controllo offerte in stato bozza 
- se l'offerta è scaduta CHIUDERE l'offerte 
- se l'offerta è ancora in validità prolungare la data di validità (?)
- controllo offerte da materiali non inviate
```

```
- controllo offerte servizi non fatturate
```
#### Drop Shipping
 link a documenti esistenti 
 http://www.adempiere.com/Sponsored_Development:_Drop_Ship
 https://idempiere.atlassian.net/browse/IDEMPIERE-2619
 http://www.globalqss.com/wiki/index.php/IDempiere/FullMeeting20150513
 
 prezzi  link LISTINO PREZZI


#### **NOTE INTERNE SU TIPI ELABORAZIONE**

## Info Ordine di Vendita con Pagamento Anticipato [IOVP00] {#IOVP00}
La Info Window mette in evidenza le informazioni relative agli ordini di vendita.
[{{< figure src="/image/InfoOrdinediVendita.png"  width="850"  >}}](/image/InfoOrdinediVendita.png)
## Ordine Conto Lavoro Attivo Light [CLAL13] {#CLAL13}
La maschera permette l'inserimento degli ordini di conto lavoro attivo in modalita 
[{{< figure src="/image/OrdineContoLavoroLight.png"  width="850"  >}}](/image/OrdineContoLavoroLight.png) 
## Elabora Gruppo di Ordine [EGO00] {#EGO00}
Il processo permette di elaborare gruppi di ordini.
[{{< figure src="/image/ElaboraGruppodiOrdineEGO00.png"  width="850"  >}}](/image/ElaboraGruppodiOrdineEGO00.png)
## Info Completa Ordini di Vendita [ICOV00] {#ICOV00}
La Info Window permette di selezionare e completare gli ordini.
[{{< figure src="/image/InfoCompletaOrdinidiVendita.png"  width="850"  >}}](/image/InfoCompletaOrdinidiVendita.png)
## Crea Ordine di Acquisto dall'Ordine di Vendita [COAOA00] {#COAOA00}
Il processo permette di creare ordini di acquisto da ordini di vendita. 
[{{< figure src="/image/CreaOrdinediAcquistoOrdinediVenditaCOVOA00.png"  width="850"  >}}](/image/CreaOrdinediAcquistoOrdinediVenditaCOVOA00.png)
## Riapertura ordine [RIO00] {#RIO00}
Il processo permette di riaprire un ordine già chiuso. 
[{{< figure src="/image/RiaperturaOrdineRIO00.png"  width="850"  >}}](/image/RiaperturaOrdineRIO00.png)
## Crea Ordine di Vendita dall'Ordine di Acquisto [COVOA00] {#COVOA00}
Il processo permette di creare ordini di vendita da ordini di acquisto.
[{{< figure src="/image/CreaOrdinediVenditaOrdinediAcquistoCOVOA00.png"  width="850"  >}}](/image/CreaOrdinediVenditaOrdinediAcquistoCOVOA00.png)
## Conversione Preventivo [COP00] {#COP00}
Il processo permette di convertire un preventivo in un ordine di vendita.
[{{< figure src="/image/ConversionePreventivoCOP00.png"  width="850"  >}}](/image/ConversionePreventivoCOP00.png)
## Crea Ordine/Offerta di Vendita da Modello [CODM12] {#CODM12}
La maschera permette di creare un ordine da un ordine modello.
[{{< figure src="/image/CreaOrdineModelloCODM12.png"  width="850"  >}}](/image/CreaOrdineModelloCODM12.png)
# Setup Ciclo Attivo
## Parametrizzazione Modello Ordine [PMO00] {#PMO00}
La Maschera permette la parametrizzazione dell'ordine in relazione ad un BP.
[{{< figure src="/image/ParametrizzazioneModelloOrdine.png"  width="850"  >}}](/image/ParametrizzazioneModelloOrdine.png)
## Configurazione Vendite [CV00] {#CV00}
Lo Schema evidenzia il rapporto tra menù per la corretta gestione della procedura.
[{{< figure src="/image/ConfigurazioneVendite.png"  width="850"  >}}](/image/ConfigurazioneVendite.png)
## Tipo Pagamento POS [TPP00] {#TPP00}
La Maschera permette di inserire il tipo di pagamento POS.
[{{< figure src="/image/TipoPagamentoPOS.png"  width="850"  >}}](/image/TipoPagamentoPOS.png)
## Origine Offerta [OO00] {#OO00}
La Maschera permette 
[{{< figure src="/image/OrigineOfferta.png"  width="850"  >}}](/image/OrigineOfferta.png)


