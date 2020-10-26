---
title: "Casi Pratici"
date: 2020-04-24T22:47:10+02:00
draft: false
weight : 10
pre: "<b></b>"
---

#### **Ciclo Attivo : Ordine di Vendita - Documento di Trasporto - Fattura di Vendita** 

##### Modifica Prezzi
```
a) Riapro l'ordine eseguendo la sua riattivazione
b) Procedo alla modifica del prezzo eventualmente su listino e su riga ordine
c) Completo nuovamente l'ordine di vendita 
```
---

##### Modifica Aliquota iva 
```
a) Riapro l'ordine eseguendo la sua riattivazione
b) Procedo alla modifica dell'aliquota iva su articolo e su riga ordine 
c) Completo nuovamente l'ordine di vendita 
```
---
##### Modifica Quantità 
```
a) Riapro l'ordine eseguendo la sua riattivazione
b) Procedo alla modifica della quantità su riga ordine 
c) Completo nuovamente l'ordine di vendita 
```
---
##### Modifica Quantità su ordine completato - non ho il DDT nè la fattura
```
a) Riapro l'ordine eseguendo la sua riattivazione
b) Procedo alla modifica della Quantità
c) Completo nuovamente l'ordine di vendita 
```
---
##### Modifica Quantità su ordine completato e DDT già emesso - Non ho ancora emesso la fattura

Opzione 1 ***modifica giro Completo***
```
a) Riapro il DDT eseguendo la sua riattivazione
b) Riapro l'ordine eseguendo la sua riattivazione
c) Procedo alla modifica della Quantità in riga ordine (se chiaramente mi va bene ricevere quantitativo differente da ordine originario)
d) Completo nuovamente l'ordine di vendita 
e) Riemetto DDT corretto

```
Opzione 2 ***Ho 1 solo DDT - Quantità completamente evasa***
```
Esempio : quantità ordine 6 - DDT quantità 7 

a) Utilizzo Special Editor per modificare il ddt 
```
Opzione 3 ***Ho 1 solo DDT - Quantità parzialmente evasa***
```

Esempio quantità ordine 10 - DDT quantità 5

a) Posso modificare la Quantità sul DDT (Special Editor) e lasciare l'ordine com'era prima
b) Posso eseguire le due modifiche senza relazione tra le stesse 
```
***preferibile far coincidere il quantitativo onde non venga riproposto fabbisogno materiale***

###### ***Ho + DDT - Quantità parzialmente o copmletamente evasa***

Non è permessa nessuna modifica. E' necessario stornare l'odv

##### Modifica Quantità su ordine completato e DDT giù emesso - Fattura Emessa

###### ***Ho 1 ODV 1 DDT 1 Fattura  tutto completamento evaso***
```
Caso tipico della Fattura Immediata

a) Eseguo la modifica nella Fattura (Special Editor) ed eseguo una rettifica di magazzino  oppure eseguo la modifica del DDT della quantità (Special Editor)
```

#### **Ciclo Passivo : Ordine di Acquisto - Entrata Merci - Fattura di Acquisto**

---

#### **Offerta Chiusa Materiale a Magazzino - Prezzo o quantità differente da ordine inviato**

Opzione 1 ***Mi va bene non contesto***
```
a) Riapro l'ordine eseguendo la sua riattivazione
b) Procedo alla modifica del prezzo su listino e su riga ordine
c) Completo nuovamente l'ordine di acquisto e lo reinvio al fornitore

oppure
a) Utilizzo Special Editor per modificare l'ordine di acquisto
b) Procedo alla modifica del prezzo su listino
```
Opzione 2 ***Non sono d'accordo***
```
Apro procedura di reso seguirà **nota accredito fornitore**
```
---

#### **Offerta Chiusa Materiale con creazione Ord.Acquisto** - Prezzo o quantità differente da ordine inviato**

Opzione 1 ***Mi va bene non contesto***
```
a) Riapro l'ordine eseguendo la sua riattivazione
b) Procedo alla modifica del prezzo su listino e su riga ordine
c) Completo nuovamente l'ordine di acquisto e lo reinvio al fornitore

```
Opzione 2 ***Non sono d'accordo***
```
Apro procedura di contestazione rifiuto invio merce chiudo ordine.
```
---

#### **Offerta Chiusa Servizio una tantum - Prezzo differente**

Opzione 1 ***Mi va bene non contesto***
```
a) Riapro l'ordine eseguendo la sua riattivazione
b) Procedo alla modifica del prezzo su listino e su riga ordine
c) Completo nuovamente l'ordine di acquisto e lo reinvio al fornitore

```
Opzione 2 ***Non sono d'accordo***
```
Apro procedura di contestazione rifiuto prestazione servizio.
```

---

#### **Offerta Chiusa Servizio a contratto - Prezzo differente**

Opzione 1 ***Mi va bene non contesto***
```
a) Riapro l'ordine eseguendo la sua riattivazione
b) Procedo alla modifica del prezzo su listino e su riga ordine
c) Completo nuovamente l'ordine di acquisto e lo reinvio al fornitore

```
Opzione 2 ***Non sono d'accordo***
```
Apro procedura di contestazione rifiuto prestazione servizio.
```
---

#### **Offerta Aperta (in economia)**
Opzione 1 ***Verifica e tutto ok***
```
a) Verifica stato offerta tutto ok 
b) Procedo alla chiusura offerta se giunta prestazione o consegna materiali a termine.
c) Completo nuovamente l'ordine di acquisto e lo reinvio al fornitore

```
Opzione 2 ***Non sono d'accordo***
```
Apro procedura di contestazione rifiuto prestazione servizio o consegna materiale.
```
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
- se l'offerta è scaduta CHIUDERE l'offerta. 
- se l'offerta è ancora in validità prolungare la data di validità.
- controllo offerta di materiali non inviate.
```
```
- controllo offerte servizi non fatturate
- richiesta fornitore fattura relativa.
```
#### Drop Shipping
Opzione 1 ***Verifica e tutto ok***

```
a) Verifico stato consegna 
b) Non rilevo ritardo o problematiche consegna 
c) Proseguo con registrazione fattura 
```
Opzione 2 ***Non ok procedure***
```
a) Verifico stato consegna
b) Ritaro o problematiche consegna 
c) Apro procedura contestazione 


Apro procedura di contestazione rifiuto prestazione servizio.
```
---

link a documenti esistenti 
 
http://www.adempiere.com/Sponsored_Development:_Drop_Ship
 
https://idempiere.atlassian.net/browse/IDEMPIERE-2619
 
http://www.globalqss.com/wiki/index.php/IDempiere/FullMeeting20150513
 
 


