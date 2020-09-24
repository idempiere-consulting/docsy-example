---
title: "Magazzino"
date: 2020-04-24T22:47:10+02:00
draft: false
weight : 520
pre: "<b> </b>"
---
## Carico/Scarico Materiale [CSM00]
La Maschera permette di gestire la movimentazione di carico e scarico da magazzino di un prodotto.
[{{< figure src="/image/CaricoScaricoMateriale.png"  width="850"  >}}](/image/CaricoScaricoMateriale.png)
## Documento di Trasporto - Magazzino [DDTM00]
La Maschera permette di inserire un Documento di Trasporto.
[{{< figure src="/image/DocumentoTrasportoMagazzino0.png"  width="850"  >}}](/image/DocumentoTrasportoMagazzino0.png)
## Genera Storno DDT di Magazzino (IGD13)
La Info Window permette lo storno di un Documento di Trasporto.
[{{< figure src="/image/GeneraStornoDDT.png"  width="850"  >}}](/image/GeneraStornoDDT.png)
## Movimento di Magazzino [MOM00]
La Window Form permette di selezionare i movimenti di Magazzino in base alle proprie esigenze.
[{{< figure src="/image/MovimentodiMagazzino.png"  width="850"  >}}](/image/MovimentodiMagazzino.png)


### documento movimentazioni magazzino (da verificare)

#### [Magazzini di base](#Magazzini di base)

#### [Movimentazione prodotto in uscita a fornitori per Riparazioni Manutenzioni](#Movimentazione prodotto in uscita a fornitori per Riparazioni Manutenzioni)

#### [Movimentazione prodotto in Conto Deposito Fornitore](#Movimentazione prodotto in Conto Deposito Fornitore)

#### [Movimentazione prodotto in conto lavoro Fornitore](#Movimentazione prodotto in conto lavoro Fornitore)

#### [Movimentazione prodotto tra diverse Sedi Aziendali](#Movimentazione prodotto tra diverse Sedi Aziendali)

#### [Movimentazione prodotto ricevuto da clienti per Conto Lavoro](#Movimentazione prodotto ricevuto da clienti per Conto Lavoro)

#### [Movimentazione prodotto ricevuto da clienti in Conto Riparazione](#Movimentazione prodotto ricevuto da clienti in Conto Riparazione)

#### [Movimentazione prodotto in Conto Deposito Clienti](#Movimentazione prodotto in Conto Deposito Clienti)

#### [Movimentazione prodotto in conto visione a clienti](#Movimentazione prodotto in conto visione a clienti)

#### [Movimentazione prodotto in acquisto](#Movimentazione prodotto in acquisto)

#### [Movimentazione prodotto in vendita](#Movimentazione prodotto in vendita)

#### [Implementazioni](#Implementazioni)



#### Magazzini di base

Sono stati impostati i seguenti magazzini di base:

01 Magazzino Sede

02 Magazzino Conto Lavoro Fornitore

03 Magazzino Conto Deposito Fornitore

04 Magazzino Sede Secondaria

05 Magazzino Conto Riparazione Fornitore

11 Magazzino Conto Lavoro Cliente

12 Magazzino Conto Riparazione Cliente

13 Magazzino Conto Deposito Cliente

14 Magazzino Conto Visione Cliente

### Movimentazione prodotto in uscita a fornitori per Riparazioni Manutenzioni

#### [Tipo di operazione](#Tipo di operazione)

#### [Ordine di Riparazione a Fornitore](#Ordine di Riparazione a Fornitore)

#### [Reso Riparato / Entrata Merce](#Reso Riparato / Entrata Merce) 

[Fatturazione o rientro in Garanzia](#Fatturazione o rientro in Garanzia)

<u>*NB: NELLE DOCUMENTAZIONI A FRONTE DI MOVIMENTAZIONI MATERIALI VIENE RICHIESTO IL MAGAZZINO DI PERTINENZA A PRESCINDERE SI TRATTI DI MATERIALE OGGETTO DI RILEVAZIONI MOVIMENTI (PRODOTTO=ARTICOLO) PIUTTOSTO CHE NO (PRODOTTO=TIPO SPESE). CHIARAMENTE I PRODOTTI CODIFICATI COME ARTICOLI RILEVANO MOVIMENTAZIONI FISICHE A MAGAZZINO (ANCHE EVENTUALMENTE COLLEGATE A GESTIONI COSTI) MENTRE I PRODOTTI=TIPO SPESE NON TRACCIANO MOVIMENTAZIONI DI MAGAZZINO.*</u> 

#### [Tipo di operazione](#Tipo di operazione)

#### Tipo di operazione

| Operazione                                                   | Codice | Magazzino Sede | Magazzino Conto Riparazione Fornitore 05 | Ddt       | Fattura |
| ------------------------------------------------------------ | ------ | -------------- | ---------------------------------------- | --------- | ------- |
| Invio prodotto al fornitore in conto riparazione manutenzione in garanzia (no addebito) | CRIGF  | -              | +                                        | Nostro    | -       |
| Reso prodotto riparato in Garanzia (no addebito)             | RRIGF  | +              | -                                        | Fornitore | -       |
| Reso prodotto non riparato in garanzia (no addebito)         | RRINF  | +              | -                                        |           |         |
| Invio prodotto al fornitore in riparazione manutenzione      | CRIAF  | -              | +                                        | Nostro    |         |
| Reso prodotto riparato  (addebito)                           | RRIAF  | +              | -                                        | Fornitore | Si      |
| Rientro prodotto non lavorato                                | RRINF  | +              | -                                        | Fornitore | -       |
| Vendita prodotto direttamente al riparatore                  | FRINF  |                | -                                        |           | Si      |
| Rettifica Inventariale +                                     |        | -              | +                                        | -         | -       |
| Rettifica Inventariale -                                     |        | +              | -                                        | -         | -       |



#### Ordine di Riparazione a Fornitore

Si deve in primis provvedere ad inserire un ordine di riparazione Materiale con tipo documento "Repair Order".

![](../../images/Causali magazzino/Screenshot1_2019-05-08 iDempiere.png)

#### Reso Riparato / Entrata Merce

Eseguita la riparazione da parte del fornitore il fornitore stesso emettarà un Ddt di reso materiale riparato. Si dovrà procedere a caricare il magazzino sede per il rientro del prodotto e avere:

a) evasione dell'ordine di riparazione con seguente registrazione di una fattura da parte del fornitore per la lavorazione se il bene riparato non era "in garanzia"

b) semplicemente carico de nostro magazzino se prodotto in garanzia quindi a cui non segue fattura 

NB: in entrambi i casi vi devono essere la evasione dell'ordine e le corrette movimentazioni di scarico/carico dei magazzini Conto Riparazione Fornitore e Magazzino nostro sede.

  ![](../../images/Causali magazzino/Screenshot2_2019-05-08 iDempiere.png)  

#### Fatturazione o rientro in Garanzia

A seguito dell' entrata merce si deve:

o registrare la fattura del fornitore 

o (se la riparazione è stata eseguita in Garanzia) la procedura è già da considerarsi conclusa

### Implementazioni

.  **Report Ddt movimentazione materiale in uscita in concomitanza emissione ordine conto/riparazione**

.. **Creare Windows per entrata reso riparato con collegamento per evasione ordine riparazione e carico magazzino con successiva se non in garanzia fatturazione della riparazione a seguito Ddt reso fornitore** 

### Movimentazione prodotto in Conto Deposito Fornitore

#### [Tipo di operazione](#Tipo di operazione)

#### Tipo di operazione

| Operazione                                       | Codice | Magazzino Conto Deposito Fornitore 03 | Magazzino Sede 01 | Ddt       | Fattura |
| ------------------------------------------------ | ------ | ------------------------------------- | ----------------- | --------- | ------- |
| Accantonamento Prodotto da Fornitore             | CDEPF  | +                                     |                   |           |         |
| Acquisto prodotto in Conto Deposito da Fornitore | FDEPF  | -                                     | +                 | Fornitore | Sì      |
| Reso Prodotti in Conto Deposito da Fornitore     | RDEPF  | -                                     |                   |           |         |
| Rettifica Inventariale +                         |        | +                                     |                   |           |         |
| Rettifica Inventariale -                         |        | -                                     |                   |           |         |

### Movimentazione prodotto in conto lavoro Fornitore

#### [Tipo di operazione](#Tipo di operazione)

#### Tipo di operazione

| Operazione                               | Codice | Magazzino Sede 01 | Magazzino Conto Lavoro Fornitore | Ddt       | Fattura |
| ---------------------------------------- | ------ | ----------------- | -------------------------------- | --------- | ------- |
| Invio prodotto in Conto Lavoro Fornitore | CLAVF  | -                 | +                                | Nostro    |         |
| Reso prodotto lavorato Fornitore         | RLAVF  | +                 | -                                | Fornitore | Sì      |
| Reso prodotto non lavorato Fornitore     | NLAVF  | +                 | -                                | Fornitore |         |
| Rettifica Inventariale +                 |        | +                 | +                                |           |         |
| Rettifica Inventariale -                 |        | -                 | -                                |           |         |

### Movimentazione prodotto tra diverse Sedi Aziendali

#### [Tipo di operazione](#Tipo di operazione)

#### Tipo di operazione

| Operazione                                         | Codice | Magazzino Sede 01 | Magazzino Sede Secondaria 04 | Ddt  | Fattura |
| -------------------------------------------------- | ------ | ----------------- | ---------------------------- | ---- | ------- |
| Trasferimento da Sede principale a Sede Secondaria | CTRAS  | -                 | +                            | Si   |         |
| Rientro da Sede Secondaria a Sede Principale       | RTRAS  | +                 | -                            | Si   |         |
| Rettifica Inventariale +                           |        | +                 | +                            |      |         |
| Rettifica Inventariale -                           |        | -                 | -                            |      |         |

## Movimentazione prodotto ricevuto da clienti per Conto Lavoro

#### [Tipo di operazione](#Tipo di operazione)

#### Tipo di operazione

| Operazione                                              | Codice | Magazzino Conto Lavoro Cliente 11 |      | Ddt     | Fattura |
| ------------------------------------------------------- | ------ | --------------------------------- | ---- | ------- | ------- |
| Ricevimento da Cliente Materiale da lavorare            | CLAVC  | +                                 |      | Cliente |         |
| Reso a Cliente materiale Lavorato (Fattura Lavorazione) | RLAVC  | -                                 |      | Nostro  | Sì      |
| Reso a Cliente materiale non Lavorato                   | NLAVC  | -                                 |      | Nostro  | No      |
| Rettifica Inventariale +                                |        | +                                 |      |         |         |
| Rettifica Inventariale -                                |        | -                                 |      |         |         |



### Movimentazione prodotto ricevuto da clienti in Conto Riparazione

#### [Tipo di operazione](#Tipo di operazione)

#### Tipo di operazione

| Operazione                                  | Codice | Magazzino Conto riparazione Cliente 12 |      | Ddt     | Fattura |
| ------------------------------------------- | ------ | -------------------------------------- | ---- | ------- | ------- |
| Ricevimento da Cliente prodotto da riparare | CRIAC  | +                                      |      | Cliente |         |
| Reso a cliente Prodotto riparato            | RRIAC  | -                                      |      | Nostro  | Sì      |
| Reso a cliente prodotto non riparato        | RRINC  | -                                      |      | Nostro  | No      |
| Rettifica Inventariale +                    |        | +                                      |      |         |         |
| Rettifica Inventariale -                    |        | -                                      |      |         |         |



### Movimentazione prodotto in Conto Deposito Clienti

#### [Tipo di operazione](#Tipi di operazione)

#### Tipo di operazione

| Operazione                                              | Codice | Magazzino Sede 01 | Magazzino Conto Deposito Cliente 13 | Ddt    | Fattura |
| ------------------------------------------------------- | ------ | ----------------- | ----------------------------------- | ------ | ------- |
| Accantonato prodotto in conto deposito Cliente          | CDEPC  | -                 | +                                   |        |         |
| Invio per vendita prodotto da conto deposito Cliente    | FDEPC  |                   | -                                   | Nostro | Si      |
| Scarico conto deposito Cliente prodotto non più venduto | RDEPC  | +                 | -                                   | Nostro | No      |
| Rettifica Inventariale +                                |        |                   | +                                   |        |         |
| Rettifica Inventariale -                                |        |                   | -                                   |        |         |



### Movimentazione prodotto in conto visione a clienti

[Tipo di operazione](#Tipi di operazione)

Tipo di operazione

| Operazione                                                  | Codice | Magazzino Sede 01 | Magazzino Conto Visione Cliente 14 | Ddt              | Fattura |
| ----------------------------------------------------------- | ------ | ----------------- | ---------------------------------- | ---------------- | ------- |
| Invio prodotto a conto Visione Cliente                      | CVISI  | -                 | +                                  | Nostro           |         |
| Vendita prodotto da conto visione (entro un anno)           | FVISI  |                   | -                                  |                  | Sì      |
| Reso prodotto da conto visione Cliente (entro un anno)      | RVISI  | +                 | -                                  |                  | No      |
| Invio prodotto in conto campionario ad Agente               | CCAMP  | -                 | +                                  | Nostro           |         |
| Vendita prodotto da conto campionario                       | FCAMP  |                   | -                                  |                  | Sì      |
| Reso prodotto da conto campionario                          | RCAMP  | +                 | -                                  | Cliente (Agente) | No      |
| Invio prodtto in prestito d'uso gratuito                    | CPRUG  | -                 | +                                  | Nostro           |         |
| Reso da prestito d'uso gratuito                             | RPRUG  | +                 | -                                  | Cliente          |         |
| Vendita da prestito d'uso gratuito (es. addedito per danno) | FPRUG  |                   | -                                  |                  | Sì      |
| Invio prodotto in prestito d'uso oneroso                    | CPRUA  | -                 | +                                  | Nostro           |         |
| Reso da prestito d'uso oneroso                              | RPRUA  | +                 | -                                  | Cliente          | Sì      |
| Vendita da prestito d'uso oneroso                           | FPRUA  |                   | -                                  |                  | Sì      |
| Invio prodotto in comodato gratuito                         | CCOMG  | -                 | +                                  | Nostro           |         |
| Reso prodotto da comodato grauito                           | RCOMG  | +                 | -                                  | Cliente          |         |
| Vendita da comodato gratuito (piaciuto il prodotto)         | FCOMG  |                   | -                                  |                  | Sì      |
| Invio prodotto conto noleggio                               | CNOLO  | -                 | +                                  | Nostro           |         |
| Reso prodotto conto noleggio                                | RNOLO  | +                 | -                                  | Cliente          | Sì      |
| Rettifica Inventariale +                                    |        | +                 | +                                  |                  |         |
| Rettifica Inventariale -                                    |        | -                 | -                                  |                  |         |

### Movimentazione prodotto in acquisto

#### Tipo di operazione

| Operazione               | Codice | Magazzino Sede 01 |      | Ddt       | Fattura      |
| ------------------------ | ------ | ----------------- | ---- | --------- | ------------ |
| Acquisto prodotto        |        | +                 |      | Fornitore | Sì           |
| Reso prodotto            |        | -                 |      | Nostro    | (Sì N.Accr.) |
| Reso in sostituzione     |        | -                 |      | Nostro    |              |
| Invio in sostituzione    |        | +                 |      | Fornitore |              |
| Rettifica Inventariale + |        | +                 | +    |           |              |
| Rettifica Inventariale - |        | -                 | -    |           |              |

**Acquisto prodotto**

La procedura inizia con invio ordine per materia prima merci

![](/home/idempiere/md/images/Causali%20magazzino/20.png)

salvo l'ordine

![](/home/idempiere/md/images/Causali%20magazzino/21.png)

e genero la movimentazione di magazzino

![](/home/idempiere/md/images/Causali%20magazzino/22.png)

![](/home/idempiere/md/images/Causali%20magazzino/23.png)

avrò anche la registrazione contabile 

![](/home/idempiere/md/images/Causali%20magazzino/24.png)

di seguito genero la fattura d'acquisto 

![](/home/idempiere/md/images/Causali%20magazzino/25.png)

e la completo 

![](/home/idempiere/md/images/Causali%20magazzino/26.png)

![](/home/idempiere/md/images/Causali%20magazzino/28.png)

con la seguente registrazione in contabilità

![](/home/idempiere/md/images/Causali%20magazzino/29.png)

posso anche visualizzare la relativa movimentazione di magazzino (già dal movimento di entrata merce)

![](/home/idempiere/md/images/Causali%20magazzino/30.png)

se poi analizzo tutti i movimenti contabili relativi vedo anche lo storno relativo alla registrazione generata dall' entrata merce (avrei un rilievo di un eventuale delta prezzo tra ordine e fattura)

![](/home/idempiere/md/images/Causali%20magazzino/31.png)

**Reso prodotto**

Vediamo di seguito il reso con anche emissione ordine eventualmente inviabile al fornitore per reintegro merce il menù è  Fornitore RMA FRMA00

![](/home/idempiere/md/images/Causali%20magazzino/1.png)

quindi creo le /le rghe per la merce reso da crea righe avrò cosi i riferimento alla merce caricata in origine a magazzino ed al prezzo e fattura relativi

![](/home/idempiere/md/images/Causali%20magazzino/2.png)

suppongo reso di 50 e modifico la quantità (avevo 1300 impostato come carico iniziale di 2000 per residuo di varie prove)

![](/home/idempiere/md/images/Causali%20magazzino/3.png)

quindi conpleto la transazione

![](/home/idempiere/md/images/Causali%20magazzino/4.png)

Avrò di conseguenza la creazione anche di un ordine da inviare per il reintegro della quantità che vado a rendere

![](/home/idempiere/md/images/Causali%20magazzino/5.png)

Quindi apro la maschera Reso Fornitore REF00 e richiamo la RMA completata

![](/home/idempiere/md/images/Causali%20magazzino/6.png)

![](/home/idempiere/md/images/Causali%20magazzino/7.png)

A questo punto a livello riga faccio nuovo e Mi selezionp la RMA relativa da accreditare (potrebbe essere che devo accreditare più RMA di reso)

![](/home/idempiere/md/images/Causali%20magazzino/8.png)

Quindi completo il processo e con il completamento vado ad aggiornare anche inventario

![](/home/idempiere/md/images/Causali%20magazzino/9.png)

ora posso generare nota di accredito

![](/home/idempiere/md/images/Causali%20magazzino/10.png)

e salvo il documento

![](/home/idempiere/md/images/Causali%20magazzino/11.png)

Avrò la generazione della nota di accredito fornitore relativa

![](/home/idempiere/md/images/Causali%20magazzino/12.png)

con la seguente registrazione di contabilità

![](/home/idempiere/md/images/Causali%20magazzino/13.png)

e a livello movimentazione merci avrò lo scarico del magazzino sede (nel caso) relativa che posso vedere ad esempio da Movimenti di Magazzino MDM00

![](/home/idempiere/md/images/Causali%20magazzino/14.png)



### Movimentazione prodotto in vendita

#### Tipo di operazione

| Operazione                  | Codice | Magazzino Sede 01 |      | Ddt     | Fattura         |
| --------------------------- | ------ | ----------------- | ---- | ------- | --------------- |
| Vendita prodotto            |        | -                 |      | Nostro  | Sì              |
| Omaggio                     |        | -                 |      | Nostro  | Sì Riv.Iva o No |
| Reso prodotto               |        | +                 |      | Cliente |                 |
| Reso in conto sostituzione  |        | +                 |      | Cliente |                 |
| Invio in conto sostituzione |        | -                 |      | Nostro  |                 |
| Rettifica Inventariale +    |        | +                 | +    |         |                 |
| Rettifica Inventariale -    |        | -                 | -    |         |                 |

Vendita prodotto

Si parte come norma da un ordine di vendita

![](/home/idempiere/md/images/Causali magazzino/Causali di Vendita/1.png)

e lo si completa

![](/home/idempiere/md/images/Causali magazzino/Causali di Vendita/2.png)

si genera quindi il Documento di Trasporto

![](/home/idempiere/md/images/Causali magazzino/Causali di Vendita/3.png)

si completa e si salva

![](/home/idempiere/md/images/Causali magazzino/Causali di Vendita/4.png)

cliccando sull' icona stampante si avrà anche il report relativo

![](/home/idempiere/md/images/Causali magazzino/Causali di Vendita/5.png) 

quindi confermo la spedizione

![](/home/idempiere/md/images/Causali magazzino/Causali di Vendita/6.png)

e posso emettere fattura di vendita relativa

![](/home/idempiere/md/images/Causali magazzino/Causali di Vendita/7.png)

andando a viualizzare le registrazioni contabili vedo anche lo storno materie prime per evidenziazione del **<u>COSTO DEL VENDUTO</u>** relativo ai prodotti venduti

![](/home/idempiere/md/images/Causali magazzino/Causali di Vendita/8.png)

e si vede il corretto scarico di magazzino

![](/home/idempiere/md/images/Causali magazzino/Causali di Vendita/9.png)

Reso prodotto

Il primo step è la autorizzazione del reso da cliente quindi entro nel menù relativo Autorizzazione Reso Merci e creo il documento relativo

![](/home/idempiere/md/images/Causali magazzino/Causali di Vendita/20.png)

ho richiamto da **crea linee da** cosi ho il richiamo alla spedizione a cui fa capo il reso e indicato il quantitativo effettivamente che mi sarà reso (la spedizione era 100 ho supposto 50). Completo il documeto e mi apparirà un tab per la creazione di un ordine di vendita per la sostituzione della merce.

![](/home/idempiere/md/images/Causali magazzino/Causali di Vendita/21.png)

Dalla rotellina di elaborazioni vado a generare il reso del cliente

![](/home/idempiere/md/images/Causali magazzino/Causali di Vendita/22.png)

e vado a creare la relativa nota di accredito al Cliente

![](/home/idempiere/md/images/Causali magazzino/Causali di Vendita/23.png)

e a completarla

![](/home/idempiere/md/images/Causali magazzino/Causali di Vendita/24.png)

avrò la seguente registrazione contabile 

![](/home/idempiere/md/images/Causali magazzino/Causali di Vendita/25.png)

il movimento di ricarico a magazzino si potrà anche correttamente vedere da movimenti di magazzino

![](/home/idempiere/md/images/Causali magazzino/Causali di Vendita/26.png)

Se ho generato un ordine anche per il reintegro chiaramente vado a procedere con il suo completamento e la fatturazione a seguito

![](/home/idempiere/md/images/Causali magazzino/Causali di Vendita/27.png)

![](/home/idempiere/md/images/Causali magazzino/Causali di Vendita/28.png)

quindi procederò come consueto con generazione Ddt e alla generazione della successiva fattura.

![](/home/idempiere/md/images/Causali magazzino/Causali di Vendita/29.png) 

con i seguenti rilievi contabili e di movimentazione magazzino

![](/home/idempiere/md/images/Causali magazzino/Causali di Vendita/30.png)

![](/home/idempiere/md/images/Causali magazzino/Causali di Vendita/31.png)

## Info Giacenza Prodotto [IGM01]
La Info Window permette di ottenere la informazione sulla giacenza del prodotto di un determinato magazzino.
[{{< figure src="/image/InfoGiacenzaProdotto.png"  width="850"  >}}](/image/InfoGiacenzaProdotto.png)
## Transazione di Materiale (uso indiretto) [TDM00]
La MAschera 
[{{< figure src="/image/TransazionediMateriale.png"  width="850"  >}}](/image/TransazionediMateriale.png)
## Info Movimenti Magazzino CLienti [IMMC00]
La Info Window fornisce informazioni sulle movimentazioni del prodotto nel magazzino di un BP.
[{{< figure src="/image/InfoMovimentiMagazinoClienti.png"  width="850"  >}}](/image/InfoMovimentiMagazinoClienti.png)
## Ricrea Quantità Riservata a Magazzino [RSR00]
Il Processo permette di verificare differenze tra quantità riservata a Magazzino e Quantità riservata da ordini Clienti. 
[{{< figure src="/image/RecreateStorageReservation.png"  width="850"  >}}](/image/RecreateStorageReservation.png)
## Spedizioniere [SPE00]
La Maschera permette di codificare lo spedizioniere.
[{{< figure src="/image/Spedizioniere.png"  width="850"  >}}](/image/Spedizioniere.png)


# Gestione Distribuzione
## Crea Movimento da ODD [CMOD00]
Il Processo permette di creare il movimento di magazzino dall'ordine di distribuzione.
[{{< figure src="/image/CreaMovimentidaODD.png"  width="850"  >}}](/image/CreaMovimentidaODD.png)
## Ordine di Distribuzione [ODD00]
@errore
[{{< figure src="/image/Spedizioniere.png"  width="850"  >}}](/image/Spedizioniere.png)
## Report Dettaglio Ordine di Distribuzione [R.45]
Il Report fornisce una stampa del dettaglio dell'ordine di distribuzione.
[{{< figure src="/image/ReportDistributionOrderRetail.png"  width="850"  >}}](/image/ReportDistributionOrderRetail.png)
[{{< figure src="/image/ReportDistributionOrderDetail.png"  width="850"  >}}](/image/ReportDistributionOrderDetail.png)
## Configurazione della Gestione della Distribuzione
Lo Schema evidenzia i rapporti tra menù nella gestione della distribuzione.
[{{< figure src="/image/DistributionManagementSetup.png"  width="850"  >}}](/image/DistributionManagementSetup.png)
## Lista di Distribuzione [DL00]
La Maschera permette di gestire una lista di distribuzione al BP.  
[{{< figure src="/image/ListadiDistribuzione.png"  width="850"  >}}](/image/ListadiDistribuzione.png)
## Rete di Distribuzione [RDD00]
La Maschera permette la gestione di una rete di distribuzione.
[{{< figure src="/image/RetediDistribuzione.png"  width="850"  >}}](/image/RetediDistribuzione.png)
## Genera Movimenti Manuali Distribuzione [GMM00]
@errore
[{{< figure src="/image/Spedizioniere.png"  width="850"  >}}](/image/Spedizioniere.png)
## Crea Piano di Distribuzione [CPD00]
Il Processo permette la creazione di un piano di distribuzione in base alla lista degli ordini di distribuzione stessi. 
[{{< figure src="/image/DistributionRunOrders.png"  width="850"  >}}](/image/DistributionRunOrders.png)
## Elaborazione distribuzione [ED00]
La Maschera permette la creazione di un Ordine di Distribuzione.
[{{< figure src="/image/ElaboraDistribuzioni.png"  width="850"  >}}](/image/ElaboraDistribuzioni.png)
## Ordine di Distribuzione [DOR00]
@errore
[{{< figure src="/image/Spedizioniere.png"  width="850"  >}}](/image/Spedizioniere.png)

# Ordine di Distribuzione 


Jump to: [navigation](http://192.168.178.102/index.php/Ordine_di_Distribuzione#column-one), [search](http://192.168.178.102/index.php/Ordine_di_Distribuzione#searchInput)

---

## Distribution Order

Presente nel plugin di **Libero Manufacturing**

---

## Generare l'Ordine di Distribuzione da Replenish Report

Vogliamo spostare il materiale da Magazzino Principale "*Magazzino Centrale Distr.*" a --> "*Magazzino Destinazione*" (1 o più magazzini di destinazione)

Vediamo i passaggi:


1) Nel Business Partner dobbiamo linkare l'organizzazione (Processo Link  Organization) di dove sono situati i miei magazzini (in questo esempio  colleghiamo il BP:Trade SRL all'organizzazione Trade). Quindi, quando  generiamo l'Ordine di Distribuzione dal "Replenish Report" viene  automaticamente inserito il Business Partner "Trade SRL"

![ODD.png](/image/DistributionOrder-ODD.png)



2) Andiamo ad impostare i nostri magazzini di Destinazione (che  possono essere esempio dei punti vendita). Vediamo un esempio di come  deve essere parametrizzato il magazzino di destinazione:

![ODD1.png](/image//image/DistributionOrder-ODD1.png)



3) Andiamo nella Tab Replenish del Prodotto ed inseriamo il Magazzino  di Destinazione (altrimenti l'Ordine di Distribuzione non verrà creato)

![ODD2.png](/image/DistributionOrder-ODD2.png)



4) Andiamo nel Replenish Report e creiamo il nostro Ordine di  Distribuzione (impostiamo come Magazzino il Magazzino di Destinazione)

![ODD3.png](/image/DistributionOrder-ODD3.png)


5)Bene, adesso il nostro Ordine di Distribuzione è stato creato. Quello che dobbiamo fare è:

```
-andiamo nell'Ordine di Distribuzione appena generato e confermiamo la Quantità nelle Linee (campo Confirmed Quantity inizialmente impostato a 0), inseriamo una quantità <> 0
-completiamo di documento
```

![ODD4.png](/image/DistributionOrder-ODD4.png)

**ATTENZIONE**: vogliamo o no tener conto della Giacenza del magazzino Centrale?

```
- Delivery Rule --> Availability (Nel nostro esempio: il prodotto "Havana" ha una giacenza nel magazzino di 300 unità, nel caso non ci fosse ricorda di fare un PHYSICAL INVENTORY)
- Delivery Rule --> Force(*)  (Non tiene conto della giacenza nel magazzino centrale e quindi lo forza sia che sia 0, sia che sia negativo)
```

*modificata classe Java  "org.libero.process.MovementGenerate" (da riga 561 a 578 ) -->  aggiunto if (!force) in modo che venga generato l'Inventory Move anche  se non c'è giacenza a magazzino (dimenticato e scopiazzato dalla classe  InOutGenerate del core)*



6)Dopo aver completato l'Ordine di Distribuzione possiamo adesso  generare il "Documento di Trasporto - Magazzino" (Inventory Move).  Andiamo nel processo Generate Movement e creiamo il nostro DDT. Settare  il Magazzino Centrale nel Warehouse.

![ODD5.png](/image/DistributionOrder-ODD5.png)



7) Bene, in nostro Documento di Trasporto-Magazzino (Inventory Move) è stato generato. Completiamo

![ODD7.png](/image/DistributionOrder-ODD7.png)


8) Se adesso andiamo nelle transazioni del nostro prodotto "Havana"  possiamo vedere lo spostamento che è stato effettuato da un magazzino  all'altro

![ODD6.png](/image/DistributionOrder-ODD6.png)

---

## Info Window - Generate Movement Inventory Move

Abbiamo Aggiunto al Plugin di Libero Manufacturing una Info Window che Genera Movimenti(DDT-Magazzino)

In questa Info Window possiamo selezionare gli Ordini di  Distribuzione Completati e che si possono movimentare (a differenza del  processo Generate Movement precedentemente descritto che lo fa per tutti  gli ordini di Distribuzione del Magazzino Selezionato)

![ODD8.png](/image/DistributionOrder-ODD8.png)


## Costo del Prodotto a Standard e Medio Fattura



# Conferme Magazzino e Report 
## Conferma Spedizione/Ricevimento [CASR00]
La Maschera permette l'iserimento dei dati relativi alla Spedizione/Ricevimento dei prodotti.
[{{< figure src="/image/ConfermaSpedizioneRicevimento0.png"  width="850"  >}}](/image/ConfermaSpedizioneRicevimento0.png)
## Conferma Movimentazione [CONM00]
La Maschera permette la confrma del processo di movimentazione dei prodotti.
[{{< figure src="/image/ConfermaMovimentazione0.png"  width="850"  >}}](/image/ConfermaMovimentazione0.png)

# Report Conferma Movimento Materiali
## Report Dettagli Conferme Aperte [R.30]
Il Report permette una stampa del dettaglio della conferma spedizione ancora aperta. 
[{{< figure src="/image/ReportDettagliConfermeSpedizione.png"  width="850"  >}}](/image/ReportDettagliConfermeSpedizione.png)
## Report Conferme Aperte [R.31]
Il Report permette una stampa della conferma spedizione ancora aperta.
[{{< figure src="/image/ReportConfermeAperte.png"  width="850"  >}}](/image/ReportConfermeAperte.png)
[{{< figure src="/image/ReportConfermeAperte1.png"  width="850"  >}}](/image/ReportConfermeAperte1.png)

# Report Magazzino
## Report Giacenza per prodotto
Il Report permette una stampa della giacenza a magazzino per prodotto.
[{{< figure src="/image/ReportGiacenzaperProdotto.png"  width="850"  >}}](/image/ReportGiacenzaperProdotto.png)
[{{< figure src="/image/ReportGiacenzaPerProdotto1.png"  width="850"  >}}](/image/ReportGiacenzaPerProdotto1.png)
## Report Dettagli transazioni [R.29]
Il Report permette una stampa dettagliata della transazione del prodotto.
[{{< figure src="/image/ReportdiDettagliosulleTransazioni.png"  width="850"  >}}](/image/ReportdiDettagliosulleTransazioni.png)
[{{< figure src="/image/ReportDettagliTransazioni.png"  width="850"  >}}](/image/ReportDettagliTransazioni.png)
## Deport Totali transazioni di prodotto [R.27]
Il Report permette una stampa del totale prodotto movimentato per magazzino.
[{{< figure src="/image/ReportTotaliTransazioni.png"  width="850"  >}}](/image/ReportTotaliTransazioni.png)
[{{< figure src="/image/ReportTotaliTransazioniDiProdotto.png"  width="850"  >}}](/image/ReportTotaliTransazioniDiProdotto.png)
## Report Prodotto "Dove Usato" [R.34]
Il Report permette una stampa nella quale si evince la/le distinte basi dove è utilizzato il prodotto indicato.
[{{< figure src="/image/ReportProdottoDoveUsato.png"  width="850"  >}}](/image/ReportProdottoDoveUsato.png)
[{{< figure src="/image/ReportProdottoDoveUsato1.png"  width="850"  >}}](/image/ReportProdottoDoveUsato1.png)
## Report Valutazione Inventario [R.32]
Il Report permette di ottenere una stampa dell'inventario vaolrizzato "al giorno" in base al listino indicato.
[{{< figure src="/image/ReportValutazioneInventario.png"  width="850"  >}}](/image/ReportValutazioneInventario.png)
[{{< figure src="/image/ReportValutazioneInventario1.png"  width="850"  >}}](/image/ReportValutazioneInventario1.png)
## Report Valore di Transazione del Prodotto [R.28]
Il Report permette di ottenere una stampa del valore della movimentazione di un prodotto.
[{{< figure src="/image/ReportValorediTransazione.png"  width="850"  >}}](/image/ReportValorediTransazione.png)
[{{< figure src="/image/ReportValoreDiTransizioneDelProdotto.png"  width="850"  >}}](/image/ReportValoreDiTransizioneDelProdotto.png)
## Riferimenti dei Materiali [RM00]
Il Report permette di ottenere una stampa del riferimento, del documento di interesse, relativo alla transazione del prodotto.
[{{< figure src="/image/RiferimentideiMateriali.png"  width="850"  >}}](/image/RiferimentideiMateriali.png)
[{{< figure src="/image/RiferimentideiMateriali.png"  width="850"  >}}](/image/RiferimentiDeiMateriali.png)
## Report Giornale di Magazzino [RP.714]
Il Report permette di ottenere una stampa del Giornale di Magazzino.
[{{< figure src="/image/ReportGiornalediMagazzino.png"  width="850"  >}}](/image/ReportGiornalediMagazzino.png)
## Report Dettaglio scorte [RDS00]
Il Report permette di ottenere una stampa dettagliata delle scorte di magazzino.
[{{< figure src="/image/ReportDettaglioScorte1.png"  width="850"  >}}](/image/ReportDettaglioScorte1.png)
[{{< figure src="/image/ReportDettaglioScorte1.png"  width="850"  >}}](/image/ReportDettaglioScorte1.png)


# Setup Magazzino
## Organizzazione magazzino [ORM00]
Il Processo permette di verificare organizzazione e struttura del magazzino di tutte le entità dell'azienda.
[{{< figure src="/image/OrganizzazioneMagazzino.png"  width="850"  >}}](/image/OrganizzazioneMagazzino.png)
## Categoria spesa di trasporto [CSDT00]
La Maschera permette di identificare una categoria di spesa di trasporto.
[{{< figure src="/image/CategoriaSpesadiTrasporto.png"  width="850"  >}}](/image/CategoriaSpesadiTrasporto.png)
## Configurazione Spedizioniere [CS01]
La Maschera permette di collegare uno spedizioniere ad un BP.
[{{< figure src="/image/ConfigurazioneSpedizioniere.png"  width="850"  >}}](/image/ConfigurazioneSpedizioniere.png)
## Configurazione di Trasporto [CDT00]
La Maschera permette di configurare il trasporto al fine di renderlo "tracciabile".
[{{< figure src="/image/ConfigurazioneTrasporto0.png"  width="850"  >}}](/image/ConfigurazioneTrasporto0.png)
## Tipo Ubicazione [TUB00]
La Maschera permette di configurare l'ubicazione in base alla attività stabilita.
[{{< figure src="/image/TipoUbicazione0.png"  width="850"  >}}](/image/TipoUbicazione0.png)
## Configurazione prodotti
Lo Schema evidenzia la relazione tra i menù per una corretta configurazione del prodotto.
[{{< figure src="/image/ConfigurazioneProdotti.png"  width="850"  >}}](/image/ConfigurazioneProdotti.png)
## Processo di Spedizione [PDS00]
La Maschera permette di definire un 
[{{< figure src="/image/ProcessoSpedizione0.png"  width="850"  >}}](/image/ProcessoSpedizione0.png)
## Causale DDT [CAD01]
La Maschera permette di definire una causale identificativa di un Documento di Trasporto.
[{{< figure src="/image/CausaleDDT.png"  width="850"  >}}](/image/CausaleDDT.png)








