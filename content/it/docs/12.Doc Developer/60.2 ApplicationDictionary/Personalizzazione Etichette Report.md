# Personalizzazione Etichette Report

Questo script genera un file con l'indicazione del valore di una etichetta per tutte le lingue installate nell'istanza di idempiere corrente.

### Descrizione

Nella cartella `/opt/scriptIdempiere`  lo script `label_report.sh`  va alla ricerca nella tabella `ad_element` di tutti i record marcati come `isReport`, elemento aggiunto ad hoc,  quindi va alla ricerca di tutte le loro traduzioni presenti nella tabella `ad_element_trl`, salva l'elenco (in ordine sparso) nel file `base.properties` nella cartella corrente (quella da cui è lanciato lo script), infine il file generato viene ordinato in modo da avere vicine le etichette e le relative traduzioni.

### Codice

`--> cat -n label_report.sh                                                                                    
   1  #!/bin/bash  
   2  #set -x 
   3  OUT='base.properties' 
   4 
   5  psql -U adempiere idempiere -c "\copy (select  e.columnname||'_'||t.ad_language||'='||t.printname as pr  from ad_element_trl t  join ad_element e on t.ad_element_id=e.ad_element_id  wh
ere isreport='Y') to $OUT"; 
   6  sort -o $OUT{,}`



1. sheebang, indica con quale shell lanciare lo script
2. attiva o disattiva l'output di ciò che sta eseguendo
3. il nome del file che verrà (sovra)scritto
4. estetica :-)
5. la shell di Postgres si collega con l'utente adempiere al database idempiere ed esegue il comando (`-c`) di copiare (`\copy` ) il risultato della query ( `(select...)` ) sul file indicato ( `to $OUT` ) 
6. ordina il file "in place" (abbreviazione usando il bangling di `sort -o input-file input-file` )

### Step futuri

- [ ] parametrizzare il db da utilizzare (come parametro dello script?)

- [ ] parametrizzare il nome del file di output e la sua posizione

- [ ] ricerca di un determinato record (?)

  