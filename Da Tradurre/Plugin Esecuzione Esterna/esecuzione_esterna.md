# Plugin EsecuzioneEsterna

---

## link esterni

---

## Riferimenti

* link pubblico          : non applicabile

* link idempiere italia  : https://bitbucket.org/consulnet/idempiere-ita-plugin 

* link jar               : 

* versione idempiere     : idempiere 3.1

* versione zk supportata : 

---

## Descrizione Plugin

Permettere di eseguire qualsiasi programma/comando al di fuori dell’application: esecuzione stringa da riga di comando.

---

## Funzionalità supportate

---

## Installazione Plugin

Installare nella console felix il jar reperibile su [https://bitbucket.org/consulnet/idempiere-download idempiere-download]

---

## Parametrizzazione Plugin

---

## Istruzioni Plugin

![image](600px-ExecProg_Videata1.png)

A seconda del Command Type selezionato, vi è la comparsa di campi utili

![image](600px-ExecProg_Videata2.png)

![image](600px-ExecProg_Videata3.png)

Bisogna duplicare più processi per ogni tabella (per convenienza ora si fa così ...)

![image](600px-ExecProg_Videata4.png)

Es. Creazione del processo per C_Contract: utilizzo sempre della stessa classe Java, ma diversa dicitura del nome del processo.
Poi anche per il parametro: stesso parametro, ma Dynamic Validation che cambia a seconda della tabella

![image](600px-ExecProg_Videata5.png)

![image](600px-ExecProg_Videata6.png)

Nella Dynamic Validation - Validation Rule in questione, bisogna settare l'id corrispondente nella tabella. Una volta settati i dati relativi al processo, verrà richiamato nella Toolbar button relativa alla maschera della C_Contract

![image](600px-ExecProg_Videata7.png)

## Documentazione Tecnica Plugin

---

## Modifiche all'AD

### Tables / Windows esistente

### Nuove Tables /Windows

------------------
```
| C_ParamRunProg |

| nome campo     | descrizione                        	|

| OS         	 | tipo sistema operativo             	|

| CmdType    	 | tipo di comando ("open" per        	|
|            	 | programmi/file, "rdp" per          	|

|            	 | connessioni..)                     	|

| StringRun  	 | stringa di comando                 	|

| Path        	 | percorso di una cartella specifica 	|

| IP          	 | indirizzo ip macchina a cui ci si  	|

|             	 | vuole collegare                    	|
```

---

## Funzionalità Future

---

## Errori e bug

---