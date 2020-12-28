---
title: "Plugin Mail Chimp [X.MAC.STD00]"
date: 2020-12-28T15:26:10+02:00
draft: false
weight : 10
pre: "<b>729. </b>"
---

## link esterni


Sorgente di origine: [https://github.com/micheal-swiggs/mailchimp-java](https://github.com/micheal-swiggs/mailchimp-java)

Libreria compilata:  [https://mvnrepository.com/artifact/com.github.micheal-swiggs/mailchimp-java/1.0.0](https://mvnrepository.com/artifact/com.github.micheal-swiggs/mailchimp-java/1.0.0)


---

## Riferimenti

*link pubblico          : 
*link idempeire italia  : 
*link jar               : 
*versione idempiere     : idempiere 7.1
*versione zk supportata : 

---

## Descrizione Plugin

Processo di gestione sincronizzazione NewsLetter tra iDempiere e MailChimp (sincro iDempiere <-> MailChimp)

---

## Funzionalità supportate

---

## Installazione Plugin

Installare nella console felix il jar reperibile su [https://github.com/idempiere-consulting/idempiere-download/blob/master/plugin-italia/LIT_NewsLetter/it.idIta.impl.LIT_NewsLetter_7.1.jar](https://github.com/idempiere-consulting/idempiere-download/blob/master/plugin-italia/LIT_NewsLetter/it.idIta.impl.LIT_NewsLetter_7.1.jar)

---

## Parametrizzazione Plugin

[{{< figure src="/image/MailChimp_1.png" title="Parametrizzazione autorizzazioni MailChimp" width="1315"  >}}](/image/MailChimp_1.png)

[{{< figure src="/image/MailChimp_2.png" title="Parametrizzazione autorizzazioni MailChimp" width="815"  >}}](/image/MailChimp_2.png)

[{{< figure src="/image/MailChimp_3.png" title="Parametrizzazione autorizzazioni MailChimp" width="1315"  >}}](/image/MailChimp_3.png)


---

## Istruzioni Plugin

Una volta parametrizzati i dati di accesso a livello maschera 'Azienda (Client)[AZC00]', bisognerà inizialmente creare la sottoscrizione Audience da iDempiere. Maschera di riferimento è la 'Area di interesse'

[{{< figure src="/image/MailChimp_4.png" title="" width="1315"  >}}](/image/MailChimp_4.png)

Una volta impostati primi dati, bisogna avviare la sincronizzazione dalla toolbar, con il processo "MailChimp Sincro"

[{{< figure src="/image/MailChimp_5.png" title="" width="1315"  >}}](/image/MailChimp_5.png)

Risultato su portale di MailChimp:

[{{< figure src="/image/MailChimp_6.png" title="Risultato MailChimp_1" width="1315"  >}}](/image/MailChimp_6.png)

[{{< figure src="/image/MailChimp_7.png" title="Risultato MailChimp_2 - Contatti" width="1315"  >}}](/image/MailChimp_7.png)

---

## Documentazione Tecnica Plugin

### Modifiche all'AD

#### Tables / Windows esistenti

#### Nuove Tables /Windows

---

## Funzionalità Future

---

## Errori e bug

---

## Struttura dati

```
http://kb.mailchimp.com/accounts/management/about-api-keys
http://developer.mailchimp.com/documentation/mailchimp/?utm_source=apidocs&utm_medium=internal_ad&utm_campaign=api_v3
https://docs.treasuredata.com/articles/result-into-mailchimp
https://blog.iadvise.eu/2013/11/25/connecting-to-salesforce-and-mailchimp-using-talend/
```

---

## Struttura dei dati in iDempiere

* Area di Interesse  [ R_InterestArea ]
  * Sottoscrizioni   [R_InterestArea ]
  * Contatti         [Contatti]
  * Column : Name,Email

NEW COLUMN on ARea di Interesse  LIT_NEWSLETTER_ID

TABELLA :LIT_NEWSLETTER

```
LIT_NEWSLETTER_ID TIPOSERVIZIO   NOMELISTA       
1000000           MAILCHIMP      LISTAIDEMPIERE
```

## Struttura dei dati in MailChimp

Metodi : 

```
csv
json
https://drive.google.com/open?id=0B_cHtOEQolgGVHdFMkpIM29kZHM 
Progetto Talend



1) isMasterDAte  - > RInterestAre
2) Eamil from    ->  RintereArea

3) Adlicnet : mailchimp auth
4) adclient : mail ci auto dc

Processo su Toolbar interest area


```

