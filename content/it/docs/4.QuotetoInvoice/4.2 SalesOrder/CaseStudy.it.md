---
title: "Casi Pratici"
date: 2020-04-24T22:47:10+02:00
draft: false
weight : 10
pre: "<b></b>"
---

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



