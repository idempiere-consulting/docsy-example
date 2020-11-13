---
title: "Script Callout"
date: 2020-04-24T22:47:10+02:00
draft: false
weight : 10000
pre: "<b></b>"
---


# Script Callout

Da iDempiere en

## Contenuto

```
1 Creare la Regola
2 Configurare il Callout da tavolo/colonna
3 Codice campione fornito per il test copia/incolla
4 Codice di esempio per l'impostazione del conto bancario di pagamento
5 Lingue di scrittura
6 Vedi anche
```
# Creare la Regola

All'interno dello script è possibile utilizzare:

```
Le variabili di contesto della finestra iniziano con un prefisso W_
Le variabili di contesto di login iniziano con il prefisso G_
Parametri per l'inizio del callout con prefisso A_
A_FinestraNo
A_Tab
A_Campo
A_Valore
A_VecchioValore
A_Ctx
```
# Configurare il Callout da tavolo/colonna


```
Questo Callout può essere richiamato anche dalla finestra Report & Process . Ricordarsi di impostare nella finestra Regola da quale tipo di evento sono
tu che chiami questo Script delle Regole.
```
# Codice campione fornito per il test copia/incolla

Sul tavolo e sulla colonna, il riferimento del callout:

```
@script:beanshell:forceUpper
```
Sulla chiave di ricerca delle regole:

```
beanshell:forceUpper
```
Sullo Script delle Regole:

```
if (A_Value != null && A_Value instanceof String) {
A_Tab.setValue(A_Field, ((Stringa)A_Value).toUpperCase());
}
risultato = "";
```

# Codice di esempio per l'impostazione del conto bancario di pagamento

Questo script imposterà il conto bancario nella finestra di pagamento in base al tipo di gara e al tipo di carta di credito.

Nella Tabella e nella Colonna Pagamenti, il riferimento di callout per il Tipo di Gara e il Tipo di Carta di Credito:

```
@script:beanshell:payment_setpaymentprocessor
```
Sulla chiave di ricerca delle regole:

```
beanshell:pagamento_setpaymentprocessor
```
Sullo Script delle Regole:

```
importare org.compiere.model.MPayment;
if(A_Tab.getValue("TenderType") != null && A_Tab.getValue("CreditCardType") != null && A_Tab.getValue("CreditCardType") != "")
{
MPayment pmt = nuovo MPayment(A_Ctx, 0,null);
pmt.setTenderType(A_Tab.getValue("TenderType"));
pmt.setC_Currency_ID(A_Tab.getValue("C_Currency_ID"));
pmt.setCreditCardType(A_Tab.getValue("CreditCardType"));
pmt.setPaymentProcessor();
A_Tab.setValue("C_BankAccount_ID", pmt.getC_BankAccount_ID());
pmt = nullo;
}
altro
{
A_Tab.setValue("C_BankAccount_ID", 0);
}
risultato="";
```
# Lingue di scrittura

```
Standard iDempiere ha caricato i vasetti per lavorare con groovy (http://groovy.codehaus.org/) , jython (http://www.jython.org/Project/index.html)
e beanshell (http://www.beanshell.org/)
per chiamare uno script da un Callout seguire questa sintassi di esempio:
@script:beanshell:ValidateQtyOnHand
@script:groovy:ValidateQtyOnHand
@script:jython:ValidateQtyOnHand
```
```
Quando si crea la regola, si deve impostare nella chiave di ricerca come:
Chiave di ricerca : beanshell:ValidateQtyOnHand
Chiave di ricerca : groovy:ValidateQtyOnHand
Chiave di ricerca : jython:ValidateQtyOnHand
```
```
Impostare il tipo di evento come Callout e il tipo di regola come API di scripting JSR 223
```
# Vedi anche

```
Script Process per l'esempio di regola degli eventi da una finestra Report & Process.
Script ModelValidatorLogin
Script ModelValidator
```
Recuperato da "http://wiki.idempiere.org/wen/index.php?title=Script_Callout&oldid=4142".
Categorie: Sviluppo di frammenti di codice

```
Questa pagina è stata modificata l'ultima volta il 23 luglio 2013, alle 21:07.
Questa pagina è stata visitata 959 volte.
Il contenuto è disponibile sotto GNULizenz für freie Dokumentation 1.3 oder höher.

Tradotto con www.DeepL.com/Translator (versione gratuita)
```



