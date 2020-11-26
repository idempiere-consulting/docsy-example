---
title: "Addon Importa Tasso di Cambio [A.ITC.STD00]"
date: 2020-04-24T22:47:10+02:00
draft: false
weight : 60
pre: "<b>720. </b>"
---



## Descrizione Addon

Con questo addon è possibili abilitare l'importazione del Tasso di Cambio (Import Currency Rate) delle valute più comuni (ovviamente da EUR verso altri tassi, e viceversa). Quali tassi possono essere importati in automatico? Vediamoli nel link di seguito:

https://www.ecb.europa.eu/stats/eurofxref/eurofxref-daily.xml?c88048ff0295a4f845ecad08d07c52c9



## Parametrizzazione

Come abilitare l'importazione?

1) come prima cosa dobbiamo abilitare l'automatismo di importazione giornaliera. Andando sullo Scheduler 

[{{< figure src="/image/CurrencyRate_1.png"  width="850"  >}}](/image/CurrencyRate_1.png)

2) Successivamente andremo ad abilitare il Tasso di Cambio per la Valuta che ci interessa (ovviamente valuta che deve essere presente nel file sopra)

[{{< figure src="/image/CurrencyRate_2.png"  width="850"  >}}](/image/CurrencyRate_2.png)

3) Ora abbiamo abilitato l'importazione automatica e verranno importati i Tassi di cambio giornalmente

[{{< figure src="/image/CurrencyRate_3.png"  width="850"  >}}](/image/CurrencyRate_3.png)


## Note Tecniche

Creato build REST con Talend. Per far si che questo possa funzionare prima di tutto dobbiamo decomprimere il file.jar (dando tutti i permessi chmod 777). Decomprimerlo all'interno della seguente cartella del contaner del cliente:

  opt/scriptIdempiere/Import_CurrancyRate/
