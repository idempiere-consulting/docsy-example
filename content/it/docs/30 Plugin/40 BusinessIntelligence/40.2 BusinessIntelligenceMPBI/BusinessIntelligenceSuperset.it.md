---
title: "Business Intelligence - Superset"
date: 2020-04-24T22:47:10+02:00
draft: false
weight : 10
pre: "<b></b>"
---

## Da Problemi con il browser chrome!

## Prerequisiti:

Creare un Virtual Environment:  

```
#installazione virtualenv
pip install virtualenv
```
```
#creazione virtualenv
python3 -m venv superset
```

Per attivarlo:

```
. superset/bin/activate
```

## Installazione:

```
# in caso di errore lanciare psycopg2-binary
python -m pip install psycopg2
```
```
#verificare la presenza di "wheel" e "python3-dev"
python -m pip install wheel
apt install python3-dev 
python -m pip install apache-superset
```
```
superset db upgrade
```
```
export FLASK_APP=superset
```
```
#prompt per la creazone dell'account admin
superset fab create-admin
```
```
superset load_examples
```
```
superset init
```

## Avvio (sviluppo):

```
#funziona solo in locale
superset run -p 8090 --with-threads --reload --debugger
```

## Avvio (produzione):

```
pip install gunicorn
pip install greenlet 
pip install eventlet
pip install gevent   
pip install Pillow


#comando unico:
gunicorn
-w 8
-k gevent
--timeout 120
-b 0.0.0.0:8090
--limit-request-line 0
--limit-request-field_size 0
"superset.app:create_app()"
```

## Connessione a database postgres:

1) Cliccare su "Sources" nel menù-barra in alto
2) Selezionare "Databases"
3) Cliccare sul "+" in alto a destra
4) Inserire il sqlalchemy per la connessione a postgres
5) DONE!
```
#esempio stringa sqlalchemy
postgresql+psycopg2://user:password@ip:port/dbname
```

## Importazione di una Table (tabella o vista del database):

1) Cliccare su "Sources" nel menù-barra in alto
2) Selezionare "Tables"
3) Cliccare sul "+" in alto a destra
4) Selezionare il database e il nome della tabella/vista
5) DONE!

## Creare una tabella/grafico e salvarla in una dashboard:

1) Cliccare su "Charts presente sul menù-barra in alto
2) Selezionare la "Table" che si vuole utilizzare
3) Modificare a piacere il risultato della query usando i filtri presenti nel menù a destra, la selezione del tipo di grafico è presente in questo menù
4) Salvare cliccando su "Save" in alto a sinistra
5) Durante la rinomina del grafico, selezionare in quale dashboard inserirlo

## Iframe su pagina esterna:

1) All'interno della dashboard, pubblicarla cliccando su "Draft" in alto a sinistra e successivamente cliccare il menù a tendina di fianco a "Edit dashboard" per selezionare "Share"
2) Copiare il link
3) Incollarlo nell'iframe di un'altra pagina 
4) andare su /home/idempiere/superset/lib64/python3.8/site-packages/superset/ (ovvero all'interno della cartella del Virtual Environment di superset)
5) modificare il valore di "SESSION_COOKIE_SAMESITE" A "None" all'interno del file "config.py"
6) DONE!
7) P.S.: per ottenere il "pre select filter" nell'url, impostare i filtri nella dashboard a piacere e poi copiare il link ottenuto tramite "Share" 

## Importazione ed esportazione dashboards da un'istanza all'altra:

-Esportazione

1) Cliccare su "Dashboard"
2) Selezionare le dashboard che si vogliono esportare
3) Action > Export
4) Salvare il file scaricato

-Importazione

1) Cliccare su Management presente nel menù-barra in alto
2) Selezionare "Import Dashboards"
3) Inserire il file scaricato precedentemente
4) DONE!

