---
title: "Fattura di Vendita"
date: 2020-04-24T22:47:10+02:00
draft: false
weight : 230
pre: "<b></b>"
---

## Fattura di vendita [FDV00]
La maschera permette l'inserimento delle fatture di vendita.
[{{< figure src="/image/FatturadivenditaFDV00.png"  width="850"  >}}](/image/FatturadivenditaFDV00.png)

## Fattura di Anticipo
## Procedura
Si deve verificare esistenza a piano dei conti di un conto nel passivo Patrimoniale ACCONTI O ANTICIPI da utilizzare in fase di generazione della fattura.

Si procede quindi con l' emissione di un Ordine di Vendita che preveda un acconto e che deve essere assoggettata ad iva a norma di legge del 22%.

Se nel contratto viene previsto un acconto ad es. del 20% si procederà a creare un termine di vendita che indichi questo qualora non esista già.

Al momento del pagamento dell'acconto si provvedera quindi ad emettere la relativa fattura di acconto

Nel momento in cui verrà completata la vendita del bene o del servizio in oggetto si procederà all'emissione della fattura definitiva andando a detrarre l'acconto o gli acconti relativi precedentemente fatturati.

---

## Fattura di Acconto
## Setup
I requisiti per impostare la procedura per una fattura definitiva a seguito di una fattura di acconto (ricordiamo che il ricevimento di una transazione in denaro deve essere fiscalmente fatturato e si deve di conseguenza versare l'Iva relativa), sono i seguenti:

a) inserimento di un prodotto servizio S.Acconto, e la relativa categoria  Prodotto collegata ad Iva ad  Aliquota 22%.

## Procedura
Si procede con l'emissione di una fattura di acconto 

Alla scadenza si procede con la fattura definitiva indicando la riga vendita per il totale della commessa e andando a stornare l'acconto precedentemente fatturato semplicemente indicando in negativo (-1) la quantità in riga e riportando nell'importo l'acconto fatturato a suo tempo

## Fattura a Stato Avanzamento
LIT_InvoiceTerm

```
  3 rate
   - acconto  20%  prodotto acconto
   - sal 1    30%           sal1
   - saldo    50%           saldo 
```

```
Infowindow  
Sulla prima e le n-1 fatture vengono ricopiate le righe con qta 0 e importo 0 
Sull'ultima fattura la qty 1 e prezzo zero
```

# "Fatturazione Elettronica"

## link esterni
https://docs.google.com/spreadsheets/d/1yEO1wISGaw6lprGEOLD8amsxS60i9bYMmO5TZlGl_rw/edit

https://fatturaelettronicaopensource.org/ 

https://www.fatturapa.gov.it/export/fatturazione/it/sperimentazione.htm

## Riferimenti
* link pubblico          : 
* link idempiere italia  : https://bitbucket.org/consulnet/idempiere-ita-plugin - it.cnet.impl.LIT_E_Invoice
* link jar               : 
* versione idempiere     : idempiere 3.1
* versione zk supportata :

## Descrizione Plugin
Questo plugin crea il file in formato xml da inviare a XX come fattura elettrinca denominata Fattura PA.
Processo obbligatorio per i clienti appartenenti alla Pubblica Amministrazion e facoltatativo per le aziende private.
Nel BP è necessario indicare che lo stesso sia un soggetto che richiede l'invio della fattura PA 

```
(probabilmete viene identificato da un codice ....
.. TO BE DEFINED ...
```
La creazione del/dei file xml viene generato da una info window delle fatture che filrano solo i soggetti che richiedono l'invio tramite fattura PA 
```
( copia della info invoice + filtro ) -> Processo "create xml invoice format"
```
## Funzionalità supportate
---
## Installazione Plugin
---
Installare nella console felix il jar reperibile su [https://bitbucket.org/consulnet/idempiere-download idempiere-download]
## Parametrizzazione Plugin
---
A livello System, ricordarsi di
1. Impostare nella Reference_LIST **"LIT_TaxTypeBPPartner_ID"**, nel nuovo campo ***Parameter Value*** alle voce corrispondente, il codice/valori ammessi **FPA12** = fattura verso PA  o **FPR12** = fattura verso privati 

2. Impostare nella Reference_LIST **"_Payment Rule"**, nel nuovo campo ***Parameter Value*** alla voce corrispondente, i codici dei Tipi_Pagamento 

A livello Client, ricordarsi di

1. Creare un Document Sequence con nome "E-Invoice"(per ora obbligatorio così.....per corretto funzionamento plug-in...), e dato che i progressivi ammessi nella fattura PA sono di lunghezza massima 5, impostare nel campo 'Decimal Pattern' il valore --> 00000

2. Duplicare il tipo documento "AR Invoice" e chiamarlo "E-Invoice"(per ora obbligatorio così.....per corretto funzionamento plug-in...) e associare il Document Sequence creato al punto 1

3. Nella maschera dell'Organizzazione > Org Info verificare che siano impostati/valorizzati i campi: **PartitaIVA(Tax ID) - C.F. (National Id Number) - Regime Fiscale(Tax Regime)** . Sono dati importanti per la compilazione della fattura elettronica.

4. Nella maschera del Business Partner, valorizzare il campo **Numero / Indice PA[Number / Index PA --- LIT_FEPA_IPA]** come codice destinatario della Fattura Elettronica ed importante valorizzare, se no la fattura elettronica non è valida; il tipo di codice deve essere un valore valido per la Pubblica Amministrazione o per soggetto privato (vedi sito fatturapa.gov.it) + valorizzare campo **C.F.**, altro dato importante per la fattura elettronica

## Istruzioni Plugin

---
Dalla dashboard principale selezionare la infoWindow **"Sending invoices PA."**  e una volta che si ha l'elenco delle fatture che ci servono, basta selezionare una o più fattura e avviare il processo di generazione.

Il processo creerà il file XML da scaricare e nello stesso tempo, verrà salvato una copia nella maschera**"Folder E-invoices"**

## Documentazione Tecnica Plugin
---
### Modifiche all'AD
Creare un Tabella LIT_E-Invoice  / 
```
DocumentoNo  [100001]
DocType  [E-Invoice]  -> Sequence 
C_Invoice_ID 101
```
```
NomeFile   
DataInvio 
DataInvoiced
```
NELLA TABELLA BP SERVER UN CAMPI IDENTIFICATIVO DELL    LIT_FEPA_IPA - Numero/Indice PA
ADD nel DOCTYPE  : LIT_FEPA_DOCTYPE  "TD01"  
#### Tables / Windows esistenti
# Fattura elettronica
# Indice
## [Argomento](#Argomento)
## [Scadenze](#Scadenze)
## [Stato attuazione](#Stato attuazione)
### Argomento	
[ATTIVAZIONE DELLE PROCEDURE]
### Modalità di attivazione 
fino al 5 novembre era possibile la "messa in delega" per la E-fattura solo tramite intervento diretto del contribuente via Web
a)accedendo tramite le credenziali in Fisconline
b)Spid
c)area riservata con carta CNS
d)presentare modulistica presso Agenzia delle Entrate (riscontrati tempi dilatati)
### Post decreto 5 novembre 2018
col provvedimento in questione sono stati approvati nuovi modelli per conferimento o revoca delle deleghe: 
a) modulo per fattura elettronica
b) modulo per cassetto fiscale
di seguito il link in area riservata di agenzia entrate del 05/11/2018
[Agenzia delle Entrate - Normativa e prassi - 2018 - Novembre 2018 Provvedimenti](https://www.agenziaentrate.gov.it/wps/content/nsilib/nsi/normativa+e+prassi/provvedimenti/2018/novembre+2018+provvedimenti/provvedimento+05112018+deleghe+fatturazione+elettronica+e+cassetto+fiscale)
per cui novità gli intermediari possono ora inserire in Agenzia Entrate le deleghe o 
a) in maniera univoca (delega per delega)
b) massiva
procedura di inserimento deleghe via PEC - invio file contenente elementi essenziali deleghe e copia delle stesse provviste di firma autenticata (art. 63 DPR 600/1973) secondo lo schema da link seguente [link](https://www.agenziaentrate.gov.it/wps/wcm/connect/cff2c187-302b-48a0-be9a-df121cd4d2fb/Schema+file+comunicazione+via+PEC.pdf?MOD=AJPERES&CACHEID=cff2c187-302b-48a0-be9a-df121cd4d2fb) le cui istruzioni di creazione sono di seguito riportate [link](https://www.agenziaentrate.gov.it/wps/wcm/connect/47359ac5-737f-4ed3-a59e-ae4f265f8261/Istruzioni+compilazione+file+comunicazione+via+PEC.pdf?MOD=AJPERES&CACHEID=47359ac5-737f-4ed3-a59e-ae4f265f8261)
sono presenti comunque i tipi di modulistica previsti nella vecchia versione:
a) possibilità consultazione acquisizione delle fatture elettroniche e dei loro duplicati
B) duplicati informatici delle fatture
b) consultazione dati rilevanti IVA
c) registrazione dell'indirizzo telematico e generazione QR code 
d) fatturazione elettronica e conservazione fatture elettroniche
e) accreditamento e censimento dispositivi
E' ORA FISSATO CHE: OGNI DELEGA DEVE ESSERE CONFERITA AD UN MASSIMO DI 4 SOGGETTI E LA DURATA SALVO REVOCA E' DI DUE ANNI.

## RILIEVI 
### Importanza del codice destinatario
   E' un elemento obbligatorio del file formato xml in quanto identifica il canale di trasmissione scelto dal CESSIONARIO/COMMITTENTE per cui il CEDENTE/PRESTATORE deve conoscere tale inforazione prima dell'emissione della fattura 
### Codice destinatario
Il campo del tracciato deve contenere un codice alfanumerico di 7 caratteri corrispondenti:
a) uno dei codici attribuiti dal SDI ai soggetti accreditati in ricezione (Web-service o FTP)
b) 0000000 nel caso di fattura destinata a chi opta per ricezione via PEC e questa sia indicata nel campo PECDestinatario
c) 0000000 nel caso di fattura destinata a soggetto di cui non si conosce canale telematico (PEC o altro)
d) XXXXXXX nel caso di fatture verso non residenti sia comunitari che non (inviata facoltativamente allo SDI)
### Volumi di fatturazione
a) in caso di volumi ridotti consigliato uso della PEC non servirà richiesta accreditamento codice destinatario sarà di 7 zeri
b) in caso di richiesta di accreditamento si ottiene un codice e si crea un canale telematico dedicato  (FTP o Web-Service) con il SDI. per attivare ciò serve stipulare un "accordo di servizio" col il SDI attraverso una richiesta di accreditamento  in aiuto modulo  sul sito www.fatturapa.gov.it con specifiche tecniche  seguenti provvedimento Agenzia delle Entrate del 30.04.2018
### PEC 
il canale accreditato (FTP o Web-Service) non deve essere necessariamente corrispondente all'operatore che emette/riceve la fattura ma può essere utilizzato per uno o più intermediari
### Ciclo passivo
è necessario inviare il proprio codice destinatario ai propri fornitori. Qui viene in aiuto utility della Agenzia delle Entrate "la registrazione dell'indirizzo telematico" reperibile nel sito Agenzia delle entrate sotto Fatture e corrispettivi. In tal modo il SDI verrà ad avere segnalazione del l'indirizzo ove si riceveranno le Fatture Elettroniche (tal indirizzo sarà prevalente qualunque sia quello riportato sull'xml dal cedente)
### Sintesi controlli effettuati dallo SDI 
a) se il soggetto ricevente ha registrato l'indirizzo telematico ove ricevere le fatture elettroniche provvede di conseguenza
b) se nel file fattura è valorizzato un codice destinatario provvede di conseguenza
c)se codice destinatario = 0000000 ed è valorizzata PECDestinatario invio a casella PEC 
d) se non valorizzata PECDestinatario SDI mette a disposizione file nell'area autenticata dei servizi telematici del cessionario/committente
### Impossibilità di recapito
se è imossibile recapitare la fatture SDI invierà ricevuta di impossibilità di recapito. Il cedente/prestatore dovrà per vie diverse dal SDI comunicare al cessionario/committente che l'originale della fatture elettronica è aa disposizione nell'area riservata dell'Agenzia delle Entrate. In tal caso la fattura risulterà correttamente emessa dal cedente/prestatore ma l'IVA sarà detraibile dal cessionario/committente solo al momento della presa visione del file nell'area riservata.  

## Fattura Elettronica  Plugin iDempiere
Troubleshooting  d

FPR12  

FPA12

| TD01 | fattura                      |
| ---- | ---------------------------- |
| TD02 | acconto/anticipo su fattura  |
| TD03 | acconto/anticipo su parcella |
| TD04 | nota di credito              |
| TD05 | nota di debito               |
| TD06 | parcella                     |

| **<RegimeFiscale>** |                                                              |
| ------------------- | ------------------------------------------------------------ |
| **RF01**            | Ordinario                                                    |
| **RF02**            | Contribuenti minimi (art.1, c.96-117, L. 244/07)             |
| **RF04**            | Agricoltura e attività connesse e pesca (artt.34 e 34-bis, DPR 633/72) |
| **RF05**            | Vendita sali e tabacchi (art.74, c.1, DPR. 633/72)           |
| **RF06**            | Commercio fiammiferi (art.74, c.1, DPR  633/72)              |
| **RF07**            | Editoria (art.74, c.1, DPR  633/72)                          |
| **RF08**            | Gestione servizi telefonia pubblica (art.74, c.1, DPR 633/72) |
| **RF09**            | Rivendita documenti di trasporto pubblico e di sosta (art.74, c.1, DPR  633/72) |
| **RF10**            | Intrattenimenti, giochi e altre attività di cui alla tariffa allegata al DPR 640/72 (art.74, c.6, DPR 633/72) |
| **RF11**            | Agenzie viaggi e turismo (art.74-ter, DPR 633/72)            |
| **RF12**            | Agriturismo (art.5, c.2, L. 413/91)                          |
| **RF13**            | Vendite a domicilio (art.25-bis, c.6, DPR  600/73)           |
| **RF14**            | Rivendita beni usati, oggetti d’arte, d’antiquariato o da collezione (art.36, DL 41/95) |
| **RF15**            | Agenzie di vendite all’asta di oggetti d’arte, antiquariato o da collezione (art.40-bis, DL 41/95) |
| **RF16**            | IVA per cassa P.A. (art.6, c.5, DPR 633/72)                  |
| **RF17**            | IVA per cassa (art. 32-bis, DL 83/2012)                      |
| **RF18**            | Altro                                                        |
| **RF19**            | Regime forfettario (art.1, c.54-89, L. 190/2014)             |

| **<TipoCassa>** |                                                              |
| --------------- | ------------------------------------------------------------ |
| **TC01**        | Cassa nazionale previdenza e assistenza avvocati e procuratori legali |
| **TC02**        | Cassa previdenza dottori commercialisti                      |
| **TC03**        | Cassa previdenza e assistenza geometri                       |
| **TC04**        | Cassa nazionale previdenza e assistenza ingegneri e architetti liberi professionisti |
| **TC05**        | Cassa nazionale del notariato                                |
| **TC06**        | Cassa nazionale previdenza e assistenza ragionieri e periti commerciali |
| **TC07**        | Ente nazionale assistenza agenti e rappresentanti di commercio (ENASARCO) |
| **TC08**        | Ente nazionale previdenza e assistenza consulenti del lavoro (ENPACL) |
| **TC09**        | Ente nazionale previdenza e assistenza medici (ENPAM)        |
| **TC10**        | Ente nazionale previdenza e assistenza farmacisti (ENPAF)    |
| **TC11**        | Ente nazionale previdenza e assistenza veterinari (ENPAV)    |
| **TC12**        | Ente nazionale previdenza e assistenza impiegati dell'agricoltura (ENPAIA) |
| **TC13**        | Fondo previdenza impiegati imprese di spedizione e agenzie marittime |
| **TC14**        | Istituto nazionale previdenza giornalisti italiani (INPGI)   |
| **TC15**        | Opera nazionale assistenza orfani sanitari italiani (ONAOSI) |
| **TC16**        | Cassa autonoma assistenza integrativa giornalisti italiani (CASAGIT) |
| **TC17**        | Ente previdenza periti industriali e periti industriali laureati (EPPI) |
| **TC18**        | Ente previdenza e assistenza pluricategoriale (EPAP)         |
| **TC19**        | Ente nazionale previdenza e assistenza biologi (ENPAB)       |
| **TC20**        | Ente nazionale previdenza e assistenza professione infermieristica (ENPAPI) |
| **TC21**        | Ente nazionale previdenza e assistenza psicologi (ENPAP)     |
| **TC22**        | INPS                                                         |

SELECT name,ParameterValue FROM AD_Ref_List 
WHERE 
AD_Reference_ID IN 
(SELECT AD_Reference_ID FROM AD_Reference WHERE Name = '_Payment Rule')

"Mixed POS Payment";""
"Direct Deposit";"MP05"
"Check";"MP02"
"Cash on delivery ";""
"RID";"MP09"
"Cash";"MP01"
"Credit Card";"MP08"
"On Credit";"MP05"
"Direct Debit";"MP05"

| **<ModalitaPagamento>** |                                            |
| ----------------------- | ------------------------------------------ |
| **MP01**                | contanti                                   |
| **MP02**                | assegno                                    |
| **MP03**                | assegno circolare                          |
| **MP04**                | contanti presso Tesoreria                  |
| **MP05**                | bonifico                                   |
| **MP06**                | vaglia cambiario                           |
| **MP07**                | bollettino bancario                        |
| **MP08**                | carta di pagamento                         |
| **MP09**                | RID                                        |
| **MP10**                | RID utenze                                 |
| **MP11**                | RID veloce                                 |
| **MP12**                | RIBA                                       |
| **MP13**                | MAV                                        |
| **MP14**                | quietanza erario                           |
| **MP15**                | giroconto su conti di contabilità speciale |
| **MP16**                | domiciliazione bancaria                    |
| **MP17**                | domiciliazione postale                     |
| **MP18**                | bollettino di c/c postale                  |
| **MP19**                | SEPA Direct Debit                          |
| **MP20**                | SEPA Direct Debit CORE                     |
| **MP21**                | SEPA Direct Debit B2B                      |
| **MP22**                | Trattenuta su somme già riscosse           |

| Codice   | Tipi di Documento            |
| -------- | ---------------------------- |
| **TD01** | Fattura                      |
| **TD02** | acconto/anticipo su fattura  |
| **TD03** | acconto/anticipo su parcella |
| **TD04** | nota di credito              |
| **TD05** | nota di debito               |
| **TD06** | parcella                     |

| Codice | VOCI NATURA                                                  |
| ------ | ------------------------------------------------------------ |
| **N1** | Escluso Art. 15 DPR 633/72                                   |
| **N2** | Fuori campo IVA Art. 2 DPR 633/72                            |
| **N3** | non imponibili                                               |
| **N4** | Esente Art. 10 DPR 633/72                                    |
| **N5** | Escluso Art. 74 DPR 633/72<                                  |
| **N6** | Reverse charge Art. 17 DPR 633/72<br />inversione contabile (per le operazioni in reverse charge ovvero nei casi di autofatturazione per acquisti extra UE di servizi ovvero per importazioni di beni nei soli casi previsti) |
| **N7** | Vendite a distanza Art. 40/41 DL 331/93<br />IVA assolta in altro stato UE (vendite a distanza ex art. 40 c. 3 e 4 e art. 41 c. 1 lett. b,  DL 331/93; prestazione di servizi di telecomunicazioni, tele-radiodiffusione ed elettronici ex art. 7-sexies lett. f, g, art. 74-sexies DPR 633/72) |


## Crea fattura di vendita (manuale) [CFVM00]
La Info Form permette di selezionare più documenti, completarli e/o elaborarli e generare le fatture di vendita. 
[{{< figure src="/image/CreaFatturaVenditaManuale.png"  width="850"  >}}](/image/CreaFatturaVenditaManuale.png)
## Crea fattura di vendita [CFV00]
Il processo permette di selezionare completare e creare la fattura di vendita singolarmente per Business Partner. 
[{{< figure src="/image/CreaFatturadivenditaCFV00.png"  width="850"  >}}](/image/CreaFatturadivenditaCFV00.png)
## Info crea fattura ad avanzamento [ICFVA12]
La Info Window permette di creare la fattura in base a stati di avanzamento per un Business Partner.  
[{{< figure src="/image/InfoCreaFatturaAvanzamento.png"  width="850"  >}}](/image/InfoCreaFatturaAvanzamento.png)
## Info crea fattura da DDT [ICFDT00]
La Info Window permette di creare la fattura. 
[{{< figure src="/image/InfoCreaFatturaDDT.png"  width="850"  >}}](/image/InfoCreaFatturaDDT.png)
## Info completa fatture di vendita [ICOFV00]
La Info Window permette di completare la fattura.
[{{< figure src="/image/InfoCompletaFatturadivendita.png"  width="850"  >}}](/image/InfoCompletaFatturadivendita.png)
## Info crea autofattura da DDT [ICFDT00]
La Info Window permette di creare Autofatture a seguito di cessioni promozionali omaggio.
[{{< figure src="/image/InfoCreaAutofatturaDDT.png"  width="850"  >}}](/image/InfoCreaAutofatturaDDT.png)
# Omaggi

## Omaggi a Terzi di Beni NON rientranti nell’attività propria dell’impresa

I  costi sostenuti per l’acquisto di Beni, ceduti gratuitamente a terzi,  la cui produzione od il cui scambio NON rientra nell’attività propria  dell’impresa sono:

**<u>integralmente deducibili dal reddito di impresa nel periodo di sostenimento, se di valore unitario non superiore ad euro 50</u>**

- qualificati come **spese di rappresentanza** (C.M. n. 188/E/1998).

In merito alle **spese di rappresentanza** che l’articolo 108, comma 2, del T.U.I.R. così dispone:

“*Le spese di rappresentanza sono deducibili nel periodo d’imposta di sostenimento se rispondenti ai requisiti di **inerenza e congruità**  stabiliti con decreto del Ministro dell’economia e delle finanze, anche  in funzione della natura e della destinazione delle stesse, del volume  dei ricavi dell’attività caratteristica dell’impresa e dell’attività  internazionale dell’impresa. **Sono comunque deducibili le spese relative a beni distribuiti gratuitamente di valore unitario non superiore a euro 50**”.*

Per  la definizione e le condizioni di deducibilità delle spese di  rappresentanza occorre fare riferimento al D.M. 19 novembre 2008, il  quale dispone che:

*“si  considerano inerenti, sempreché effettivamente sostenute e documentate,  le spese per erogazioni a titolo   gratuito   di beni e servizi,  effettuate con finalità promozionali o di pubbliche relazioni e il cui  sostenimento risponda a criteri di ragionevolezza in funzione  dell’obiettivo di generare anche potenzialmente benefici economici per  l’impresa ovvero sia coerente con pratiche commerciali di settore*”.  

Costituiscono, in particolare, spese di rappresentanza a mente del D.M. citato:

**a)  le spese per viaggi turistici in occasione dei quali siano svolte  significative attività promozionali dei beni/servizi la cui produzione o  scambio costituisce oggetto dell’attività caratteristica dell’impresa;**

**b) le spese per feste, ricevimenti ed altri eventi di intrattenimento organizzati in occasione:**

– di ricorrenze aziendali o di festività nazionali o religiose;

– dell’inaugurazione di nuove sedi, uffici o stabilimenti dell’impresa;

– di mostre, fiere, ed eventi simili in cui sono esposti i beni e i servizi prodotti dall’impresa;

**c)  le altre spese per beni e servizi erogati gratuitamente, inclusi i  contributi erogati gratuitamente per convegni, seminari e manifestazioni  simili il cui sostenimento risponda a criteri di inerenza.**

Il Decreto fissa altresì le percentuali di deducibilità.

Le spese di rappresentanza sono deducibili nel periodo d’imposta di sostenimento e sono “*commisurate all’**ammontare dei Ricavi** e proventi della gestione caratteristica dell’impresa risultanti dalla dichiarazione dei redditi relativa allo stesso periodo*”.

I **limiti di deducibilità** di tali spese **da****l 2016** sono i seguenti:

| **LIMITI DEDUCIBILITA’ DAL 2016**                            |                              |
| ------------------------------------------------------------ | ---------------------------- |
| **Scaglioni dei ricavi e proventi della gestione caratteristica** | **Importo %** **sui ricavi** |
| **Fino a 10 milioni di Euro**                                | **1,50%**                    |
| **Oltre i 10 milioni e fino a 50 milioni di Euro**           | **0,60%**                    |
| **Oltre 50 milioni di euro**                                 | **0,40%**                    |
|                                                              |                              |

Con riguardo al **valore di 50,00 euro**  fissato per la deducibilità integrale, si precisa che nel caso in cui  l’omaggio sia composto da più beni (è il caso ad esempio del cesto  natalizio) il valore di 50,00 euro va **riferito al valore complessivo dell’omaggio** e non ai singoli beni che compongono lo stesso. 

Per quanto riguarda l’**I.V.A.**, l’articolo 19 bis1, comma 1, lett. h), del D.P.R. n. 633/1972, prevede:

– la **detraibilità integrale dell’I.V.A.** per gli omaggi, rientranti nelle spese di rappresentanza, di costo unitario **NON superiore ad euro 50,00**;

– l’indetraibilità dell’I.V.A., per gli omaggi di costo unitario superiore ad euro 50,00.

La  successiva cessione gratuita del bene (omaggio), indipendentemente da  valore dell’omaggio, è esclusa dal campo di applicazione dell’I.V.A. per  effetto dell’articolo 2, comma 2, n. 4), del D.P.R. n. 633/1972. 

Proponiamo di seguito in forma tabellare un riepilogo della disciplina sul punto:

|                                                           | **IVA**                                                      | **IRPEF / IRES**                                     |                                                              |
| --------------------------------------------------------- | ------------------------------------------------------------ | ---------------------------------------------------- | ------------------------------------------------------------ |
| **Detrazione IVA**                                        | **Cessione gratuita**                                        | **Deducibilità del Costo dell’Omaggio**              |                                                              |
| **OMAGGI** **A favore di CLIENTI**                        | **SI**   se di costo unitario **pari o inferiore ad euro 50,00** | **Esclusa** da IVA (art. 2, co. 2, n. 4, DPR 633/72) | nel **limite annuo deducibile** (cfr. Tabella sopra);     **per intero** nell’esercizio se di valore unitario **pari o inferiore ad euro 50,00** |
| **NO**   se di costo unitario **superiore ad euro 50,00** |                                                              |                                                      |                                                              |



## Omaggi a Terzi di Beni rientranti nell’attività propria dell’impresa

Gli Omaggi a clienti o fornitori di beni che rientrano in quelli dell’attività propria dell’impresa, “*non costituiscono spese di rappresentanza*” (*cfr.* Circolare Agenzia Entrate n. 188/E/1998). Quindi:

– l’I.V.A. assolta all’atto dell’acquisto è detraibile;

–  la cessione gratuita è imponibile I.V.A. indipendentemente dal costo  unitario dei beni (ex articolo 2, comma 2, n. 4, del D.P.R. n. 633/72).

La  rivalsa dell’I.V.A. addebitata in fattura non è obbligatoria (ex  articolo 18, D.P.R. n. 633/72) e, come spesso accade, l’I.V.A. rimane  quindi a carico del cedente e costituisce costo indeducibile (ex  articolo 99, comma 1, T.U.I.R.). Nella fattura emessa con applicazione  dell’I.V.A., ma senza addebitare la stessa al cliente, si indicherà che  trattasi di “*Omaggio senza rivalsa dell’I.V.A. ex articolo 18, D.P.R. n. 633/72*”.

Alternativamente, si potrà emettere un’autofattura, indicando che trattasi di “*Autofattura per Omaggi*”.

L’autofattura potrà esser singola (per ogni cessione) o globale mensile (per le cessioni effettuate nel mese).

Un’ulteriore  possibilità è quella di tenuta del Registro degli Omaggi ove annotare  l’ammontare complessivo delle cessioni gratuite effettuate in ciascun  giorno, distinte per aliquota.

## Omaggi ai Dipendenti

Nel  caso di Omaggi ai dipendenti dell’impresa, è opportuno iscrivere il  costo di acquisto di tali beni tra i costi di lavoro dipendente (non  nelle spese di rappresentanza).

Le  erogazioni liberali in natura (tra i quali rientrano anche gli Omaggi)  concessi ai singoli dipendenti sono reddito di lavoro dipendente (*benefits*) per gli stessi, **se di importo superiore ad euro 258,23** per ciascun periodo d’imposta.

Nel caso di cessione gratuita a dipendenti di beni che non rientrano nell’attività propria dell’impresa, l’**I.V.A.** è **indetraibile** e la loro cessione gratuita è esclusa dal campo di applicazione dell’IVA (come sopra ricordato).

La  cessione gratuita di Beni la cui produzione o il cui commercio rientra  nell’attività propria dell’impresa segue il medesimo trattamento sopra  indicato per gli omaggi effettuati nei confronti di Terzi.

## Pranzi e cene degli Auguri nel periodo natalizio

I  pranzi o cene degli auguri sono considerati **<u>spese di rappresentanza</u>** nel  caso in cui partecipino clienti o fornitori. In tal caso le cene sono  deducibili nel limite del 75% della spesa sostenuta, con i limiti in  vigore dal 2016 per la deducibilità delle spese di rappresentanza (come  sopra indicato; cfr.).

Nel  caso invece in cui a tali pranzi o cene degli auguri partecipino solo i  dipendenti, la Circolare n. 34 del 2009 considera tali spese  agevolativi nel limite del 75% (trattandosi di spese per alberghi e  ristoranti), deducibili nel limite dello 0,50% delle spese per  prestazioni di lavoro dipendente (ex articolo 100, comma 1, del TUIR). 

L’IVA  sarà indetraibile in entrambi i casi, ovvero sia che alla cena  partecipino clienti o fornitori, che nel caso siano beneficiari della  stessa i dipendenti. 

Ai  fini IRAP infine, la spesa di rappresentanza in esame risulta  deducibile per i contribuenti che applicano in metodo di bilancio,  mentre risulterà indeducibile per coloro che applicano il metodo fiscale  per la determinazione della base imponibile IRAP. Infine, risulta in  ogni caso consigliabile procedere ad identificare nei documenti fiscali i  soggetti che partecipano agli eventi aziendali: anche la Circolare n.  1/2018 della Guardia di Finanza ritiene di dover esprimere una  valutazione in merito alla tipologia di soggetti beneficiari, che  potrebbero ‘mascherare’ elargizioni, liberalità, forme di autoconsumo o  assegnazioni di beni ai soci a titolo gratuito. 

## Omaggi effettuati da Professionisti

Per  gli Omaggi di beni e servizi effettuati da Professionisti, ai fini  delle imposte dirette, le spese di rappresentanza sono deducibili nel **limite dell’1% dei compensi percepiti** nel periodo d’imposta, a prescindere dal valore unitario degli stessi.

Ai fini I.V.A. l’articolo 2, comma 2, n. 4), del D.P.R. n. 633/1972 esclude dalle cessioni imponibili “*quelli  la cui produzione o il cui commercio non rientra nell’attività propria  dell’impresa se di costo unitario non superiore ad euro 50,00*”.  Tale disposizione non trova applicazione per quanto riguarda i  lavoratori autonomi, per i quali costituiranno cessioni imponibili le  cessioni gratuite di beni di costo unitario inferiore ad euro 50,00 con  conseguenti obblighi di fatturazione, registrazione, ecc. degli omaggi.  In alternativa, si potrà **non detrarre l’I.V.A.** sull’acquisto dei beni da omaggiare, rendendo irrilevante ai fini I.V.A. la successiva cessione.

## TABELLA RIEPILOGATIVA CON TRATTAMENTO IN VENDITA

|                                                              |                                                         | IVA                                    |                                                              | IRPEF IRES                                                   |
| ------------------------------------------------------------ | ------------------------------------------------------- | -------------------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| TIPO DI BENE CEDUTO IN OMAGGIO                               | **ACQUISTO**                                            | **VENDITA**                            | ADEMPIMENTI                                                  |                                                              |
| Omaggio di beni che non costituiscono oggetto della produzione o del commercio dell'impresa di importo non superiore a € 25.82 (compresi alimenti e bevande) | IVA detraibile art. 19 bis .1 lett.h DPR 633/72         | fuori campo IVA art. 2 n. 2 DPR 633/72 | nessno                                                       | interamente deducibili art. 108 TUIR                         |
| Omaggio di beni che non costituiscono oggetto della produzione o del commercio dell'impresa di importo superiore a € 25.82 (compresi alimenti e bevande) | IVA **non** detraibile art. 19 bis .1 lett.h DPR 633/72 | fuori campo IVA art. 2 n. 2 DPR 633/72 | nessuno                                                      | deducibili nel periodo di sostinementose rispondenti ai requisiti si congruità stab. dal min. delle finanze in funzione di 1 natura e destinazione degli stessi 2 volume dei ricavi dell'attivià caratteristica (vedi 2) 3 attività internazionale dell' impresa |
| Beni ceduti ai dipendenti                                    | IVA **non** detraibile art. 19 co. 2  DPR 633/72        | fuori campo IVA art. 2 n. 4 DPR 633/72 | nessuno                                                      | deducibili nel limite del 5xmille costo del personale art. 95 TUIR |
| Omaggio di beni che  costituiscono oggetto della produzione o del commercio dell'impresa di importo non superiore a € 25.82 (compresi alimenti e bevande) | iva DETRAIBILE                                          | soggetti a IVA art. 2 n. 4 DPR 633/72  | - Fattura con o senza rivalsa Iva                                                 - Autofattura                             - Registrazione Registro degli Omaggi | interamente deducibili fino al limite di € 50,00             |
| Omaggio di beni che  costituiscono oggetto della produzione o del commercio dell'impresa di importo superiore a € 25.82 (compresi alimenti e bevande) | IVA non detraibile                                      | soggetti a IVA art. 2 n. 4 DPR 633/72  | - Fattura con o senza rivalsa Iva                                                 - Autofattura                             - Registrazione Registro degli Omaggi | deducibili nel periodo di sostinementose rispondenti ai requisiti si congruità stab. dal min. delle finanze in funzione di 1 natura e destinazione degli stessi 2 volume dei ricavi dell'attivià caratteristica (vedi 2) 3 attività internazionale dell' impresa |

(vedi 2) 

| **LIMITI DEDUCIBILITA’ DAL 2016**                            |                              |
| ------------------------------------------------------------ | ---------------------------- |
| **Scaglioni dei ricavi e proventi della gestione caratteristica** | **Importo %** **sui ricavi** |
| **Fino a 10 milioni di Euro**                                | **1,50%**                    |
| **Oltre i 10 milioni e fino a 50 milioni di Euro**           | **0,60%**                    |
| **Oltre 50 milioni di euro**                                 | **0,40%**                    |
|                                                              |                              |


## Info crea fattura di vendita [ICFV00]
La Info Window permette la creazione delle fattura di vendita 
[{{< figure src="/image/InfoCreaFatturadivendita.png"  width="850"  >}}](/image/InfoCreaFatturadivendita.png)
## Info crea fattura elettronica [ICFE00]
La Info Window permette di creare la fattura in formato elettonico.
[{{< figure src="/image/InfoCreaFatturaElettronica.png"  width="850"  >}}](/image/InfoCreaFatturaElettronica.png)
## Stampa fattura su carta e/o invia email [SIFV00]
Il processo permette la generazione della fattura cartacea o la spedizione della stessa via email. 
[{{< figure src="/image/StampaFatturaInviaEmail.png"  width="850"  >}}](/image/StampaFatturaInviaEmail.png)
## Archivio fattura elettronica [AFE00]
La maschera propone l'archivio elettronico delle fatture.
[{{< figure src="/image/ArchivioFatturaElettronica.png"  width="850"  >}}](/image/ArchivioFatturaElettronica.png)
## Scadenziario pagamento fattura [SPF00]
La maschera propone lo scadenzario delle fatture non incassate.
[{{< figure src="/image/ScadenzarioPagamentoFattura.png"  width="850"  >}}](/image/ScadenzarioPagamentoFattura.png)

# Report Fatture di vendita
## Info BI fatturato [IBF00]
La Info BI permette l'analisi del fatturato.
[{{< figure src="/image/InfoBIFatturatoIBF00.png"  width="850"  >}}](/image/InfoBIFatturatoIBF00.png)
## Report transazioni di fatturazione [R.08]
Il Report permette la stampa delle transazioni di vendita di un determinato periodo.
[{{< figure src="/image/TransazionidiFatturazioneR08.png"  width="850"  >}}](/image/TransazionidiFatturazioneR08.png)
[{{< figure src="/image/ReportTransazioniDiFatturazione.png"  width="850"  >}}](/image/ReportTransazioniDiFatturazione.png)
## report dettagli fatture [R.10]
Il Report permette le stampa dettagliata del fatturato di un periodo.
[{{< figure src="/image/DettagliFattureR10.png"  width="850"  >}}](/image/DettagliFattureR10.png)
[{{< figure src="/image/ReportDettagliFatture1.png"  width="850"  >}}](/image/ReportDettagliFatture1.png)
## Report totali fatture [R.09]
Il Report permette la stampa dei totali del fatturato di un periodo.
[{{< figure src="/image/TotaliFattureR09.png"  width="850"  >}}](/image/TotaliFattureR09.png)
[{{< figure src="/image/ReportTransazionidiFatturazione.png"  width="850"  >}}](/image/ReportTransazionidiFatturazione.png)
## Report fatture per giorno [R.11]
Il Report permette la stampa di un rapporto delle fatture di un giorno.   
[{{< figure src="/image/Fatturepergiorno.png"  width="850"  >}}](/image/Fatturepergiorno.png)
[{{< figure src="/image/ReportFatturePerGiorno.png"  width="850"  >}}](/image/ReportFatturePerGiorno.png)
## Report fatture per settimana [R.12]
Il Report permette la stampa di un rapporto delle fatture di una settimana.
[{{< figure src="/image/Fatturepersettimana.png"  width="850"  >}}](/image/Fatturepersettimana.png)
[{{< figure src="/image/ReportFatturePerSettimana.png"  width="850"  >}}](/image/ReportFatturePerSettimana.png)
## Report fatture per mese [R.14]
Il Report permette la stampa di un rapporto delle fatture di un mese.
[{{< figure src="/image/Fatturepermese.png"  width="850"  >}}](/image/Fatturepermese.png)
[{{< figure src="/image/ReportFatturePerMese.png"  width="850"  >}}](/image/ReportFatturePerMese.png)
## Report fatture per prodotto per settimana [R.13]
Il Report permette la stampa di un rapporto per categoria di prodotto delle fatture di una settimana.
[{{< figure src="/image/FattureperProdottopersettimanaR13.png"  width="850"  >}}](/image/FattureperProdottopersettimanaR13.png)
[{{< figure src="/image/ReportFatturePerProdottoPerSettimana.png"  width="850"  >}}](/image/ReportFatturePerProdottoPerSettimana.png)
## Report fatture per prodotto e per mese [R.17]
Il Report permette la stampa di un rapporto per prodotto delle fatture di un mese.
[{{< figure src="/image/FattureProdottoMeseR17.png"  width="850"  >}}](/image/FattureProdottoMeseR17.png)
[{{< figure src="/image/ReportFatturePerProdottoePerMese.png"  width="850"  >}}](/image/ReportFatturePerProdottoePerMese.png)
## Report fatture per prodotto e per trimestre [R.19]
Il Report permette la stampa di un rapporto per categoria di prodotto delle fatture di un trimestre.
[{{< figure src="/image/FattureProdottoTrimestreR19.png"  width="850"  >}}](/image/FattureProdottoTrimestreR19.png)
[{{< figure src="/image/ReportFatturePerProdottoPerTrimestre.png"  width="850"  >}}](/image/FatturePerProdottoPerTrimestre.png)
## Report fatture trimestrali per prodotto [R.20]
Il Report permetta la stampa di un rapporto per prodotto delle fatture di un trimestre.
[{{< figure src="/image/FattureTrimestraliProdottoR20.png"  width="850"  >}}](/image/FattureTrimestraliProdottoR20.png)
[{{< figure src="/image/ReportFattureTrimestraliPerProdotto.png"  width="850"  >}}](/image/ReportFattureTrimestraliPerProdotto.png)
## Report fatture cliente per fornitore per trimestre [R.18]
???
[{{< figure src="/image/FattureCLienteFornitoreperTrimestreR18.png"  width="850"  >}}](/image/FattureCLienteFornitoreperTrimestreR18.png)
[{{< figure src="/image/ReportFattureClientePerFornitorePerTrimestre.png"  width="850"  >}}](/image/ReportFattureClientePerFornitorePerTrimestre.png)
## Report fatture per fornitore per mese [R.16]
Il Report permette la stampa di un rapporto per categoria di prodotto e Business Partner di un mese.
[{{< figure src="/image/FattureFornitoreMeseR16.png"  width="850"  >}}](/image/FattureFornitoreMeseR16.png)
[{{< figure src="/image/ReportFatturePerFornitorePerMese.png"  width="850"  >}}](/image/ReportFatturePerFornitorePerMese.png)
Il report permette la stampa di un rapporto per categoria di prodotto delle fatture di un mese.
## Report fatture per prodotto per mese [R.15]
[{{< figure src="/image/FattureProdottoperMeseR15.png"  width="850"  >}}](/image/FattureProdottoperMeseR15.png)
[{{< figure src="/image/ReportFatturePerProdottoPerMese.png"  width="850"  >}}](/image/ReportFatturePerProdottoPerMese.png)

## Video - 4. Fattura Cliente

### Video - 4. Quote to Invoice - Foreign Invoice / Fattura Estera  [V048]
{{<youtube oqnPbYX-5hU>}}

### Video - 4. Quote to Invoice - Invoice Sales Italy / Fattura Vendita Italia [V051]
{{<youtube jDuAQ3QRW0g>}}

### Video - 4. Quote-to-Invoice - Invoice (Customer) / Fattura Vendita Italia2 [V052]
{{<youtube l6q1IYIFbak>}}

### Video - 4. Quote to Invoice - Sales Invoice / Fattura Vendita Split Payment [V053]
{{<youtube KJTP4Mpoi4o>}}

### Video - 4. Quote to Invoice - Sales Invoice / Fattura Vendita Split Payment [V054]
{{<youtube mR1H4KtKFWY>}}

### Video - 4. Quote to Invoice - Sales Invoice UE / Fattura Vendita UE [V055]
{{<youtube RVcqY7WX4yw>}}

### Video - 4. Quote to Invoice - Customer Invoice / Fattura Vendita ExtraUE [V056]
{{<youtube 7g_ym18eplE>}}

### Video - 4. Quote to Invoice - Sales Invoice / Fattura Vendita Reverse Charge [V057]
{{<youtube oT8BteV6_p0>}}

### Video - 4. Quote to Invoice - Invoice / Corrispettivi [V058]
{{<youtube uf_VQg9lY-o>}}

### Video - 4. Quote to Invoice - Reopen Invoice / Fattura Riapertura e Modifiche [V059]
{{<youtube F2HLm5Ty0t8>}}

### Video - 4. Quote to Invoice - Posting bill / Registrazione Corrispettivi Fattura Vendita [V060]
{{<youtube E3pZ1JpULjM>}}

### Video - 4. Quote to Invoice - Variation VAT / Fattura Note Variazione IVA Split Payment [V071]
{{<youtube PQkA7LpJrMw>}}

### Video - 4. Quote-to-Invoice - Invoice Squaring / Non Quadratura Sconto cassa spiegazione [V109]
{{<youtube uHPrb5ZD5_o>}}

### Video - 4. Quote-to-Invoice - Sales Invoice / Plugin Invoice Minus Return [V125]
{{<youtube YlkS0pHmb7I>}}

### Video - 4. Quote to Invoice - Create Invoice XML / Genera Fattura XML [V166]
{{<youtube pqruUqqmLKo>}}

### Video - 4- QuotetoInvoice - Invoice by Email / Inviare Fattura via Email [V024]
{{<youtube NoEa8E6Mzok>}}






 









 




