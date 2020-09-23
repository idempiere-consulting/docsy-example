---
title: "Listino Prezzi"
date: 2020-04-24T22:47:10+02:00
draft: false
weight : 510
pre: "<b></b>"
---

## Listino Prezzi [LSP00]
La Maschera permette di creare il Listino Prezzi che si desidera. 
[{{< figure src="/image/ListinoPrezzi0.png"  width="850"  >}}](/image/ListinoPrezzi0.png)

## Riferimenti


- link 2pack /opt/repos/idempiere-download/plugin-italia/ScontoTestata/2packSystemScontoTestata.zip

## Descrizione 2pack

---

Nuova funzionalità che consente di applicare gli sconti multiriga inserendoli da testata. Due differenti gestioni:

```
-applicare sconto a tutti i prodotti
-applicare sconto SOLO a prodotti con Discount = 0.0
```

Vediamo un esempio nella maschera delle Sales Order.

Inseriamo lo sconto che vogliamo applicare, e premiamo sul Pulsante "Apply Discount"

![Sonto1.png](/image/PrezziScontoTestata1.png)

 Per applicare lo sconto su qualsiasi riga dobbiamo deselezionare il campo "Applica solo ai prodotti con Sconto=0.0"

![Sonto2.png](/image/PrezziScontoTestata2.png)


 Ecco il risultato:

![Sonto4.png](/image/PrezziScontoTestata4.png)

 Oppure applichiamo lo sconto solamente ai prodotti con Discount=0.0  (selezioniamo il campo "Applica solo ai prodotti con Sconto=0.0")

![Sonto3.png](/image/PrezziScontoTestata3.png)

 Ecco il risultato:

![Sonto5.png](http://192.168.178.102/images/PrezziScontoTestata5.png)


 Inoltre, ad ogni inserimento di un prodotto nelle righe, viene impostato  il valore di Sconto impostato in Testata (solo se lo Sconto in testata è  diverso da 0)

Vediamo un esempio:

![Sonto6.png](/image/PrezziScontoTestata6.png)

Come possiamo vedere dall'immagine qui sopra, quando inseriamo un  nuovo prodotto, esso assumerà lo Sconto impostato dalla testata  dell'ordine (ATTENZIONE: questo solo se il campo Sconto testata è  diverso da 0.0, altrimenti se = 0.0 assumerà lo sconto di default  impostato dal prodotto)



## Sconto Multiplo [SM01]
La Maschera permette di creare una scontistica per prodotto fino a tre livelli.
[{{< figure src="/image/ScontoMultiplo.png"  width="850"  >}}](/image/ScontoMultiplo.png)

## Ricalcola Prezzo [RPOF00]
Il Processo permette per ordini clienti aperti e fatture non completate il ricalcolo del prezzo in base all'ultimo listino di vendita.
[{{< figure src="/image/RicalcolaPrezzoOrdine_Fattura.png"  width="850"  >}}](/image/RicalcolaPrezzoOrdine_Fattura.png)

## Promozione [PRO00]
La Maschera permette la creazione di una campagna promozionale in base alle esigenze desiderate. 
[{{< figure src="/image/Promozione.png"  width="850"  >}}](/image/Promozione.png)



# Report Price List
## Report Scheda Prodotto [RP.342]
Il Report permette una stampa del listino prezzi selezionato.
[{{< figure src="/image/ReportSchedaProdottoRP342.png"  width="850"  >}}](/image/ReportSchedaProdottoRP342.png)
## Report Scheda Prodotto [RP.341]
Il Report permette una stampa del listino prezzi selezionato.
[{{< figure src="/image/ReportListinoPrezziRP341.png"  width="850"  >}}](/image/ReportListinoPrezziRP341.png)
## Report Scheda Prodotto [Rp.343]
Il Report permette una stampa delle variazioni dei listino di un BP.
[{{< figure src="/image/ReportVariazionePrezzoProdottoRP343.png"  width="850"  >}}](/image/ReportVariazionePrezzoProdottoRP343.png)


# Setup Price List
## Configurazione listini
Lo Schema raffigura le relazioni tra menù della gestione del Listino Prezzi.
[{{< figure src="/image/ConfigurazioneListini.png"  width="850"  >}}](/image/ConfigurazioneListini.png)
## Schema della Scontistica
La Maschera permette di configurare una tipologia di sconto desiderata. 
[{{< figure src="/image/SchemadellaScontistica.png"  width="850"  >}}](/image/SchemadellaScontistica.png)
## Schema Listino Prezzi
La Maschera permette di configurare il Listino Prezzi in base alle proprie esigenze.
[{{< figure src="/image/SchemaListinoPrezzi0.png"  width="850"  >}}](/image/SchemaListinoPrezzi0.png)




