---
title: "Business Intelligence - Metabase"
date: 2020-04-24T22:47:10+02:00
draft: false
weight : 10
pre: "<b></b>"
---
## Installazione:

Aprire la console ed entrare nella cartella /opt:  

```
cd /opt
```

Scaricare il .jar di metabase(sostituire il link il link in basso con uno nuovo in caso di versioni aggiornate):  

```
wget https://downloads.metabase.com/v0.36.4/metabase.jar
```

Cambiare la porta in cui opera metabase:  

```
export MB_JETTY_PORT=8090
```

## Primo avvio:

Comando per avviare metabase:  

```
java -jar metabase.jar
```

Digitare l'ip della macchina su cui è installato metabase sulla barra del Browser:

```
x.x.x.x:8090 

o

localhost:8090
```

Seguire la guida sulla pagina per creare l'account admin e collegare il database postgres

## Creare un grafico/tabella e salvarlo in una dashboard:

1) Cliccare su "Browse Data" posizionato a destra sulla barra in alto
2) Selezionare il database che si vuole usare
3) Scegliere una tabella/vista all'interno della lista

-per modificare i parametri della query andare su summarize e scegliere come "Riassumere per" (count,sum,avg etc.) e la colonna della tabella da raggruppare
-per filtrare il risultato della query andare su "Filter" e scegliere il campo da filtrare per ottenere il risultato
-per scegliere un grafico che può utilizzare i dati della query, andare su "Visualize" e scegliere l'icona del tipo di grafico più appropriato

4) Cliccare su "Save", dare un nome al grafico/tabella e scegliere la dashboard in cui inserirlo (è possibile creare una nuova dashboard direttamente da questo menù di salvataggio fornendo semplicemente un nuovo nome per una dashboard)

## Iframe su un'altra pagina delle dashboard:

1) Abilitare la condivisione delle dashboard dalle opzioni (Rotellina nell'angolo in alto a destra > Admin > Public sharing)
2) Home > My Analysis > Dashboards
3) entrare in una dashboard e condividere la dashboard cliccando sull'icona "Share"
4) copiare il link iframe fornito ed incollarlo nel codice della pagina 
5) DONE!

## Copiare configurazione metabase + dashboards da un'istanza all'altra (provvisorio e non consigliato in produzione):

1) Copiare il file "metabase.db.mv.db" presente all'interno della cartella /opt 
2) Incollarlo e sostituirlo al file di destinazione all'interno della seconda istanza di metabase
  
  






