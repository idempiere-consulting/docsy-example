---
title: "Report Cespite"
date: 2020-04-24T22:47:10+02:00
draft: false
weight : 310
pre: "<b></b>"
---

## Report costi Ammortamento non imputati [R.76]
[{{< figure src="/image/ReportCostiAmmortamentoNonImputati.png"  width="850"  >}}](/image/ReportCostiAmmortamentoNonImputati.png)
## Report cespite [RP.881]
[{{< figure src="/image/ReportCespite.png"  width="850"  >}}](/image/ReportCespite.png)


## Report ???##
Lista Cespite
- Codice
- Descrizione
- Condizioni di ammortamento
- Conti Contabilità Usati per Classificazioni
  a) Immobilizzazioni Attivo e Passivo
  b) Ammortamento ordinario
  c) Ammortamento fiscale
  d) Plusvalenza 
  e) Minusvalenza

Report LIBRO CESPITI AMMORTIZZABILI [RP.881]
Report LIBRO CESPITI AMMORTIZZABILI [RP.882]

### Esempi di Reportistica

di seguito inserisco tre immagini di report che mi sembrano abbastanza ben fatte in prima pagina l'immagine del programma di cui fanno parte.

[{{< figure src="/image/Cespiti-29.png"  width="850"  >}}](/image/Cespiti-29.png)

[{{< figure src="/image/Cespiti-30.png"  width="850"  >}}](/image/Cespiti-30.png)
[{{< figure src="/image/Cespiti-31.png"  width="850"  >}}](/image/Cespiti-31.png)

Cosa estrae ora il report

![](/home/milena/consulting-nc/Documentazione iDempiere Utente/Manuale iDempiere/8.Contabilità e Controllo di Gestione/11.Contabilità e Controllo di Gestione/12.Cespite/12.01 Setup Ammortamento Cespite/Immagini Cespiti/35.png)

a) prima osservazione se il nome gruppo è molto lungo (60 caratteri?=) elide la percentuale di ammortamento del gruppo

b) non so se perchè seleziono anche anno prima di inserimento del cespite (ho selezionato 2018 mentre il cespite era stato inserito in data 8/10/2019) mi reporta una riga di valori a 0 vedi primo gruppo cespite id 1000034. Se seleziono periodo contabile precedente non dovrebbe reportare niente.

allego ora altro esempio di stampa registro

![](/home/idempiere/md/Documentazione iDempiere Utente/Manuale iDempiere/8.Contabilità e Controllo di Gestione/11.Contabilità e Controllo di Gestione/12.Cespite/12.01 Setup Ammortamento Cespite/Immagini Cespiti/37.png)

c) come si vede effettuamndo una stampa di più anni cumulati la percentuale di ammortamento viene evidenziata in descrizione anno per anno. Sarebbe bello fissare  un totale storico aggiornato del bene il cui valore è composto da due importi (mezzo + antifurto) in un'unica riga. 

![](/home/idempiere/md/Documentazione iDempiere Utente/Manuale iDempiere/8.Contabilità e Controllo di Gestione/11.Contabilità e Controllo di Gestione/12.Cespite/12.01 Setup Ammortamento Cespite/Immagini Cespiti/38.png)

d) altra cosa che manca nella stampa è una totalizzazione per categoria come si evince dalla stampa sopra riportata.

dalla stampa seguente si ha esempio di altri campi che sarebbe opportuo riportare. più gstionali riportano correttamente anche quelli che sono i valori fiscalmente detraibili (generalmente affiancando i dati su due meze pagine, proporrei per ottimizzare spazi di riportare i dati di cui sopra su due righe una sotto l'altra) indicando a inizio riga civile o fiscale.

![](/home/idempiere/md/Documentazione iDempiere Utente/Manuale iDempiere/8.Contabilità e Controllo di Gestione/11.Contabilità e Controllo di Gestione/12.Cespite/12.01 Setup Ammortamento Cespite/Immagini Cespiti/39.png)
