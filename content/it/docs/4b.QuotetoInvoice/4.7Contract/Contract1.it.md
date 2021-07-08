---
title: "Contratti"
date: 2020-04-24T22:47:10+02:00
draft: false
weight : 260
pre: "<b></b>"
---

Menù Idempiere

[Crea Contratto da ordine [CCO20]]({{< ref "_index.it.md#CC020" >}} "Crea Contratto da ordine") <br>
[Contratto di Vendita [CDV20]]({{< ref "_index.it.md#CDV20" >}} "Contratto di Vendita") <br>
[Crea Ordine di Vendita da Contratto [COVC20]]({{< ref "_index.it.md#COVC20" >}} "Crea Ordine di Vendita da Contratto") <br>
[Info Contratto di Vendita [ICV00]]({{< ref "_index.it.md#ICV00" >}} "Info Contratto di Vendita") <br>

[Crea Contratto da ordine di Acquisto [CCOA20]]({{< ref "_index.it.md#CC0A20" >}} "Crea Contratto da ordine di Acquisto") <br>
[Contratto di Acquisto [CDA20]]({{< ref "_index.it.md#CDA20" >}} "Contratto di Acquisto") <br>
[Crea Ordine di Acquisto da Contratto [COAC20]]({{< ref "_index.it.md#COAC20" >}} "Crea Ordine di Acquisto da Contratto") <br>
[Info Contratto di Acquisto [ICA20]]({{< ref "_index.it.md#ICA20" >}} "Info Contratto di Acquisto") <br>



## Crea Contratto da ordine [CCO20] {#CC020}
{{< figure src="/image/ContrattodaOrdine.png"  width="850"  >}}
La Info Window permette di creare un contratto da un ordine di vendita già esistente.


{{< figure src="/image/Crea CO.png"  width="850"  >}}
Nel momento in cui si genera il processo il sistema propone il tipo di frequenza ( esempio. mensile/anuale/trimestrale ).


{{< figure src="/image/Prodotto-COntratto.png"  width="850"  >}}
Maschera Prodotto : indispensabile inserire il "Flag" nel contratto per la gestione corretta del processo.

## Contratto di Vendita [CDV20] {#CDV20}
{{< figure src="/image/Contrattodivendita.png"  width="850"  >}}
La maschera permette l'inserimento manuale di un cotratto di vendita.


## Crea Ordine di Vendita da Contratto [COVC20] {#COVC20}
{{< figure src="/image/IfoContrattodiVendita.png"  width="850"  >}}
Il processo genera un ordine di vendita partendo da un contratto.
La Info Window permette di selezionare i contratti di vendita apportando anche determinate modifiche (ad es. rinnovo).


## Info Contratto di Vendita [ICV00] {#ICV00}
{{< figure src="/image/CreaOrdinediVenditaContrattoCOVC20.png"  width="850"  >}}
E possibile oppzionalmente creare un offerta di vendita dalla maschera COVC20.


## Crea Contratto da ordine di Acquisto [CCOA20] {#CCOA20}
{{< figure src="/image/Contratto Acquisto.png"  width="850"  >}}
Il processo genera un ordine di acquisto partendo da un contratto.


## Contratto di Acquisto [CDA20] {#CDA20}
{{< figure src="/image/ConAcq.png"  width="850"  >}}
La maschera permette l’inserimento manuale di un cotratto di acquisto.


## Crea Ordine di Acquisto da Contratto [COAC20] {#COAC20}
{{< figure src="/image/ConAcq.png"  width="850"  >}}
Il processo genera un ordine di acquisto partendo da un contratto.


## Info Contratto di Acquisto [ICA20] {#ICA20}
E possibile oppzionalmente creare un offerta di acquisto dalla maschera ICA20.
{{< figure src="/image/ConAcq.png"  width="850"  >}}


## link esterni
---
## Riferimenti
- link pubblico  :
- link idempeire italia  :
- link jar  : /opt/repos/idempiere-download/plugin-italia/Contract/
- versione idempiere  : idempiere 3.1
- versione zk supportata : na
---
## Specifiche di ambiente test/demo
```
database    : idempiere_demobase
application : idempiere-demobase
```
---
## Link documentazione esterna
---
## Descrizione Funzionalità

Maschera gestione contratto , con dettaglio di righe .

[{{< figure src="/image/Contract_1.png"  width="850"  >}}](/image/Contract_1.png)

## Processo di accodamento all'ordine di vendita.

[{{< figure src="/image/Contract_2.png"  width="850"  >}}](/image/Contract_2.png)

[{{< figure src="/image/Contract_3.png"  width="850"  >}}](/image/Contract_3.png)

 Processo che permette di associare i contratti presenti ad un nuovo ordine o ad un ordine già presente.
- Validity date: criterio → ricerca i contratti che sono ancora attivi, in base alla data impostata

> MContract.COLUMNNAME_validfromdate + "<= ? AND " +
>  MContract.COLUMNNAME_validtodate + ">= ? AND " +
>  MContract.COLUMNNAME_DateInvoiced + "< ? AND "
- I contratti creati sono associati ad un Business Partner, quindi la scelta del BusinessPartner risulta obbligatoria
- Si può associare i contratti ad un ordine già presente, selezionando Sales Order desiderato
Il processo creerà un nuovo ordine (se non è esistente) e rispettive  linee ordine in base al numero delle linee di contratto presenti.
 Dati salvati:
```
product_ID, 
qty, 
price, 
contractID, 
C_UOM_ID
```
Una volta creato/aggiornato l'ordine, sul contratto verrà  visualizzato il numero dell'ordine associato e sulle righe d'ordine  verrà segnalato il contratto associato.
- A fine processo, verrà visualizzato un messaggio, dove verrà indicato
  1) il numero dei contratti salvati e l'ordine di riferimento.
- oppure
  2) nessun contratto è stato elaborato.
### Processo di accodamento dal ....
### Gestione ticket iTop

Creazione di utenze iTop per gestione dei ticket su iTop; la  creazione avviene nel momento del salvataggio dell'utente associato al  BPartner presente sulla *sotto-tab "Contract > Contact (User) for Web Ticket"* e che abbia il **flag "Web Ticket"** abilitato

[{{< figure src="/image/Contract_4.png"  width="850"  >}}](/image/Contract_4.png)

Per riferimenti specifici su iTop, vedere la pagina wiki [ITop](http://192.168.178.102/index.php/ITop)
Per il corretto funzionamento di questa funzione, è IMPORTANTE inserire le giuste credenziali di iTop nella *maschera "Client > Client Info"*
 
[{{< figure src="/image/Contract_7.png"  width="850"  >}}](/image/Contract_7.png)
 
https://192.168.178.102/images/thumb/e/ee/Contract_7.png/1050px-Contract_7.png

https://192.168.178.102/index.php/File:Contract_7.png

---
## Da Fare
---
## Modifiche all' AD
### Existing Tables / Windows
### New Tables /Windows

```
C_Contract
C_Contract_line
```
