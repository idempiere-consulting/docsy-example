# Cespiti

indice

## [Parametrizzazione base](#Parametrizzazione base)

## [Processo inserimento cespite Idempiere](#Processo inserimento cespite Idempiere)

## [Da Fare/Segnalazioni](#Da Fare/Segnalazioni)

## [Report](#Report)

## Parametrizzazione base

### Piano dei conti

E' necessario (ove non siano esistenti) l' Inserimentro dei conti contabili in attivo relativi alle categorie cespiti da inserire e nel passivo dei conti che accolgono gli ammortamenti accumulati nei corsi dei vari anni (Fondi ammortamento).

Il piano dei conti di Idempiere già prevede i conti da utilizzare **<u>(si tratta solo di verificare se esistano tutti o se si vuole per motivi interni inserirne altri fermo restando il dover creare anche categorie prodotti e gruppi bene gestito dei punti seguenti)</u>**

### Anagrafiche prodotti cespite

Si devono creare le categorie prodotto cespite pertinenti alla propria attività aziendale come da decreto Ministero delle finanze. (D.M. 31-12-1988 Coefficienti di ammortamento del costo dei beni materiali strumentali impiegati nell'esercizio
di attività commerciali, arti e professioni. Pubblicato nella Gazz. Uff. 2 febbraio 1989, n. 27, S.O.)

Si allega allo scopo parte tabella industrie gruppo V Manifatturiere alimentari - Specie 3 Panificazione, produzione di biscotti e di pasticcerie.![](../../../md/images/Cespiti 2/1.png)

### Gruppo bene gestito

Si devono creare dei gruppi cespiti (in base al punto precedente) per la definizione di un piano di ammortamento ed il collegamento dei vari coefficienti di ammortamento dei beni.![](../../../md/images/Cespiti 2/4.png)

## Processo inserimento cespite Idempiere

### [Inserimento Oda](#Inserimento Oda)

### [Entrata merce](#Entrata merce)

### [Generazione della fattura di acquisto](#Generazione della fattura di acquisto)

### Inserimento Oda

Il primo step nella procedura di inserimento di un nuovo bene ammortizzabile è l' inserimento di un ordine di acquisto per il bene da cespitare in azienda (si pone come esempio l'acquisto di una scrivania ufficio presidente).![](../../../md/images/Cespiti 2/2.png)

si inserisce e completa l'ordine![](../../../md/images/Cespiti 2/3.png)

## Entrata merce

Si procede con fare l'entrata merce da ordine di acquisto o direttamente da elaborazione selezionando la iconcina rotellina sulla barra degli strumenti o da Entrata Merci EM00 e facendo riferimento alle righe ordine in soggetto.![](../../../md/images/Cespiti 2/6.png)

si completa l' entrata e si vedrà anche la registrazione contabile di magazzino.![](../../../md/images/Cespiti 2/7.png)

## Generazione della fattura di acquisto

A questo punto si procede con la generazione della fattura di acquisto preferibilmente dall'iconcina rotellina elabora.![](../../../md/images/Cespiti 2/8.png)

Apparirà un processo e selezionandolo avremo la videata della fattura in bozza.![](../../../md/images/Cespiti 2/9.png)

controllati i dati se si procede al completamento della fattura viene data la seguente segnalazione in quanto sto aggiungendo un cespite e dovrò completare la riga fattura con delle altre informazioni.![](../../../md/images/Cespiti 2/13.png)

Selezioni quindi la riga prodotto in fattura e vado a compilare i dati relativi al cespite che sto acquistando semplicemente idicanto che si tratta di un bene di tipo "capital", apparirà anche il gruppo al quale fa parte il cespite in oggetto.![](../../../md/images/Cespiti 2/12.png)

si procede con il completamento della fattura.

![](../../../md/images/Cespiti 2/14.png)

![](../../../md/images/Cespiti 2/15.png)

la registrazione contabile è la seguente![](../../../md/images/Cespiti 2/16.png)

lo step successivo è l'attivazione del cespite. Si apre quindi il menù aggiunte cespite ed apparirà, se si fanno in successione le registrazioni il cespite sul quale si opera (altrimenti lo si cerca)![](../../../md/images/Cespiti 2/17.png)

Si attiva il cespite completando la registrazione![](../../../md/images/Cespiti 2/18.png)

Viene prodotta anche una registrazione contabile che si elide in sè (dare avere della categoria)![](../../../md/images/Cespiti 2/19.png)

apriamo ora il menù cespite: Il cespite a seguito delle operazioni precedenti si è popolato (in base alle impostazioni attribuetegli come gruppo e categoria)a livello tab aggiunta con la registrazione del cespite ed il suo collegamento alla fattura e a livello tab ammortamento di una serie di proposte di registrazioni di ammortamento come vediamo di seguito![](../../../md/images/Cespiti 2/20.png)

![](../../../md/images/Cespiti 2/20a.png)

per effettuare la registrazione in contabilità devo ***processare*** le varie proposte di registrazione. Ciò si può fare o per singola riga o selezionando tutte le righe. nell'esempio lo facciamo solo per la riga con ammortamento del 31/08/2019, apriamo a pagina intera la riga, e utilizziamo la rotellina di elaborazione come di seguito da immagine salvata![](../../../md/images/Cespiti 2/21.png)

![](/home/idempiere/md/images/Cespiti 2/21a.png)

![](../../../md/images/Cespiti 2/22.png)

Confermato il processo posso verificare i dati da confermare contabilmente.

![](../../../md/images/Cespiti 2/23.png)

ora si potrà registra contabilmente il tutto da creazione ammortamento, andando a scegliere il tipo piano di ammortamento e la data dell' ammortamento processato.![](../../../md/images/Cespiti 2/24.png)

![](../../../md/images/Cespiti 2/25.png)

è l'ultimo della lista l' ammortamento in esame e confermando si confermano tutti gli ammortamenti anche altri precedentemente eventualmente processati![](../../../md/images/Cespiti 2/26.png)

![](../../../md/images/Cespiti 2/27.png)

## Da Fare/Segnalazioni

A me ha tratto in inganno il fatto che in riga fattura posso andare a collegare un cespite che genero in contemporanea da "cespite CSP00" in realtà la fattura è meglio completarla andando semplicemente ad impostre il dato riga a "capitale" dopo di che aprendo aggiunta cespite e completando l'aggiunta cespite avrò in link "cespite generato da invoice"

![](../../../md/images/Cespiti 2/28.png)

ho quindi avuto un problema per cui sono stati creati due stessi cespiti vedi il quadro Gattuso (generato da fattura e da maschera cespite anche se non con stesso nome prodotto). **<u>E' DA VERIFICARE LA POSSIBILITA' DI BRASARE UN CESPITE COSA CHE AL MOMENTO NON CREDO SIA POSSIBILE</u>**

![](../../../md/images/Cespiti 2/32.png)

![](../../../md/images/Cespiti 2/33.png)



- da verificare come creare piani ammortamento differenti da "fa" non so come si faccia, di modo che si possano andare a generare ammortamenti convenzionali ad esempio fare popolare un ammortamento a metà valore per l' anno 1 oppure generare ad esempio un "superammortamento".

verificare la possibilità di impostare una tabella per importare situazione attuale cespiti di un cliente i dati da importare sono quelli che si evincono dall' immagine che riporto anche tra i report che chiamerei "scheda cespite"

![](../../../md/images/Cespiti 2/31.png)

quindi dovrebbero essere questi i dati minimi da inserire.

| Matricola (codice) | Descr.cesp. | inizio poss. | val.storico | imp.agg. | ammort. | progr.amm. | res.da amm. |
| ------------------ | ----------- | ------------ | ----------- | -------- | ------- | ---------- | ----------- |
|                    |             |              |             |          |         |            |             |

in "importa cespite" ICE00 se in serisco i dati iniziali in realtà posso fare manualmente l' operazione di cari dati iniziali.

PS: non so come si capisca se tutti i cespiti in possesso siano ammortizzati e quindi se siano state fatte le registrazioni contabili relative.

## Report

di seguito inserisco tre immagini di report che mi sembrano abbastanza ben fatte in prima pagina l'immagine del programma di cui fanno parte.

![](../../../md/images/Cespiti 2/29.png)

![](../../../md/images/Cespiti 2/30.png)

![](../../../md/images/Cespiti 2/31.png)